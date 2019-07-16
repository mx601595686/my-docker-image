# 使用说明

### 命令
* `server`：启动代理服务器
* `client`：启动客户端

### 参数
* `-k`：代理服务器登陆密码
* `-s`：代理服务器IP
* `-p`：代理服务器`kcptun`端口号

### 暴露出的端口
* `1111`：远端服务器代理端口或客户端`socks5`端口
* `2222`：命令为`server`时暴露的`kcptun`端口
* `3333`：命令为`client`时暴露的`http`代理端口

### 创建SS服务器
```
docker stop ss-server; \
docker rm -f ss-server; \
docker rmi registry.cn-hangzhou.aliyuncs.com/wujingtao/ss; \
docker pull registry.cn-hangzhou.aliyuncs.com/wujingtao/ss; \
docker run --name ss-server -d -p 1111:1111 -p 2222:2222/udp \
registry.cn-hangzhou.aliyuncs.com/wujingtao/ss server -k 登陆密码
```

### 创建SS客户端
```
docker stop ss-server; \
docker rm -f ss-server; \
docker rmi registry.cn-hangzhou.aliyuncs.com/wujingtao/ss; \
docker pull registry.cn-hangzhou.aliyuncs.com/wujingtao/ss; \
docker run --name ss-server -d -p 1111:1111 -p 3333:3333 \
registry.cn-hangzhou.aliyuncs.com/wujingtao/ss client -s 代理服务器IP -p UDP端口号 -k 登陆密码
```

### 其他参考
* 加密方式：`aes-256-gcm`
* kcptun配置：`dscp=0;mtu=1350;parityshard=3;mode=fast;cryto=none`
* [ss windows客户端](https://github.com/shadowsocks/shadowsocks-windows)。( xp最高可用版本为3.2 )
* [ss android客户端](https://github.com/shadowsocks/shadowsocks-android)
* [kcptun 客户端](https://github.com/xtaci/kcptun)
* [kcptun windows图形界面](https://github.com/dfdragon/kcptun_gclient)
* [kcptun android插件](https://github.com/shadowsocks/kcptun-android)