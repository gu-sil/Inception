#!/bin/bash
echo -e "Download wordpress with wp-cli"
wp core download --path=/var/www/wordpress

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

echo -e "Config wp-config.php"
cp /tmp/wp-config.php /var/www/wordpress/wp-config.php

echo -e "Install wordpress"
wp core install --url="$WP_URL" --title="$WP_TITLE" --admin_user="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PWD" --admin_email="$WP_ADMIN_EMAIL" --skip-email --path=/var/www/wordpress

echo -e "Add default user"
wp user create hyun hyun@example.com --user_pass=password --path=/var/www/wordpress

echo -e "Start fpm server"
php-fpm7 --nodaemonize
