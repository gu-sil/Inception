#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'

# User settings
echo -e "${RED}Apply user settings...${NC}"
addgroup "www"
adduser -D -g "www" www
chown -R $DB_USER:$DB_GROUP /var/lib/mysql

echo -e "${RED}Service MariaDB${NC}"
openrc
touch /run/openrc/softlevel
/etc/init.d/mariadb setup
/etc/init.d/mariadb start

echo -e "${RED}Setup db${NC}"
chmod 755 db-create.sh
./db-create.sh wordpress wordpress wordpress
#./db-create.sh $DB_TABLE $DB_USER $DB_PASSWORD

tail -F anything
