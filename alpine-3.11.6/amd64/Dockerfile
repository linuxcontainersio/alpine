FROM scratch

ARG BUILD_DATE

# set our environment variable
ENV MUSL_LOCPATH="/usr/share/i18n/locales/musl"

LABEL maintainer="Peter <peter@linuxcontainers.io>" \
    architecture="amd64/x86_64" \
    alpine-version="3.11.6" \
    build=$BUILD_DATE \
    org.opencontainers.image.title="alpine" \
    org.opencontainers.image.description="Docker image running on Alpine Linux" \
    org.opencontainers.image.authors="Peter <peter@linuxcontainers.io>" \
    org.opencontainers.image.vendor="Peter" \
    org.opencontainers.image.version="v3.11.6" \
    org.opencontainers.image.url="https://hub.docker.com/r/linuxcontainers/alpine/" \
    org.opencontainers.image.source="https://github.com/linuxcontainersio/alpine" \
    org.opencontainers.image.created=$BUILD_DATE

ADD alpine-minirootfs-3.11.6-x86_64.tar.gz /

RUN apk update && \
    apk upgrade && \
    apk --no-cache add libintl && \
    apk --no-cache --virtual .locale_build add cmake make musl-dev gcc gettext-dev git && \
    git clone https://gitlab.com/rilian-la-te/musl-locales && \
    cd musl-locales && cmake -DLOCALE_PROFILE=OFF -DCMAKE_INSTALL_PREFIX:PATH=/usr . && make && make install && \
    cd .. && rm -r musl-locales && \
    apk del .locale_build && \
    apk add tzdata && \
    mkdir /scripts

COPY files /scripts/

RUN chmod -R 755 /scripts

ENTRYPOINT ["/scripts/run-alpine.sh"]
