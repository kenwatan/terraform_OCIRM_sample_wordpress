#!/bin/bash
sudo cd /usr/share/nginx/html/
sudo wget https://ja.wordpress.org/latest-ja.tar.gz
sudo tar -xzvf /home/opc/latest-ja.tar.gz 
sudo mv -f /home/opc/wordpress /usr/share/nginx/html
sudo rm -f /home/opc/latest-ja.tar.gz
sudo chmod -R 777 /usr/share/nginx/html/wordpress

sudo rm -f /etc/nginx/nginx.conf
sudo mv -f /home/opc/nginx.conf /etc/nginx/nginx.conf
echo "setup wordpress"

sudo systemctl stop nginx
sudo systemctl stop php-fpm
sudo systemctl start nginx
sudo systemctl start php-fpm
echo "start nginx"
