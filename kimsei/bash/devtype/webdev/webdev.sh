#!/bin/bash
 OPTIONS=(1 "Apache Web Server (Certbot SSL)"
          2 "Apache Web Server (User SSL)"
          3 "Apache Web Server (No SSL)"
          4 "Back")

            CHOICE=$(dialog --clear \
                            --title "Webdev" \
                            --menu "Choose a deployment" \
                            15 40 4 \
                            "${OPTIONS[@]}" \
                            2>&1 >/dev/tty)

            # Process menu selection
            case $CHOICE in
                1)
# display welcome message
dialog --msgbox "Welcome to Kimsei's automatic Web/SSL configurator" 10 50

# display disclaimer message
dialog --msgbox "Disclaimer: Please have your DNS A/AAAA records in order for your domain. This script will not work unless you have proper DNS configuration beforehand!" 10 70

# prompt user for domain name
domain=$(dialog --inputbox "Enter your domain name:" 10 50 3>&1 1>&2 2>&3)

# prompt user for email address
email=$(dialog --inputbox "Enter your email address:" 10 50 3>&1 1>&2 2>&3)

# Install Apache2 web server
if ! dpkg -l | grep -q apache2; then
  # install Apache2
(
echo "XXX"
echo "Updating System Packages..."
echo "XXX"
sudo apt-get update 2>&1 | awk '!/^(Reading|Unpacking)/{print "XXX\n"$0"\nXXX"}'
) | dialog --title "Updating System Packages" --gauge "Please wait..." 10 60 0
(
echo "XXX"
echo "Installing Apache2..."
echo "XXX"
sudo apt-get install -y apache2 2>&1 | awk '!/^(Reading|Unpacking)/{print "XXX\n"$0"\nXXX"}'
echo "XXX"
echo "Installation complete."
echo "XXX"
) | dialog --title "Installing Apache2" --gauge "Please wait..." 10 60 0
fi
# Create virtual host configuration file for $domain
sudo cat > /etc/apache2/sites-available/$domain.conf <<EOF
<VirtualHost *:80>
    ServerAdmin admin@$domain
    ServerName $domain
    ServerAlias $domain
    DocumentRoot /var/www/html/$domain
    ErrorLog ${APACHE_LOG_DIR}/$domain_error.log
    CustomLog ${APACHE_LOG_DIR}/$domain_access.log combined
</VirtualHost>
EOF

# Create directory for $domain
sudo mkdir -p /var/www/html/$domain

# Create index file for $domain
sudo cat > /var/www/html/$domain/index.html <<EOF
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to $domain</title>
</head>
<body>
    <h1>Welcome to $domain</h1>
    <p>This is the default web page for this server.</p>
</body>
</html>
EOF

# Enable the virtual host
sudo a2ensite $domain.conf

# Restart Apache
sudo systemctl restart apache2

# Install Certbot for SSL
if ! dpkg -l | grep -q certbot && ! dpkg -l | grep -q python3-certbot-apache; then
# install Certbot and Apache plugin
(
echo "XXX"
echo "Installing Certbot..."
echo "XXX"
sudo apt-get install certbot 2>&1 | awk '!/^(Reading|Unpacking)/{print "XXX\n"$0"\nXXX"}'
) | dialog --title "Installing Certbot" --gauge "Please wait..." 10 60 0
(
echo "XXX"
echo "Installing Python3-certbot-apache..."
echo "XXX"
sudo apt-get install -y Python3-certbot-apache 2>&1 | awk '!/^(Reading|Unpacking)/{print "XXX\n"$0"\nXXX"}'
echo "XXX"
echo "Installation complete."
echo "XXX"
) | dialog --title "Installing Python3-certbot-apache" --gauge "Please wait..." 10 60 0
fi
# Obtain SSL certificate for $domain
sudo certbot --apache -d $domain -d $domain --non-interactive --agree-tos --email $email
# Complete
dialog --msgbox "Success! Your new website should be available at $domain! You can go to /var/www/html/$domain to change the web page files." 10 70
#######################################################################
                    ;;
                2)
# display welcome message
dialog --msgbox "Welcome to Kimsei's automatic Web/SSL configurator" 10 50
# Install Apache2 web server
if ! dpkg -l | grep -q apache2; then
  # install Apache2
(
  echo "XXX"
  echo "Updating System Packages..."
  echo "XXX"
  sudo apt-get update 2>&1 | awk '!/^(Reading|Unpacking)/{print "XXX\n"$0"\nXXX"}'
) | dialog --title "Updating System Packages" --gauge "Please wait..." 10 60 0
(
  echo "XXX"
  echo "Installing Apache2..."
  echo "XXX"
  sudo apt-get install -y apache2 2>&1 | awk '!/^(Reading|Unpacking)/{print "XXX\n"$0"\nXXX"}'
  echo "XXX"
  echo "Installation complete."
  echo "XXX"
) | dialog --title "Installing Apache2" --gauge "Please wait..." 10 60 0
fi
# Get domain name from user
domain=$(dialog --inputbox "Enter your domain name:" 10 50 3>&1 1>&2 2>&3)

# Get SSL certificate and key file paths from user
# prompt user for .crt file path
crt_path=$(dialog --inputbox "Enter the path to your .crt file:" 10 50 3>&1 1>&2 2>&3)

# prompt user for .key file path
key_path=$(dialog --inputbox "Enter the path to your .key file:" 10 50 3>&1 1>&2 2>&3)

# Create Apache virtual host configuration file
cat << EOF > /etc/apache2/sites-available/$domain.conf
<VirtualHost *:80>
    ServerName $domain
    Redirect permanent / https://$domain/
</VirtualHost>

<VirtualHost *:443>
    ServerName $domain
    SSLEngine on
    SSLCertificateFile $crt_path
    SSLCertificateKeyFile $key_path
    DocumentRoot /var/www/html/$domain
</VirtualHost>
EOF

# Create website directory and index.html file
mkdir /var/www/html/$domain
echo "<html><body><h1>Welcome to $domain</h1></body></html>" > /var/www/html/$domain/index.html

# Change ownership of website directory to user running the script
chown -R $(whoami):$(whoami) /var/www/html/$domain

# Enable site and SSL module, then restart Apache
a2ensite $domain
a2enmod ssl
systemctl restart apache2
#######################################################################
                    ;;
                3)
# display welcome message
dialog --msgbox "Welcome to Kimsei's automatic Web configurator" 10 50
# Prompt user for domain name
domain=$(dialog --inputbox "Enter your domain name:" 10 50 3>&1 1>&2 2>&3)
# Install Apache web server
if ! dpkg -l | grep -q apache2; then
# install Apache2
(
  echo "XXX"
  echo "Updating System Packages..."
  echo "XXX"
  sudo apt-get update 2>&1 | awk '!/^(Reading|Unpacking)/{print "XXX\n"$0"\nXXX"}'
) | dialog --title "Updating System Packages" --gauge "Please wait..." 10 60 0
(
  echo "XXX"
  echo "Installing Apache2..."
  echo "XXX"
  sudo apt-get install -y apache2 2>&1 | awk '!/^(Reading|Unpacking)/{print "XXX\n"$0"\nXXX"}'
  echo "XXX"
  echo "Installation complete."
  echo "XXX"
) | dialog --title "Installing Apache2" --gauge "Please wait..." 10 60 0
fi
apt-get install apache2 -y
# Create directory for domain and set permissions
mkdir /var/www/$domain
chown -R www-data:www-data /var/www/$domain
chmod -R 755 /var/www/$domain
# Create virtual host file for domain
cat > /etc/apache2/sites-available/$domain.conf << EOF
<VirtualHost *:80>
    ServerName $domain
    ServerAlias www.$domain
    DocumentRoot /var/www/$domain
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF
# Enable the virtual host and restart Apache
a2ensite $domain.conf
systemctl reload apache2
# Complete
dialog --msgbox "Success! Your new website should be available at $domain! You can go to /var/www/html/$domain to change the web page files." 10 70
                    ;;
#######################################################################
                4)
                    exit
                    ;;
#######################################################################
            esac
        done