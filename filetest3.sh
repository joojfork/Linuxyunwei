#!/bin/bash
#
if [ $# -lt 1 ]; then
  echo "Usage: ./filetest3.sh ARG1 [ARG2 ...]"
  exit 7
fi

if [ -e $1 ]; then
  echo "OK."
else
  echo "No such file."
fi
