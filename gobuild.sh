#!/bin/ash -e

exec go build -ldflags "-linkmode external -extldflags -static" $@