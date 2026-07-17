package process

import (
	"context"
	"sync"
	"testing"
	"time"

	"github.com/stretchr/testify/require"
)

func TestBackgroundTaskLifecycleCloseWaitsAndAllowsRestart(t *testing.T) {
	lifecycle := &backgroundTaskLifecycle{}
	started := make(chan struct{})
	release := make(chan struct{})

	require.True(t, lifecycle.start("blocking-task", func(_ context.Context) {
		close(started)
		<-release
	}))
	<-started
	require.False(t, lifecycle.start("duplicate-task", func(_ context.Context) {}))

	closed := make(chan struct{})
	go func() {
		lifecycle.close()
		close(closed)
	}()

	select {
	case <-closed:
		t.Fatal("close returned while the old generation was still running")
	case <-time.After(20 * time.Millisecond):
	}

	close(release)
	select {
	case <-closed:
	case <-time.After(time.Second):
		t.Fatal("close did not return after the old generation completed")
	}

	restarted := make(chan struct{})
	require.True(t, lifecycle.start("restarted-task", func(ctx context.Context) {
		close(restarted)
		<-ctx.Done()
	}))
	<-restarted
	lifecycle.close()
}

func TestBackgroundTaskLifecycleConcurrentCloseAndPanicCompletion(t *testing.T) {
	lifecycle := &backgroundTaskLifecycle{}
	require.True(t, lifecycle.start("panicking-task", func(_ context.Context) {
		panic("test panic")
	}))

	var waitGroup sync.WaitGroup
	waitGroup.Add(2)
	for index := 0; index < 2; index++ {
		go func() {
			defer waitGroup.Done()
			lifecycle.close()
		}()
	}

	completed := make(chan struct{})
	go func() {
		waitGroup.Wait()
		close(completed)
	}()
	select {
	case <-completed:
	case <-time.After(time.Second):
		t.Fatal("concurrent close calls did not observe panic completion")
	}

	require.True(t, lifecycle.start("post-panic-task", func(ctx context.Context) {
		<-ctx.Done()
	}))
	lifecycle.close()
}
