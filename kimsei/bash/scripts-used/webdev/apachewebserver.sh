#!/bin/bash
echo "Welcome to Kimsei's automatic web configurator."
# Prompt user for domain name
read -p "Enter domain name: " domain_name
# Install Apache web server
apt-get update
apt-get install apache2 -y
# Create directory for domain and set permissions
mkdir /var/www/$domain_name
chown -R www-data:www-data /var/www/$domain_name
chmod -R 755 /var/www/$domain_name
# Create virtual host file for domain
cat > /etc/apache2/sites-available/$domain_name.conf << EOF
<VirtualHost *:80>
    ServerName $domain_name
    ServerAlias www.$domain_name
    DocumentRoot /var/www/$domain_name
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF
# Enable the virtual host and restart Apache
a2ensite $domain_name.conf
systemctl reload apache2
echo "Your Apache web server is complete! visit the IP address of this machine or the domain name if you set up DNS."

