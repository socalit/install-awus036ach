# ALFA AWUS036ACH Driver Installer for Kali Linux

This script installs the correct Realtek RTL8812AU driver for the ALFA AWUS036ACH Wi-Fi adapter on Kali Linux using DKMS.

It fully automates:
- Removal of conflicting driver versions
- Installation of build dependencies
- Cloning the latest stable driver from Aircrack-ng
- DKMS-based installation (auto-rebuild on kernel updates)
- Module loading and interface check

---

## Requirements

- Kali Linux (Rolling)
- USB Wi-Fi adapter: ALFA AWUS036ACH (RTL8812AU chipset)
- Internet connection (to fetch dependencies and clone the repo)

---

## Installation

```bash
git clone https://github.com/socalit/awus036ach-installer.git
cd awus036ach-installer
chmod +x install-awus036ach.sh
./install-awus036ach.sh
