#!/bin/bash
            OPTIONS=(1 "Soft Ether VPN WIP"
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
# Install required packages
sudo apt-get update
sudo apt-get install build-essential wget -y

# Download and extract SoftEther VPN server binary
cd ~
wget https://github.com/SoftEtherVPN/SoftEtherVPN_Stable/releases/download/v4.38-9760-rtm/softether-vpnserver-v4.38-9760-rtm-2021.08.17-linux-x64-64bit.tar.gz
tar xzvf softether-vpnserver-v4.38-9760-rtm-2021.08.17-linux-x64-64bit.tar.gz
cd vpnserver

# Build and install SoftEther VPN server
sudo make

# Set up SoftEther VPN

# Prompt user for server password
SERVER_PASSWORD=$(dialog --passwordbox "Enter SoftEther VPN root server password (Do not share this password with anyone)" 8 50 --stdout)

# Set server password
sudo ./vpncmd /server localhost /hub default /password: /cmd ServerPasswordSet $SERVER_PASSWORD

# Enable IPsec
sudo ./vpncmd /server localhost /password: /cmd IPsecEnable

# Enable L2TP/IPsec
L2TP_PASSWORD=$(dialog --passwordbox "Enter L2TP/IPsec shared secret (Do not exceed 10 characters)" 8 50 --stdout)
L2TP_PASSWORD=${L2TP_PASSWORD:0:10} # Keep only first 10 characters
sudo ./vpncmd /server localhost /password: /cmd IPsecEnable /L2TP:yes /L2TPRAW:no /L2TPSharedKey:$L2TP_PASSWORD

# Enable VPN-over-ICMP/DNS
sudo ./vpncmd /server localhost /password: /cmd VpnOverIcmpDnsEnable /ICMP:yes /DNS:yes

# Prompt user for hub name
HUB_NAME=$(dialog --inputbox "Enter SoftEther VPN hub name" 8 50 --stdout)

# Create hub
sudo ./vpncmd /server localhost /password: /cmd HubCreate $HUB_NAME

# Prompt user for username and password
USERNAME=$(dialog --inputbox "Enter SoftEther VPN user name" 8 50 --stdout)
PASSWORD=$(dialog --passwordbox "Enter SoftEther VPN user password" 8 50 --stdout)

# Create user
sudo ./vpncmd /server localhost /password: /hub:$HUB_NAME /cmd UserCreate $USERNAME /password:$PASSWORD /group:none

# Enable SecureNAT
sudo ./vpncmd /server localhost /password: /cmd SecureNatEnable

# Start SoftEther VPN server
sudo ./vpnserver start

# Display success message
dialog --title "Installation Complete" --msgbox "SoftEther VPN installed, running, and configured successfully!" 10 60
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