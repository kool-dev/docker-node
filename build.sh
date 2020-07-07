#! /bin/bash

docker build --pull -t kooldev/node:12 12
docker build -t kooldev/node:12-adonis 12-adonis
docker build -t kooldev/node:12-adonis-qa 12-adonis-qa
docker build -t kooldev/node:12-qa 12-qa
docker build --pull -t kooldev/node:14 14
docker build -t kooldev/node:14-adonis 14-adonis
docker build -t kooldev/node:14-adonis-qa 14-adonis-qa
docker build -t kooldev/node:14-qa 14-qa
