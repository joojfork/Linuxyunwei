#!/bin/bash
#
DEST=/mnt/sysroot
libcp() {
  LIBPATH=${1%/*}
  [ ! -d $DEST$LIBPATH ] && mkdir -p $DEST$LIBPATH
  [ ! -e $DEST${1} ] && cp $1 $DEST$LIBPATH && echo "copy lib $1 finished."
}

bincp() {
  CMDPATH=${1%/*}
  [ ! -d $DEST$CMDPATH ] && mkdir -p $DEST$CMDPATH
  [ ! -e $DEST${1} ] && cp $1 $DEST$CMDPATH

  for LIB in  `ldd $1 | grep -o "/.*lib\(64\)\{0,1\}/[^[:space:]]\{1,\}"`; do
    libcp $LIB
  done
}

read -p "Your command: " CMD
until [ $CMD == 'q' ]; do
   ! which $CMD && echo "Wrong command" && read -p "Input again:" CMD && continue
  COMMAND=` which $CMD | grep -v "^alias" | grep -o "[^[:space:]]\{1,\}"`
  bincp $COMMAND
  echo "copy $COMMAND finished."
  read -p "Continue: " CMD
done
