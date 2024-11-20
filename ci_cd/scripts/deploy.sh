#!/bin/bash

# Exit on any error
set -e

# Variables
SERVER_USER=${SERVER_USER:-"your-default-user"}
SERVER_HOST=${SERVER_HOST:-"your-server-host"}
SSH_PRIVATE_KEY=${SSH_PRIVATE_KEY:-"~/.ssh/id_rsa"}
REMOTE_PATH=${REMOTE_PATH:-"/path/to/remote/app_directory"}

# Ensure required variables are set
if [[ -z "$SERVER_USER" || -z "$SERVER_HOST" || -z "$REMOTE_PATH" ]]; then
  echo "Error: SERVER_USER, SERVER_HOST, or REMOTE_PATH is not set."
  exit 1
fi

echo "Starting deployment process..."

# Add the server to known_hosts
echo "Adding server to known_hosts..."
mkdir -p ~/.ssh
ssh-keyscan -H "$SERVER_HOST" >> ~/.ssh/known_hosts

# Deploy the backend directory
echo "Deploying backend to $SERVER_USER@$SERVER_HOST:$REMOTE_PATH..."
rsync -avz -e "ssh -i $SSH_PRIVATE_KEY" "$(dirname "$0")" "$SERVER_USER@$SERVER_HOST:$REMOTE_PATH"

echo "Deployment completed successfully!"
