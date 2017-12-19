FROM imelos/alpine-sshd

MAINTAINER Melos

COPY file /

RUN apk add --update --no-cache  pwgen mysql mysql-client \
	&& chmod +x /docker-entrypoint.sh \
	&& chmod +x /mysql.sh \
	&& mkdir /run/mysqld \
	&& chmod 777 /run/mysqld
	
ENV MYSQL_ROOT_PASSWORD 123456

EXPOSE 22 3306
ENTRYPOINT ["/docker-entrypoint.sh"]
