FROM alpine:latest

LABEL MAINTAINER="Melos"

RUN apk add --update --no-cache ca-certificates openssh supervisor pwgen bash tzdata \
	&& rm -rf /var/cache/apk/*  \
	&& ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&& echo "Asia/Shanghai" > /etc/timezone \
	&& ssh-keygen -A 

ADD file /

EXPOSE 22  

ENTRYPOINT ["/docker-entrypoint.sh"]
