#!/usr/bin/env bash

# 1
cd ~

# 2
curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh

# 3
sudo bash nodesource_setup.sh

# 4
# Command to install nodejs
sudo apt install nodejs

# 5
# Check to see the version of nodejs installed
node -v

# 6
# Check to see the version of npm installed
npm -v

# 7
# Below installation is needed for some npm packages to work (those that require compiling code from source).
sudo apt install build-essential