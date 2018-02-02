### 基于最新的ubuntu 17.10做了以下改动
* 替换了国内源
* 更改了时区
* 安装了常用工具
* 安装了ssh（暴露在22端口）
* 更改了root密码为testroot

> 由于ssh无法随容器启动，可使用下面命令先启动ssh，之后通过连接ssh，再启动要执行的命令     
> 
> docker run -d -p 3333:22 image /usr/sbin/sshd -D
>        
> -D 是强制容器保持运行不退出