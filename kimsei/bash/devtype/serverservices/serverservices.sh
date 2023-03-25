#!/bin/bash
            OPTIONS=(1 "NTP Server"
                     2 "Pi-hole DNS"
                     3 "Tor Proxy Server"
                     4 "Jellyfin"
                     5 "Plex"
                     6 "XRDP"
                     7 "Samba Setup"
                     8 "Back")

            CHOICE=$(dialog --clear \
                            --title "Server Services" \
                            --menu "Choose a deployment type:" \
                            15 40 4 \
                            "${OPTIONS[@]}" \
                            2>&1 >/dev/tty)

            # Process menu selection
            case $CHOICE in
                1)
                   clear
# Define the title and message for the dialog box
TITLE="NTP Server Installation"
MESSAGE="Welcome to the NTP server installation script"

# Display a dialog box with the welcome message
dialog --title "$TITLE" --msgbox "$MESSAGE" 8 60
echo "Updating system now"
sleep 0.3
sudo apt-get update -y
#Installing NTP 1/3
# Install NTP and display a status bar
(
  echo "XXX"
  echo "Installing NTP..."
  echo "XXX"
  sudo apt-get install -y ntp 2>&1 | awk '!/^(Reading|Unpacking)/{print "XXX\n"$0"\nXXX"}'
  echo "XXX"
  echo "Installation complete."
  echo "XXX"
) | dialog --title "Installing NTP" --gauge "Please wait..." 10 60 0
#Installing NTP 2/3
# Display dialog box and prompt user to choose an option
CHOICE=$(dialog --clear --title "Choose an option" --menu "Select an option:" 10 50 5 \
    1 "United states" \
    2 "Germany" \
    3 "Netherlands" \
    4 "Romania" \
    5 "France" \
    3>&1 1>&2 2>&3)

# Check which option the user chose and provide an if statement for each option
case $CHOICE in
    1)
    #United States
echo "" > /etc/ntp.conf
    echo "# /etc/ntp.conf, configuration for ntpd; see ntp.conf(5) for help

driftfile /var/lib/ntp/ntp.drift

# Leap seconds definition provided by tzdata
leapfile /usr/share/zoneinfo/leap-seconds.list

# Enable this if you want statistics to be logged.
#statsdir /var/log/ntpstats/

statistics loopstats peerstats clockstats
filegen loopstats file loopstats type day enable
filegen peerstats file peerstats type day enable
filegen clockstats file clockstats type day enable

# Specify one or more NTP servers.

# Use servers from the NTP Pool Project. Approved by Ubuntu Technical Board
# on 2011-02-08 (LP: #104525). See http://www.pool.ntp.org/join.html for
# more information.
server 0.us.pool.ntp.org iburst
server 1.us.pool.ntp.org iburst
server 2.us.pool.ntp.org iburst	
server 3.us.pool.ntp.org iburst

# Use Ubuntu's ntp server as a fallback.
pool ntp.ubuntu.com

# Access control configuration; see /usr/share/doc/ntp-doc/html/accopt.html for
# details.  The web page <http://support.ntp.org/bin/view/Support/AccessRestrictions>
# might also be helpful.
#
# Note that "restrict" applies to both servers and clients, so a configuration
# that might be intended to block requests from certain clients could also end
# up blocking replies from your own upstream servers.

# By default, exchange time with everybody, but don't allow configuration.
restrict -4 default kod notrap nomodify nopeer noquery limited
restrict -6 default kod notrap nomodify nopeer noquery limited

# Local users may interrogate the ntp server more closely.
restrict 127.0.0.1
restrict ::1

# Needed for adding pool entries
restrict source notrap nomodify noquery

# Clients from this (example!) subnet have unlimited access, but only if
# cryptographically authenticated.
#restrict 192.168.123.0 mask 255.255.255.0 notrust


# If you want to provide time to your local subnet, change the next line.
# (Again, the address is an example only.)
#broadcast 192.168.123.255

# If you want to listen to time broadcasts on your local subnet, de-comment the
# next lines.  Please do this only if you trust everybody on the network!
#disable auth
#broadcastclient" >> /etc/ntp.conf
        ;;
    2)
     #Germany
     echo "" > /etc/ntp.conf
    echo "# /etc/ntp.conf, configuration for ntpd; see ntp.conf(5) for help

driftfile /var/lib/ntp/ntp.drift

# Leap seconds definition provided by tzdata
leapfile /usr/share/zoneinfo/leap-seconds.list

# Enable this if you want statistics to be logged.
#statsdir /var/log/ntpstats/

statistics loopstats peerstats clockstats
filegen loopstats file loopstats type day enable
filegen peerstats file peerstats type day enable
filegen clockstats file clockstats type day enable

# Specify one or more NTP servers.

# Use servers from the NTP Pool Project. Approved by Ubuntu Technical Board
# on 2011-02-08 (LP: #104525). See http://www.pool.ntp.org/join.html for
# more information.
server 0.de.pool.ntp.org iburst
server 1.de.pool.ntp.org iburst
server 2.de.pool.ntp.org iburst
server 3.de.pool.ntp.org iburst

# Use Ubuntu's ntp server as a fallback.
pool ntp.ubuntu.com

# Access control configuration; see /usr/share/doc/ntp-doc/html/accopt.html for
# details.  The web page <http://support.ntp.org/bin/view/Support/AccessRestrictions>
# might also be helpful.
#
# Note that "restrict" applies to both servers and clients, so a configuration
# that might be intended to block requests from certain clients could also end
# up blocking replies from your own upstream servers.

# By default, exchange time with everybody, but don't allow configuration.
restrict -4 default kod notrap nomodify nopeer noquery limited
restrict -6 default kod notrap nomodify nopeer noquery limited

# Local users may interrogate the ntp server more closely.
restrict 127.0.0.1
restrict ::1

# Needed for adding pool entries
restrict source notrap nomodify noquery

# Clients from this (example!) subnet have unlimited access, but only if
# cryptographically authenticated.
#restrict 192.168.123.0 mask 255.255.255.0 notrust


# If you want to provide time to your local subnet, change the next line.
# (Again, the address is an example only.)
#broadcast 192.168.123.255

# If you want to listen to time broadcasts on your local subnet, de-comment the
# next lines.  Please do this only if you trust everybody on the network!
#disable auth
#broadcastclient" >> /etc/ntp.conf
        ;;
    3)
    # Netherlands
     echo "" > /etc/ntp.conf
    echo "# /etc/ntp.conf, configuration for ntpd; see ntp.conf(5) for help

driftfile /var/lib/ntp/ntp.drift

# Leap seconds definition provided by tzdata
leapfile /usr/share/zoneinfo/leap-seconds.list

# Enable this if you want statistics to be logged.
#statsdir /var/log/ntpstats/

statistics loopstats peerstats clockstats
filegen loopstats file loopstats type day enable
filegen peerstats file peerstats type day enable
filegen clockstats file clockstats type day enable

# Specify one or more NTP servers.

# Use servers from the NTP Pool Project. Approved by Ubuntu Technical Board
# on 2011-02-08 (LP: #104525). See http://www.pool.ntp.org/join.html for
# more information.
server 0.nl.pool.ntp.org iburst
server 1.nl.pool.ntp.org iburst
server 2.nl.pool.ntp.org iburst
server 3.nl.pool.ntp.org iburst

# Use Ubuntu's ntp server as a fallback.
pool ntp.ubuntu.com

# Access control configuration; see /usr/share/doc/ntp-doc/html/accopt.html for
# details.  The web page <http://support.ntp.org/bin/view/Support/AccessRestrictions>
# might also be helpful.
#
# Note that "restrict" applies to both servers and clients, so a configuration
# that might be intended to block requests from certain clients could also end
# up blocking replies from your own upstream servers.

# By default, exchange time with everybody, but don't allow configuration.
restrict -4 default kod notrap nomodify nopeer noquery limited
restrict -6 default kod notrap nomodify nopeer noquery limited

# Local users may interrogate the ntp server more closely.
restrict 127.0.0.1
restrict ::1

# Needed for adding pool entries
restrict source notrap nomodify noquery

# Clients from this (example!) subnet have unlimited access, but only if
# cryptographically authenticated.
#restrict 192.168.123.0 mask 255.255.255.0 notrust


# If you want to provide time to your local subnet, change the next line.
# (Again, the address is an example only.)
#broadcast 192.168.123.255

# If you want to listen to time broadcasts on your local subnet, de-comment the
# next lines.  Please do this only if you trust everybody on the network!
#disable auth
#broadcastclient" >> /etc/ntp.conf
        ;;
    4)
    # Romania
      echo "" > /etc/ntp.conf
    echo "# /etc/ntp.conf, configuration for ntpd; see ntp.conf(5) for help

driftfile /var/lib/ntp/ntp.drift

# Leap seconds definition provided by tzdata
leapfile /usr/share/zoneinfo/leap-seconds.list

# Enable this if you want statistics to be logged.
#statsdir /var/log/ntpstats/

statistics loopstats peerstats clockstats
filegen loopstats file loopstats type day enable
filegen peerstats file peerstats type day enable
filegen clockstats file clockstats type day enable

# Specify one or more NTP servers.

# Use servers from the NTP Pool Project. Approved by Ubuntu Technical Board
# on 2011-02-08 (LP: #104525). See http://www.pool.ntp.org/join.html for
# more information.
server 0.ro.pool.ntp.org iburst
server 1.ro.pool.ntp.org iburst
server 2.ro.pool.ntp.org iburst
server 3.ro.pool.ntp.org iburst

# Use Ubuntu's ntp server as a fallback.
pool ntp.ubuntu.com

# Access control configuration; see /usr/share/doc/ntp-doc/html/accopt.html for
# details.  The web page <http://support.ntp.org/bin/view/Support/AccessRestrictions>
# might also be helpful.
#
# Note that "restrict" applies to both servers and clients, so a configuration
# that might be intended to block requests from certain clients could also end
# up blocking replies from your own upstream servers.

# By default, exchange time with everybody, but don't allow configuration.
restrict -4 default kod notrap nomodify nopeer noquery limited
restrict -6 default kod notrap nomodify nopeer noquery limited

# Local users may interrogate the ntp server more closely.
restrict 127.0.0.1
restrict ::1

# Needed for adding pool entries
restrict source notrap nomodify noquery

# Clients from this (example!) subnet have unlimited access, but only if
# cryptographically authenticated.
#restrict 192.168.123.0 mask 255.255.255.0 notrust


# If you want to provide time to your local subnet, change the next line.
# (Again, the address is an example only.)
#broadcast 192.168.123.255

# If you want to listen to time broadcasts on your local subnet, de-comment the
# next lines.  Please do this only if you trust everybody on the network!
#disable auth
#broadcastclient" >> /etc/ntp.conf
        ;;
    5)
        # France
         echo "" > /etc/ntp.conf
    echo "# /etc/ntp.conf, configuration for ntpd; see ntp.conf(5) for help

driftfile /var/lib/ntp/ntp.drift

# Leap seconds definition provided by tzdata
leapfile /usr/share/zoneinfo/leap-seconds.list

# Enable this if you want statistics to be logged.
#statsdir /var/log/ntpstats/

statistics loopstats peerstats clockstats
filegen loopstats file loopstats type day enable
filegen peerstats file peerstats type day enable
filegen clockstats file clockstats type day enable

# Specify one or more NTP servers.

# Use servers from the NTP Pool Project. Approved by Ubuntu Technical Board
# on 2011-02-08 (LP: #104525). See http://www.pool.ntp.org/join.html for
# more information.
server 0.fr.pool.ntp.org iburst
server 1.fr.pool.ntp.org iburst
server 2.fr.pool.ntp.org iburst
server 3.fr.pool.ntp.org iburst

# Use Ubuntu's ntp server as a fallback.
pool ntp.ubuntu.com

# Access control configuration; see /usr/share/doc/ntp-doc/html/accopt.html for
# details.  The web page <http://support.ntp.org/bin/view/Support/AccessRestrictions>
# might also be helpful.
#
# Note that "restrict" applies to both servers and clients, so a configuration
# that might be intended to block requests from certain clients could also end
# up blocking replies from your own upstream servers.

# By default, exchange time with everybody, but don't allow configuration.
restrict -4 default kod notrap nomodify nopeer noquery limited
restrict -6 default kod notrap nomodify nopeer noquery limited

# Local users may interrogate the ntp server more closely.
restrict 127.0.0.1
restrict ::1

# Needed for adding pool entries
restrict source notrap nomodify noquery

# Clients from this (example!) subnet have unlimited access, but only if
# cryptographically authenticated.
#restrict 192.168.123.0 mask 255.255.255.0 notrust


# If you want to provide time to your local subnet, change the next line.
# (Again, the address is an example only.)
#broadcast 192.168.123.255

# If you want to listen to time broadcasts on your local subnet, de-comment the
# next lines.  Please do this only if you trust everybody on the network!
#disable auth
#broadcastclient" >> /etc/ntp.conf
        ;;
    *)
        echo "Invalid option selected"
        ;;
esac
sudo service ntp restart
sudo ntpd
# Define the title and message for the dialog box
TITLE="NTP Server Installation Complete"
MESSAGE="Success! The NTP server is now installed"

# Display a dialog box with the welcome message
dialog --title "$TITLE" --msgbox "$MESSAGE" 8 60
                    ;;
                2)
####################################################################################################
                    clear
                    # Define the title and message for the dialog box
TITLE="Pihole DNS Installer"
MESSAGE="Welcome to the Pihole DNS installation script"

# Display a dialog box with the welcome message
dialog --title "$TITLE" --msgbox "$MESSAGE" 8 60
            curl -sSL https://install.pi-hole.net | PIHOLE_SKIP_OS_CHECK=true sudo -E bash
                    ;;
####################################################################################################                    
                3)
                    clear
# Define the title and message for the dialog box
TITLE="Tor Server Installation"
MESSAGE="Welcome to the Tor proxy installation script"

# Display a dialog box with the welcome message
dialog --title "$TITLE" --msgbox "$MESSAGE" 8 60
clear
#Welcome 1/1
#Installing Tor 0/1
sudo apt update
(
  echo "XXX"
  echo "Installing Tor..."
  echo "XXX"
  sudo apt-get install tor -y 2>&1 | awk '!/^(Reading|Unpacking)/{print "XXX\n"$0"\nXXX"}'
  echo "XXX"
  echo "Installation complete."
  echo "XXX"
) | dialog --title "Installing Tor" --gauge "Please wait..." 10 60 0
  # Use dialog to prompt the user for a number input
torproxyport=$(dialog --stdout --inputbox "Enter the Tor proxy port (1-65535):" 0 0)

# Check if the user entered a number
if ! [[ "$torproxyport" =~ ^[1-65535]+$ ]]; then
    dialog --msgbox "Invalid input. Please enter a number." 0 0
    exit 1
fi
echo "The Tor proxy port is: $torproxyport for this server"
# Print the value of the variable
echo "" > /etc/tor/torrc
echo "## Configuration file for a typical Tor user
## Last updated 9 October 2013 for Tor 0.2.5.2-alpha.
## (may or may not work for much older or much newer versions of Tor.)
##
## Lines that begin with ##  try to explain what's going on. Lines
## that begin with just # are disabled commands: you can enable them
## by removing the # symbol.
##
## See 'man tor', or https://www.torproject.org/docs/tor-manual.html,
## for more options you can use in this file.
##
## Tor will look for this file in various places based on your platform:
## https://www.torproject.org/docs/faq#torrc

## Tor opens a socks proxy on port 9050 by default -- even if you don't
## configure one below. Set "SocksPort 0" if you plan to run Tor only
## as a relay, and not make any local application connections yourself.
SocksPort 9050 # Default: Bind to localhost:9050 for local connections.
SocksPort 0.0.0.0:$torproxyport # Bind to this address:port too.

## Entry policies to allow/deny SOCKS requests based on IP address.
## First entry that matches wins. If no SocksPolicy is set, we accept
## all (and only) requests that reach a SocksPort. Untrusted users who
## can access your SocksPort may be able to learn about the connections
## you make.
SocksPolicy accept 0.0.0.0/24
#SocksPolicy reject *

## Logs go to stdout at level "notice" unless redirected by something
## else, like one of the below lines. You can have as many Log lines as
## you want.
##
## We advise using "notice" in most cases, since anything more verbose
## may provide sensitive information to an attacker who obtains the logs.
##
## Send all messages of level 'notice' or higher to /var/log/tor/notices.log
#Log notice file /var/log/tor/notices.log
## Send every possible message to /var/log/tor/debug.log
#Log debug file /var/log/tor/debug.log
## Use the system log instead of Tor's logfiles
#Log notice syslog
## To send all messages to stderr:
#Log debug stderr

## Uncomment this to start the process in the background... or use
## --runasdaemon 1 on the command line. This is ignored on Windows;
## see the FAQ entry if you want Tor to run as an NT service.
RunAsDaemon 1

## The directory for keeping all the keys/etc. By default, we store
## things in $HOME/.tor on Unix, and in Application Data\tor on Windows.
DataDirectory /var/lib/tor

## The port on which Tor will listen for local connections from Tor
## controller applications, as documented in control-spec.txt.
#ControlPort 9051
## If you enable the controlport, be sure to enable one of these
## authentication methods, to prevent attackers from accessing it.
#HashedControlPassword 16:872860B76453A77D60CA2BB8C1A7042072093276A3D701AD684053EC4C
#CookieAuthentication 1

############### This section is just for location-hidden services ###

## Once you have configured a hidden service, you can look at the
## contents of the file ".../hidden_service/hostname" for the address
## to tell people.
##
## HiddenServicePort x y:z says to redirect requests on port x to the
## address y:z.

#HiddenServiceDir /var/lib/tor/hidden_service/
#HiddenServicePort 80 127.0.0.1:80

#HiddenServiceDir /var/lib/tor/other_hidden_service/
#HiddenServicePort 80 127.0.0.1:80
#HiddenServicePort 22 127.0.0.1:22

################ This section is just for relays #####################
#
## See https://www.torproject.org/docs/tor-doc-relay for details.

## Required: what port to advertise for incoming Tor connections.
#ORPort 9001
## If you want to listen on a port other than the one advertised in
## ORPort (e.g. to advertise 443 but bind to 9090), you can do it as
## follows.  You'll need to do ipchains or other port forwarding
## yourself to make this work.
#ORPort 443 NoListen
#ORPort 127.0.0.1:9090 NoAdvertise

## The IP address or full DNS name for incoming connections to your
## relay. Leave commented out and Tor will guess.
#Address noname.example.com

## If you have multiple network interfaces, you can specify one for
## outgoing traffic to use.
# OutboundBindAddress 10.0.0.5

## A handle for your relay, so people don't have to refer to it by key.
#Nickname ididnteditheconfig

## Define these to limit how much relayed traffic you will allow. Your
## own traffic is still unthrottled. Note that RelayBandwidthRate must
## be at least 20 KB.
## Note that units for these config options are bytes per second, not bits
## per second, and that prefixes are binary prefixes, i.e. 2^10, 2^20, etc.
#RelayBandwidthRate 100 KB  # Throttle traffic to 100KB/s (800Kbps)
#RelayBandwidthBurst 200 KB # But allow bursts up to 200KB/s (1600Kbps)

## Use these to restrict the maximum traffic per day, week, or month.
## Note that this threshold applies separately to sent and received bytes,
## not to their sum: setting "4 GB" may allow up to 8 GB total before
## hibernating.
##
## Set a maximum of 4 gigabytes each way per period.
#AccountingMax 4 GB
## Each period starts daily at midnight (AccountingMax is per day)
#AccountingStart day 00:00
## Each period starts on the 3rd of the month at 15:00 (AccountingMax
## is per month)
#AccountingStart month 3 15:00

## Administrative contact information for this relay or bridge. This line
## can be used to contact you if your relay or bridge is misconfigured or
## something else goes wrong. Note that we archive and publish all
## descriptors containing these lines and that Google indexes them, so
## spammers might also collect them. You may want to obscure the fact that
## it's an email address and/or generate a new address for this purpose.
#ContactInfo Random Person <nobody AT example dot com>
## You might also include your PGP or GPG fingerprint if you have one:
#ContactInfo 0xFFFFFFFF Random Person <nobody AT example dot com>

## Uncomment this to mirror directory information for others. Please do
## if you have enough bandwidth.
#DirPort 9030 # what port to advertise for directory connections
## If you want to listen on a port other than the one advertised in
## DirPort (e.g. to advertise 80 but bind to 9091), you can do it as
## follows.  below too. You'll need to do ipchains or other port
## forwarding yourself to make this work.
#DirPort 80 NoListen
#DirPort 127.0.0.1:9091 NoAdvertise
## Uncomment to return an arbitrary blob of html on your DirPort. Now you
## can explain what Tor is if anybody wonders why your IP address is
## contacting them. See contrib/tor-exit-notice.html in Tor's source
## distribution for a sample.
#DirPortFrontPage /etc/tor/tor-exit-notice.html

## Uncomment this if you run more than one Tor relay, and add the identity
## key fingerprint of each Tor relay you control, even if they're on
## different networks. You declare it here so Tor clients can avoid
## using more than one of your relays in a single circuit. See
## https://www.torproject.org/docs/faq#MultipleRelays
## However, you should never include a bridge's fingerprint here, as it would
## break its concealability and potentionally reveal its IP/TCP address.
#MyFamily $keyid,$keyid,...

## A comma-separated list of exit policies. They're considered first
## to last, and the first match wins. If you want to _replace_
## the default exit policy, end this with either a reject *:* or an
## accept *:*. Otherwise, you're _augmenting_ (prepending to) the
## default exit policy. Leave commented to just use the default, which is
## described in the man page or at
## https://www.torproject.org/documentation.html
##
## Look at https://www.torproject.org/faq-abuse.html#TypicalAbuses
## for issues you might encounter if you use the default exit policy.
##
## If certain IPs and ports are blocked externally, e.g. by your firewall,
## you should update your exit policy to reflect this -- otherwise Tor
## users will be told that those destinations are down.
##
## For security, by default Tor rejects connections to private (local)
## networks, including to your public IP address. See the man page entry
## for ExitPolicyRejectPrivate if you want to allow "exit enclaving".
##
#ExitPolicy accept *:6660-6667,reject *:* # allow irc ports but no more
#ExitPolicy accept *:119 # accept nntp as well as default exit policy
#ExitPolicy reject *:* # no exits allowed

## Bridge relays (or "bridges") are Tor relays that aren't listed in the
## main directory. Since there is no complete public list of them, even an
## ISP that filters connections to all the known Tor relays probably
## won't be able to block all the bridges. Also, websites won't treat you
## differently because they won't know you're running Tor. If you can
## be a real relay, please do; but if not, be a bridge!
#BridgeRelay 1
## By default, Tor will advertise your bridge to users through various
## mechanisms like https://bridges.torproject.org/. If you want to run
## a private bridge, for example because you'll give out your bridge
## address manually to your friends, uncomment this line:
#PublishServerDescriptor 0" >> /etc/tor/torrc
clear
#Installing Tor 1/1
#Cleaning up 0/1
sudo service tor restart
# Define the title and message for the dialog box
TITLE="Tor Proxy Installer Complete Installation"
MESSAGE="Success! The Tor proxy is installed. Use a proxy to this IP:$torproxyport"

# Display a dialog box with the welcome message
dialog --title "$TITLE" --msgbox "$MESSAGE" 8 60
                    ;;
####################################################################################################                    
                4)
                clear
                # Define the title and message for the dialog box
TITLE="Jellyfin Server Installer"
MESSAGE="Welcome to the Jellyfin installation script"

# Display a dialog box with the welcome message
dialog --title "$TITLE" --msgbox "$MESSAGE" 8 60
sleep 1.0
echo "Updating system now"
sleep 0.5
sudo apt-get update -y
(
  echo "XXX"
  echo "Installing apt-transport-https..."
  echo "XXX"
  sudo apt-get install apt-transport-https -y 2>&1 | awk '!/^(Reading|Unpacking)/{print "XXX\n"$0"\nXXX"}'
  echo "XXX"
  echo "Installation complete."
  echo "XXX"
) | dialog --title "Installing apt-transport-https" --gauge "Please wait..." 10 60 0
wget -O - https://repo.jellyfin.org/jellyfin_team.gpg.key | sudo apt-key add -
echo "deb [arch=$( dpkg --print-architecture )] https://repo.jellyfin.org/$( awk -F'=' '/^ID=/{ print $NF }' /etc/os-release ) $( awk -F'=' '/^VERSION_CODENAME=/{ print $NF }' /etc/os-release ) main" | sudo tee /etc/apt/sources.list.d/jellyfin.list
sudo apt update
(
  echo "XXX"
  echo "Installing Jellyfin..."
  echo "XXX"
  sudo apt-get install jellyfin -y 2>&1 | awk '!/^(Reading|Unpacking)/{print "XXX\n"$0"\nXXX"}'
  echo "XXX"
  echo "Installation complete."
  echo "XXX"
) | dialog --title "Installing Jellyfin" --gauge "Please wait..." 10 60 0
# Define the title and message for the dialog box
TITLE="Jellyfin Server Installation Finished"
MESSAGE="Jellyfin is now installed! Go to:This IP:8096  "

# Display a dialog box with the welcome message
dialog --title "$TITLE" --msgbox "$MESSAGE" 8 60
                    ;;
####################################################################################################
                5)
                # Define the title and message for the dialog box
TITLE="Plex Server Installation"
MESSAGE="Welcome to the Plex server installation script"

# Display a dialog box with the welcome message
dialog --title "$TITLE" --msgbox "$MESSAGE" 8 60
                    # Add the Plex repository key
                    clear
curl https://downloads.plex.tv/plex-keys/PlexSign.key | sudo apt-key add -

# Add the Plex repository to the sources list
echo deb https://downloads.plex.tv/repo/deb public main | sudo tee /etc/apt/sources.list.d/plexmediaserver.list

# Update the package lists
sudo apt update
clear
# Install Plex Media Server
(
  echo "XXX"
  echo "Installing Plex..."
  echo "XXX"
  sudo apt-get install plexmediaserver -y 2>&1 | awk '!/^(Reading|Unpacking)/{print "XXX\n"$0"\nXXX"}'
  echo "XXX"
  echo "Installation complete."
  echo "XXX"
) | dialog --title "Installing Plex" --gauge "Please wait..." 10 60 0
# Define the title and message for the dialog box
TITLE="Plex Server Installation Finished"
MESSAGE="Plex is now installed! Go to:This IP:32400  "

# Display a dialog box with the welcome message
dialog --title "$TITLE" --msgbox "$MESSAGE" 8 60
                    ;;
####################################################################################################
                6)
                clear
                echo "Installing Xrdp now..."
                2.0
                    # Install xrdp and ssl-cert packages
sudo apt-get update
(
  echo "XXX"
  echo "Installing ssl-cert..."
  echo "XXX"
  sudo apt-get install ssl-cert -y 2>&1 | awk '!/^(Reading|Unpacking)/{print "XXX\n"$0"\nXXX"}'
) | dialog --title "Installing ssl-cert" --gauge "Please wait..." 10 60 0
(
  echo "XXX"
  echo "Installing xrdp..."
  echo "XXX"
  sudo apt-get install xrdp -y 2>&1 | awk '!/^(Reading|Unpacking)/{print "XXX\n"$0"\nXXX"}'
  echo "XXX"
  echo "Installation complete."
  echo "XXX"
) | dialog --title "Installing xrdp" --gauge "Please wait..." 10 60 0

# Add user to ssl-cert group
sudo usermod -aG ssl-cert $USER

# Add xrdp to ssl-cert group
sudo adduser xrdp ssl-cert

# Enable xrdp service
sudo systemctl enable xrdp

# Define the options to display in the dialog box
OPTIONS=("xubuntu-desktop" "ubuntu-desktop")

# Define the title and prompt for the dialog box
TITLE="Choose desktop environment"
PROMPT="Select the desktop environment you want to install:"

# Use dialog to display the options to the user and save their choice to the variable CHOICE
CHOICE=$(dialog --clear --title "$TITLE" --menu "$PROMPT" 10 40 2 "${OPTIONS[@]}" 2>&1 >/dev/tty)

# Check if the user has made a choice or cancelled the dialog
if [ "$CHOICE" != "" ]; then
  # Check if the selected desktop environment is already installed
  if dpkg -l "$CHOICE" &> /dev/null; then
    echo "The $CHOICE package is already installed."
  else
    # Prompt the user to confirm that they want to download and install the selected desktop environment
    CONFIRM=$(dialog --clear --yesno "Do you want to download and install $CHOICE?" 10 40 2>&1 >/dev/tty)

    # If the user confirms, download and install the selected desktop environment
    if [ "$CONFIRM" = "0" ]; then
      sudo apt-get update
      sudo apt-get install "$CHOICE"
    else
      echo "Installation cancelled."
    fi
  fi
else
  echo "Selection cancelled."
fi

# Prompt user to allow xrdp port in UFW
# Display the Yes/No dialog box
dialog --title "Allow incoming traffic on port 3389?" \
       --yesno "Do you want to allow incoming traffic on port 3389?" 7 50

# Check the user's answer
case $? in
  0) # The user chose Yes
    sudo ufw allow 3389
    dialog --title "Success" --msgbox "Xrdp is installed with port 3389 now open" 7 50
    ;;
  1) # The user chose No or pressed Escape
    dialog --title "Canceled" --msgbox "Xrdp is intalled with no changes made to UFW" 7 50
    ;;
esac

exit 0
# Restart xrdp service
sudo systemctl restart xrdp
echo "Success! Xrdp is installed."
sleep 4.0
                    ;;
                7)
# Define the title and message for the dialog box
TITLE="Samba Service Installation"
MESSAGE="Welcome to the Samba service installation script"

# Display a dialog box with the welcome message
dialog --title "$TITLE" --msgbox "$MESSAGE" 8 60
(
  echo "XXX"
  echo "Installing Samba..."
  echo "XXX"
  sudo apt-get install -y samba 2>&1 | awk '!/^(Reading|Unpacking)/{print "XXX\n"$0"\nXXX"}'
  echo "XXX"
  echo "XXX"
  sudo apt-get install -y samba-common-bin 2>&1 | awk '!/^(Reading|Unpacking)/{print "XXX\n"$0"\nXXX"}'
  echo "XXX"
  echo "XXX"
  sudo apt-get install -y libpam-smbpass -y 2>&1 | awk '!/^(Reading|Unpacking)/{print "XXX\n"$0"\nXXX"}'
  echo "XXX"
  echo "Installation complete."
  echo "XXX"
) | dialog --title "Installing Samba packages" --gauge "Please wait..." 10 60 0
# Get user input for Samba configuration options
dialog --backtitle "Samba Setup" --title "Samba Share Configuration" --form "Please provide the following information:" 15 60 5 \
    "Share Name:" 1 1 "" 1 20 40 0 \
    "Share Path:" 2 1 "" 2 20 40 0 \
    "Browsable (yes or no):" 3 1 "" 3 20 10 0 \
    "Guest Access (yes or no):" 4 1 "" 4 20 10 0 \
    2>/tmp/samba-conf.tmp

# Parse user input and update Samba configuration file
SHARENAME=$(cat /tmp/samba-conf.tmp | head -n1)
SHAREPATH=$(cat /tmp/samba-conf.tmp | head -n2 | tail -n1)
BROWSABLE=$(cat /tmp/samba-conf.tmp | head -n3 | tail -n1)
GUESTACCESS=$(cat /tmp/samba-conf.tmp | head -n4 | tail -n1)

if [[ "$BROWSABLE" == "yes" ]]; then
    BROWSABLE="yes"
else
    BROWSABLE="no"
fi

if [[ "$GUESTACCESS" == "yes" ]]; then
    GUESTACCESS="yes"
else
    GUESTACCESS="no"
fi

echo "[$SHARENAME]" | sudo tee -a /etc/samba/smb.conf
echo "path = $SHAREPATH" | sudo tee -a /etc/samba/smb.conf
echo "browsable = $BROWSABLE" | sudo tee -a /etc/samba/smb.conf
echo "guest ok = $GUESTACCESS" | sudo tee -a /etc/samba/smb.conf

# Get user input for Samba user creation
dialog --backtitle "Samba Setup" --title "Samba User Creation" --inputbox "Enter a username to be added to Samba:" 8 60 2>/tmp/samba-user.tmp

# Add user to Samba
SAMBAUSER=$(cat /tmp/samba-user.tmp)
sudo smbpasswd -a $SAMBAUSER

# Restart Samba service
sudo service smbd restart

# Clean up temporary files
rm /tmp/samba-conf.tmp /tmp/samba-user.tmp

# Display final message to user
dialog --backtitle "Samba Setup" --title "Samba Setup Complete" --msgbox "Samba has been set up with the following configuration:\n\nShare Name: $SHARENAME\nShare Path: $SHAREPATH\nBrowsable: $BROWSABLE\nGuest Access: $GUESTACCESS\n\nUser $SAMBAUSER has been added to Samba." 12 60
                    ;;
####################################################################################################                    
                8)
                    exit
                    ;;
####################################################################################################
            esac
        done