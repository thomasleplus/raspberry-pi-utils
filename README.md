# Raspberry Pi utilities

This is a collection of useful Raspberry Pi shell scripts.

**These scripts have only been tested with the Raspbian Linux distro.**

Each of these scripts are designed to be executable directly from GitHub using a simple one-liner like:

```sh
sudo bash <(curl -sS https://raw.githubusercontent.com/thomasleplus/raspberry-pi-utils/main/script.sh)
```

But for more advanced (or security-conscious) users, I always recommend downloading scripts and reviewing them before executing them, especially when using `sudo`.

## [Configure LEDs](configure-LEDs.sh)

This script lets you configure the LEDs in an interactive way.

```sh
sudo bash <(curl -sS https://raw.githubusercontent.com/thomasleplus/raspberry-pi-utils/main/configure-LEDs.sh)
```

## [Create new login](create-new-login.sh)

This script creates a new user account in an interactive way.

```sh
sudo bash <(curl -sS https://raw.githubusercontent.com/thomasleplus/raspberry-pi-utils/main/create-new-login.sh)
```

## See also

[Adafruit's scripts](https://github.com/adafruit/Raspberry-Pi-Installer-Scripts)

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

## Security

Please read [SECURITY.md](SECURITY.md) for details on our security policy and how to report security vulnerabilities.

## Code of Conduct

Please read [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) for details on our code of conduct.

## License

This project is licensed under the terms of the [LICENSE](LICENSE) file.
