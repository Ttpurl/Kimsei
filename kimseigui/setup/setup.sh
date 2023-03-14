#!/bin/bash
echo "Welcome to Kimsei's setup script!"
sleep 1.0
echo "installing and configuring the script now..."
sleep 1.0
sudo apt update
if ! dpkg -s libncurses5-dev &> /dev/null; then
  sudo apt-get install -y libncurses5-dev
fi
sudo apt install dialog
cd ..
sudo chmod +x ./kimsei.sh
cd bash/devtype/
# Web Dev
cd webdev/
sudo chmod +x $PWD/./webdev.sh
# Server Services
cd ../serverservices/
sudo chmod +x $PWD/./serverservices.sh
# Comms
cd ../comms/
sudo chmod +x $PWD/./comms.sh
# Hacking Tools
cd ../hackingtools/
sudo chmod +x $PWD/./hackingtools.sh
# Encryption 
cd ../encryption/
sudo chmod +x $PWD/./encryption.sh
# Mailing
cd ../mailing
sudo chmod +x $PWD/./mailing.sh
# Server Lockdown
cd ../serverlockdown
sudo chmod +x $PWD/./serverlockdown.sh
# VPN
cd ../vpn
sudo chmod +x $PWD/./vpn.sh
# Automation
cd ../automation
sudo chmod +x $PWD/./automation.sh
clear
echo "The script is ready to go! You can now run sudo ./kimsei.sh to get started!"