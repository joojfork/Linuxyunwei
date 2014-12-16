#!/bin/bash
#

if [ $1 == '--add' ]; then
  for I in `echo $2 | sed 's/,/ /g'`; do
    if id $I &> /dev/null; then
      echo "$I exists."
    else
      useradd $I
      echo $I | passwd --stdin $I &> /dev/null
      echo "add $I finished."
    fi
  done
elif [ $1 == '--del' ];then
  for I in `echo $2 | sed 's/,/ /g'`; do
    if id $I &> /dev/null; then
      userdel -r $I
      echo "Delete $I finished."
    else
      echo "$I NOT exist."
    fi
  done
elif [ $1 == '--help' ]; then
  echo "Usage: adminuser2.sh --add USER1,USER2,... | --del USER1,USER2,...| --help"
else
  echo "Unknown options."
fi

