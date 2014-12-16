#!/bin/bash
#
DEBUG=0

case $1 in
-v|--verbose)
  DEBUG=1 ;;
*) 
  echo "Unknown options"
  exit 7
  ;;
esac

[ $DEBUG -eq 1 ] && echo hello
