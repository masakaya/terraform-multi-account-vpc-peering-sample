#!/bin/bash

# Install mysql instance
sudo yum install -y https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm
sudo yum remove mariadb-libs
sudo yum-config-manager --enable mysql57-community
sudo yum-config-manager --disable mysql80-community
sudo yum install -y mysql-community-client

# change timezone
unalias cp
cp -f -p /usr/share/zoneinfo/Japan /etc/localtime

cat << _EOT_ > /etc/sysconfig/clock
ZONE="Asia/Tokyo"
UTC=false
_EOT_

chmod 644 /etc/sysconfig/clock
/etc/init.d/crond restart