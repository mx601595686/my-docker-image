#!/bin/bash

MODE=fast

OPTIND=2
while getopts "s:p:k:m:" OPT; do
    case $OPT in
        s)
            SERVER=$OPTARG;;
        p)
            PORT=$OPTARG;;
        k)
            PASSWORD=$OPTARG;;
        m)
            MODE=$OPTARG;;
    esac
done

if [[ $1 == 'server' ]]; then
    export SS_MODULE=ss-server
    export SS_CONFIG="-s 0.0.0.0 -p 1111 -m aes-256-gcm -k $PASSWORD --fast-open"
    export KCP_FLAG=true
    export KCP_MODULE=kcpserver
    export KCP_CONFIG="-t 127.0.0.1:1111 -l :2222 -mode $MODE --crypt none"
elif [[ $1 == 'client' ]]; then
    export SS_MODULE=ss-local
    export SS_CONFIG="-s 127.0.0.1 -p 6500 -b 0.0.0.0 -l 1111 -m aes-256-gcm -k $PASSWORD"
    export KCP_FLAG=true
    export KCP_MODULE=kcpclient
    export KCP_CONFIG="-r $SERVER:$PORT -l :6500 -mode $MODE --crypt none"
    export PRIVOXY_FLAG=true
else 
    cat /README.md
fi

exec /entrypoint.sh