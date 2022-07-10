FROM {{ $from }}

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

@if($full)
RUN npm install -g buddy.js jshint jsinspect eslint \
    # for NestJS
    @nestjs/cli \
    # for AdonisJS
    @adonisjs/cli \
    && rm -rf rm -rf /root/.npm/*
@endif

COPY root-npmrc /root/.npmrc
COPY --chown=kool:kool kool-npmrc /home/kool/.npmrc
COPY entrypoint /entrypoint

RUN chmod +x /entrypoint

ENTRYPOINT [ "/entrypoint" ]
