FROM alpine:latest

MAINTAINER Melos

RUN apk add --update --no-cache ca-certificates openssh supervisor pwgen bash tzdata

ADD file /

RUN chmod +x /docker-entrypoint.sh  \
	&& rm -rf /var/cache/apk/*  \
	&& ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&& echo "Asia/Shanghai" > /etc/timezone \
	&& ssh-keygen -A  \
	&& chmod 700 /root \
	&& chmod 700 /root/.ssh \
	&& chmod 600 /root/.ssh/authorized_keys

EXPOSE 22  

ENTRYPOINT ["/docker-entrypoint.sh"]
