这个镜像仅仅是更改了[官方原版DockerFile](https://github.com/docker-library/mysql/tree/0590e4efd2b31ec794383f084d419dea9bc752c4/5.7)
的基础镜像。

从原来的`debian:jessie`更改成了`buildpack-deps:stretch`。后者包含了更多更新的工具包。