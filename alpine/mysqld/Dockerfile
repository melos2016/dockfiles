FROM imelos/alpine-sshd

MAINTAINER Melos

RUN apk add --update --no-cache  pwgen mysql mysql-client

COPY file /
RUN chmod +x /docker-entrypoint.sh \
     && mv /supervisord.conf /etc/supervisord.conf \
	&& mv /sshd_config /etc/ssh/sshd_config \
	&& chmod +x /mysql.sh \
	&& mkdir /run/mysqld \
	&& chmod 777 /run/mysqld
	
ENV ROOT_PASS root
ENV MYSQL_ROOT_PASSWORD 123456

EXPOSE 22 3306
ENTRYPOINT ["/docker-entrypoint.sh"]
