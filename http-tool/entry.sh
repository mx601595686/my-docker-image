#!/usr/bin/env bash

if [[ $1 == 'serve' ]]; then
    http-server . -p 80
elif [[ $1 == 'download' ]]; then
    if [[ -n $3 ]]; then
        wget -O $3 $2
    else
        wget $2
    fi
else 
    echo '使用方法：'
    echo '1. 开启文件服务器：docker run -d -v $(pwd):/path http-tool server'
    echo '2. 下载文件：docker run -d -v $(pwd):/path http-tool download 网址 [文件名]'
    exit 1
fi