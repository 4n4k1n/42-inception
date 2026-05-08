FROM alpine:3.23

RUN apk update && apk upgrade && apk add --no-cache php84 php84-fpm php84-mysqli php84-phar php84-iconv php84-mbstring curl mariadb-client

COPY www.conf /etc/php84/php-fpm.d/.
COPY script.sh .

RUN chmod +x script.sh

CMD ["./script.sh"]