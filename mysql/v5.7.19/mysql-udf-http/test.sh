#!/bin/sh
docker run -it --rm -p 192.168.160.128:3306:3306 \
-e MYSQL_ALLOW_EMPTY_PASSWORD=yes \
--entrypoint /bin/bash \
registry.cn-hangzhou.aliyuncs.com/wujingtao/mysql:mysql-udf-http