#
# Dockerfile for kcptun-server
#

FROM lisnaz/kcptun:latest
MAINTAINER Vincent.Gu <g@v-io.co>

ENV KCPTUN_SERVER_LISTEN_ADDR   127.0.0.1
ENV KCPTUN_SERVER_LISTEN_PORT   8388
ENV KCPTUN_SERVER_TARGET_ADDR   127.0.0.1
ENV KCPTUN_SERVER_TARGET_PORT   4000

EXPOSE $KCPTUN_SERVER_LISTEN_PORT/tcp

ADD entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

# install dependencies
ENV KCPTUN_DEP bash
RUN set -ex \
    && apk add --update --no-cache $KCPTUN_DEP \
    && rm -rf /var/cache/apk/* \
