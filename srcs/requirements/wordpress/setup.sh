#!/bin/bash
echo "Update and Install packages"
apk add lighttpd mariadb-client php7-common php7-session php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php7-simplexml

echo "Config Lighttpd"
sed -i 's/# include "mod_fastcgi.conf"/include "mod_fastcgi.conf"/g' /etc/lighttpd/lighttpd.conf

echo "Install wordpress"
mkdir -p /usr/share/webapps/
cd /usr/share/webapps/
wget http://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
rm latest.tar.gz

echo "Make www user and give permissions"
adduser -D www
chown -R www /usr/share/webapps/
ln -s /usr/share/webapps/wordpress/ /var/www/localhost/htdocs/wordpress

echo "Copy wp-config.php"
cp /wp-config.php /var/www/localhost/htdocs/wordpress/wp-config.php

echo "Start lighttpd service"
service lighttpd start
