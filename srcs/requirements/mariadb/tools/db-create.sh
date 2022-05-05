#!/bin/bash

readonly MYSQL=`which mysql`

# Construct the MySQL query
readonly Q1="CREATE DATABASE IF NOT EXISTS $MARIADB_DB;"
readonly Q2="CREATE USER '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PWD';"
readonly Q3="GRANT ALL PRIVILEGES ON $MARIADB_DB.* TO '$MARIADB_USER'@'%' WITH GRANT OPTION;"
readonly Q4="CREATE USER '$MARIADB_USER'@'localhost' IDENTIFIED BY '$MARIADB_PWD';"
readonly Q5="GRANT ALL PRIVILEGES ON $MARIADB_DB.* TO '$MARIADB_USER'@'localhost' WITH GRANT OPTION;"
readonly Q6="FLUSH PRIVILEGES;"
readonly SQL="${Q1}${Q2}${Q3}${Q4}${Q5}${Q6}"

# Run the actual command
$MYSQL -uroot --password="" -e "$SQL"

# Let the user know the database was created
echo -e "Database $MARIADB_DB and user $MARIADB_USER created with a password you chose"
