#!/bin/bash

# install-awus036ach.sh – Dynamic installer for ALFA AWUS036ACH (RTL8812AU)
# Author: SoCal IT – github.com/socalit
# Version: v1.1-dynamic

set -e

echo -e "\nALFA AWUS036ACH Dynamic Installer"
echo "────────────────────────────────────────────"

KERNEL_VERSION="$(uname -r)"
echo "[*] Detected kernel: $KERNEL_VERSION"

# STEP 1: Remove old conflicting drivers
echo "[*] Step 1: Removing old driver remnants..."
sudo dkms remove 8812au/5.6.4.2_35491.20191025 --all 2>/dev/null || true
sudo dkms remove realtek-rtl88xxau/5.6.4.2~20230501 --all 2>/dev/null || true
sudo rm -rf /usr/src/8812au-* /usr/src/rtl8812au-* /usr/src/realtek-rtl88xxau-*

# STEP 2: Install dependencies
echo "[*] Step 2: Installing required packages..."
sudo apt update
sudo apt install -y dkms git build-essential libelf-dev

# STEP 3: Check for kernel headers
echo "[*] Step 3: Checking for headers for $KERNEL_VERSION..."
if ! apt-cache show linux-headers-"$KERNEL_VERSION" &>/dev/null; then
    echo "[!] No headers found for kernel $KERNEL_VERSION"
    echo "    └─ Try booting into an older kernel or wait for official headers."
    exit 1
fi

sudo apt install -y linux-headers-"$KERNEL_VERSION"

# STEP 4: Clone driver
echo "[*] Step 4: Cloning rtl8812au driver from Aircrack-ng..."
cd ~
rm -rf rtl8812au
git clone https://github.com/aircrack-ng/rtl8812au.git
cd rtl8812au

# STEP 5: DKMS build and install
echo "[*] Step 5: Installing driver via DKMS..."
sudo dkms add .
sudo dkms install 8812au || true
sudo dkms autoinstall

# STEP 6: Load module
echo "[*] Step 6: Loading 8812au kernel module..."
sudo modprobe 8812au

# STEP 7: Show interface
echo "[*] Step 7: Checking for wireless interfaces..."
ip link | grep wlan || echo "[!] No wireless interface found. Replug or reboot."

# DONE
echo
echo "[✓] AWUS036ACH driver installation complete!"
echo "────────────────────────────────────────────"
echo "To enable monitor mode:"
echo "    sudo ip link set wlan1 down"
echo "    sudo iw dev wlan1 set type monitor"
echo "    sudo ip link set wlan1 up"
echo "    iwconfig wlan1"
