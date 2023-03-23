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
        # Define the title and message for the dialog box
TITLE="Veracrypt Installation"
MESSAGE="Welcome to the Veracrypt installation script"

# Display a dialog box with the welcome message
dialog --title "$TITLE" --msgbox "$MESSAGE" 8 60
            # Add the Veracrypt repository
            clear
sudo add-apt-repository ppa:unit193/encryption -y
# Update the package list
(
  echo "XXX"
  echo "Updating Repositories..."
  echo "XXX"
  sudo apt-get update -y 2>&1 | awk '!/^(Reading|Unpacking)/{print "XXX\n"$0"\nXXX"}'
) | dialog --title "Updating Repositories" --gauge "Please wait..." 10 60 0
# Install Veracrypt
(
  echo "XXX"
  echo "Installing Veracrypt..."
  echo "XXX"
  sudo apt-get install veracrypt -y 2>&1 | awk '!/^(Reading|Unpacking)/{print "XXX\n"$0"\nXXX"}'
  echo "XXX"
  echo "Installation complete."
  echo "XXX"
) | dialog --title "Installing Veracrypt" --gauge "Please wait..." 10 60 0
        # Define the title and message for the dialog box
TITLE="Veracrypt Installation Complete"
MESSAGE="Success! Veracrypt is now installed to the system"

# Display a dialog box with the welcome message
dialog --title "$TITLE" --msgbox "$MESSAGE" 8 60
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