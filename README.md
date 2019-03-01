# one-key-bt
一键式bt下载服务搭建与使用

## 为什么要建这个repo
国内下载bt实在是慢的想捶人, 迅雷有版权限制, 百度网盘有的资源下不下不来, 比较烦人

现在在使用的是 https://github.com/jpillora/cloud-torrent 这个项目来解决

但是有几个问题
* 当cloud-torrent下载到文件到服务器上后, 我再从服务器Web界面下载无法直接下载文件夹
* bt tracker 有点少, 不能自动更新, 所以导致了有时候速度比较慢

### 更多的想法
* 服务器自动将下载的文件压缩
* 服务器下载的同时, 客户端也可以从服务器下载, 比如服务器已经下载1MB的数据但并没有下载好, 客户端可以下这1MB的数据, 服务器的下载速度肯定是比客户端快的

## 项目预期
* 参考 https://github.com/jpillora/cloud-torrent, 使用Web作为UI
* 使用 `aria2` 作为下载工具


## docker usage
### build
```
docker build -t one-key-bt:v1 .
```
### run
```
docker run -d --privileged=true \
    -p 80:80 \
    -p 6800:6800 \
    -p 6881:6881/udp \
    -v /YOU_DOWNLOAD_DIR:/data \
    one-key-bt:v1
```
修改`/YOU_DOWNLOAD_DIR`
