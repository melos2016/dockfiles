FROM docker
MAINTAINER Melos

ENV ROOT_PASS root

RUN apk add --no-cache openssh
	
RUN echo "root:${ROOT_PASS}" |chpasswd \
    && ssh-keygen -A

EXPOSE 22

RUN apk add --no-cache supervisor

COPY sshd_config /etc/ssh/
COPY docker-entrypoint.sh /usr/local/bin/
COPY supervisord.conf /etc/supervisord.conf

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
