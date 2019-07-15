# 使用说明

### 命令
* `server`：启动代理服务器
* `client`：启动客户端

### 参数
* `-k`：登陆密码
* `-s`：代理服务器IP
* `-p`：UDP端口号

### 暴露出的端口
* `1111`：SOCK5
* `2222`：KCPTUN
* `3333`：客户端暴露的 HTTP 代理端口

### 创建SS服务器
```
docker stop ss-server; \
docker rm -f ss-server; \
docker rmi registry.cn-hangzhou.aliyuncs.com/wujingtao/ss; \
docker pull registry.cn-hangzhou.aliyuncs.com/wujingtao/ss; \
docker run --name ss-server -d -p 1234:1111 -p 4321:2222/udp \
registry.cn-hangzhou.aliyuncs.com/wujingtao/ss server -k 登陆密码
```

### 创建SS客户端
```
docker stop ss-server; \
docker rm -f ss-server; \
docker rmi registry.cn-hangzhou.aliyuncs.com/wujingtao/ss; \
docker pull registry.cn-hangzhou.aliyuncs.com/wujingtao/ss; \
docker run --name ss-server -d -p 1080:1111 -p 2080:3333 \
registry.cn-hangzhou.aliyuncs.com/wujingtao/ss client -s 代理服务器IP -p UDP端口号 -k 登陆密码
```