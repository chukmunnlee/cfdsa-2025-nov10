#!/bin/sh

docker run -d -p 3306:3306 \
  --mount type=volume,src=mysql-vol,dst=/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=rootroot \
  mysql:8
