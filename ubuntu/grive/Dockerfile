FROM imelos/ubuntu-sshd

RUN apt update \
    && apt install -y python-software-properties software-properties-common

RUN add-apt-repository -y ppa:nilarimogard/webupd8 \
    && apt update \
    && apt install -y grive

ADD file /

RUN mkdir ~/google_drive \
	&& chmod +x /docker-entrypoint.sh

# Cleanup
RUN rm -rf /tmp/* /var/tmp/* /var/cache/apt/archives/* /var/lib/apt/lists/*

EXPOSE 22

ENTRYPOINT ["/docker-entrypoint.sh"]
