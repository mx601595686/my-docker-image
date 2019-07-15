FROM mritd/shadowsocks:3.2.5-20190712

SHELL [ "/bin/bash", "-c" ]

RUN apk update && apk add --no-cache privoxy

COPY entrypoint.sh /my_entrypoint.sh
COPY config /etc/privoxy/config
COPY README.md /README.md

EXPOSE 1111
EXPOSE 2222/udp
EXPOSE 3333

ENTRYPOINT ["/my_entrypoint.sh"]