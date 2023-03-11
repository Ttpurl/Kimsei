#!/bin/bash
echo "Select a deployment service:"
echo "1. Soft Ether VPN"
echo "This VPN server will transform yoyr server into a lightweight VPN server."
echo "Allows for L2TP connections, free DDNS (domain.softether.net), and custom encryption Alg's."
echo "##################################################################"
echo "2. "
echo "3. "
echo "4. "
echo "5. "
echo "6. "
echo "7. "
echo "8. "

read choice

if [ $choice -eq 1 ]; then
clear
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
fi
elif [ $choice -eq 2 ]; then
wget https://github.com/SoftEtherVPN/SoftEtherVPN_Stable/releases/download/v4.38-9760-rtm/softether-vpnserver-v4.38-9760-rtm-2021.08.17-linux-arm64-64bit.tar.gz
sudo tar -xvf softether-vpnserver-v4.38-9760-rtm-2021.08.17-linux-arm64-64bit.tar.gz
cd vpnserver
make
sudo ./vpnserver start
fi
else
echo "Invalid choice. Please try again."

elif [ $choice -eq 2 ]; then
clear
    sudo
elif [ $choice -eq 3 ]; then
clear
    sudo
elif [ $choice -eq 4 ]; then
clear
    sudo
elif [ $choice -eq 5 ]; then
clear
    sudo
elif [ $choice -eq 6 ]; then
clear
    sudo
elif [ $choice -eq 7 ]; then
clear
    sudo
elif [ $choice -eq 8 ]; then
clear
    cd ..
    sudo menu/menu.sh
else
    echo "Invalid choice. Please select a valid option."
fi