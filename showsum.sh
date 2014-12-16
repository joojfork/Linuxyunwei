#!/bin/bash
#
declare -i EVENSUM=0
declare -i ODDSUM=0

for I in {1..100}; do
  if [ $[$I%2] -eq 0 ]; then
    let EVENSUM+=$I
  else
    let ODDSUM+=$I
  fi
done

echo "Odd sum is: $ODDSUM."
echo "Even sum is: $EVENSUM."
