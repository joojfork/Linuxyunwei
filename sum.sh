#!/bin/bash
#
declare -i SUM=0

for I in {1..100}; do
  let SUM=$[$SUM+$I]
done

echo "The sum is: $SUM."
