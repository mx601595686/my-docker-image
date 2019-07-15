FROM xtaci/kcptun as kcptun

FROM alpine

RUN apk update && apk add --no-cache \
    bash \
    shadowsocks-libev \
    privoxy

COPY --from=kcptun /bin/client /bin/server /bin/
COPY entrypoint.sh /entrypoint.sh
COPY config /etc/privoxy/config

EXPOSE 1111
EXPOSE 2222/udp
EXPOSE 3333

ENTRYPOINT ["/entrypoint.sh"]