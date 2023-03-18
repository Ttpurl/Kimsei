#!/bin/bash
            OPTIONS=(1 "NTP Server"
                     2 "Pi-hole DNS"
                     3 "Tor Proxy Server"
                     4 "Jellyfin"
                     5 "Plex"
                     6 "XRDP"
                     7 "Grafana (User SSL)"
                     8 "Snipe IT (User SSL)"
                     9 "Snipe IT (Certbot)"
                     10 "Back")

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
echo "Welcome to the NTP server installation"
sleep 1.0
echo "Updating system now"
sleep 0.3
sudo apt-get update -y
#Installing NTP 1/3
echo "Installing NTP..."
sudo apt install ntp
#Installing NTP 2/3
echo "Where would you like your NTP servers to solicit?(US,DE,NL,RO,FR)Choose one:"
read ntpserver

ntpserver=$ntpserver 

if [ "$ntpserver" == "US" ]; then
  echo "Ok! Adding $ntpserver based time servers to your NTP config!"
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
fi
  if [ "$ntpserver" == "DE" ]; then
    echo "Ok! Adding $ntpserver based time servers to your NTP config!"
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
fi
    if [ "$ntpserver" == "NL" ]; then
    echo "Ok! Adding $ntpserver based time servers to your NTP config!"
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
fi
    if [ "$ntpserver" == "RO" ]; then
    echo "Ok! Adding $ntpserver based time servers to your NTP config!"
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
fi
    if [ "$ntpserver" == "FR" ]; then
    echo "Ok! Adding $ntpserver based time servers to your NTP config!"
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
    fi
    sudo service ntp restart
                    ;;
                2)
####################################################################################################
                    clear
            curl -sSL https://install.pi-hole.net | PIHOLE_SKIP_OS_CHECK=true sudo -E bash
                    ;;
####################################################################################################                    
                3)
                    clear
echo "Welcome to the Tor proxy installation script"
sleep 1.0
echo "Let's get started."
sleep 0.2
clear
#Welcome 1/1
#Installing Tor 0/1
echo "Installing Tor..."
sudo apt update
sudo apt install tor
echo "What port would you like to use for the tor proxy?"
read torproxyport
echo "Ok. Setting tor proxy to port to $torproxyport"
sleep 0.3
echo "Setting up your torrc config now"
sleep 0.1
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
echo "Finished installing Tor"
sleep 1.0
#Installing Tor 1/1
#Cleaning up 0/1
echo "Restarting Tor with the new configurations"
sudo service tor restart
clear
echo "Your Tor proxy is set up! Use a SOCKS5 Proxy to connect!"
sleep 2.0
                    ;;
####################################################################################################                    
                4)
                clear
                    echo "Welcome to the Jellyfin installer"
sleep 1.0
echo "Updating system now"
sleep 0.5
sudo apt-get update -y
sudo apt install apt-transport-https -y
wget -O - https://repo.jellyfin.org/jellyfin_team.gpg.key | sudo apt-key add -
echo "deb [arch=$( dpkg --print-architecture )] https://repo.jellyfin.org/$( awk -F'=' '/^ID=/{ print $NF }' /etc/os-release ) $( awk -F'=' '/^VERSION_CODENAME=/{ print $NF }' /etc/os-release ) main" | sudo tee /etc/apt/sources.list.d/jellyfin.list
sudo apt update
sudo apt install jellyfin -y
clear
echo "Jellyfin is now installed! Go to:"
echo "                                      "
echo "     This IP:8096                     "
echo "          Or                          "
echo "     localhost:8096                   "
echo "                                      "
sleep 5.0


                    ;;
####################################################################################################
                5)
                    # Add the Plex repository key
curl https://downloads.plex.tv/plex-keys/PlexSign.key | sudo apt-key add -

# Add the Plex repository to the sources list
echo deb https://downloads.plex.tv/repo/deb public main | sudo tee /etc/apt/sources.list.d/plexmediaserver.list

# Update the package lists
sudo apt update

# Install Plex Media Server
sudo apt install plexmediaserver
echo "Plex is now installed! Go to:"
echo "                                      "
echo "     This IP:32400                    "
echo "          Or                          "
echo "     localhost:32400                  "
echo "                                      "
sleep 5.0
                    ;;
####################################################################################################
                6)
                clear
                echo "Installing Xrdp now..."
                2.0
                    # Install xrdp and ssl-cert packages
sudo apt-get update
sudo apt-get install xrdp ssl-cert -y

# Add user to ssl-cert group
sudo usermod -aG ssl-cert $USER

# Add xrdp to ssl-cert group
sudo adduser xrdp ssl-cert

# Enable xrdp service
sudo systemctl enable xrdp

# Prompt user to allow xrdp port in UFW
read -p "Do you want to allow the xrdp port in UFW? (y/n) " choice

if [ "$choice" = "y" ]; then
    # Allow xrdp port in UFW
    sudo ufw allow 3389
    echo "xrdp port allowed in UFW."
    echo "Success! Xrdp is now installed."
    sleep 5.0
else
    echo "xrdp port not allowed in UFW."
    echo "Success! Xrdp is now installed."
    sleep 5.0
fi

# Restart xrdp service
sudo systemctl restart xrdp
echo "Success! Xrdp is installed."
sleep 4.0
                    ;;
                7)
                    # Install necessary packages
sudo apt-get update
sudo apt-get install -y adduser libfontconfig1 dialog

# Get user input for IP address and SSL certificates
exec 3>&1
values=$(dialog --ok-label "Install" --backtitle "Grafana Installation" --title "Installation Wizard" \
--form "\nEnter the following details:" 15 50 0 \
"IP Address:" 1 1 "" 1 20 30 0 \
".crt File Path:" 2 1 "" 2 20 30 0 \
".key File Path:" 3 1 "" 3 20 30 0 \
2>&1 1>&3)
exitcode=$?
exec 3>&-
if [ $exitcode -ne 0 ]; then
  echo "Installation canceled."
  exit 1
fi

grafana_ip=$(echo "$values" | awk 'NR==1{print $1}')
grafana_crt=$(echo "$values" | awk 'NR==2{print $1}')
grafana_key=$(echo "$values" | awk 'NR==3{print $1}')

# Create a directory for SSL certificates
sudo mkdir /etc/grafana/ssl/

# Copy SSL certificates to the directory
sudo cp $grafana_crt /etc/grafana/ssl/
sudo cp $grafana_key /etc/grafana/ssl/

# Change ownership of the SSL certificates
sudo chown -R grafana:grafana /etc/grafana/ssl/

# Configure Grafana to use SSL and listen on port 443
sudo sed -i '/;protocol = http/a protocol = https\nhttp_port = 443\nhttps_port = 443\nssl_cert_path = /etc/grafana/ssl/'$(basename $grafana_crt)'\nssl_key_path = /etc/grafana/ssl/'$(basename $grafana_key)'' /etc/grafana/grafana.ini

# Configure Grafana to listen on the specified IP address
sudo sed -i '/;http_addr =/c http_addr = '${grafana_ip}'' /etc/grafana/grafana.ini

# Enable and start Grafana service
sudo systemctl enable grafana-server.service
sudo systemctl start grafana-server.service

# Output instructions to access Grafana
dialog --backtitle "Grafana Installation" --title "Installation Complete" \
--msgbox "Grafana has been successfully installed and configured.\n\nYou can access Grafana at https://${grafana_ip}:443" 10 50
                    ;;
####################################################################################################                    
                8)
                    # Install necessary packages
sudo apt-get update
sudo apt-get install -y apache2 libapache2-mod-php7.4 php7.4-cli php7.4-mysql php7.4-gd php7.4-mbstring php7.4-xml php7.4-curl php7.4-bcmath php7.4-zip mariadb-server mariadb-client git unzip

# Set up database
dbname=$(dialog --inputbox "Enter database name:" 0 0 2>&1 >/dev/tty)
dbuser=$(dialog --inputbox "Enter database user:" 0 0 2>&1 >/dev/tty)
dbpass=$(dialog --passwordbox "Enter database password:" 0 0 2>&1 >/dev/tty)
dbhost=$(dialog --inputbox "Enter database host (optional):" 0 0 2>&1 >/dev/tty)
sudo mysql -e "CREATE DATABASE $dbname;"
sudo mysql -e "GRANT ALL PRIVILEGES ON $dbname.* TO '$dbuser'@'$dbhost' IDENTIFIED BY '$dbpass';"

# Download and set up Snipe IT
sudo rm -rf /var/www/snipe-it
sudo git clone https://github.com/snipe/snipe-it /var/www/snipe-it
cd /var/www/snipe-it
sudo git checkout tags/v5.2.2
sudo cp .env.example .env
sudo composer install --no-dev --prefer-source
sudo php artisan key:generate --force
sudo sed -i "s|DB_DATABASE=snipeit|DB_DATABASE=$dbname|g" .env
sudo sed -i "s|DB_USERNAME=snipeit|DB_USERNAME=$dbuser|g" .env
sudo sed -i "s|DB_PASSWORD=snipeit|DB_PASSWORD=$dbpass|g" .env
sudo sed -i "s|APP_URL=http://localhost|APP_URL=https://localhost|g" .env

# Set up SSL
certfile=$(dialog --filedialog "Select SSL certificate file:" 0 0 2>&1 >/dev/tty)
keyfile=$(dialog --filedialog "Select SSL key file:" 0 0 2>&1 >/dev/tty)
sudo mkdir -p /etc/apache2/ssl
sudo cp "$certfile" /etc/apache2/ssl/snipe-it.crt
sudo cp "$keyfile" /etc/apache2/ssl/snipe-it.key
sudo sed -i 's|<VirtualHost \*:80>|<VirtualHost \*:443>\n    SSLEngine on\n    SSLCertificateFile /etc/apache2/ssl/snipe-it.crt\n    SSLCertificateKeyFile /etc/apache2/ssl/snipe-it.key\n</VirtualHost>|g' /etc/apache2/sites-available/000-default.conf

# Set up Apache
sudo a2enmod rewrite
sudo a2enmod ssl
sudo systemctl restart apache2

# Set file permissions
sudo chown -R www-data:www-data /var/www/snipe-it/public/
sudo chown -R www-data:www-data /var/www/snipe-it/storage/
sudo chmod -R 755 /var/www/snipe-it/public/
sudo chmod -R 755 /var/www/snipe-it/storage/

# Display message box
dialog --msgbox "Snipe IT has been successfully installed. The web files are located in /var/www/snipe-it/public/" 0 0
                    ;;
####################################################################################################                    
                9) 
                    # Install necessary packages
sudo apt-get update
sudo apt-get install -y apache2 libapache2-mod-php7.4 php7.4-cli php7.4-mysql php7.4-gd php7.4-mbstring php7.4-xml php7.4-curl php7.4-bcmath php7.4-zip mariadb-server mariadb-client git unzip certbot python3-certbot-apache

# Set up database
dbname=$(dialog --inputbox "Enter database name:" 0 0 2>&1 >/dev/tty)
dbuser=$(dialog --inputbox "Enter database user:" 0 0 2>&1 >/dev/tty)
dbpass=$(dialog --passwordbox "Enter database password:" 0 0 2>&1 >/dev/tty)
dbhost=$(dialog --inputbox "Enter database host (optional):" 0 0 2>&1 >/dev/tty)
sudo mysql -e "CREATE DATABASE $dbname;"
sudo mysql -e "GRANT ALL PRIVILEGES ON $dbname.* TO '$dbuser'@'$dbhost' IDENTIFIED BY '$dbpass';"

# Download and set up Snipe IT
sudo rm -rf /var/www/snipe-it
sudo git clone https://github.com/snipe/snipe-it /var/www/snipe-it
cd /var/www/snipe-it
sudo git checkout tags/v5.2.2
sudo cp .env.example .env
sudo composer install --no-dev --prefer-source
sudo php artisan key:generate --force
sudo sed -i "s|DB_DATABASE=snipeit|DB_DATABASE=$dbname|g" .env
sudo sed -i "s|DB_USERNAME=snipeit|DB_USERNAME=$dbuser|g" .env
sudo sed -i "s|DB_PASSWORD=snipeit|DB_PASSWORD=$dbpass|g" .env
sudo sed -i "s|APP_URL=http://localhost|APP_URL=https://localhost|g" .env

# Set up SSL with Certbot
domain=$(dialog --inputbox "Enter your domain name for SSL certificate:" 0 0 2>&1 >/dev/tty)
email=$(dialog --inputbox "Enter your email for SSL certificate:" 0 0 2>&1 >/dev/tty)
sudo certbot --apache --agree-tos --no-eff-email --email $email -d $domain

# Set up Apache
sudo a2enmod rewrite
sudo systemctl restart apache2

# Set file permissions
sudo chown -R www-data:www-data /var/www/snipe-it/public/
sudo chown -R www-data:www-data /var/www/snipe-it/storage/
sudo chmod -R 755 /var/www/snipe-it/public/
sudo chmod -R 755 /var/www/snipe-it/storage/

# Display message box
dialog --msgbox "Snipe IT has been successfully installed with SSL. The web files are located in /var/www/snipe-it/public/" 0 0
                    ;;
####################################################################################################                    
                10)
                    exit
                    ;;

            esac
        done