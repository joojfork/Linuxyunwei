#!/bin/bash
#
if [ $# -gt 0 ]; then
  if [ $1 == '--add' ]; then
    OP='useradd'
    USERS=$2
    shift 2
  elif [ $1 == '--del' ]; then
    OP='userdel -r'
    USERS=$2
    shift 2
  else
    echo "Unknown Options."
    exit 3
  fi
fi

$OP $USERS
