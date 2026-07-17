package process

import (
	"context"
	"runtime/debug"
	"sync"
)

type backgroundTaskLifecycle struct {
	mut        sync.Mutex
	cancelFunc context.CancelFunc
	done       chan struct{}
}

func (lifecycle *backgroundTaskLifecycle) start(taskName string, fn func(context.Context)) bool {
	lifecycle.mut.Lock()
	defer lifecycle.mut.Unlock()

	if lifecycle.cancelFunc != nil {
		return false
	}

	ctx, cancelFunc := context.WithCancel(context.Background())
	done := make(chan struct{})
	lifecycle.cancelFunc = cancelFunc
	lifecycle.done = done

	runGuardedBackgroundTask(taskName, func() {
		defer close(done)
		fn(ctx)
	})

	return true
}

func (lifecycle *backgroundTaskLifecycle) close() {
	lifecycle.mut.Lock()
	if lifecycle.cancelFunc == nil {
		lifecycle.mut.Unlock()
		return
	}

	cancelFunc := lifecycle.cancelFunc
	done := lifecycle.done
	lifecycle.mut.Unlock()

	cancelFunc()
	<-done

	lifecycle.mut.Lock()
	if lifecycle.done == done {
		lifecycle.cancelFunc = nil
		lifecycle.done = nil
	}
	lifecycle.mut.Unlock()
}

func runGuardedBackgroundTask(taskName string, fn func()) {
	go func() {
		defer func() {
			if recovered := recover(); recovered != nil {
				log.Error("background task panic recovered", "task", taskName, "panic", recovered, "stack", string(debug.Stack()))
			}
		}()

		fn()
	}()
}
