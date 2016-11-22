# shadowsocksr-net-speeder 
FROM lnterface/ssr-with-net_speeder:latest
ADD ssserver /root/ssr/
RUN chmod +x /root/ssr/entrypoint.sh

ENTRYPOINT ["/root/ssr/entrypoint.sh"]
CMD ["-p 1080 -k 123456 -m chacha20-ietf -o tls1.2_ticket_auth_compatible -O auth_aes128_md5_compatible"]
