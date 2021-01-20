FROM scratch

LABEL maintainer="Peter <peter@linuxcontainers.io>" \
    architecture="amd64/x86_64" \
    alpine-version="3.12.3" \
    build=$BUILD_DATE \
    org.opencontainers.image.title="alpine" \
    org.opencontainers.image.description="Docker image running on Alpine Linux " \
    org.opencontainers.image.authors="Peter <peter@linuxcontainers.io>" \
    org.opencontainers.image.vendor="Peter" \
    org.opencontainers.image.version="v3.12.3" \
    org.opencontainers.image.url="https://hub.docker.com/r/linuxcontainers/alpine/" \
    org.opencontainers.image.created=$BUILD_DATE

ADD alpine-minirootfs-3.12.3-x86_64.tar.gz /
RUN apk update --no-cache \
    && apk upgrade --no-cache \
    && rm -rf /var/cache/apk/*
CMD ["/bin/sh"]

