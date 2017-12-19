#!/bin/bash

nohup /usr/sbin/sshd -D &
nohup /usr/local/bin/net_speeder eth0 "ip" >/dev/null 2>&1 &
/root/ssr/ssserver $@
#-k 123456 -m chacha20-ietf -o tls1.2_ticket_auth_compatible -O auth_aes128_md5_compatible

