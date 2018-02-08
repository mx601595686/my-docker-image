FROM registry.cn-hangzhou.aliyuncs.com/wujingtao/ubuntu:16.04

RUN apt-get update && apt-get install -y --no-install-recommends \
    openssh-server \
	&& rm -rf /var/lib/apt/lists/*

RUN mkdir /var/run/sshd

RUN echo 'root:root' |chpasswd

RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

EXPOSE 22

CMD    ["/usr/sbin/sshd", "-D"]