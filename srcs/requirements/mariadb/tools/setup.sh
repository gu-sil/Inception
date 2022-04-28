#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'

# User settings
echo -e "${RED}Apply user settings...${NC}"
mariadb-install-db --datadir=/var/lib/mysql --auth-root-authentication-method=normal && \
chown -R mysql:mysql /var/lib/mysql

echo -e "${RED}Start mariadb for configuration${NC}"
# Execute MariaDB Daemon as a Background Process to Set Up
/usr/bin/mysqld_safe --datadir=/var/lib/mysql &
# Change Config to Use Not Only Socket But Also Network
sed -i "s/skip-networking/# skip-networking/g" /etc/my.cnf.d/mariadb-server.cnf
# Change Config to Allow Every Host
sed -i "s/.*bind-address\s*=.*/bind-address=0.0.0.0\nport=3306/g" /etc/my.cnf.d/mariadb-server.cnf
# Check Server Status Whether Configuration File Applied Well or Not

echo -e "${RED}Add database for wordpress${NC}"
if ! mysqladmin --wait=10 ping; then
	echo -e "MariaDB Daemon Unreachable\n"
	exit 1
fi
chmod 755 /tmp/db-create.sh
#/db-create.sh wordpress wordpress wordpress
bash /tmp/db-create.sh

mysqladmin -uroot --password="" password "${MARIADB_ROOT_PWD}"
# stop mariadb daemon
echo -e "${RED}Finish mariadb setup${NC}"
mysqladmin -uroot --password="${MARIADB_ROOT_PWD}" shutdown

# start mariadb as non-daemon
echo -e "${RED}Start mariadb service${NC}"
/usr/bin/mysqld_safe --datadir=/var/lib/mysql
if ! mysqladmin --wait=10 ping; then
	echo -e "MariaDB Daemon Unreachable\n"
	exit 1
fi

echo -e "${RED}Finished All mariadb configuration!!${NC}"
