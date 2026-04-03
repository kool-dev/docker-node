FROM node:20-alpine

ENV ASUSER= \
    UID=0 \
    ENTRYPOINT=entrypoint.node.sh

WORKDIR /app

RUN adduser -D -u 1337 kool && deluser --remove-home node \
    # deps
    && apk add --no-cache \
        bash \
        git \
        shadow \
        su-exec \
        curl \
        # build tools
        g++ \
        libpng-dev \
        make \
        zlib-dev \
    && npm install -g pnpm \
    # pnpm global settings live in ~/.config/pnpm/rc so npm does not warn on unknown keys in ~/.npmrc (npm 11+)
    && mkdir -p /root/.config/pnpm /home/kool/.config/pnpm \
    && printf '%s\n' \
        'store-dir=/root/.pnpm-store' \
        'package-import-method=copy' \
        'shamefully-hoist=true' \
        'scripts-prepend-node-path=true' \
        > /root/.config/pnpm/rc \
    && printf '%s\n' \
        'store-dir=/home/kool/.pnpm-store' \
        'package-import-method=copy' \
        'shamefully-hoist=true' \
        'scripts-prepend-node-path=true' \
        > /home/kool/.config/pnpm/rc \
    && chown -R kool:kool /home/kool/.config \
    && rm -rf rm -rf /root/.npm/* \
    # dockerize
    && curl -L https://github.com/jwilder/dockerize/releases/download/v0.6.1/dockerize-alpine-linux-amd64-v0.6.1.tar.gz | tar xz \
    && mv dockerize /usr/local/bin/dockerize

COPY entrypoint /entrypoint

RUN chmod +x /entrypoint

RUN mkdir -p /usr/local/lib/node_modules && chmod -R 777 /usr/local/lib/node_modules

RUN npm i --location=global npm@latest

ENTRYPOINT [ "/entrypoint" ]
