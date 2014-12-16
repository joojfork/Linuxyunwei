#!/bin/bash
#
if [ $# -lt 2 ]; then
  echo "Usage: cacl.sh ARG1 ARG2"
  exit 8
fi

echo "The sum is: $[$1+$2]."
echo "The prod is: $[$1*$2]."
