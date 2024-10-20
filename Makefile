export GO111MODULE=on

all: safebit

PKG := github.com/juicedata/juicefs/pkg/version
LDFLAGS = -s -w

SHELL = /bin/sh

safebit: Makefile *.go pkg/*/*.go
	go version
	go build -ldflags="$(LDFLAGS)"  -o safebit .

test:
	go test -v -cover -count=1  -failfast -timeout=12m $$(go list ./pkg/...) -coverprofile=cov.out

clean:
	rm -f safebit