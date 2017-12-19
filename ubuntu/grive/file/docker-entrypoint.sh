#!/bin/sh

sh /run.sh

if [ ! -z $GRIVE_PASS ];then
	openssl des3 -in /grive.enc -out /root/google_drive/.grive -a -k $GRIVE_PASS -d
fi

/usr/bin/supervisord
