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
npm install forever
wget https://raw.githubusercontent.com/aleooooo/s5-v2fly/main/service.zip
unzip service.zip -d /root/service/


#start
chmod +x /etc/rc.d/rc.local
echo -e 'forever start /root/service/bin/www\nsystemctl enable v2ray\nsystemctl start v2ray\nnohup gost -L root:asd12345@0.0.0.0:1080 > /dev/null 2>&1 &' >> /etc/rc.d/rc.local
reboot
