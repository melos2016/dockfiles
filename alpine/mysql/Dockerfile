FROM imelos/alpine:sshd

MAINTAINER Melos

ENV MYSQL_ROOT_PASSWORD 111111

RUN apk --no-cache add bash pwgen su-exec tzdata mysql mysql-client && \
    mkdir /run/mysqld && chmod 777 /run/mysqld

ADD file /
RUN chmod +x /docker-entrypoint.sh \
	&& mv supervisord.conf /etc/supervisord.conf \
	&& chmod +x /mysql.sh

ENV ROOT_PASS root

EXPOSE 22 3306
ENTRYPOINT ["/docker-entrypoint.sh"]
