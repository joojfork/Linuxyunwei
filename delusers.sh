#!/bin/bash
#

for I in {1..10}; do
  if id user$I &> /dev/null; then
    userdel -r user$I
    echo "Delete user$I finished."
  else
    echo "user$I not exist."
  fi
done

