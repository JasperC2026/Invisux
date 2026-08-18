<div align="center">

![Banner](https://codeberg.org/JasperC/Invisux/raw/branch/main/Assets/INVISUX.png)

# Invisux

[![Version](https://img.shields.io/badge/1.1-000000?style=for-the-badge)](https://codeberg.org/JasperC/Invisux/releases)
[![License](https://img.shields.io/badge/GPL_v3.0-000000?style=for-the-badge&logo=gnu&logoColor=white)](./LICENSE)
[![Language](https://img.shields.io/badge/Bash-000000?style=for-the-badge&logo=gnubash&logoColor=white)]()
[![Platform](https://img.shields.io/badge/Linux-000000?style=for-the-badge&logo=linux&logoColor=white)]()
[![FOSS](https://img.shields.io/badge/FOSS-000000?style=for-the-badge)]()

**Linux privacy toolkit** — Terminal-based security and privacy automation

</div>

---

## What is Invisux?

Invisux is a Bash script designed to handle privacy and security tasks on your Linux system through the terminal. It features an interactive TUI built with the [Gum](https://github.com/charmbracelet/gum) library for ease of use, but commands can also be called directly for scripting and automation purposes.

Built with simplicity and lightweightness in mind, Invisux consolidates common privacy and security operations into a single, portable tool.

---

## Installation

Install the tool using the installer, or build your preferred version from source.

``` bash
curl -L -o Installer.sh https://codeberg.org/JasperC/Invisux/raw/branch/main/Installer.sh
chmod +x Installer.sh
./Installer.sh
```

For secuurity advice, please verify any scripts you run on a system, don't blindly trust any maintaner. I personally do my best to provide good software without bugs and I have no intent to harm your system but I am not perfect, neither is my software.

---

## Features

Invisux is organized into three main sections — **Privacy**, **Security**, and **Encryption** — plus a few basic informational options.

### Privacy

| Command | Description |
|---|---|
| `hide_files` | Hide files on your filesystem. Offers three methods: `hide_dot` (marks the file as hidden — still discoverable by attackers), `concatenation` (embeds file data inside a JPG image), and `steganography` (encrypts the hidden data for a much more secure result). |
| `random_data` | Generate a random name, random string, or random username. |
| `dns_res` | Check DNS resolution. |
| `dns_conf` | Verify your DNS configuration. |
| `rand_mac` | Randomize your machine's MAC address for privacy purposes. |
| `check_tor` | Check whether Tor is running on your system. |
| `check_ip` | Retrieve your machine's public IP address. |
| `remove_metadata` | Strip metadata from an image to make it harder to trace its origin and protect your privacy when sharing. |
| `empty_trash` | Securely empty the trash, making deleted files harder to recover. |
| `delete-file` | Securely remove a specific file, making it harder to recover. |
| `wipe-drive`  | Securely wipe an USB drive. |

### Security

| Command | Description |
|---|---|
| `check_ports` | Check open ports on your system. |
| `audit-system` | Run a security audit of your system. |
| `update-apps` | Interactive TUI to update your system, with support for different package managers. |
| `generate-passwd` | Generate a secure password between 8 and 128 characters. |
| `hash-passwd` | Hash a password. |

### Encryption

| Command | Description |
|---|---|
| `keys` | Generate an encryption key for various purposes. |
| `aes_menu` | Menu to encrypt or decrypt text and files using AES. |
| `generate-key` | Generate a new GPG key. |
| `delete-key` | Delete a GPG key. |
| `import-key` | Import one or more GPG keys. |
| `export-key` | Export one or more GPG keys. |
| `list-keys` | List all GPG keys. |
| `sign` | Sign a GPG key. |
| `verify` | Verify a GPG key. |

### Info

| Command | Description |
|---|---|
| `info` | View information about the Invisux tool. |
| `license` | View the Invisux license. |

---

> **DISCLAIMER:** This program comes with **ABSOLUTELY NO WARRANTY**. Any damage to your system is your own responsibility.

---

## Dependencies

Invisux requires **Gum** to run. All other dependencies are optional and are only needed for specific features.

| Dependency | Required? |
|---|---|
| [gum](https://github.com/charmbracelet/gum) | **Required** |
| faker | Optional |
| openssl | Optional |
| shred | Optional |
| exiftool | Optional |
| gpg | Optional |
| steghide | Optional |
| dig | Optional |
| lynis | Optional |

---

## Thanks

Thanks to [bash_loading_animations](https://github.com/Silejonu/bash_loading_animations) for the loading animation used, and to the creators of all the dependencies that power this tool.

---

## Contributing

Contributions are welcome! Message me or open a PR to get started.

<div align="center">

───────────────────

**GNU General Public License v3.0 © 2026 JasperC**

</div>