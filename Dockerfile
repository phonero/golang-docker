# Do not edit this file directly, it is generated from .github/.Dockerfile.tmpl

FROM alpine:3.14
LABEL maintainer "Pål Sollie <sollie@sparkz.no>"
LABEL org.opencontainers.image.source https://github.com/sollie/golang-docker

ENV OS_ARCH="amd64" \
    OS_FLAVOUR="alpine" \
    OS_NAME="linux" \
    GOLANG_VERSION="go1.17" \
    GOLANG_HASH="6bf89fc4f5ad763871cf7eac80a2d594492de7a818303283f1366a7f6a30372d" \
    GOLANG_FILENAME="go1.17.linux-amd64.tar.gz" \
    GOLANG_URL="https://dl.google.com/go/go1.17.linux-amd64.tar.gz" \
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

RUN wget -nc -P /tmp/cache https://dl.google.com/go/go1.17.linux-amd64.tar.gz && \
    echo "6bf89fc4f5ad763871cf7eac80a2d594492de7a818303283f1366a7f6a30372d  /tmp/cache/go1.17.linux-amd64.tar.gz" | sha256sum -c - && \
    tar -zxf /tmp/cache/go1.17.linux-amd64.tar.gz -P -C /opt && \
    rm -rf /tmp/cache/go1.17.linux-amd64.tar.gz
RUN mkdir -p "/go/src" "/go/bin" && chmod -R 777 "/go"

WORKDIR $GOPATH
CMD [ "sh" ]
