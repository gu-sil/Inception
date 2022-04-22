FROM alpine:3.14

RUN apk add --no-cache  vim bash wget openrc\
                        mariadb mariadb-client \
&& wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_x86_64
&& chmod +x /usr/local/bin/dumb-init

COPY ./setup.sh /setup.sh
COPY ./wp_db.sql /wp_db.sql

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["/setup.sh"]
                        