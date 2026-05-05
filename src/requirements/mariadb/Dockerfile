FROM alpine:3.21

RUN apk update && apk upgrade && apk add --no-cache mariadb mariadb-client

COPY mariadb-server.cnf /etc/my.cnf.d/.
COPY entrypoint.sh /entrypoint.sh

RUN mkdir /run/mysqld && chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
