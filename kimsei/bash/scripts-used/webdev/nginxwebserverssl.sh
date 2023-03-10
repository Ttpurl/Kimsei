#!/bin/bash

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
