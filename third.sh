#!/bin/bash
#
NAME=root
USERID=`id -u $NAME`
[ $USERID -eq 0 ] && echo "Admin" || echo "Common user."
