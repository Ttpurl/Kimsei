#!/bin/bash
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
        while true; do
            # Define menu options
            OPTIONS=(1 "Website Deployment"
                     2 "Server Services"
                     3 "Communications"
                     4 "Virtual Private Network"
                     5 "Automation"
                     6 "Encryption"
                     7 "Mailing"
                     8 "Server Hardening"
                     9 "Exit")

            # Get menu selection
            CHOICE=$(dialog --clear \
                            --title "Kimsei" \
                            --menu "Choose an option:" \
                            15 40 4 \
                            "${OPTIONS[@]}" \
                            2>&1 >/dev/tty)

            # Process menu selection
            case $CHOICE in
                1)
                    sudo bash/devtype/webdev/./webdev.sh
                    ;;
                2)
                    sudo bash/devtype/serverservices/./serverservices.sh
                    ;;
                3)
                    sudo bash/devtype/comms/./comms.sh
                    ;;
                4)
                    sudo bash/devtype/vpn/./vpn.sh
                    ;;
                5)
                    sudo bash/devtype/automation/./automation.sh
                    ;;
                6)
                    sudo bash/devtype/encryption/./encryption.sh
                    ;;
                7)
                    sudo bash/devtype/mailing/./mailing.sh
                    ;;
                8)
                    sudo bash/devtype/serverlockdown/./serverlockdown.sh
                    ;;
                9)  
                clear
                    echo "Exiting Kimsei..."
                    exit
                    ;;
            esac
        done
    else
        echo "Kimsei is not properly configured. Please run the setup bash script."
        exit 1
    fi
done
