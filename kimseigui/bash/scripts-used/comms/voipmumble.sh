#!/bin/bash
#This script was made by txr8v9s2ytg7xr.us
#Link to website: https://txr8v9s2ytg7xr.us/
#This script is meant to set up a working VoIP server that is protected by a password
echo "Welcome to the VoIP installation script by txr8v9s2ytg7xr.us!"
sleep 1.0
clear
#Updating Repositories (0/1)
echo "Updating repositories now"
sleep 0.3
sudo apt update -y
sudo apt upgrade -y
sudo apt autoremove -y
#Updating Repositories (1/1)
#Installing Mumble (0/3)
clear
echo "Installing the VoIP server now"
sleep 0.3
sudo apt install mumble-server -y
#Installing Mumble (1/3)
clear
echo "Mumble-Server installed. The next prompts will help customize your VoIP server to your liking!"
sleep 1.0
echo "Set your password to access the VoIP server via superuser here. We reccomend 8 characters minimum but there is no minimum:"
read voippassword
voippassword=$voippassword
echo "What is the IP of the server hosting the VoIP server? (Can be private or public addressing):"
read voipip
voipip=$voipip
echo "What is the port that you would like to connect to for VoIP? (Default is 64738 but any port will do)"
read voipport
voipport=$voipport
echo "how many bits per second can users send voice data?(Default is 72,000, Max 192000)" 
read voipbandwidth
voipbandwidth=$voipbandwidth
echo "How many users are allowed at once?(Default is 100):"
read voipusers
voipusers=$voipusers
echo "How many days would you like to keep logs?(Set to 0 to keep forever, or -1 to disable logging to the DB)"
read voiplog
voiplog=$voiplog
#Installing Mumble (2/3)
sleep 0.3
clear
echo "Ok! applying the changes now!"
sleep 0.3
echo "# Murmur configuration file.
# General notes:
# * Settings in this file are default settings and many of them can be overridden
#   with virtual server specific configuration via the Ice or DBus interface.
# * Due to the way this configuration file is read some rules have to be
#   followed when specifying variable values (as in variable = value):
#     * Make sure to quote the value when using commas in strings or passwords.
#        NOT variable = super,secret BUT variable = super,secret
#     * Make sure to escape special characters like \ or  correctly
#        NOT variable =  BUT variable =  \
#        NOT regex = \w* BUT regex = \\w*
#
# Path to database. If blank, will search for
# murmur.sqlite in default locations or create it if not found.
database=/var/lib/mumble-server/mumble-server.sqlite

# Murmur defaults to using SQLite with its default rollback journal.
# In some situations, using SQLites write-ahead log (WAL) can be
# advantageous.
# If you encounter slowdowns when moving between channels and similar
# operations, enabling the SQLite write-ahead log might help.
#
# To use SQLites write-ahead log, set sqlite_wal to one of the following
# values:
#
# 0 - Use SQLites default rollback journal.
# 1 - Use write-ahead log with synchronous=NORMAL.
#     If Murmur crashes, the database will be in a consistent state, but
#     the most recent changes might be lost if the operating system did
#     not write them to disk yet. This option can improve Murmurs
#     interactivity on busy servers, or servers with slow storage.
# 2 - Use write-ahead log with synchronous=FULL.
#     All database writes are synchronized to disk when they are made.
#     If Murmur crashes, the database will be include all completed writes.
#sqlite_wal=0

# If you wish to use something other than SQLite, youll need to set the name
# of the database above, and also uncomment the below.
# Sticking with SQLite is strongly recommended, as its the most well tested
# and by far the fastest solution.
#
#dbDriver=QMYSQL
#dbUsername=
#dbPassword=
#dbHost=
#dbPort=
#dbPrefix=murmur_
#dbOpts=

# Murmur defaults to not using D-Bus. If you wish to use dbus, which is one of the
# RPC methods available in Murmur, please specify so here.
#
#dbus=system

# Alternate D-Bus service name. Only use if you are running distinct
# murmurd processes connected to the same D-Bus daemon.
#dbusservice=net.sourceforge.mumble.murmur

# If you want to use ZeroC Ice to communicate with Murmur, you need
# to specify the endpoint to use. Since there is no authentication
# with ICE, you should only use it if you trust all the users who have
# shell access to your machine.
# Please see the ICE documentation on how to specify endpoints.
#ice=tcp -h 127.0.0.1 -p 6502

# Ice primarily uses local sockets. This means anyone who has a
# user account on your machine can connect to the Ice services.
# You can set a plaintext secret on the Ice connection, and
# any script attempting to access must then have this secret
# (as context with name secret).
# Access is split in read (look only) and write (modify)
# operations. Write access always includes read access,
# unless read is explicitly denied (see note below).
#
# Note that if this is uncommented and with empty content,
# access will be denied.

#icesecretread=
icesecretwrite=

# If you want to expose Murmurs experimental gRPC API, you
# need to specify an address to bind on.
# Note: not all builds of Murmur support gRPC. If gRPC is not
# available, Murmur will warn you in its log output.
#grpc=127.0.0.1:50051
# Specifying both a certificate and key file below will cause gRPC to use
# secured, TLS connections.
#grpccert=""
#grpckey=""

# Specifies the file Murmur should log to. By default, Murmur
# logs to the file murmur.log. If you leave this field blank
# on Unix-like systems, Murmur will force itself into foreground
# mode which logs to the console.
logfile=/var/log/mumble-server/mumble-server.log

# If set, Murmur will write its process ID to this file
# when running in daemon mode (when the -fg flag is not
# specified on the command line). Only available on
# Unix-like systems.
pidfile=/run/mumble-server/mumble-server.pid

# The below will be used as defaults for new configured servers.
# If youre just running one server (the default), its easier to
# configure it here than through D-Bus or Ice.
#
# Welcome message sent to clients when they connect.
# If the welcome message is set to an empty string,
# no welcome message will be sent to clients.
#welcometext=<br />Welcome to this VoIP server made by a script made by<b>txr8v9s2ytg7xr.us</b>.<br />Enjoy your stay!<br />

# Port to bind TCP and UDP sockets to.
port=$voipport

# Specific IP or hostname to bind to.
# If this is left blank (default), Murmur will bind to all available addresses.
host=$voipip

# Password to join server.
serverpassword= $voippassword

# Maximum bandwidth (in bits per second) clients are allowed
# to send speech at.
bandwidth=$voipbandwidth

# Murmur and Mumble are usually pretty good about cleaning up hung clients, but
# occasionally one will get stuck on the server. The timeout setting will cause
# a periodic check of all clients who havent communicated with the server in
# this many seconds - causing zombie clients to be disconnected.
#
# Note that this has no effect on idle clients or people who are AFK. It will
# only affect people who are already disconnected, and just havent told the
# server.
#timeout=30

# Maximum number of concurrent clients allowed.
users=$voipusers

# Where users sets a blanket limit on the number of clients per virtual server,
# usersperchannel sets a limit on the number per channel. The default is 0, for
# no limit.
#usersperchannel=0

# Per-user rate limiting
#
# These two settings allow to configure the per-user rate limiter for some
# command messages sent from the client to the server. The messageburst setting
# specifies an amount of messages which are allowed in short bursts. The
# messagelimit setting specifies the number of messages per second allowed over
# a longer period. If a user hits the rate limit, his packages are then ignored
# for some time. Both of these settings have a minimum of 1 as setting either to
# 0 could render the server unusable.
messageburst=5
messagelimit=1

# Respond to UDP ping packets.
#
# Setting to true exposes the current user count, the maximum user count, and
# the servers maximum bandwidth per client to unauthenticated users. In the
# Mumble client, this information is shown in the Connect dialog.
allowping=true

# Amount of users with Opus support needed to force Opus usage, in percent.
# 0 = Always enable Opus, 100 = enable Opus if its supported by all clients.
#opusthreshold=100

# Maximum depth of channel nesting. Note that some databases like MySQL using
# InnoDB will fail when operating on deeply nested channels.
#channelnestinglimit=10

# Maximum number of channels per server. 0 for unlimited. Note that an
# excessive number of channels will impact server performance
#channelcountlimit=1000

# Regular expression used to validate channel names.
# (Note that you have to escape backslashes with \ )
#channelname=[ \\-=\\w\\#\\[\\]\\{\\}\\(\\)\\@\\|]+

# Regular expression used to validate user names.
# (Note that you have to escape backslashes with \ )
#username=[-=\\w\\[\\]\\{\\}\\(\\)\\@\\|\\.]+

# If a user has no stored channel (theyve never been connected to the server
# before, or rememberchannel is set to false) and the client hasnt been given
# a URL that includes a channel path, the default behavior is that they will
# end up in the root channel.
#
# You can set this setting to a channel ID, and the user will automatically be
# moved into that channel instead. Note that this is the numeric ID of the
# channel, which can be a little tricky to get (youll either need to use an
# RPC mechanism, watch the console of a debug client, or root around through
# the Murmur Database to get it).
#
#defaultchannel=0

# When a user connects to a server theyve already been on, by default the
# server will remember the last channel they were in and move them to it
# automatically. Toggling this setting to false will disable that feature.
#
#rememberchannel=true

# Maximum length of text messages in characters. 0 for no limit.
#textmessagelength=5000

# Maximum length of text messages in characters, with image data. 0 for no limit.
#imagemessagelength=131072

# Allow clients to use HTML in messages, user comments and channel descriptions?
#allowhtml=true

# Murmur retains the per-server log entries in an internal database which
# allows it to be accessed over D-Bus/ICE.
# How many days should such entries be kept?
# Set to 0 to keep forever, or -1 to disable logging to the DB.
logdays=$voiplog

# To enable public server registration, the serverpassword must be blank, and
# this must all be filled out.
# The password here is used to create a registry for the server name# subsequent
# updates will need the same password. Dont lose your password.
# The URL is your own website, and only set the registerHostname for static IP
# addresses.
# Location is typically the country of typical users of the server, in
# two-letter TLD style (ISO 3166-1 alpha-2 country code)
#
# If you only wish to give your Root channel a custom name, then only
# uncomment the registerName parameter.
#
#registerName=Mumble Server
#registerPassword=secret
#registerUrl=http://www.mumble.info/
#registerHostname=
#registerLocation=

# If this option is enabled, the server will announce its presence via the
# bonjour service discovery protocol. To change the name announced by bonjour
# adjust the registerName variable.
# See http://developer.apple.com/networking/bonjour/index.html for more information
# about bonjour.
#bonjour=True

# If you have a proper SSL certificate, you can provide the filenames here.
# Otherwise, Murmur will create its own certificate automatically.
#sslCert=
#sslKey=

# If the keyfile specified above is encrypted with a passphrase, you can enter
# it in this setting. It must be plaintext, so you may wish to adjust the
# permissions on your murmur.ini file accordingly.
#sslPassPhrase=

# If your certificate is signed by an authority that uses a sub-signed or
# intermediate certificate, you probably need to bundle it with your
# certificate in order to get Murmur to accept it. You can either concatenate
# the two certificates into one file, or you can put it in a file by itself and
# put the path to that PEM-file in sslCA.
#sslCA=

# The sslDHParams option allows you to specify a PEM-encoded file with
# Diffie-Hellman parameters, which will be used as the default Diffie-
# Hellman parameters for all virtual servers.
#
# Instead of pointing sslDHParams to a file, you can also use the option
# to specify a named set of Diffie-Hellman parameters for Murmur to use.
# Murmur comes bundled with the Diffie-Hellman parameters from RFC 7919.
# These parameters are available by using the following names:
#
# @ffdhe2048, @ffdhe3072, @ffdhe4096, @ffdhe6144, @ffdhe8192
#
# By default, Murmur uses @ffdhe2048.
#sslDHParams=@ffdhe2048

# The sslCiphers option chooses the cipher suites to make available for use
# in SSL/TLS. This option is server-wide, and cannot be set on a
# per-virtual-server basis.
#
# This option is specified using OpenSSL cipher list notation (see
# https://www.openssl.org/docs/apps/ciphers.html#CIPHER-LIST-FORMAT).
#
# It is recommended that you try your cipher string using openssl ciphers <string>
# before setting it here, to get a feel for which cipher suites you will get.
#
# After setting this option, it is recommend that you inspect your Murmur log
# to ensure that Murmur is using the cipher suites that you expected it to.
#
# Note: Changing this option may impact the backwards compatibility of your
# Murmur server, and can remove the ability for older Mumble clients to be able
# to connect to it.
#sslCiphers=EECDH+AESGCM:EDH+aRSA+AESGCM:DHE-RSA-AES256-SHA:DHE-RSA-AES128-SHA:AES256-SHA:AES128-SHA

# If Murmur is started as root, which user should it switch to?
# This option is ignored if Murmur isnt started with root privileges.
uname=mumble-server

# By default, in log files and in the user status window for privileged users,
# Mumble will show IP addresses - in some situations you may find this unwanted
# behavior. If obfuscate is set to true, Murmur will randomize the IP addresses
# of connecting users.
#
# The obfuscate function only affects the log file and DOES NOT effect the user
# information section in the client window.
#obfuscate=false

# If this options is enabled, only clients which have a certificate are allowed
# to connect.
#certrequired=False

# If enabled, clients are sent information about the servers version and operating
# system.
#sendversion=True

# You can set a recommended minimum version for your server, and clients will
# be notified in their log when they connect if their client does not meet the
# minimum requirements. suggestVersion expects the version in the format X.X.X.
#
# Note that the suggest* options appeared after 1.2.3 and will have no effect
# on client versions 1.2.3 and earlier.
#
#suggestVersion=

# Setting this to true will alert any user who does not have positional audio
# enabled that the server administrators recommend enabling it. Setting it to
# false will have the opposite effect - if you do not care whether the user
# enables positional audio or not, set it to blank. The message will appear in
# the log window upon connection, but only if the users settings do not match
# what the server requests.
#
# Note that the suggest* options appeared after 1.2.3 and will have no effect
# on client versions 1.2.3 and earlier.
#
#suggestPositional=

# Setting this to true will alert any user who does not have Push-To-Talk
# enabled that the server administrators recommend enabling it. Setting it to
# false will have the opposite effect - if you do not care whether the user
# enables PTT or not, set it to blank. The message will appear in the log
# window upon connection, but only if the users settings do not match what the
# server requests.
#
# Note that the suggest* options appeared after 1.2.3 and will have no effect
# on client versions 1.2.3 and earlier.
#
#suggestPushToTalk=

# This sets password hash storage to legacy mode (1.2.4 and before)
# (Note that setting this to true is insecure and should not be used unless absolutely necessary)
#legacyPasswordHash=false

# By default a strong amount of PBKDF2 iterations are chosen automatically. If >0 this setting
# overrides the automatic benchmark and forces a specific number of iterations.
# (Note that you should only change this value if you know what you are doing)
#kdfIterations=-1

# In order to prevent misconfigured, impolite or malicious clients from
# affecting the low-latency of other users, Murmur has a rudimentary global-ban
# system. Its configured using the autobanAttempts, autobanTimeframe and
# autobanTime settings.
#
# If a client attempts autobanAttempts connections in autobanTimeframe seconds,
# they will be banned for autobanTime seconds. This is a global ban, from all
# virtual servers on the Murmur process. It will not show up in any of the
# ban-lists on the server, and they cant be removed without restarting the
# Murmur process - just let them expire. A single, properly functioning client
# should not trip these bans.
#
# To disable, set autobanAttempts or autobanTimeframe to 0. Commenting these
# settings out will cause Murmur to use the defaults:
#
#autobanAttempts=10
#autobanTimeframe=120
#autobanTime=300

# You can configure any of the configuration options for Ice here. We recommend
# leave the defaults as they are.
# Please note that this section has to be last in the configuration file.
#
[Ice]
Ice.Warn.UnknownProperties=1
Ice.MessageSizeMax=65536" | sudo tee -a /etc/mumble-server.ini
sudo service mumble-server restart
clear
#Installing Mumble (3/3)
echo "Script is completed! Enjoy your new VoIP server! Note: to change the config of the mumble-server, go to /etc/mumble-server.ini"