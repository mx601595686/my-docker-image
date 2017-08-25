# 给MySQL增加mysql-udf-http自定义函数
> [原代码项目地址](https://github.com/y-ken/mysql-udf-http)

### Dockerfile
由于mysql存放的数据是保存在volume中的，启动容器后就会被覆盖，所以没有办法通过`Dockerfile`来进行配置。容器第一次启动之后需要执行一次配置插件的SQL（在下面）。



### 安装过程参考
编译最好放在linux主机下进行。这里已经有一个在ubuntu16.04（64位）下编译完成的[mysql-udf-http.so](mysql-udf-http.so)。

[给MySQL增加mysql-udf-http和mysql-udf-json自定义函数，让MySQL有调用http接口和查询直接回JSON的能力](http://www.cnblogs.com/kgdxpr/p/5961310.html)
```bash
# 如果没安装过mysql，先安装mysql
apt-get install mysql-server

# 解压
unzip mysql-udf-http.zip
cd 到解压的文件夹中

# 安装配置，路径需要根据自己mysql的安装路径进行调整。第一个参数“--prefix”是指定编译完成后保存的路径，第二个参数“--with-mysql”是指mysql_config命令行程序的路径
./configure --prefix=/usr/local/mysql-udf-http --with-mysql=/usr/local/mysql/bin/mysql_config

# 开始编译
make && make install

# 编译完成后将程序放到“mysql/lib/plugin”文件夹下
ln -s /usr/local/mysql-udf-http/lib/mysql-udf-http.so.0.0.0 /usr/local/mysql/lib/plugin/mysql-udf-http.so

# 重启mysql
service mysql restart
```
执行`sql`配置插件
```sql
# 删除已有的
DROP FUNCTION IF EXISTS http_get;
DROP FUNCTION IF EXISTS http_post;
DROP FUNCTION IF EXISTS http_put;
DROP FUNCTION IF EXISTS http_delete;

# 创建
create function http_get returns string soname 'mysql-udf-http.so';
create function http_post returns string soname 'mysql-udf-http.so';
create function http_put returns string soname 'mysql-udf-http.so';
create function http_delete returns string soname 'mysql-udf-http.so';

# 实例
select http_get('http://10.10.3.199/dsideal_yy/kgdxpr') as res;
select http_post('http://10.10.3.199/dsideal_yy/kgdxpr','id=1&type=a') as res;
```

### 如果编译过程中提示找不到libcurl库
安装 `sudo apt-get install libcurl4-openssl-dev`

### 查找mysql_config的位置
`which mysql_config`

### json-functions
由于现在mysql已经自带`json-functions`了，说就就不需要安装json插件了
[官方文档](https://dev.mysql.com/doc/refman/5.7/en/json-functions.html)

### 用法说明

#### Description:
```sql
SELECT http_get('<url>');
SELECT http_post('<url>', '<data>');
SELECT http_put('<url>', '<data>');
SELECT http_delete('<url>');
```

#### Example:
```sql
/* Baidu Mobile Search */
SELECT http_get('http://m.baidu.com/s?word=xoyo&pn=0');
SELECT http_post('http://m.baidu.com/s','word=xoyo&pn=0');

/* Sina Weibo Open Platform */
SELECT http_get('http://api.t.sina.com.cn/statuses/user_timeline/103500.json?count=1&source=1561596835') AS data;
SELECT http_post('http://your_sina_uid:your_password@api.t.sina.com.cn/statuses/update.xml?source=1561596835', 'status=Thins is sina weibo test information');

/* Tokyo Tyrant */
SELECT http_put('http://192.168.8.34:1978/key', 'This is value');
SELECT http_get('http://192.168.8.34:1978/key');
SELECT http_delete('http://192.168.8.34:1978/key');
```