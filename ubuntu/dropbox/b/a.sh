/usr/sbin/sshd -D &
wait 10
/root/dropbox.py start &
wait 60
chmod +x /root/Dropbox/checkiptool/checkip.py
/root/Dropbox/checkiptool/checkip.py
