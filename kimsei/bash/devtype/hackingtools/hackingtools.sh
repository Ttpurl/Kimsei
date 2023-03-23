#!/bin/bash
while true; do
    # Define menu options
    OPTIONS=(1 "Pwndrop"
             2 "Coming Soon"
             3 "Coming Soon"
             4 "Coming Soon"
             5 "Coming Soon"
             6 "Coming Soon"
             7 "Coming Soon"
             8 "Back")

    # Get menu selection
    CHOICE=$(dialog --clear \
                    --title "Hacking Tools" \
                    --menu "Choose a hacking service to deploy:" \
                    15 40 4 \
                    "${OPTIONS[@]}" \
                    2>&1 >/dev/tty)

    # Process menu selection
    case $CHOICE in
        1)
# Define the title and message for the dialog box
TITLE="Pwndrop Server Installer"
MESSAGE="Welcome to the Pwndrop installation script"

# Display a dialog box with the welcome message
dialog --title "$TITLE" --msgbox "$MESSAGE" 8 60
            # Use dialog to ask the user yes or no
            dialog --yesno "Do you want to install?" 15 30

            # Check the dialog exit code to see if the user selected yes or no
            if [ $? -eq 0 ]; then
                curl https://raw.githubusercontent.com/kgretzky/pwndrop/master/install_linux.sh | sudo bash
            else
                exit
            fi
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
        5)
            exit
            ;;
        6)
            exit
            ;;
        7)
            exit
            ;;
        8)
            exit
            ;;
    esac
done