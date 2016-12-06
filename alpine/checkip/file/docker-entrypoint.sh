#!/bin/sh

sh /run.sh


if [ ! -z $BOX_PASS ];then
	openssl des3 -in /dropbox.enc -out /root/.dropbox_uploader -a -k $BOX_PASS -d
fi

bash /dropbox_uploader.sh download /Checkip/checkip.tar.gz /root/backup/checkip.tar.gz

tar xzf /root/backup/checkip.tar.gz -C /root/checkip/

crond

/usr/bin/supervisord 
