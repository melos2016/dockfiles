FROM alpine:latest

MAINTAINER Melos

RUN apk add --update --no-cache openssh supervisor pwgen bash

ADD file /
	
RUN chmod +x /docker-entrypoint.sh  \
	&& rm -rf /var/cache/apk/*  \
	&& ssh-keygen -A  \
	&& chmod 700 /root \
	&& chmod 700 /root/.ssh \
	&& chmod 600 /root/.ssh/authorized_keys

EXPOSE 22  

ENTRYPOINT ["/docker-entrypoint.sh"]
