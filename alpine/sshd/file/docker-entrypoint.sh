#!/bin/sh
chmod 700 /root
chmod 700 /root/.ssh
chmod 600 /root/.ssh/authorized_keys

sh /run.sh

/usr/bin/supervisord
