#!/bin/bash
echo "Welcome to Kimsei's setup script!"
sleep 1.0
echo "installing and configuring the script now..."
sleep 1.0
cd ..
sudo chmod +x ./kimsei.sh
cd bash/devtype/
sudo chmod +x ./automation.sh
sudo chmod +x ./comms.sh
sudo chmod +x ./encryption.sh
sudo chmod +x ./mailing.sh
sudo chmod +x ./serverlockdown.sh
sudo chmod +x ./serverservices.sh
sudo chmod +x ./vpn.sh
sudo chmod +x ./webdev.sh
clear
echo "The script is ready to go! You can now run sudo ./kimsei.sh to get started!"