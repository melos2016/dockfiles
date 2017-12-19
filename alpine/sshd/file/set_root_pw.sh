#!/bin/bash

cd /etc/ssh
chmod 644 ./*
chmod 600 ssh_host_dsa_key
chmod 600 ssh_host_rsa_key
chmod 755 .

if [ -f /.root_pw_set ]; then
	echo "Root password already set!"
	exit 0
fi

PASS=${ROOT_PASS:-$(pwgen -s 12 1)}
_word=$( [ ${ROOT_PASS} ] && echo "preset" || echo "random" )
echo "=> Setting a ${_word} password to the root user"
echo "root:$PASS" | chpasswd

echo "=> Done!"
echo "the root password : $PASS " > /.root_pw_set

echo "========================================================================"
echo "You can now connect to this Alpine container via SSH using:"
echo ""
echo "    ssh -p <port> root@<host>"
echo "and enter the root password '$PASS' when prompted"
echo ""
echo "Please remember to change the above password as soon as possible!"
echo "========================================================================"
