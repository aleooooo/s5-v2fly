systemctl stop firewalld.service
systemctl disable firewalld.service
#BBR
#wget –no-check-certificate https://raw.githubusercontent.com/aleooooo/s5-v2fly/main/install_bbr.sh 
#chmod +x install_bbr.sh 
#./install_bbr.sh

#v2fly
wget https://raw.githubusercontent.com/aleooooo/s5-v2fly/main/v2fly_install.sh
chmod -R 777 v2fly_install.sh
./v2fly_install.sh

#wget -cO /usr/local/etc/v2ray/config.json https://raw.githubusercontent.com/aleooooo/s5-v2fly/main/v2fly_config.json
chmod -R 777 /usr/local/etc/v2ray/config.json
echo '{"inbounds":[{"port":443,"protocol":"vmess","settings":{"clients":[{"id":"ffffffff-ffff-ffff-ffff-ffffffffffff","alterId":0}]}}],"outbounds":[{"protocol":"freedom","settings":{}}]}' > /usr/local/etc/v2ray/config.json 

#nodeJs
yum -y install nodejs
yum -y install npm
npm update
wget https://raw.githubusercontent.com/aleooooo/s5-v2fly/main/callback_v1.zip
unzip callback_v1.zip -d /root/
cd /root/
npm install forever -g

host=$1
chmod +x /etc/rc.d/rc.local
echo -e "cd /root\nforever app.js $host\n" >> /etc/rc.d/rc.local
reboot
