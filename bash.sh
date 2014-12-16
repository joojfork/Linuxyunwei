#!/bin/bash
#
grep "\<bash$" /etc/passwd &> /dev/null
RETVAL=$?

if [ $RETVAL -eq 0 ]; then
  USERS=`grep "\<bash$" /etc/passwd | wc -l`
  echo "The shells of $USERS users is bash." 
else
  echo "No such user."
fi 
