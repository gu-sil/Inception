FROM alpine:3.14

RUN	apk update \
&&	apk add bash wget curl mariadb-client php7 php7-phar php7-json php7-curl php7-fpm php7-mysqli php7-iconv dumb-init\
&&	curl -s -L https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/bin/wp \
&&	chmod +x /usr/bin/wp \
&&	mkdir -p /var/www/wordpress

COPY ./tools/setup.sh /tmp/setup.sh
COPY ./tools/wp-config.php /tmp/wp-config.php

ENTRYPOINT ["dumb-init", "--"]

CMD ["/tmp/setup.sh"]
