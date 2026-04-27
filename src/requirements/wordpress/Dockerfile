FROM alpine:latest

RUN apk update && apk upgrade && apk add --no-cache php84-fpm

COPY www.conf /etc/php84/php-fpm.d/.

CMD ["php-fpm84", "-F"]