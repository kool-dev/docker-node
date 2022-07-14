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
    && npm install -g pnpm \
    && rm -rf rm -rf /root/.npm/*

COPY root-npmrc /root/.npmrc
COPY --chown=kool:kool kool-npmrc /home/kool/.npmrc
COPY entrypoint /entrypoint

RUN chmod +x /entrypoint

RUN mkdir -p /usr/local/lib/node_modules && chmod -R 777 /usr/local/lib/node_modules

RUN npm i --location=global npm@latest

ENTRYPOINT [ "/entrypoint" ]
