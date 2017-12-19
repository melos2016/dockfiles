#!/bin/sh

chmod +x /backup.sh
chmod +x /dropbox_uploader.sh

sh /run.sh


if [ ! -z $BOX_PASS ];then
	openssl des3 -in /dropbox.enc -out /root/.dropbox_uploader -a -k $BOX_PASS -d
fi

bash /dropbox_uploader.sh download /Tumblr/tumblr.tar.gz /root/backup/tumblr.tar.gz

tar xzf /root/backup/tumblr.tar.gz -C /root/tumblr/

crond

/usr/bin/supervisord 
