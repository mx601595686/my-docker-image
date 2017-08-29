# 这个镜像是根据相同目录下的buildpack-deps镜像构建出来的。
# 存放在阿里云镜像仓库中。
FROM registry.cn-hangzhou.aliyuncs.com/wujingtao/mysql:buildpack-deps-5.7.19

# http 插件的版本
ENV MYSQL_UDF_HTTP=1.0.0

# 这个二进制版本是在ubuntu16.04,64位 版本下编译完成的
COPY mysql-udf-http.so /usr/lib/mysql/plugin

