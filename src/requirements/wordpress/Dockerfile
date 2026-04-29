FROM alpine:3.20

RUN apk update && apk upgrade && apk add --no-cache php84 php84-fpm php84-mysqli curl php-phar

COPY www.conf /etc/php84/php-fpm.d/.
COPY script.sh .

RUN chmod +x script.sh

CMD ["./script.sh"]