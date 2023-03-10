#!/bin/bash
echo "Select a deployment service:"
echo "1. Mailinabox"
echo "Mailinabox is a very easily deployable mail server for your needs."
echo "Make sure that your VPS provider allows port 25 (SMTP) on your instance or account."
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
    curl -s https://mailinabox.email/setup.sh | sudo bash
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