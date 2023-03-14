#!/bin/bash
while true; do
    # Define menu options
    OPTIONS=(1 "Auto Update every 6 hours"
             2 "Sudo logger"
             3 "Coming Soon"
             4 "Coming Soon"
             5 "Coming Soon"
             6 "Coming Soon"
             7 "Coming Soon"
             8 "Back")

    # Get menu selection
    CHOICE=$(dialog --clear \
                    --title "Automation" \
                    --menu "Choose an option:" \
                    15 40 4 \
                    "${OPTIONS[@]}" \
                    2>&1 >/dev/tty)

    # Process menu selection
    case $CHOICE in
        1)
        #Create Cron
        echo "0 */6 * * * sudo apt-get update && sudo apt-get -y upgrade && sudo updatedb" > /tmp/cronjob

        # Install the new cron job
        crontab /tmp/cronjob

        # Clean up the temporary file
        rm /tmp/cronjob
            echo "Success! The autoupdater is now working!"
            echo "Note: If the machine restarts, you can run this service again to re enable the script!"
            sleep 3.0
            ;;
        2)
            screen -dmS Autoupdate-Kimsei bash -c 'cd $PWD/py/logging && pip3 install -r requirements.txt && sudo python3 sudolog.py'
            echo "Success! The autologger is now working!"
            echo "Note: If the machine restarts, you can run this service again to re enable the script!"
            sleep 3.0
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