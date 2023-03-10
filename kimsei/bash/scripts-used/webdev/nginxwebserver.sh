#!/bin/bash
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
