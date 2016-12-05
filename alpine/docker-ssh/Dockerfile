FROM docker
MAINTAINER Melos

ENV ROOT_PASS root

RUN apk add --no-cache openssh
	
RUN echo "root:${ROOT_PASS}" |chpasswd \
    && ssh-keygen -A \
    && sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config \
	&& sed -i "s/#PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config \
    && mkdir -p /var/run/sshd

EXPOSE 22

COPY docker-entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/usr/sbin/sshd","-D"]
