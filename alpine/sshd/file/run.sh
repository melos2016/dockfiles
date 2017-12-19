#!/bin/bash
chmod 700 /root
chmod 700 /root/.ssh
chmod 600 /root/.ssh/authorized_keys

if [ ! -f /.root_pw_set ]; then
	sh /set_root_pw.sh
fi


