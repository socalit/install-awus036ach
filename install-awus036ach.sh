#!/bin/bash

# install-awus036ach.sh – Installer for ALFA AWUS036ACH (RTL8812AU) on Kali Linux

set -e

echo "ALFA AWUS036ACH Installer for Kali Linux"
echo "------------------------------------------"

echo "Step 1: Removing old drivers..."
sudo dkms remove 8812au/5.6.4.2_35491.20191025 --all 2>/dev/null || true
sudo dkms remove realtek-rtl88xxau/5.6.4.2~20230501 --all 2>/dev/null || true
sudo rm -rf /usr/src/8812au-*
sudo rm -rf /usr/src/rtl8812au-*
sudo rm -rf /usr/src/realtek-rtl88xxau-*

echo "Step 2: Installing dependencies..."
sudo apt update
sudo apt install -y dkms git build-essential libelf-dev linux-headers-$(uname -r)

echo "Step 3: Cloning Aircrack-ng RTL8812AU driver..."
cd ~
rm -rf rtl8812au
git clone https://github.com/aircrack-ng/rtl8812au.git
cd rtl8812au

echo "Step 4: Adding and installing module via DKMS..."
sudo dkms add .
sudo dkms install realtek-rtl88xxau/5.6.4.2~20230501

echo "Step 5: Loading driver module (88XXau)..."
sudo modprobe 88XXau

echo "Installation complete!"
echo "------------------------------------------"

echo "Checking interface..."
ip a | grep -E 'wlan[0-9]'

echo
echo "To enable monitor mode:"
echo "    sudo ip link set wlan1 down"
echo "    sudo iw dev wlan1 set type monitor"
echo "    sudo ip link set wlan1 up"
echo "    iwconfig wlan1"
