FROM alpine:3.12

LABEL maintainer="Peter <peter@linuxcontainers.io>" \
    architecture="amd64/x86_64" \
    alpine-version="3.12.0" \
    build=$BUILD_DATE \
    org.opencontainers.image.title="alpine" \
    org.opencontainers.image.description="Docker image running on Alpine Linux" \
    org.opencontainers.image.authors="Peter <peter@linuxcontainers.io>" \
    org.opencontainers.image.vendor="Peter" \
    org.opencontainers.image.version="v3.12.0" \
    org.opencontainers.image.url="https://hub.docker.com/r/linuxcontainers/alpine/" \
    org.opencontainers.image.source="https://github.com/linuxcontainersio/alpine" \
    org.opencontainers.image.created=$BUILD_DATE

ARG BUILD_DATE
ARG TZ="GMT"

ENV TZ ${TZ}

RUN apk update \
    && apk upgrade \
    && apk add tzdata wget curl \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo ${TZ} > /etc/timezone \
    && rm -rf /var/cache/apk/*

CMD ["/bin/ash"]
