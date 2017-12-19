FROM imelos/alpine-sshd

MAINTAINER Melos

ENV KCP_VERSON 20171201

RUN apk add --update --no-cache python libsodium unzip wget libnet-dev libpcap-dev git g++ \
    && mkdir /ssr \
    && cd /ssr \
    && wget --no-check-certificate https://github.com/shadowsocksr-backup/shadowsocksr/archive/manyuser.zip -O /tmp/manyuser.zip \
    && unzip -d /tmp /tmp/manyuser.zip \
    && mv /tmp/shadowsocksr-manyuser/shadowsocks /ssr/shadowsocks \
    && rm -rf /tmp/* \
    && apk add --no-cache --virtual .build-deps curl \
    && mkdir -p /opt/kcptun \
    && cd /opt/kcptun \
    && curl -fSL https://github.com/xtaci/kcptun/releases/download/v${KCP_VERSON}/kcptun-linux-amd64-${KCP_VERSON}.tar.gz | tar xz \
    && rm client_linux_amd64 \
    && cd ~ \
    && apk del .build-deps \
    && git clone https://github.com/snooda/net-speeder.git net_speeder \
    && cd net_speeder \
    && sh build.sh \
    && mv net_speeder /usr/local/bin/ \
    && chmod +x /usr/local/bin/net_speeder \
    && rm -rf /var/cache/apk/*

ADD file /

EXPOSE 8388/tcp 18388/udp 22

ENTRYPOINT ["/docker-entrypoint.sh"]
