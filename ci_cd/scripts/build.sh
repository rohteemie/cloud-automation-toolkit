#!/bin/bash

# Exit on any error
set -e

echo "Starting build process..."

# Navigate to the backend directory
cd "$(dirname "$0")"

# Install dependencies
echo "Installing dependencies..."
npm install

# (Optional) Run build process if your app requires it
if [ -f package.json ] && grep -q '"build"' package.json; then
  echo "Building the application..."
  npm run build
else
  echo "No build script found. Skipping build step..."
fi

echo "Build process completed!"
