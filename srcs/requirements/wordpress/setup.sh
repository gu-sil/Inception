#!/bin/bash
echo -e "Make www user and give permissions"
adduser -D www
chown -R www /var/www

echo -e "Configure fpm server"
sed -i "s/.*listen = 127.0.0.1.*/listen = 9000/g" /etc/php7/php-fpm.d/www.conf
# Enable error logs
echo "php_flag[display_errors] = on" >> /etc/php7/php-fpm.d/www.conf
echo "php_admin_value[error_log] = /var/log/php7/$pool.error.log" >> /etc/php7/php-fpm.d/www.conf
echo "php_admin_flag[log_errors] = on" >> /etc/php7/php-fpm.d/www.conf

# Append Env Variables on the Configuration File
echo "env[MARIADB_HOST] = \$MARIADB_HOST" >> /etc/php7/php-fpm.d/www.conf
echo "env[MARIADB_USER] = \$MARIADB_USER" >> /etc/php7/php-fpm.d/www.conf
echo "env[MARIADB_PWD] = \$MARIADB_PWD" >> /etc/php7/php-fpm.d/www.conf
echo "env[MARIADB_DB] = \$MARIADB_DB" >> /etc/php7/php-fpm.d/www.conf

echo -e "Copy wp-config.php"
cp /wp-config.php /var/www/wordpress/wp-config.php

echo -e "Start fpm server"
php-fpm7 --nodaemonize
