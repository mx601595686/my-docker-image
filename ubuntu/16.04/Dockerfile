# 基于ubuntu 16.04
FROM buildpack-deps:xenial
LABEL MAINTAINER wujingtao

# 存储系统信息
ENV OS_NAME ubuntu
ENV OS_VERSION 16.04
ENV OS_TAG xenial

# 替换成国内源
COPY sources.list /etc/apt/sources.list

# 安装我需要的包
RUN apt-get update && apt-get install -y --no-install-recommends \
        # 安装MySQL需要这几个
        dirmngr \
		perl \
        pwgen \
		openssl \
        # ifconfig 、netstat
        net-tools \
        # ping 
        iputils-ping \
        # 用于调整时区
        tzdata \
        # 常用工具
        vim \
        tree \
        zip \
        unzip \
	&& rm -rf /var/lib/apt/lists/*

# 更改时区
ENV TIME_ZONE Asia/Shanghai
RUN echo "${TIME_ZONE}" > /etc/timezone && ln -sf /usr/share/zoneinfo/${TIME_ZONE} /etc/localtime

# 将工作目录设置到根
WORKDIR /