# 使用说明

### 命令

-   `server`：启动代理服务器
-   `client`：启动客户端

### 参数

-   `-k`：代理服务器登陆密码
-   `-s`：代理服务器 IP
-   `-p`：代理服务器`kcptun`端口号
-   `-m`：`kcptun`加速模式：fast3, fast2, fast, normal。默认 fast
    -   > 对于服务器，使用默认`fast`就足够了，最多`fast2`，`fast3`对服务器而言没有太多意义
    -   > 对于客户端，如果没有过多的上传流量推荐直接开到`fast3`，这样可加快对服务器的`ACK`响应，减少服务器重复发包的数量，节约服务器流量。

### 暴露出的端口

-   `1111`：远端服务器代理端口或客户端`socks5`端口
-   `2222`：命令为`server`时暴露的`kcptun`端口
-   `3333`：命令为`client`时暴露的`http`代理端口

### 创建 SS 服务器

```sh
docker stop ss-server; \
docker rm -f ss-server; \
docker rmi registry.cn-hangzhou.aliyuncs.com/wujingtao/ss; \
docker pull registry.cn-hangzhou.aliyuncs.com/wujingtao/ss; \
docker run --name ss-server -d -p 1111:1111 -p 2222:2222/udp \
registry.cn-hangzhou.aliyuncs.com/wujingtao/ss server -k 登陆密码
```

### 创建 SS 客户端

```sh
docker stop ss-client; \
docker rm -f ss-client; \
docker rmi registry.cn-hangzhou.aliyuncs.com/wujingtao/ss; \
docker pull registry.cn-hangzhou.aliyuncs.com/wujingtao/ss; \
docker run --name ss-client -d -p 1111:1111 -p 3333:3333 \
registry.cn-hangzhou.aliyuncs.com/wujingtao/ss client -s 代理服务器IP -p kcptun端口号 -k 登陆密码
```

### 其他参考

-   加密方式：`aes-256-gcm`
-   kcptun 配置：`dscp=0;mtu=1350;parityshard=3;mode=fast3;cryto=none`
-   [ss windows 客户端](https://github.com/shadowsocks/shadowsocks-windows)。( xp 最高可用版本为 3.2 )
-   [ss android 客户端](https://github.com/shadowsocks/shadowsocks-android)
-   [kcptun 客户端](https://github.com/xtaci/kcptun)
-   [kcptun windows 图形界面](https://github.com/dfdragon/kcptun_gclient)
-   [kcptun android 插件](https://github.com/shadowsocks/kcptun-android)
