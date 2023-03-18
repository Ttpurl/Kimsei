#!/bin/bash
            OPTIONS=(1 "Soft Ether VPN"
                     2 "OpenVPN Coming soon"
                     3 "Wireguard Coming soon"
                     4 "Coming soon"
                     5 "Back")

            # Get menu selection
            CHOICE=$(dialog --clear \
                            --title "VPN" \
                            --menu "Choose a deployment type" \
                            15 40 4 \
                            "${OPTIONS[@]}" \
                            2>&1 >/dev/tty)

            # Process menu selection
            case $CHOICE in
                1)
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
sleep 2.0
                    ;;
                2)
                    exit
                    ;;
                3)
                    exit
                    ;;
                4)
                    exit
                    ;;
                5)
                    exit
                    ;;
            esac
        done
    else
        echo "Kimsei is not properly configured. Please run the setup bash script."
        exit 1
    fi
done