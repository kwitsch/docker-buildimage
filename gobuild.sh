#!/bin/ash -e
go get github.com/ramr/go-reaper
exec go build -ldflags "-linkmode external -extldflags -static" $@