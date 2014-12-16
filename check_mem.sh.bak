#!/bin/bash

# Check Memory Usage via `free -mt`

########################
# DECLARATIONS
########################

PROGNAME=`basename $0`
REVISION=`echo '$Revision: 1.0 $' | sed -e 's/[^0-9.]//g'`

DEBUG=0

exitstatus=0
result=""
perfdata=""
pctWarning=""
pctCritical=""
pctSwpWarning=""
pctSwpCritical=""
rawOutput=0

status[0]="OK: "
status[1]="WARNING: "
status[2]="CRITICAL: "
status[3]="UNKNOWN: "

########################
# FUNCTIONS
########################

print_usage() {
  echo "Usage: $PROGNAME [options]"
  echo "  e.g. $PROGNAME -w 75 -W 25 -c 95 -C 75"
  echo
  echo "Options:"
  echo -e "\t --help    | -h       print help"
  echo -e "\t --version | -V       print version"
  echo -e "\t --verbose | -v       be verbose (debug mode)"
  echo -e "\t --raw     | -r       Use MB instead of % for output data"
  echo -e "\t -w [int]             set warning value for physical RAM used %"
  echo -e "\t -c [int]             set critical value for physical RAM used %"
  echo -e "\t -W [int]             set warning value for swap used %"
  echo -e "\t -C [int]             set critical value for swap used %"
  echo
  echo
}

print_help() {
#  print_revision $PROGNAME $REVISION
  echo "${PROGNAME} Revision: ${REVISION}"
  echo
  echo "This plugin checks local memory usage using 'free -mt'"
  echo
  print_usage
  echo
# support
  exit 3
}

parse_options() {
# parse cmdline arguments
  (( DEBUG )) && echo "Parsing options $1 $2 $3 $4 $5 $6 $7 $8"
  if [ "$#" -gt 0 ]; then
    while [ "$#" -gt 0 ]; do
      case "$1" in
        '--help'|'-h')
          print_help
          exit 3
          ;;
        '--version'|'-V')
          #print_revision $PROGNAME $REVISION
          echo "${PROGNAME} Revision: ${REVISION}"
          exit 3
          ;;
        '--verbose'|'-v')
          DEBUG=1
          shift 1
          ;;
        '--raw'|'-r')
          rawOutput=1
          shift 1
          ;;
        '-c')
          pctCritical="$2"
          shift 2
          ;;
        '-w')
          pctWarning="$2"
          shift 2
          ;;
        '-C')
          pctSwpCritical="$2"
          shift 2
          ;;
        '-W')
          pctSwpWarning="$2"
          shift 2
          ;;
        *)
          echo "Unknown option!"
          print_usage
          exit 3
          ;;
      esac
    done
  fi
}

########################
# MAIN
########################

parse_options $@

memory=$(free -mt)
 (( DEBUG )) && echo "memory=$memory"

phyTotal=$(cut -d' ' -f  8 <<< $memory)
 (( DEBUG )) && echo "phyTotal=$phyTotal"
swpTotal=$(cut -d' ' -f 19 <<< $memory)
 (( DEBUG )) && echo "swpTotal=$swpTotal"
phyShared=$(cut -d' ' -f 11 <<< $memory)
 (( DEBUG )) && echo "phyShared=$phyShared"
phyBuffers=$(cut -d' ' -f 12 <<< $memory)
 (( DEBUG )) && echo "phyBuffers=$phyBuffers"
phyCached=$(cut -d' ' -f 13 <<< $memory)
 (( DEBUG )) && echo "phyCached=$phyCached"
phyUsed=$(cut -d' ' -f 16 <<< $memory)
 (( DEBUG )) && echo "phyUsed=$phyUsed"
phyAllUsed=$(cut -d' ' -f 9 <<< $memory)
 (( DEBUG )) && echo "phyAllUsed=$phyAllUsed"
swpUsed=$(cut -d' ' -f 20 <<< $memory)
 (( DEBUG )) && echo "swpUsed=$swpUsed"

pctPhyShared=$(bc <<< "scale=2;$phyShared*100/$phyTotal")
 (( DEBUG )) && echo "pctPhyShared=$pctPhyShared"
pctPhyBuffers=$(bc <<< "scale=2;$phyBuffers*100/$phyTotal")
 (( DEBUG )) && echo "pctPhyBuffers=$pctPhyBuffers"
pctPhyCached=$(bc <<< "scale=2;$phyCached*100/$phyTotal")
 (( DEBUG )) && echo "pctPhyCached=$pctPhyCached"
pctPhyUsed=$(bc <<< "scale=2;$phyUsed*100/$phyTotal")
 (( DEBUG )) && echo "pctPhyUsed=$pctPhyUsed"
pctPhyAllUsed=$(bc <<< "scale=2;$phyAllUsed*100/$phyTotal")
 (( DEBUG )) && echo "pctPhyAllUsed=$pctPhyAllUsed"
if [ $swpTotal -eq 0 ]; then
  pctSwpUsed=0
else
  pctSwpUsed=$(bc <<< "scale=2;$swpUsed*100/$swpTotal")
fi
 (( DEBUG )) && echo "pctSwpUsed=$pctSwpUsed"
 (( DEBUG )) && echo "rawOutput=$rawOutput"
 (( DEBUG )) && echo "pctWarning=$pctWarning"
 (( DEBUG )) && echo "pctCritical=$pctCritical"
 (( DEBUG )) && echo "pctSwpWarning=$pctSwpWarning"
 (( DEBUG )) && echo "pctSwpCritical=$pctSwpCritical"

if [ -n "$pctWarning" ]; then
  warning=$(bc <<< "scale=0;$pctWarning * $phyTotal / 100")
  (( DEBUG )) && echo "warning=$warning"
  if [ $(bc <<< "$pctPhyUsed >= $pctWarning") -ne 0 ]; then
    exitstatus=1
  fi
fi

if [ -n "$pctSwpWarning" ]; then
  swpWarning=$(bc <<< "scale=0;$pctSwpWarning * $swpTotal / 100")
  (( DEBUG )) && echo "swpWarning=$swpWarning"
  if [ $(bc <<< "$pctSwpUsed >= $pctSwpWarning") -ne 0 ]; then
    exitstatus=1
  fi
fi

if [ -n "$pctCritical" ]; then
  critical=$(bc <<< "scale=0;$pctCritical * $phyTotal / 100")
  (( DEBUG )) && echo "critical=$critical"
  if [ $(bc <<< "$pctPhyUsed >= $pctCritical") -ne 0 ]; then
    exitstatus=2
  fi
fi

if [ -n "$pctSwpCritical" ]; then
  swpCritical=$(bc <<< "scale=0;$pctSwpCritical * $swpTotal / 100")
  (( DEBUG )) && echo "swpCritical=$swpCritical"
  if [ $(bc <<< "$pctSwpUsed >= $pctSwpCritical") -ne 0 ]; then
    exitstatus=2
  fi
fi

if [ $rawOutput -eq 1 ]; then
  result="Memory Usage - ${phyUsed}MB of ${phyTotal}MB RAM used, ${swpUsed}MB of ${swpTotal}MB Swap used"
  perfdata="phyUsed=${phyUsed};${warning};${critical};0;${phyTotal} phyShared=${phyShared};;;0;${phyTotal} phyBuffers=${phyBuffers};;;0;${phyTotal} phyCached=${phyCached};;;0;${phyTotal} phyAllUsed=${phyAllUsed};;;0;${phyTotal} swpUsed=${swpUsed};${swpWarning};${swpCritical};0;${swpTotal}"
else
  result="Memory Usage - ${pctPhyUsed}% RAM, ${pctSwpUsed}% Swap"
  perfdata="phyUsed=${pctPhyUsed}%;${pctWarning};${pctCritical};0;100 phyShared=${pctPhyShared}%;;;0;100 phyBuffers=${pctPhyBuffers}%;;;0;100 phyCached=${pctPhyCached}%;;;0;100 phyAllUsed=${pctPhyAllUsed}%;;;0;100 swpUsed=${pctSwpUsed}%;${pctSwpWarning};${pctSwpCritical};0;100"
fi

echo "${status[$exitstatus]}${result} | ${perfdata}"
exit $exitstatus

