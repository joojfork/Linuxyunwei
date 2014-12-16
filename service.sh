#!/bin/bash
#
case $1 in
'start')
  echo "start server ..." ;;
'stop')
  echo "stop server ..." ;;
'restart')
  echo "Restarting server ..." ;;
'status')
  echo "Running..." ;;
*)
  echo "`basename $0` {start|stop|restart|status}" ;;
esac
