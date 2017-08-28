# 简单地将下载地址换成了淘宝cdn
# tar 解压只会覆盖文件不会覆盖目录
FROM buildpack-deps:jessie

RUN groupadd --gid 1000 node \
  && useradd --uid 1000 --gid node --shell /bin/bash --create-home node

ENV NPM_CONFIG_LOGLEVEL info

# node版本号
ENV NODE_VERSION 8.4.0

RUN curl -SLO "http://cdn.npm.taobao.org/dist/node/latest/node-v$NODE_VERSION-linux-x64.tar.xz" \
  && tar -xJf "node-v$NODE_VERSION-linux-x64.tar.xz" -C /usr/local --strip-components=1 \
  && rm "node-v$NODE_VERSION-linux-x64.tar.xz" \
  && ln -s /usr/local/bin/node /usr/local/bin/nodejs

CMD [ "node" ]