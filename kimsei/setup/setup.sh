#!/bin/bash
if ! dpkg -s libncurses5-dev &> /dev/null; then
  sudo apt-get install libncurses5-dev -y
fi
if ! dpkg -s ncurses-term &> /dev/null; then
  sudo apt-get install ncurses-term -y
fi
if ! dpkg -s dialog &> /dev/null; then
  sudo apt-get install dialog -y
fi
TITLE="Kimsei installation"
MESSAGE="Welcome to the Kimsei software installation!"

# Welcome
dialog --title "$TITLE" --msgbox "$MESSAGE" 8 60
TITLE="Kimsei installation disclaimer"
MESSAGE="Some features in this code are still in beta. If you want a stable version, go to https://github.com/Ttpurl/Kimsei/releases/download/v1.0.0/Kimsei.zip"

# Disclaimer and notes
dialog --title "$TITLE" --msgbox "$MESSAGE" 8 60
# Update
(
  echo "XXX"
  echo "Updating System Packages..."
  echo "XXX"
  sudo apt-get update 2>&1 | awk '!/^(Reading|Unpacking)/{print "XXX\n"$0"\nXXX"}'
) | dialog --title "Updating System Packages" --gauge "Please wait..." 10 60 0
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
# Hacking Tools
cd ../hackingtools
sudo chmod +x $PWD/./hackingtools.sh
clear
# create a symbolic link to Kimsei in /usr/bin BETA
#sudo ln -s /path/to/your/script.sh /usr/bin/kimsei
# Finish
dialog --title "$TITLE" --msgbox "$MESSAGE" 8 60
TITLE="Kimsei installation complete"
MESSAGE="The script is ready to go! You can now run sudo ./kimsei to get started!"

# Disclaimer and notes
dialog --title "$TITLE" --msgbox "$MESSAGE" 8 60