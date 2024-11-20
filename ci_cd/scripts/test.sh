#!/bin/bash

# Exit on any error
set -e

echo "Running tests..."

# Navigate to the backend directory
cd "$(dirname "$0")"

# Export environment variables for testing
export NODE_ENV=test
export DB_HOST=${DB_HOST:-"localhost"}
export DB_USER=${DB_USER:-"root"}
export DB_PASSWORD=${DB_PASSWORD:-""}
export DB_NAME=${DB_NAME:-"test_db"}

# Run tests
if [ -f package.json ] && grep -q '"test"' package.json; then
  echo "Executing test suite..."
  npm test
else
  echo "No test script found in package.json. Skipping tests..."
fi

echo "Tests completed!"
