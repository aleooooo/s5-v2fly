systemctl stop firewalld.service
systemctl disable firewalld.service
#BBR
wget –no-check-certificate https://raw.githubusercontent.com/aleooooo/s5-v2fly/main/install_bbr.sh 
chmod +x install_bbr.sh 
./install_bbr.sh

#v2fly
wget https://raw.githubusercontent.com/aleooooo/s5-v2fly/main/v2fly_install.sh
chmod -R 777 v2fly_install.sh
./v2fly_install.sh

chmod -R 777 /usr/local/etc/v2ray/config.json
echo '{"inbounds":[{"port":443,"protocol":"vmess","settings":{"clients":[{"id":"ffffffff-ffff-ffff-ffff-ffffffffffff","alterId":0}]}}],"outbounds":[{"protocol":"freedom","settings":{}}]}' > /usr/local/etc/v2ray/config.json 

#nodejs
yum -y install nodejs
yum -y install npm
npm update
wget https://raw.githubusercontent.com/aleooooo/s5-v2fly/main/service.zip
unzip service.zip -d /root/service/
cd /root/service
npm install forever -g

echo -e 'cd /root/service\nforever start ./bin/www' > '/root/startService.sh'
chmod -R 777 /root/startService.sh
#start
chmod +x /etc/rc.d/rc.local
echo -e 'systemctl enable v2ray\nsystemctl start v2ray\n/root/startService.sh\n' >> /etc/rc.d/rc.local
reboot
