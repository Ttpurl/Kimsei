#!/bin/bash
echo "Welcome to Kimsei's Server Deployment script!"
sleep 1.0 
echo "Checking if the script is working..."
# Checking core files
file1="bash/devtype/webdev/webdev.sh"
file2="bash/devtype/serverservices/serverservices.sh"
file3="bash/devtype/comms/comms.sh"
file4="bash/devtype/vpn/vpn.sh"
file5="bash/devtype/automation/automation.sh"
file6="bash/devtype/encryption/encryption.sh"
file7="bash/devtype/mailing/mailing.sh"
file8="bash/devtype/serverlockdown/serverlockdown.sh"

# Defining array of files
files=("$file1" "$file2" "$file3" "$file4" "$file5" "$file6" "$file7" "$file8")

# Loop through the array and check each file for executability
for file in "${files[@]}"; do
    if [ -x "$file" ]; then
        echo "Core files are in order. Proceding with script."
        # Checks are good. Running script
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
clear
    sudo bash/devtype/webdev/./webdev.sh
elif [ $choice -eq 2 ]; then
clear
    sudo bash/devtype/serverservices/./serverservices.sh
elif [ $choice -eq 3 ]; then
clear
    sudo bash/devtype/comms/./comms.sh
elif [ $choice -eq 4 ]; then
clear
    sudo bash/devtype/vpn/./vpn.sh
elif [ $choice -eq 5 ]; then
clear
    sudo bash/devtype/automation/./automation.sh
elif [ $choice -eq 6 ]; then
clear
    sudo bash/devtype/encryption/./encryption.sh
elif [ $choice -eq 7 ]; then
clear
    sudo bash/devtype/mailing/./mailing.sh
elif [ $choice -eq 8 ]; then
clear
    sudo bash/devtype/serverlockdown/./serverlockdown.sh
else
    echo "Invalid choice. Please select a valid option."
fi
    else
        echo "Kimsei is not properly configured. Please run the setup bash script."
        exit 1
    fi
done