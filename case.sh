#!/bin/bash
#
case $1 in
[0-9])
  echo "A digit." ;;
[a-z])
  echo "Lower" ;;
[A-Z])
  echo "Upper" ;;
*)
  echo "Special character." ;;
esac
