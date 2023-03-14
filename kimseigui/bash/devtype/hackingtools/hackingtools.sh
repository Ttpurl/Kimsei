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
            # Set the dialog colors and font
            export DIALOGRC=/path/to/dialog.rc

            # Define the text to display
            TEXT="Pwndrop is a self-deployable file hosting service specially developed for red teamers, allowing them to easily upload and transfer payloads over HTTP and WebDAV."

            # Use ncurses to create the text display
            echo "$TEXT" | dialog --programbox 20 50

            # Use dialog to ask the user yes or no
            dialog --yesno "Do you want to install?" 10 30

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