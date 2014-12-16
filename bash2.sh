#!/bin/bash
#
grep "\<bash$" /etc/passwd &> /dev/null
RETVAL=$?

if [ $RETVAL -eq 0 ]; then
  AUSER=`grep "\<bash$" /etc/passwd | head -1 | cut -d: -f1`
  echo "$AUSER is one of such users."
else
  echo "No such user."
fi 
