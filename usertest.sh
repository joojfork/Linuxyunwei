#!/bin/bash
#
NAME=user17

if id $NAME &> /dev/null; then
  echo "$NAME exists."
else
  useradd $NAME
  echo $NAME | passwd --stdin $NAME &> /dev/null
  echo "Add $NAME finished."
fi
