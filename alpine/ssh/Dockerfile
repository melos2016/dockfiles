FROM alpine:latest

MAINTAINER Melos

ENV ROOT_PASS root

RUN apk add --no-cache openssh
	
RUN echo "root:${ROOT_PASS}" |chpasswd \
    && ssh-keygen -A \
    && sed -i "s/#PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config \
    && mkdir -p /var/run/sshd

EXPOSE 22

CMD    ["/usr/sbin/sshd", "-D"]
