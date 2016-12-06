FROM imelos/alpine-sshd

MAINTAINER Melos

RUN apk add --update --no-cache \
              musl \
              build-base \
              bash \
              git \
              python \
              python-dev \
              py-pip

RUN pip install --upgrade pip \
	&& pip install gevent \
	&& rm -r /root/.cache \
	&& rm -rf /var/cache/apk/*
