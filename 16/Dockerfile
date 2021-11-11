FROM node:16-alpine

ENV ASUSER= \
    UID=0 \
    ENTRYPOINT=entrypoint.node.sh

WORKDIR /app

RUN adduser -D -u 1337 kool && deluser --remove-home node \
    && apk add --no-cache \
        bash \
        git \
        shadow \
        su-exec \
        # build tools
        g++ \
        libpng-dev \
        make \
        zlib-dev \
        python2 \
    && npm install -g pnpm \
    && rm -rf rm -rf /root/.npm/*

COPY root-npmrc /root/.npmrc
COPY --chown=kool:kool kool-npmrc /home/kool/.npmrc
COPY entrypoint /entrypoint

RUN chmod +x /entrypoint

ENTRYPOINT [ "/entrypoint" ]
