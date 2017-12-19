FROM ubuntu:14.04

MAINTAINER Melos

RUN apt update \
    && apt install -y openssh-server supervisor pwgen\
    && mkdir /var/run/sshd 

ADD file /

RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config \
	&& sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config \
	&& echo "Asia/Shanghai" > /etc/timezone \
	&& chmod +x /docker-entrypoint.sh  \
	&& chmod 700 /root \
	&& chmod 700 /root/.ssh \
	&& chmod 600 /root/.ssh/authorized_keys

# Cleanup
RUN rm -rf /tmp/* /var/tmp/* /var/cache/apt/archives/* /var/lib/apt/lists/*

EXPOSE 22

ENTRYPOINT ["/docker-entrypoint.sh"]

