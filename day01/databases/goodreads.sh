#!/bin/sh

docker run -d -p 3306:3306 \
  --mount type=volume,src=mysql-vol,dst=/var/lib/mysql \
  --mount type=bind,src=./seed,dst=/docker-entrypoint-initdb.d \
  --network=mynet --name=mydb \
  -e MYSQL_ROOT_PASSWORD=rootroot \
  mysql:8
