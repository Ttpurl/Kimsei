#!/bin/bash
echo "Welcome to Kimsei's setup script!"
sleep 1.0
echo "installing and configuring the script now..."
sleep 1.0
cd ..
sudo chmod +x ./kimsei.sh
cd bash/devtype/
# Web Dev
cd webdev/
sudo chmod +x ./webdev.sh
sudo chmod +x ./apachewebserverssl.sh
sudo chmod +x ./nginxwebserverssl.sh
# Server Services
cd ../serverservices/
sudo chmod +x ./serverservices.sh
sudo chmod +x ./ntp.sh
sudo chmod +x ./pihole.sh
sudo chmod +x ./torproxy.sh
# Comms
cd ../comms/
sudo chmod +x ./comms.sh
sudo chmod +x ./voipmumble.sh
# Encryption 
cd ../encryption/
sudo chmod +x ./encryption.sh
# Mailing
cd ../mailing
sudo chmod +x ./mailing.sh
sudo chmod +x mailinabox.sh
# Server Lockdown
cd ../serverlockdown
sudo chmod +x ./serverlockdown.sh
# VPN
cd ../vpn
sudo chmod +x ./vpn.sh
# Automation
cd ../automation
sudo chmod +x ./automation.sh
clear
echo "The script is ready to go! You can now run sudo ./kimsei.sh to get started!"