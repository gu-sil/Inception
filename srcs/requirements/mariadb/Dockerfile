FROM alpine:3.14

RUN	apk update \
&&	apk add wget bash mariadb mariadb-client dumb-init

COPY ./tools/setup.sh /tmp/setup.sh
COPY ./tools/db-create.sh /tmp/db-create.sh

ENTRYPOINT ["dumb-init", "--"]

CMD ["/tmp/setup.sh"]

