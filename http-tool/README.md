## 文件服务器

```sh
docker run --rm -d -v $(pwd):/path -p 8080:80 registry.cn-hangzhou.aliyuncs.com/wujingtao/http-tool server
```

## 文件下载器

```sh
docker run --rm -d -v $(pwd):/path registry.cn-hangzhou.aliyuncs.com/wujingtao/http-tool download 网址 [文件名]
```
