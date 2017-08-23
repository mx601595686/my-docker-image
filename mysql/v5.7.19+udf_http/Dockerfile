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

