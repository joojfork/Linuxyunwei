#!/bin/bash
#

if [ $# -lt 1 ]; then
  echo "Usage: adminusers ARG"
  exit 7
fi

if [ $1 == '--add' ]; then
  for I in {1..10}; do
    if id user$I &> /dev/null; then
      echo "user$I exists."
    else
      useradd user$I
      echo user$I | passwd --stdin user$I &> /dev/null
      echo "Add user$I finished."
    fi
  done
elif [ $1 == '--del' ]; then
  for I in {1..10}; do
    if id user$I &> /dev/null; then
      userdel -r user$I
      echo "Delete user$I finished."
    else
      echo "No user$I."
    fi
  done
else
  echo "Unknown ARG"
  exit 8
fi
  

