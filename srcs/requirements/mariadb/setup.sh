#!/bin/bash


# Create database and user for wordpress
mysql -uroot --password="" -e `\
CREATE DATABASE ${DB_DATABASE}
CREATE USER '${DB_USER}'@'localhost' IDENTIFIED BY ''; \
GRANT ALL PRIVILEGES ON * . * TO '${DB_USER}'@'localhost'; \
FLUSH PRIVILEGES; \
exit; `





