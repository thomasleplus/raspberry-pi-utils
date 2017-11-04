#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

# check if root
if [ "$EUID" -ne 0 ]; then
   >&2 /bin/echo "Please run as root"
   exit 1
fi

# check we are on a Raspberry Pi
cat /proc/cpuinfo

execs=("/bin/echo")
for exec in "${execs[@]}"; do
    if [ ! -x "${exec}" ]; then
	>&2 /bin/echo "${0}: ${exec} required"
	exit 1
    fi
done

/bin/echo -n "Type the desired username: "
read username

# if username does not exist, create it

# if username pi still exist, copy groups (except pi) to new username
# otherwise use default group list

# sudo

# print command to:
# delete user, group, home folder
# warn to logout and run as other user
