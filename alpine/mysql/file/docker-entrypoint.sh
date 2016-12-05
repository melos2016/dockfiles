#!/bin/bash

sh /run.sh

/mysql.sh mysqld

/usr/bin/supervisord
