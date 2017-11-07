#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

# check if root
if [ "$EUID" -ne 0 ]; then
   >&2 /bin/echo "Please run as root"
   exit 1
fi

execs=("/bin/echo" "/usr/bin/passwd" "/usr/sbin/useradd")
for exec in "${execs[@]}"; do
    if [ ! -x "${exec}" ]; then
	>&2 /bin/echo "${0}: ${exec} required"
	exit 1
    fi
done

/bin/echo -n "Type the desired username: "
read -r username

/usr/sbin/useradd --create-home --shell /bin/bash --user-group --groups adm,dialout,cdrom,sudo,audio,video,plugdev,games,users,input,netdev,gpio,i2c,spi "${username}"

/usr/bin/passwd "${username}"
