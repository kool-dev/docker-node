# Use the base image
FROM kooldev/node:22

RUN apk add --no-cache nginx

RUN mkdir -p /etc/nginx/conf.d \
    && mkdir /etc/nginx/h5bp \
    && cd /etc/nginx/h5bp \
    && wget https://github.com/h5bp/server-configs-nginx/archive/refs/tags/3.3.0.tar.gz -O h5bp.tgz \
    && tar xzvf h5bp.tgz \
    && rm -f h5bp.tgz \
    && mv server-configs-nginx-*/h5bp/* . \
    && mv server-configs-nginx-*/nginx.conf /etc/nginx/nginx.conf \
