# Do not edit this file directly, it is generated from .github/.Dockerfile.tmpl

FROM alpine:3.15
LABEL maintainer "Pål Sollie <sollie@sparkz.no>"
LABEL org.opencontainers.image.source https://github.com/sollie/golang-docker

ENV OS_ARCH="amd64" \
    OS_FLAVOUR="alpine" \
    OS_NAME="linux" \
    GOLANG_VERSION="go1.20.7" \
    GOLANG_HASH="f0a87f1bcae91c4b69f8dc2bc6d7e6bfcd7524fceec130af525058c0c17b1b44" \
    GOLANG_FILENAME="go1.20.7.linux-amd64.tar.gz" \
    GOLANG_URL="https://dl.google.com/go/go1.20.7.linux-amd64.tar.gz" \
    GOPATH="/go" \
    PATH="/go/bin:/opt/go/bin:$PATH"

RUN apk update && \
    apk add libc6-compat \
        build-base \
        ca-certificates \
        curl \
        git \
        gzip \
        procps \
        tar \
        unzip \
        wget

RUN wget -nc -P /tmp/cache https://dl.google.com/go/go1.20.7.linux-amd64.tar.gz && \
    echo "f0a87f1bcae91c4b69f8dc2bc6d7e6bfcd7524fceec130af525058c0c17b1b44  /tmp/cache/go1.20.7.linux-amd64.tar.gz" | sha256sum -c - && \
    tar -zxf /tmp/cache/go1.20.7.linux-amd64.tar.gz -P -C /opt && \
    rm -rf /tmp/cache/go1.20.7.linux-amd64.tar.gz
RUN mkdir -p "/go/src" "/go/bin" && chmod -R 777 "/go"

WORKDIR $GOPATH
CMD [ "sh" ]
