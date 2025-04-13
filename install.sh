#! /bin/bash
rm install.sh
cd 
rm -rf /usr/bin/x-ui /usr/local/x-ui /etc/init.d/x-ui
mkdir /usr/local/x-ui
cd /usr/local/x-ui
wget https://github.com/aaalpineee/3x-ui/releases/download/v1.0/x-ui.gz
gzip -d x-ui.gz
chmod u+x x-ui
mkdir bin
cd bin
wget https://github.com/aaalpineee/3x-ui/releases/download/v1.0/xray.gz
wget https://github.com/aaalpineee/3x-ui/releases/download/v1.0/geosite.dat.gz
wget https://github.com/aaalpineee/3x-ui/releases/download/v1.0/geoip.dat.gz
gzip -d xray.gz
mv xray xray-linux-amd64
gzip -d geosite.dat.gz
gzip -d geoip.dat.gz
chmod u+x xray-linux-amd64
wget https://github.com/aaalpineee/3x-ui/raw/refs/heads/main/x-ui -O /etc/init.d/x-ui
chmod u+x /etc/init.d/x-ui
wget https://github.com/aaalpineee/3x-ui/raw/refs/heads/main/x-ui.sh -O /usr/bin/x-ui
chmod u+x /usr/bin/x-ui
/usr/local/x-ui/x-ui setting -username $(tr -dc A-Za-z0-9 </dev/urandom | head -c 20) -password $(tr -dc A-Za-z0-9 </dev/urandom | head -c 20)
/usr/local/x-ui/x-ui setting -webBasePath $(tr -dc A-Za-z0-9 </dev/urandom | head -c 20)
/usr/local/x-ui/x-ui setting -port $(( RANDOM % 64512 + 1024 ))
/usr/local/x-ui/x-ui setting -show
rc-service x-ui start
rc-update add x-ui
cd 
