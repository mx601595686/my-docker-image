FROM mysql:5.7

RUN apt-get update && apt-get install -y --no-install-recommends \
    dos2unix \
    tzdata \
    && rm -rf /var/lib/apt/lists/*

COPY [".bashrc", "/root/.bashrc"]

RUN dos2unix /root/.bashrc

ENV TZ=Asia/Shanghai