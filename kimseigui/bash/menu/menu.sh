#!/bin/bash
echo "Please select a development type:"
echo "1. Website Deployment"
echo "2. Server Services"
echo "3. Communications"
echo "4. Virtual Private Network"
echo "5. Automation"
echo "6. Encryption"
echo "7. Mailing"
echo "8. Server Hardening"

read choice

if [ $choice -eq 1 ]; then
    sudo /devtype/./webdev.sh
elif [ $choice -eq 2 ]; then
    sudo /devtype/./serverservices.sh
elif [ $choice -eq 3 ]; then
    sudo /devtype/./comms.sh
elif [ $choice -eq 4 ]; then
    sudo /devtype/./vpn.sh
elif [ $choice -eq 5 ]; then
    sudo /devtype/./automation.sh
elif [ $choice -eq 6 ]; then
    sudo /devtype/./encryption.sh
elif [ $choice -eq 7 ]; then
    sudo /devtype/./mailing.sh
elif [ $choice -eq 8 ]; then
    sudo /devtype/./serverlockdown.sh
else
    echo "Invalid choice. Please select a valid option."
fi