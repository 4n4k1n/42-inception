FROM alpine:3

RUN apk update && apk upgrade && apk add mariadb mariadb-client

COPY mariadb-server.cnf /etc/my.cnf.d/.

COPY init.sql /init.sql

RUN mkdir /run/mysqld && \
    mysql_install_db --user=root --datadir=/var/lib/mysql && \
    mysqld --user=root --skip-networking & \
    sleep 2 && \
    mysql -u root < /init.sql && \
    mysqladmin -u root shutdown

CMD ["mysqld_safe"]