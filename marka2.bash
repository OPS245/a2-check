#!/bin/bash
# Author: Jason Carman; jason.carman@senecacollege.ca
# Date: March 14, 2023
# Purpose: Generate a text file submission for Assignment 2
# Usage: Run this on centos3, then copy the output file to your host.

read -p "Please enter your userID: " user

cat << EOF > /home/$user/a2output.txt
Username: $user
Unique ID: $(echo $user | sha256sum)

#####
# Apache status:
$(systemctl status httpd)

#####
# Mariadb status:
$(systemctl status mariadb)

#####
# Wordpress installed:
$(ls -la /var/www/html/wordpress)

#####
# Wordpress config:
$(head -30 /var/www/html/wordpress/wp-config.php)

#####
# Firewall configuration:
$(iptables -L -vn --line-numbers)

EOF

cat << EOF

a2output.txt has been created in your home directory.  Please submit it to the Assignment 2 folder on BlackBoard.

EOF
