FROM alpine:3.14

RUN apk update && apk add --no-cache   vim bash wget nginx openrc dumb-init

COPY ./setup.sh /setup.sh
COPY ./index.html /index.html
COPY ./nginx.conf /nginx.conf
COPY ./default /default
COPY ./ssl/nginx-selfsigned.crt /nginx-selfsigned.crt
COPY ./ssl/nginx-selfsigned.key /nginx-selfsigned.key

ENTRYPOINT ["dumb-init", "--"]

CMD ["/setup.sh"]

EXPOSE 443
