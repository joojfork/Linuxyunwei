#!/bin/bash
#
LINES=`wc -l /etc/passwd | cut -d' ' -f1`
declare -i NUMBASH=0

for I in `seq 1 $LINES`; do
  if [ `head -$I /etc/passwd | tail -1 | cut -d: -f7 | cut -d'/' -f3` == 'bash' ]; then
    NUMBASH=$[$NUMBASH+1]
    [ -z $BASHUSERS ] && BASHUSERS=`head -$I /etc/passwd | tail -1 | cut -d: -f1` || BASHUSERS="$BASHUSERS,`head -$I /etc/passwd | tail -1 | cut -d: -f1`"
  fi
done

echo "BASH, $NUMBASH users, they are:"
echo "$BASHUSERS"
    

