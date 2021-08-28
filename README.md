# Raspberry Pi utilities

This is a collection of useful Raspberry Pi shell scripts.

[![ShellCheck](https://github.com/thomasleplus/raspberry-pi-utils/workflows/ShellCheck/badge.svg)](https://github.com/thomasleplus/raspberry-pi-utils/actions?query=workflow:"ShellCheck")

**These scripts have only been tested with the Raspbian Linux distro.**

Each of these scripts are designed to be executable directly from GitHub using a simple one-liner like:

```sh
sudo bash <(curl -sS https://raw.githubusercontent.com/thomasleplus/raspberry-pi-utils/master/script.sh)
```

But for more advanced (or security-conscious) users, I always recommend downloading scripts and reviewing them before executing them, especially when using `sudo`.

## configure-LEDs.sh

This script lets you configure the LEDs in an interactive way.

```sh
sudo bash <(curl -sS https://raw.githubusercontent.com/thomasleplus/raspberry-pi-utils/master/configure-LEDs.sh)
```

## create-new-login.sh

This script creates a new user account in an interactive way.

```sh
sudo bash <(curl -sS https://raw.githubusercontent.com/thomasleplus/raspberry-pi-utils/master/create-new-login.sh)
```

## See also

[Adafruit's scripts](https://github.com/adafruit/Raspberry-Pi-Installer-Scripts)
