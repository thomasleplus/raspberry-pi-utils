#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# check if root
if [ "$EUID" -ne 0 ]; then
   >&2 /bin/echo "Please run as root"
   exit 1
fi

execs=("/bin/grep" "/bin/sed" "/usr/bin/tee")
for exec in "${execs[@]}"; do
    if [ ! -x "${exec}" ]; then
	>&2 /bin/echo "${0}: ${exec} required"
	exit 1
    fi
done

set_dtparam() {
    if /bin/grep -q "^dtparam=${1}" /boot/config.txt ; then
	/bin/sed -i "s/^dtparam=${1}/dtparam=${2}/g" /boot/config.txt
    else
	/bin/echo "dtparam=${2}" | /usr/bin/tee -a /boot/config.txt > /dev/null
    fi
}

ZERO=0
if /bin/grep -q " Zero " /proc/device-tree/model ; then
    ZERO=1
fi

ACT=0
/bin/echo -n "Enable ACT LED? [y/N] "
read -r REPLY
if [[ ${REPLY} =~ ^[Yy] ]]; then
    ACT=1
fi

if [ ${ZERO} -ne 1 ]; then
    PWR=0
    /bin/echo -n "Enable PWR LED? [y/N] "
    read -r REPLY
    if [[ ${REPLY} =~ ^[Yy] ]]; then
	PWR=1
    fi
fi

if [ ${ZERO} -eq 0 ]; then
    if [ ${ACT} -eq 0 ]; then # ACT off
	set_dtparam "act_led_trigger=[^ 	]*" "act_led_trigger=none"
	set_dtparam "act_led_activelow=[^ 	]*" "act_led_activelow=off"
	/bin/echo "ACT disabled."
    else # ACT on
	set_dtparam "act_led_trigger=[^ 	]*" "act_led_trigger=mmc0"
	set_dtparam "act_led_activelow=[^ 	]*" "act_led_activelow=on"
	/bin/echo "ACT enabled."
    fi
    if [ ${PWR} -eq 0 ]; then # PWR off
	set_dtparam "pwr_led_trigger=[^ 	]*" "pwr_led_trigger=none"
	set_dtparam "pwr_led_activelow=[^ 	]*" "pwr_led_activelow=off"
	/bin/echo "PWR disabled."
    else # PWR on
	set_dtparam "pwr_led_trigger=[^ 	]*" "pwr_led_trigger=input"
	set_dtparam "pwr_led_activelow=[^ 	]*" "pwr_led_activelow=on"
	/bin/echo "PWR enabled."
    fi
else
    # For Raspberry Pi Zero values are reversed
    if [ ${ACT} -eq 0 ]; then # ACT off
	set_dtparam "act_led_trigger=[^ 	]*" "act_led_trigger=none"
	set_dtparam "act_led_activelow=[^ 	]*" "act_led_activelow=on"
	/bin/echo "ACT disabled."
    else # ACT on
	set_dtparam "act_led_trigger=[^ 	]*" "act_led_trigger=mmc0"
	set_dtparam "act_led_activelow=[^ 	]*" "act_led_activelow=off"
	/bin/echo "ACT enabled."
    fi
fi
