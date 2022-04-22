FROM alpine:3.8

RUN	apk update \
&&	apk add ca-certificates wget bash\
&&	update-ca-certificates \
&&	wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_x86_64 \
&&	chmod +x /usr/local/bin/dumb-init

COPY ./setup.sh /setup.sh
COPY ./wp-config.php /wp-config.php

ENTRYPOINT ["dumb-init", "--"]

CMD ["/setup.sh"]

