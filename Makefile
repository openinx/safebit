export GO111MODULE=on

all: safebit

PKG := github.com/juicedata/juicefs/pkg/version
LDFLAGS = -s -w

SHELL = /bin/sh

safebit: Makefile *.go pkg/*/*.go
	go version
	go build -ldflags="$(LDFLAGS)"  -o safebit .

clean:
	rm -f safebit