#!/bin/bash
echo "Welcome to the Jellyfin installer"
sleep 1.0
echo "Updating system now"
sleep 0.5
sudo apt-get update -y
sudo apt install apt-transport-https -y
wget -O - https://repo.jellyfin.org/jellyfin_team.gpg.key | sudo apt-key add -
echo "deb [arch=$( dpkg --print-architecture )] https://repo.jellyfin.org/$( awk -F'=' '/^ID=/{ print $NF }' /etc/os-release ) $( awk -F'=' '/^VERSION_CODENAME=/{ print $NF }' /etc/os-release ) main" | sudo tee /etc/apt/sources.list.d/jellyfin.list
sudo apt update
sudo apt install jellyfin
clear
echo "Jellyfin is now installed! Go to:"
echo "                                      "
echo "     This IP:8096                     "
echo "          Or                          "
echo "     localhost:8096                   "
echo "                                      "
sleep 2.0

