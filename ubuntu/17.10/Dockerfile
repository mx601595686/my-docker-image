# 基于最新的ubuntu 17.10
FROM buildpack-deps:artful

LABEL MAINTAINER wujingtao

# 存储系统信息
ENV OS_NAME ubuntu
ENV OS_VERSION 17.10
ENV OS_TAG artful

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
        # sshd
        openssh-server \
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

# 配置ssh
RUN mkdir /var/run/sshd && \
    # 允许root用户登录
    sed -i 's/#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    # 设置root ssh远程登录密码为testroot
    echo "root:testroot" | chpasswd

# 容器需要开放SSH 22端口
EXPOSE 22

# 将工作目录设置到根
WORKDIR /