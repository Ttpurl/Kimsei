#!/bin/bash
while true; do
    # Define menu options
    OPTIONS=(1 "Install Veracrypt"
             2 "Coming Soon"
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
            clear
            echo "Installing Veracrypt now..."
            sleep 1.0
sudo add-apt-repository ppa:unit193/encryption

# Update the package list
sudo apt-get update

# Install Veracrypt
sudo apt-get install veracrypt
clear
echo "Veracrypt is installed!"
sleep 4.0
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