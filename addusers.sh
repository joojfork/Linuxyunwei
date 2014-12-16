#!/bin/bash
useradd user1
echo "user1" | passwd --stdin user1 &> /dev/null
echo "Add user1 finished."
