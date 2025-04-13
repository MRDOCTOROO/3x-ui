# 3x-ui alpine amd64  
请使用root用户运行

---
安装前准备
```bash
apk add bash wget
```
---
安装:
```bash
wget https://github.com/aaalpineee/3x-ui/raw/refs/heads/main/install.sh
bash install.sh
```
---
卸载
```bash
rc-service x-ui stop
rc-update del x-ui
rm -rf /usr/local/x-ui /usr/bin/x-ui /etc/init.d/x-ui
```
---
显示设置
```bash
/usr/local/x-ui/x-ui setting -show
```
---
设置随机用户名，密码，端口，路径  
**修改设置需要重启**
```bash
/usr/local/x-ui/x-ui setting -username $(tr -dc A-Za-z0-9 </dev/urandom | head -c 20) -password $(tr -dc A-Za-z0-9 </dev/urandom | head -c 20)
/usr/local/x-ui/x-ui setting -webBasePath $(tr -dc A-Za-z0-9 </dev/urandom | head -c 0)
/usr/local/x-ui/x-ui setting -port $(( RANDOM % 64512 + 1024 ))
```
---
改变用户名，密码，路径，端口  
**修改设置需要重启**
```bash
/usr/local/x-ui/x-ui setting -username 新用户名 -password 新密码
/usr/local/x-ui/x-ui setting -webBasePath 新路径
/usr/local/x-ui/x-ui setting -port 新端口
```
