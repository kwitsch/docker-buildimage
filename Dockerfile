FROM alpine AS build
RUN apk add --no-cache \
    build-base \
    ca-certificates \
    curl \
    linux-headers \
    perl \
    util-linux \
    coreutils \
    binutils \
    findutils \
    grep \
    automake \
    autoconf \
    libtool \
    openssl-dev \
    musl-dev \
    go
WORKDIR /usr/local/bin
COPY *.sh .
RUN chmod +x *.sh
WORKDIR /builddir

#COPY test.go .