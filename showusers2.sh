#!/bin/bash
#
NUMBASH=`grep "bash$" /etc/passwd | wc -l`

BASHUSERS=`grep "bash$" /etc/passwd | cut -d: -f1`

BASHUSERS=`echo $BASHUSERS | sed 's@[[:space:]]@,@g'`

echo "BASH, $NUMBASH users, they are:"
echo "$BASHUSERS"

