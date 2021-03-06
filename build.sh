#! /bin/bash

docker build --pull -t kooldev/node:10 10
docker build -t kooldev/node:10-qa 10-qa
docker build -t kooldev/node:10-adonis 10-adonis
docker build -t kooldev/node:10-adonis-qa 10-adonis-qa
docker build -t kooldev/node:10-nest 10-nest
docker build -t kooldev/node:10-nest-qa 10-nest-qa
docker build --pull -t kooldev/node:12 12
docker build -t kooldev/node:12-qa 12-qa
docker build -t kooldev/node:12-adonis 12-adonis
docker build -t kooldev/node:12-adonis-qa 12-adonis-qa
docker build -t kooldev/node:12-nest 12-nest
docker build -t kooldev/node:12-nest-qa 12-nest-qa
docker build --pull -t kooldev/node:14 14
docker build -t kooldev/node:14-qa 14-qa
docker build -t kooldev/node:14-adonis 14-adonis
docker build -t kooldev/node:14-adonis-qa 14-adonis-qa
docker build -t kooldev/node:14-nest 14-nest
docker build -t kooldev/node:14-nest-qa 14-nest-qa
