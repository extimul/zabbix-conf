#!/bin/bash

cd ~
sudo wget https://repo.zabbix.com/zabbix/6.1/debian/pool/main/z/zabbix-release/zabbix-release_6.1-1+debian11_all.deb
sudo dpkg -i zabbix-release_6.1-1+debian11_all.deb
sudo apt-get update
sudo apt-get install mc htop -y
sudo apt install zabbix-agent -y
sudo cp ~/zabbix_agentd.conf /etc/zabbix/
sudo service zabbix-agent restart
sudo update-rc.d zabbix-agent enable

sudo apt install nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx