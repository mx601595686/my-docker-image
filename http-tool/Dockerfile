FROM alpine:3.10

COPY README.md /README.md
COPY entry.sh /entry.sh

RUN apk add --no-cache tzdata wget bash dos2unix nodejs npm && \
    dos2unix /entry.sh && chmod 777 /entry.sh && \
    npm i http-server -g && \
    echo '# 设置系统时区' >> /root/.bashrc && \
    echo 'ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone' >> /root/.bashrc

# TZ：时区默认是上海
ENV TZ=Asia/Shanghai

WORKDIR /path

EXPOSE 80

ENTRYPOINT [ "/entry.sh" ]