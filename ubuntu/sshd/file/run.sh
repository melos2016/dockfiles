#!/bin/bash

if [ ! -f /.root_pw_set ]; then
	sh /set_root_pw.sh
fi

