FROM alpine:3.14

RUN apk update && apk add --no-cache   vim bash wget nginx dumb-init

COPY ./tools/setup.sh /tmp/setup.sh
COPY ./tools/index.html /tmp/index.html
COPY ./conf/nginx.conf /tmp/nginx.conf
COPY ./tools/default /tmp/default
COPY ./tools/ssl/nginx-selfsigned.crt /tmp/nginx-selfsigned.crt
COPY ./tools/ssl/nginx-selfsigned.key /tmp/nginx-selfsigned.key

ENTRYPOINT ["dumb-init", "--"]

CMD ["/tmp/setup.sh"]

EXPOSE 443
