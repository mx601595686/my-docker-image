# 静态文件服务器和下载工具使用方法：
1. 文件服务器：docker run --rm -v $(pwd):/path -p 8080:80 http-tool server
2. 下载文件：docker run -v $(pwd):/path http-tool download 网址 [文件名]