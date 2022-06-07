#!/bin/bash
# Install zabbix repo
sudo wget https://repo.zabbix.com/zabbix/6.1/debian/pool/main/z/zabbix-release/zabbix-release_6.1-1+debian11_all.deb
sudo dpkg -i zabbix-release_6.1-1+debian11_all.deb
sudo apt update

# Install server, frontend, agent and other tools
sudo apt install zabbix-server-pgsql zabbix-frontend-php php7.4-pgsql zabbix-apache-conf zabbix-sql-scripts zabbix-agent git curl php-curl mc htop

# Setup database
sudo -u postgres createuser --pwprompt zabbix
sudo -u postgres createdb -O zabbix zabbix

sudo zcat /usr/share/doc/zabbix-sql-scripts/postgresql/server.sql.gz | sudo -u zabbix psql zabbix

sudo cp ~/server_conf/zabbix_server.conf /etc/zabbix
sudo cp ~/server_conf/apache.conf /etc/zabbix

sudo systemctl restart zabbix-server zabbix-agent apache2
sudo systemctl enable zabbix-server zabbix-agent apache2