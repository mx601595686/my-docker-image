# 启动mysql，并配置udf方法
# 启动mysql之前需先启动mysqld，并在后台执行，通过 /bin/bash -c
# 中途等待mysqld启动15秒
# 最后执行SQL语句，SQL语句放在 -e 参数后面
RUN /bin/bash -c "docker-entrypoint.sh mysqld >/dev/null 2>&1 & " && \
    echo "等待mysql启动(15秒)" && \
    sleep 15 && \
    mysql -e "create function http_get returns string soname 'mysql-udf-http.so'; \
              create function http_post returns string soname 'mysql-udf-http.so'; \
              create function http_put returns string soname 'mysql-udf-http.so'; \
              create function http_delete returns string soname 'mysql-udf-http.so';" && \
              mysql -e "CREATE DATABASE mydb";