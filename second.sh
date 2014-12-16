#!/bin/bash
LINES=`wc -l /etc/inittab`
#echo $LINES

FINLINES=`echo $LINES | cut -d' ' -f1`
#echo $FINLINES

[ $FINLINES -gt 100 ] && echo "/etc/inittab is a big file." || echo "/etc/inittab is a small file."
