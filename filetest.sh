#!/bin/bash
#
FILE=/etc/inittabb

if [ -e $FILE ]; then
  echo "OK"
else
  echo "No such file."
fi
