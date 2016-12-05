#!/bin/sh

echo "root:${ROOT_PASS}" |chpasswd  > /dev/null

/usr/bin/supervisord
