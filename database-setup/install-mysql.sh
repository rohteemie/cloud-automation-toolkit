#!/usr/bin/env bash

# Stop script on any command failure
set -e

# Update system and install MySQL (automatically confirm installation with -y)
echo "Updating system and installing MySQL..."
sudo apt update -y
sudo apt install -y mysql-server

# Start MySQL service
echo "Starting MySQL service..."
sudo systemctl start mysql
sudo systemctl enable mysql

# Secure MySQL installation (optional)
echo "Securing MySQL installation..."
sudo mysql_secure_installation

# Prompt the user for database name, username, and password
read -p "Enter the name of the database to create: " db_name
read -p "Enter the MySQL username to create: " db_user
read -sp "Enter the password for the MySQL user: " db_password
echo  # Just to move to the next line after the password input

# Log in to MySQL as root and create the user, database, and grant privileges
echo "Creating database, user, and granting privileges..."
sudo mysql -u root -e "
CREATE DATABASE IF NOT EXISTS $db_name;
CREATE USER IF NOT EXISTS '$db_user'@'localhost' IDENTIFIED BY '$db_password';
GRANT ALL PRIVILEGES ON $db_name.* TO '$db_user'@'localhost';
FLUSH PRIVILEGES;
"

# Confirm that everything is set up
echo "Database '$db_name' created and user '$db_user' granted all privileges."

# Optional: Check the status of MySQL to ensure it's running
echo "Checking MySQL status..."
sudo systemctl status mysql