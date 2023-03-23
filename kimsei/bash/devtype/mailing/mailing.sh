#!/bin/bash
while true; do
    # Define menu options
    OPTIONS=(1 "Mailinabox (Ubuntu 22.04)"
             2 "Coming Soon"
             3 "Coming Soon"
             4 "Back")

    # Get menu selection
    CHOICE=$(dialog --clear \
                    --title "Update, Upgrade, and Updatedb" \
                    --menu "Choose an option:" \
                    15 40 4 \
                    "${OPTIONS[@]}" \
                    2>&1 >/dev/tty)

    # Process menu selection
    case $CHOICE in
        1)
        clear
        # Define the title and message for the dialog box
TITLE="Mailinabox Server Installation"
MESSAGE="Welcome to the Mailinabox server installation script"

# Display a dialog box with the welcome message
dialog --title "$TITLE" --msgbox "$MESSAGE" 8 60
(
  echo "XXX"
  echo "Updating Repositories..."
  echo "XXX"
  sudo apt-get update -y 2>&1 | awk '!/^(Reading|Unpacking)/{print "XXX\n"$0"\nXXX"}'
) | dialog --title "Updating Repositories" --gauge "Please wait..." 10 60 0
            curl -s https://mailinabox.email/setup.sh | sudo bash
            TITLE="Mailinabox Server Installation Complete"
MESSAGE="Success! The Mailinabox Install script is complete"
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