#!/bin/bash
# Script made by Kimsei.com
# Website: https://kimsei.com
# This script is for setting up a fully functional website with https enabled
echo "Welcome to Kimsei's automatic Web/SSL configurator"
echo "Disclaimer: Please have your DNS A/AAAA records in order for your domain. This script will not work unless you have proper DNS configuration beforehand!"
sleep 3.0
echo "Initializing script..."
sleep 0.7
clear
# AGet variables for domain and email
read -p "Enter your domain name: " domain
read -p "Enter your email address: " email

# Install Apache2 web server
sudo apt-get update
sudo apt-get install apache2 -y

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
sudo apt-get update
sudo apt-get install certbot python3-certbot-apache -y

# Obtain SSL certificate for $domain
sudo certbot --apache -d $domain -d $domain --non-interactive --agree-tos --email $email
