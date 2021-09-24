FROM alpine AS build
RUN apk add --no-cache build-base
RUN apk add --no-cache ca-certificates
RUN apk add --no-cache curl
RUN apk add --no-cache linux-headers 
RUN apk add --no-cache perl
RUN apk add --no-cache util-linux
RUN apk add --no-cache coreutils
RUN apk add --no-cache binutils
RUN apk add --no-cache findutils
RUN apk add --no-cache grep
RUN apk add --no-cache automake
RUN apk add --no-cache autoconf
RUN apk add --no-cache libtool
RUN apk add --no-cache openssl-dev
RUN apk add --no-cache musl-dev
RUN apk add --no-cache go

WORKDIR /usr/local/bin
COPY *.sh .
RUN chmod +x *.sh

WORKDIR /builddir