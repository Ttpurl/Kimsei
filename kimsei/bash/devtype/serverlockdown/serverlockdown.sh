#!/bin/bash
            OPTIONS=(1 "SSH Setup (Fail2Ban)"
                     2 "Coming Soon"
                     3 "Coming Soon"
                     4 "Coming Soon"
                     5 "Coming Soon"
                     6 "Back")

            # Get menu selection
            CHOICE=$(dialog --clear \
                            --title "Server Lockdown" \
                            --menu "Choose a service to deploy" \
                            15 40 4 \
                            "${OPTIONS[@]}" \
                            2>&1 >/dev/tty)

            # Process menu selection
            case $CHOICE in
                1)
                    sudo apt-get update
                    sudo apt install ssh -y
                    sudo apt install fail2ban -y
                    echo
                    echo "Enter your public SSH key (Leave blank if you don't want public key authentication set up): " 
read ssh_key #set var ssh pub key

if [ ! -d ~/.ssh ]; then
  mkdir ~/.ssh
  echo "$ssh_key" >> ~/.ssh/authorized_keys
  echo "Created .ssh directory and added public key to authorized_keys file."
else
  echo "$ssh_key" >> ~/.ssh/authorized_keys
  echo "Added public key to authorized_keys file."
fi
#Password authentication on/off
echo "Would you like password authentication for this server? yes/no (please enter your answer in all lowercase to avoid problems with SSH default is yes if you wish to have no public key authentication):"
read passauth
#Permit empty passwords
echo "would you like to permit empty password authentication for this server? (please enter your answer in all lowercase to avoid problems with SSH. Default is no)"
read emptypassauth
#SSH port
echo "What port would you like for SSH? (Default is 22)"
read ssh_port
#Deleting and recreating sshd file in /etc/ssh/sshd_config
echo "changing your sshd cpnfig in /etc/sshd/sshd_config..."
echo "" > /etc/ssh/sshd_config
echo "#       $OpenBSD: sshd_config,v 1.103 2018/04/09 20:41:22 tj Exp $

# This is the sshd server system-wide configuration file.  See
# sshd_config(5) for more information.

# This sshd was compiled with PATH=/usr/bin:/bin:/usr/sbin:/sbin

# The strategy used for options in the default sshd_config shipped with
# OpenSSH is to specify options with their default value where
# possible, but leave them commented.  Uncommented options override the
# default value.

Include /etc/ssh/sshd_config.d/*.conf

Port $ssh_port
#AddressFamily any
#ListenAddress 0.0.0.0
#ListenAddress ::

#HostKey /etc/ssh/ssh_host_rsa_key
#HostKey /etc/ssh/ssh_host_ecdsa_key
#HostKey /etc/ssh/ssh_host_ed25519_key

# Ciphers and keying
#RekeyLimit default none

# Logging
#SyslogFacility AUTH
#LogLevel INFO

# Authentication:

#LoginGraceTime 2m
#PermitRootLogin prohibit-password
#StrictModes yes
MaxAuthTries 3
MaxSessions 3

PubkeyAuthentication yes

# Expect .ssh/authorized_keys2 to be disregarded by default in future.
#AuthorizedKeysFile     .ssh/authorized_keys .ssh/authorized_keys2

#AuthorizedPrincipalsFile none

#AuthorizedKeysCommand none
#AuthorizedKeysCommandUser nobody

# For this to work you will also need host keys in /etc/ssh/ssh_known_hosts
#HostbasedAuthentication no
# Change to yes if you don't trust ~/.ssh/known_hosts for
# HostbasedAuthentication
#IgnoreUserKnownHosts no
# Don't read the user's ~/.rhosts and ~/.shosts files
#IgnoreRhosts yes

# To disable tunneled clear text passwords, change to no here!
PasswordAuthentication $passauth
PermitEmptyPasswords $emptypassauth

# Change to yes to enable challenge-response passwords (beware issues with
# some PAM modules and threads)
ChallengeResponseAuthentication no

# Kerberos options
#KerberosAuthentication no
#KerberosOrLocalPasswd yes
#KerberosTicketCleanup yes
#KerberosGetAFSToken no

# GSSAPI options
#GSSAPIAuthentication no
#GSSAPICleanupCredentials yes
#GSSAPIStrictAcceptorCheck yes
#GSSAPIKeyExchange no

# Set this to 'yes' to enable PAM authentication, account processing,
# and session processing. If this is enabled, PAM authentication will
# be allowed through the ChallengeResponseAuthentication and
# PasswordAuthentication.  Depending on your PAM configuration,
# PAM authentication via ChallengeResponseAuthentication may bypass
# the setting of "PermitRootLogin without-password".
# If you just want the PAM account and session checks to run without
# PAM authentication, then enable this but set PasswordAuthentication
# and ChallengeResponseAuthentication to 'no'.
UsePAM yes

#AllowAgentForwarding yes
#AllowTcpForwarding yes
#GatewayPorts no
X11Forwarding yes
#X11DisplayOffset 10
#X11UseLocalhost yes
#PermitTTY yes
PrintMotd no
#PrintLastLog yes
#TCPKeepAlive yes
#PermitUserEnvironment no
#Compression delayed
#ClientAliveInterval 0
#ClientAliveCountMax 3
#UseDNS no
#PidFile /var/run/sshd.pid
#MaxStartups 10:30:100
#PermitTunnel no
#ChrootDirectory none
#VersionAddendum none

# no default banner path
#Banner none

# Allow client to pass locale environment variables
AcceptEnv LANG LC_*

# override default of no subsystems
Subsystem       sftp    /usr/lib/openssh/sftp-server

# Example of overriding settings on a per-user basis
#Match User anoncvs
#       X11Forwarding no
#       AllowTcpForwarding no
#       PermitTTY no
#       ForceCommand cvs server" >> /etc/ssh/sshd_config
sleep 0.3
echo "SSH has been configured! Restarting now"
sleep 2.0
sudo service ssh restart 
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
            esac
        done