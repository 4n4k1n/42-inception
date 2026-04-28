FROM alpine:3

RUN apk update && apk upgrade && apk add mariadb mariadb-client

COPY mariadb-server.cnf /etc/my-cnf.d/.

RUN mkdir /run/mysqld

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

CMD ["mysqld_safe"]