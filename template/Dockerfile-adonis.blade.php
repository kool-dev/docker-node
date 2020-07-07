FROM {{ $from }}

RUN npm install -g @adonisjs/cli \
    && rm -rf rm -rf /root/.npm/*

CMD [ "adonis", "serve" ]
