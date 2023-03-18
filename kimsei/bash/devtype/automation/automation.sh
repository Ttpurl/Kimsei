#!/bin/bash
while true; do
    # Define menu options
    OPTIONS=(1 "Auto Update every 6 hours"
             2 "Coming Soon"
             3 "Coming Soon"
             4 "Coming Soon"
             5 "Coming Soon"
             6 "Coming Soon"
             7 "Coming Soon"
             8 "Back")

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
            exit
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