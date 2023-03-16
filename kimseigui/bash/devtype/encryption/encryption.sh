#!/bin/bash
while true; do
    # Define menu options
    OPTIONS=(1 "Install Veracrypt"
             2 "Create an encrypted file (VC REQUIRED)"
             3 "Coming Soon"
             4 "Back")

    # Get menu selection
    CHOICE=$(dialog --clear \
                    --title "Encryption" \
                    --menu "Choose a service to deploy" \
                    15 40 4 \
                    "${OPTIONS[@]}" \
                    2>&1 >/dev/tty)

    # Process menu selection
    case $CHOICE in
        1)
            # Add the Veracrypt repository
sudo add-apt-repository ppa:unit193/encryption

# Update the package list
sudo apt-get update

# Install Veracrypt
sudo apt-get install veracrypt
            ;;
        2)
            exit
            ;;
        3)
            exit
            ;;
        4)
            exit
            ;;
    esac
done