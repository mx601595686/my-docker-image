#!/usr/bin/env sh

if [[ $1 == 'server' ]]; then
    http-server . -p 80
elif [[ $1 == 'download' ]]; then
    if [[ -n $3 ]]; then
        wget -O $3 $2
    else
        wget $2
    fi
else 
    cat /README.md
fi