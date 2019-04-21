FROM mongo:4

RUN apt-get update && apt-get install -y --no-install-recommends \
    tzdata \
    && rm -rf /var/lib/apt/lists/* && \
    echo '# 设置系统时区' >> /root/.bashrc && \
    echo 'ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone' >> /root/.bashrc

ENV TZ=Asia/Shanghai