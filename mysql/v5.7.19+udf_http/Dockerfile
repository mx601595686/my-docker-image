FROM mysql:5.7.19

# 由于该库依赖libcurl，安装依赖库
RUN apt-get update && apt-get install -y --no-install-recommends \
    libcurl4-openssl-dev \
	&& rm -rf /var/lib/apt/lists/*

# 启动mysql不需要验证
ENV MYSQL_ALLOW_EMPTY_PASSWORD=yes

# http 插件的版本
ENV MYSQL_UDF_HTTP=1.0.0

# 这个二进制版本是在ubuntu16.04,64位 版本下编译完成的
COPY mysql-udf-http.so /usr/lib/mysql/plugin

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
              create function http_delete returns string soname 'mysql-udf-http.so';";
