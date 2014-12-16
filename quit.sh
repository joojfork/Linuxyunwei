#!/bin/bash
#
if [ $1 == 'q' -o $1 == 'Q' -o $1 == 'Quit' -o $1 == 'quit' ]; then
  echo "Not Quiting..."
  exit 0
else
  echo "Unknown Argument."
  exit 1
fi
