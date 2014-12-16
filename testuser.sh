#!/bin/bash
#
if ! id $1 &>/dev/null; then
  echo "No such user."
  exit 10
fi

if [ $1 == `id -n -g $1` ]; then
  echo "Yiyang"
else
  echo "Bu Yiyang"
fi
