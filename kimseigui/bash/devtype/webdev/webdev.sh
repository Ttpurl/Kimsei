#!/bin/bash
 OPTIONS=(1 "Apache Web Server (SSL)"
          2 "Nginx Web Server (SSL)"
          3 "Apache Web Server (No SSL)"
          4 "Nginx Web Server (No SSL)"
          5 "Apache Web Server .Onion"
          6 "Nginx Web Server .Onion"
          7 "Exit")

            CHOICE=$(dialog --clear \
                            --title "Webdev" \
                            --menu "Choose a deployment" \
                            15 40 4 \
                            "${OPTIONS[@]}" \
                            2>&1 >/dev/tty)

            # Process menu selection
            case $CHOICE in
                1)
                    clear
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
#######################################################################
                    ;;
                2)
                    clear
# Prompt user to enter email and domain name
read -p "Enter your email address: " email
read -p "Enter your domain name: " domain

# Update package list and install Nginx
sudo apt-get update
sudo apt-get install nginx -y

# Set up basic Nginx server block with user-provided domain name
sudo bash -c "cat > /etc/nginx/sites-available/$domain <<EOF
server {
    listen 80;
    listen [::]:80;
    server_name $domain;
    return 301 https://\$server_name\$request_uri;
}
server {
    listen 443 ssl;
    listen [::]:443 ssl;
    server_name $domain;
    ssl_certificate /etc/letsencrypt/live/$domain/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/$domain/privkey.pem;
    include /etc/nginx/snippets/ssl-params.conf;
    root /var/www/html;
    index index.html index.htm;
    location / {
        try_files \$uri \$uri/ =404;
    }
}
EOF"

# Create a symbolic link for the Nginx server block
sudo ln -s /etc/nginx/sites-available/$domain /etc/nginx/sites-enabled/

# Remove default Nginx server block
sudo rm /etc/nginx/sites-enabled/default

# Restart Nginx to apply changes
sudo systemctl restart nginx

# Install Certbot
sudo apt-get install certbot python3-certbot-nginx -y

# Obtain and install SSL/TLS certificate
sudo certbot --nginx --agree-tos -m $email -d $domain -d www.$domain

# Restart Nginx to apply changes
sudo systemctl restart nginx
#######################################################################
                    ;;
                3)
                    clear
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
sleep 1.5
#######################################################################
                    ;;
                4)
                    clear
    echo "Welcome to Kimsei's automatic web configurator."
sleep 1.0
# Prompt user for domain name
read -p "Enter domain name: " domain_name

# Install nginx web server
apt-get update
apt-get install nginx -y

# Create directory for domain and set permissions
mkdir /var/www/$domain_name
chown -R www-data:www-data /var/www/$domain_name
chmod -R 755 /var/www/$domain_name

# Create virtual host file for domain
cat > /etc/nginx/sites-available/$domain_name << EOF
server {
    listen 80;
    listen [::]:80;

    root /var/www/$domain_name;
    index index.html index.htm index.nginx-debian.html;

    server_name $domain_name www.$domain_name;

    location / {
        try_files \$uri \$uri/ =404;
    }
}
EOF

# Enable the virtual host and restart nginx
ln -s /etc/nginx/sites-available/$domain_name /etc/nginx/sites-enabled/
nginx -t
systemctl reload nginx
echo "Your Nginx web server is complete! visit the IP address of this machine or the domain name if you set up DNS."
sleep 1.5
                    ;;
                5)
                clear
                    # Install Apache and Tor
                    sudo apt-get update
                    sudo apt-get install apache2 tor -y

                    # Configure Tor Hidden Service
                    sudo sh -c 'echo "HiddenServiceDir /var/lib/tor/hidden_service/" >> /etc/tor/torrc'
                    sudo sh -c 'echo "HiddenServicePort 80 127.0.0.1:80" >> /etc/tor/torrc'
                    sudo service tor restart

                    # Obtain the Onion URL
                    ONION_URL=$(sudo cat /var/lib/tor/hidden_service/hostname)

                    # Configure Apache Server
                    sudo sh -c 'echo "ServerName $ONION_URL" >> /etc/apache2/apache2.conf'
                    sudo service apache2 restart

                    # Display Onion URL and file location
                    echo "Apache server is now running with Onion URL: $ONION_URL"
                    echo "Front end HTML files are located in /var/www/html/"
                    sleep 5.0
                    ;;
                6)
                    # Install Nginx and Tor
                    sudo apt-get update
                    sudo apt-get install nginx tor -y

                    # Configure Tor Hidden Service
                    sudo sh -c 'echo "HiddenServiceDir /var/lib/tor/hidden_service/" >> /etc/tor/torrc'
                    sudo sh -c 'echo "HiddenServicePort 80 127.0.0.1:80" >> /etc/tor/torrc'
                    sudo service tor restart

                    # Obtain the Onion URL
                    ONION_URL=$(sudo cat /var/lib/tor/hidden_service/hostname)

                    # Configure Nginx Server
                    sudo sh -c 'echo "server {
                        listen 80;
                        server_name $ONION_URL;

                        location / {
                            root /var/www/html/;
                            index index.html;
                        }
                    }" > /etc/nginx/sites-available/onion'
                    sudo ln -s /etc/nginx/sites-available/onion /etc/nginx/sites-enabled/
                    sudo service nginx restart

                    # Display Onion URL and file location
                    echo "Nginx server is now running with Onion URL: $ONION_URL"
                    echo "Front end HTML files are located in /var/www/html/"
                    sleep 5.0
                    ;;
                7)  
                    exit
                    ;;

            esac
        done