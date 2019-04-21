FROM mongo:4

RUN apt-get update && apt-get install -y --no-install-recommends \
    tzdata \
    && rm -rf /var/lib/apt/lists/* \
    echo -e '# 设置系统时区' >> /root/.bashrc \
    echo -e 'ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone' >> /root/.bashrc

ENV TZ=Asia/Shanghai