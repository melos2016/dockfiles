#!/bin/sh

sh /run.sh

bash /dropbox_uploader.sh download /Checkip/checkip.tar.gz /root/backup/checkip.tar.gz

tar xzf /root/backup/checkip.tar.gz -C /root/checkip/

crond

/usr/bin/supervisord 
