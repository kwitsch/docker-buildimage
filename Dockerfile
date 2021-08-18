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
    openssl-dev
WORKDIR /builddir
COPY glghr.sh .
RUN chmod +x glghr.sh
