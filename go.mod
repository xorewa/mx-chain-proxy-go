module github.com/multiversx/mx-chain-proxy-go

go 1.26.2

require (
	github.com/gin-contrib/cors v1.6.0
	github.com/gin-contrib/pprof v1.4.0
	github.com/gin-contrib/static v0.0.1
	github.com/gin-gonic/gin v1.10.0
	github.com/multiversx/mx-chain-core-go v1.5.0
	github.com/multiversx/mx-chain-crypto-go v1.3.0
	github.com/multiversx/mx-chain-es-indexer-go v1.9.3-0.20260112102658-97d6a0ceb5f6
	github.com/multiversx/mx-chain-logger-go v1.1.0
	github.com/multiversx/mx-chain-storage-go v1.1.0
	github.com/pkg/errors v0.9.1
	github.com/stretchr/testify v1.11.1
	github.com/urfave/cli v1.22.16
	gopkg.in/go-playground/validator.v8 v8.18.2
)

require (
	github.com/btcsuite/btcd/btcutil v1.1.3 // indirect
	github.com/bytedance/sonic v1.11.6 // indirect
	github.com/bytedance/sonic/loader v0.1.1 // indirect
	github.com/cloudwego/base64x v0.1.4 // indirect
	github.com/cloudwego/iasm v0.2.0 // indirect
	github.com/cpuguy83/go-md2man/v2 v2.0.5 // indirect
	github.com/davecgh/go-spew v1.1.1 // indirect
	github.com/denisbrodbeck/machineid v1.0.1 // indirect
	github.com/gabriel-vasile/mimetype v1.4.6 // indirect
	github.com/gin-contrib/sse v0.1.0 // indirect
	github.com/go-playground/locales v0.14.1 // indirect
	github.com/go-playground/universal-translator v0.18.1 // indirect
	github.com/go-playground/validator/v10 v10.20.0 // indirect
	github.com/goccy/go-json v0.10.2 // indirect
	github.com/gogo/protobuf v1.3.2 // indirect
	github.com/golang/protobuf v1.5.3 // indirect
	github.com/json-iterator/go v1.1.12 // indirect
	github.com/klauspost/cpuid/v2 v2.3.0 // indirect
	github.com/leodido/go-urn v1.4.0 // indirect
	github.com/mattn/go-isatty v0.0.22 // indirect
	github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd // indirect
	github.com/modern-go/reflect2 v1.0.2 // indirect
	github.com/mr-tron/base58 v1.3.0 // indirect
	github.com/pelletier/go-toml v1.9.3 // indirect
	github.com/pelletier/go-toml/v2 v2.2.2 // indirect
	github.com/pmezard/go-difflib v1.0.0 // indirect
	github.com/russross/blackfriday/v2 v2.1.0 // indirect
	github.com/twitchyliquid64/golang-asm v0.15.1 // indirect
	github.com/ugorji/go/codec v1.2.12 // indirect
	golang.org/x/arch v0.8.0 // indirect
	golang.org/x/crypto v0.53.0 // indirect
	golang.org/x/net v0.55.0 // indirect
	golang.org/x/sys v0.46.0 // indirect
	golang.org/x/text v0.38.0 // indirect
	google.golang.org/protobuf v1.36.11 // indirect
	gopkg.in/go-playground/assert.v1 v1.2.1 // indirect
	gopkg.in/yaml.v3 v3.0.1 // indirect
)

// Pin the NewArc lower-stack modules to xorewa mirrors. The proxy imports
// github.com/multiversx/mx-chain-core-go/data/drwa, which is part of the
// NewArc DRWA/MRV stack and is not present in upstream MultiversX v1.5.0.
replace github.com/multiversx/mx-chain-core-go => github.com/xorewa/mx-chain-core-go v0.0.0-20260731080906-2ae724dbfeb1

replace github.com/multiversx/mx-chain-logger-go => github.com/xorewa/mx-chain-logger-go v0.0.0-20260801081807-1372e2ba679d

replace github.com/multiversx/mx-chain-crypto-go => github.com/xorewa/mx-chain-crypto-go v0.0.0-20260801082855-aa434576d3a5

replace github.com/multiversx/mx-chain-storage-go => github.com/xorewa/mx-chain-storage-go v0.0.0-20260801083748-7b50e0213c4d

replace github.com/multiversx/mx-chain-es-indexer-go => github.com/xorewa/mx-chain-es-indexer-go v0.0.0-20260804110617-40a39e2ab1dc

replace github.com/multiversx/mx-chain-communication-go => github.com/xorewa/mx-chain-communication-go v0.0.0-20260801092431-483cc64b4e4b

replace github.com/multiversx/mx-chain-vm-common-go => github.com/xorewa/mx-chain-vm-common-go v0.0.0-20260801091718-772b8d777a0c

replace github.com/herumi/bls-go-binary => github.com/xorewa/bls-go-binary v0.0.0-20260731163832-566eb78d4b77
