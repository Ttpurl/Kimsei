#!/bin/bash
echo "Select a deployment service:"
echo "1. Apache Web Server (SSL) "
echo "This script will help you set up a Apache2 web server and install"
echo "SSL certificates to enable HTTPS on your site. Please have your DNS"
echo "records (A/AAAA) ready and assigned to this server before running."
echo "##################################################################"
echo "2. Nginx Web Server (SSL)"
echo "This script will help you set up an Nginx web server and install"
echo "SSL certificates to enable HTTPS on your site. Please have your DNS"
echo "records (A/AAAA) ready and assigned to this server before running."
echo "##################################################################"
echo "3. "
echo "4. "
echo "5. "
echo "6. "
echo "7. "
echo "8. Back"

read choice

if [ $choice -eq 1 ]; then
clear
cd webdev
    sudo ./apachewebserverssl.sh
elif [ $choice -eq 2 ]; then
clear
cd webdev
    sudo ./nginxwebserverssl.sh
elif [ $choice -eq 3 ]; then
clear
cd webdev
    sudo
elif [ $choice -eq 4 ]; then
clear
cd webdev
    sudo
elif [ $choice -eq 5 ]; then
clear
cd webdev
    sudo
elif [ $choice -eq 6 ]; then
clear
cd webdev
    sudo
elif [ $choice -eq 7 ]; then
clear
cd webdev
    sudo
elif [ $choice -eq 8 ]; then
clear
    cd ..
    sudo menu/menu.sh
else
    echo "Invalid choice. Please select a valid option."
fi