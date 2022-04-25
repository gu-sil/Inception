FROM alpine:3.14

VOLUME [ “/sys/fs/cgroup” ]

RUN	apk update \
&&	apk add wget bash openrc mariadb mariadb-client dumb-init

COPY ./setup.sh /setup.sh
COPY ./db-create.sh /db-create.sh
COPY ./my.cnf /my.cnf

ENTRYPOINT ["dumb-init", "--"]

CMD ["/setup.sh"]

