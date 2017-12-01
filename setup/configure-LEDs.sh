#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

# check if root
if [ "$EUID" -ne 0 ]; then
   >&2 /bin/echo "Please run as root"
   exit 1
fi

execs=()
for exec in "${execs[@]}"; do
    if [ ! -x "${exec}" ]; then
	>&2 /bin/echo "${0}: ${exec} required"
	exit 1
    fi
done
