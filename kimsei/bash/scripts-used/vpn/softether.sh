#!/bin/bash
echo "Welcome to the Soft Ether VPN script."
sleep 1.0
echo "Downloading packages..."
sleep 0.5
sudo apt-get update
sudo apt install gcc make -y
clear
echo "Select your CPU architecture"
echo "1). Intelx64/AMD64"
echo "2). ARM 64 Bit"

read choice

if [ $choice -eq 1 ]; then
wget https://github.com/SoftEtherVPN/SoftEtherVPN_Stable/releases/download/v4.38-9760-rtm/softether-vpnserver-v4.38-9760-rtm-2021.08.17-linux-x64-64bit.tar.gz
sudo tar -xvf softether-vpnserver-v4.38-9760-rtm-2021.08.17-linux-x64-64bit.tar.gz
cd vpnserver
make
sudo ./vpnserver start
elif [ $choice -eq 2 ]; then
wget https://github.com/SoftEtherVPN/SoftEtherVPN_Stable/releases/download/v4.38-9760-rtm/softether-vpnserver-v4.38-9760-rtm-2021.08.17-linux-arm64-64bit.tar.gz
sudo tar -xvf softether-vpnserver-v4.38-9760-rtm-2021.08.17-linux-arm64-64bit.tar.gz
cd vpnserver
make
sudo ./vpnserver start
else
echo "Invalid choice. Please try again."
fi
