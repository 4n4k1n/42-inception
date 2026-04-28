FROM alpine:3

RUN apk update && apk upgrade && apk add mariadb mariadb-client

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

CMD ["mysqld_safe"]