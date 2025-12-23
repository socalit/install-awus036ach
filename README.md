<p align="center">
  <img src="assets/banner.png" alt="install-awus036ach" width="100%">
</p>

[![Buy Me a Coffee](https://img.shields.io/badge/Buy%20Me%20a%20Coffee-support-%23FFDD00?logo=buymeacoffee&logoColor=black)](https://buymeacoffee.com/socal370xs)

# ALFA AWUS036ACH Driver Installer for Kali Linux (v1.2-dynamic)

This script installs the correct **Realtek RTL8812AU** driver for the **ALFA AWUS036ACH** USB Wi-Fi adapter using DKMS on Kali Linux (and Debian-based distros). It supports **monitor mode**, **packet injection**, and **survives kernel upgrades** via `dkms autoinstall`.

> Tested on Kali Rolling with kernel versions 6.8 and above.

---

## Features

- Automatically detects and installs matching kernel headers  
- Removes conflicting Realtek driver versions (8812au, 88XXau)  
- Installs build tools and DKMS  
- Clones the [Aircrack-ng rtl8812au](https://github.com/aircrack-ng/rtl8812au) driver  
- Registers with DKMS to auto-rebuild on future kernel updates  
- Loads the `8812au` module and checks for a wireless interface  
- Fails gracefully if no matching headers are available  

---

## Requirements

- Kali Linux or Debian-based distro  
- ALFA AWUS036ACH (Realtek RTL8812AU chipset)  
- Internet access (to fetch packages and clone repo)

---

## Installation

```bash
git clone https://github.com/socalit/install-awus036ach.git
cd install-awus036ach
chmod +x install-awus036ach.sh
sudo ./install-awus036ach.sh
```
### ⭐ **Star the GitHub repo**  
### Share it with communities  
### Open issues or request features  

If this project saved you time or solved a problem, consider supporting development:

[![Buy Me a Coffee](https://img.buymeacoffee.com/button-api/?text=Buy%20me%20a%20coffee&slug=socal370xs&button_colour=FFDD00&font_colour=000000&font_family=Arial&outline_colour=000000&coffee_colour=ffffff)](https://buymeacoffee.com/socal370xs)
