#!/bin/bash
#
declare -i SHOWNUM=0
declare -i SHOWUSERS=0

for I in `seq 1 $#`; do
  if [ $# -gt 0 ]; then
    case $1 in
    -h|--help)
      echo "Usage: `basename $0` -h|--help -c|--count -v|--verbose"
      exit 0 ;;
    -v|--verbose)
      let SHOWUSERS=1 
      shift ;;
    -c|--count)
      let SHOWNUM=1 
      shift ;;
    *)
      echo "Usage: `basename $0` -h|--help -c|--count -v|--verbose"
      exit 8 ;;
    esac
  fi
done

if [ $SHOWNUM -eq 1 ]; then
  echo "Logged users: `who | wc -l`."
  if [ $SHOWUSERS -eq 1 ]; then
    echo "They are:"
    who
  fi      
fi

