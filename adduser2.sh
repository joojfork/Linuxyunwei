#!/bin/bash
! id user1 &> /dev/null && useradd user1 && echo "user1" | passwd --stdin user1 &> /dev/null || echo "user1 exists."
! id user2 &> /dev/null	&& useradd user2 && echo "user2" | passwd --stdin user2	&> /dev/null ||	echo "user2 exists."
! id user3 &> /dev/null	&& useradd user3 && echo "user3" | passwd --stdin user3	&> /dev/null ||	echo "user3 exists."

USERS=`wc -l /etc/passwd | cut -d: -f1`
echo "$USERS users."
