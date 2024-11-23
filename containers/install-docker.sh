!#/usr/bin/env bash

# Update WSL Linux Packages:
sudo apt update && sudo apt upgrade -y

# Install Docker Dependencies:
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    gnupg

# Add Docker's Official GPG Key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add Docker's APT Repository:
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker:
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Start Docker:
sudo service docker start

# Verify Docker Installation:
docker --version
docker run hello-world

# Enable Docker Without sudo
# Add your WSL user to the Docker group:
sudo usermod -aG docker $USER

# Restart your terminal or log out/in for changes to take effect.
# Test Docker without sudo:
docker ps
