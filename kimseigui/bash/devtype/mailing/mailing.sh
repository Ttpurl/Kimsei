#!/bin/bash
while true; do
    # Define menu options
    OPTIONS=(1 "Mailinabox"
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
            curl -s https://mailinabox.email/setup.sh | sudo bash
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