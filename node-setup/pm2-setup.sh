#!/usr/bin/env bash

# Stop script on any command failure
set -e

# Define the required variables
# file_name: The main entry file for your Node.js application (e.g., app.js)
file_name="your_file.js"

# username: Your system username (e.g., johndoe)
username="your_username"

# app_name: The name of your PM2 application (e.g., app_name from the PM2 process list)
app_name="your_app_name"

# Check if required variables are set
if [ -z "$file_name" ] || [ -z "$username" ] || [ -z "$app_name" ]; then
  echo "Error: Missing required variable. Please set 'file_name', 'username', and 'app_name'."
  exit 1
fi

# Check if PM2 is installed
if ! command -v pm2 &> /dev/null; then
  echo "Error: PM2 is not installed. Please install PM2 first."
  exit 1
fi

# Install and configure PM2
echo "Installing PM2..."
sudo npm install pm2@latest -g
echo "Starting PM2 with $file_name..."
pm2 start $file_name

# Ensure PM2 starts on system startup
echo "Setting PM2 to start on system startup..."
pm2 startup systemd
sudo env PATH=$PATH:/usr/bin /usr/lib/node_modules/pm2/bin/pm2 startup systemd -u $username --hp /home/$username

# Save the PM2 process list
echo "Saving PM2 process list..."
pm2 save

# Start the PM2 service
echo "Starting PM2 service for $username..."
sudo systemctl start pm2-$username

# Check the status of the PM2 systemd unit
echo "Checking PM2 service status..."
systemctl status pm2-$username

# PM2 commands for application control
echo "Stopping $app_name..."
pm2 stop $app_name
echo "Restarting $app_name..."
pm2 restart $app_name
echo "Listing all PM2 applications..."
pm2 list
echo "Getting information about $app_name..."
pm2 info $app_name
echo "Opening PM2 process monitor..."
pm2 monit