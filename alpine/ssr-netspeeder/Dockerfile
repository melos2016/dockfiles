FROM alpine

ENV KCP_VERSON 20170525

RUN apk update \
    && apk add --no-cache python libsodium unzip wget libnet-dev libpcap-dev git g++ ca-certificates openssh supervisor pwgen bash tzdata

ADD file /

RUN  chmod +x /docker-entrypoint.sh  \
    && rm -rf /var/cache/apk/*  \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && ssh-keygen -A  \
    && chmod 700 /root \
    && chmod 700 /root/.ssh \
    && chmod 600 /root/.ssh/authorized_keys \
    && mkdir /ssr \
    && cd /ssr \
    && wget --no-check-certificate https://github.com/breakwa11/shadowsocks/archive/manyuser.zip -O /tmp/manyuser.zip \
    && unzip -d /tmp /tmp/manyuser.zip \
    && mv /tmp/shadowsocksr-manyuser/shadowsocks /ssr/shadowsocks \
    && rm -rf /tmp/*

ADD shadowsocks.json /shadowsocks.json

RUN apk add --no-cache --virtual .build-deps curl \
    && mkdir -p /opt/kcptun \
    && cd /opt/kcptun \
    && curl -fSL https://github.com/xtaci/kcptun/releases/download/v${KCP_VERSON}/kcptun-linux-amd64-${KCP_VERSON}.tar.gz | tar xz \
    && rm client_linux_amd64 \
    && cd ~ \
    && apk del .build-deps
	
ADD kcptun.json /kcptun.json

COPY supervisord.conf /etc/supervisord.conf

ADD docker-entrypoint.sh /docker-entrypoint.sh

RUN git clone https://github.com/snooda/net-speeder.git net-speeder

WORKDIR net-speeder

RUN sh build.sh \
    && mv net_speeder /usr/local/bin/ \
    && chmod +x /docker-entrypoint.sh \
    && chmod +x /usr/local/bin/net_speeder \
    && rm -rf /var/cache/apk/*

EXPOSE 8388/tcp 18388/udp 22
ENTRYPOINT ["/docker-entrypoint.sh"]
