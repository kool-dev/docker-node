FROM {{ $from }}

RUN npm install -g buddy.js jshint jsinspect eslint \
    && rm -rf rm -rf /root/.npm/*
