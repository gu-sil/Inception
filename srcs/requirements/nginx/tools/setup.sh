#!/bin/bash
# Create new user and group 'www' for nginx
adduser -D -g 'www' www

# Create a directory for html files
mkdir /www
chown -R www:www /var/lib/nginx
chown -R www:www /www

# Config
mkdir -p /etc/nginx/sites-available
mkdir -p /etc/nginx/sites-enabled
cp /tmp/nginx.conf /etc/nginx/nginx.conf
cp /tmp/index.html /www/index.html
cp /tmp/default /etc/nginx/sites-available/default
ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

# Setup ssl
mkdir -p /etc/ssl/certs
mkdir -p /etc/ssl/private
cp /tmp/nginx-selfsigned.crt /etc/ssl/certs/nginx-selfsigned.crt
cp /tmp/nginx-selfsigned.key /etc/ssl/private/nginx-selfsigned.key

# Run nginx
echo "Run nginx"
nginx -g "daemon off;"
