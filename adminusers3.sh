#!/bin/bash
#
DEBUG=0
ADD=0
DEL=0

for I in `seq 0 $#`; do
if [ $# -gt 0 ]; then
case $1 in
-v|--verbose)
  DEBUG=1
  shift ;;
-h|--help)
  echo "Usage: `basename $0` --add USER_LIST --del USER_LIST -v|--verbose -h|--help"
  exit 0
  ;;
--add)
  ADD=1
  ADDUSERS=$2
  shift 2
  ;;
--del)
  DEL=1
  DELUSERS=$2
  shift 2
  ;;
*)
  echo "Usage: `basename $0` --add USER_LIST --del USER_LIST -v|--verbose -h|--help"
  exit 7
  ;;
esac
fi
done

if [ $ADD -eq 1 ]; then
  for USER in `echo $ADDUSERS | sed 's@,@ @g'`; do
    if id $USER &> /dev/null; then
      [ $DEBUG -eq 1 ] && echo "$USER exists."
    else
      useradd $USER
      [ $DEBUG -eq 1 ] && echo "Add user $USER finished."
    fi
  done
fi

if [ $DEL -eq 1 ]; then
  for USER in `echo $DELUSERS | sed 's@,@ @g'`; do
    if id $USER &> /dev/null; then
      userdel -r $USER
      [ $DEBUG -eq 1 ] && echo "Delete $USER finished."
    else
      [ $DEBUG -eq 1 ] && echo "$USER not exist."
    fi
  done
fi
