#!/bin/bash
#
FILE=/etc/rc.dddd

if [ ! -e $FILE ]; then
  echo "No such file."
  exit
fi

if [ -f $FILE ]; then
  echo "Common file."
elif [ -d $FILE ]; then
  echo "Directory."
else
  echo "Unknown."
fi
