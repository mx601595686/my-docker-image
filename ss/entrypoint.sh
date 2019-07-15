#!/bin/bash

while getopts "s:p:k" OPT; do
    case $OPT in
        s)
            SERVER=$OPTARG;;
        p)
            PORT=$OPTARG;;
        k)
            PASSWORD=$OPTARG;;
    esac
done

if [[ $1 == 'server' ]]; then
    ss-server -s 0.0.0.0 -p 1111 -m aes-256-gcm -k $PASSWORD --fast-open
    server -t 127.0.0.1:1111 -l :2222 -mode fast --crypt none
elif [[ $1 == 'client' ]]; then
    client -r $SERVER:$PORT -l :6500 -mode fast --crypt none
    ss-local -s 127.0.0.1 -p 6500 -b 0.0.0.0 -l 1111 -m aes-256-gcm -k $PASSWORD
    privoxy --no-daemon /etc/privoxy/config
else 
    cat /README.md
fi