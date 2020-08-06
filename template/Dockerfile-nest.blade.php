FROM {{ $from }}

RUN npm install -g @nestjs/cli \
    && rm -rf rm -rf /root/.npm/*

CMD [ "npm", "run", "start" ]
