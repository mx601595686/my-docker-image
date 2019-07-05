FROM node:12 as builder

RUN apt-get update && apt-get install -y --no-install-recommends \
    dos2unix

COPY entry.sh /entry.sh
RUN dos2unix /entry.sh && chmod 777 /entry.sh
RUN npm i http-server@0.11.1 -g

FROM alpine:3.10

RUN apk add --no-cache tzdata wget && \
    echo '# 设置系统时区' >> /root/.bashrc && \
    echo 'ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone' >> /root/.bashrc

# TZ：时区默认是上海
ENV TZ=Asia/Shanghai

COPY --from=builder /entry.sh /entry.sh
COPY --from=builder /usr/local/bin/node /usr/local/bin/node
COPY --from=builder /usr/local/bin/http-server /usr/local/bin/http-server
COPY --from=builder /usr/local/lib/node_modules /usr/local/lib/node_modules

WORKDIR /path

EXPOSE 80

ENTRYPOINT [ "/entry.sh" ]