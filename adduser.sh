#!/bin/bash
#
DEBUG=0

case $1 in
-v|--verbose)
  DEBUG=1
  ;;
esac

useradd tom &> /dev/null
[ $DEBUG -eq 1 ] && echo "Add user tom finished."
