#!/bin/bash
sudo timedatectl set-timezone Asia/Tokyo
sudo localectl set-locale LANG=ja_JP.utf8
sudo setenforce 0
sudo yum update -y
sudo yum install -y nginx
sudo rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum install -y https://rpms.remirepo.net/enterprise/remi-release-7.rpm
sudo yum -y install --enablerepo=remi-php74 php php-mbstring php-xml php-xmlrpc php-gd php-pdo php-pecl-mcrypt php-mysqlnd php-pecl-mysql php-fpm
sudo yum install -y https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm
sudo yum install -y mysql-community-client
sudo firewall-cmd --add-service=http --zone=public --permanent
sudo firewall-cmd --reload
sudo firewall-cmd --list-all --zone=public
