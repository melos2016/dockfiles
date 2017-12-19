FROM imelos/alpine-sshd

MAINTAINER Melos

RUN apk add --update --no-cache \
              musl \
              build-base \
              bash \
              git \
              python \
              python-dev \
              py-pip \
	&& apk add --update --no-cache curl libffi-dev openssl openssl-dev\
	&& pip install --upgrade pip \
	&& pip install gevent \
	&& pip install pyopenssl \
	&& pip install apsw \
	&& pip install requests \
	&& pip install xmltodict \ 
	&& rm -r /root/.cache \
	&& rm -rf /var/cache/apk/*

COPY file /

EXPOSE 22 
ENTRYPOINT ["/docker-entrypoint.sh"]
