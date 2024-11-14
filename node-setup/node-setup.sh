#!/usr/bin/env bash

# Stop the script if any command fails
set -e

# Prompt for GitHub repository URL and the application type (Node.js or Python)
read -p "Enter the GitHub repository URL: " repo_url
read -p "Enter the type of application (node or python): " app_type

# Clone the repository into the current directory
echo "Cloning the repository from $repo_url..."
git clone "$repo_url"

# Extract the project name from the repository URL (assuming the repo name is the last part of the URL)
repo_name=$(basename "$repo_url" .git)

# Navigate to the cloned project directory
cd "$repo_name" || { echo "Failed to enter project directory"; echo "Fix and run the script again"; exit 1; }

# Prompt for environment variables
echo "Setting up environment variables..."
read -p "Enter the environment variable file path (e.g., .env): " env_file

# Check if the environment file exists, and load the variables if it does
if [ -f "$env_file" ]; then
    export $(cat "$env_file" | xargs)  # Export all variables from the file
    echo "Environment variables set successfully."
else
    echo "Environment file not found: $env_file"
    exit 1
fi

# Install dependencies based on the application type (Node.js or Python)
if [ "$app_type" == "node" ]; then
    if [ -f "package.json" ]; then
        echo "Installing Node.js dependencies..."
        npm install
    else
        echo "No package.json found. Make sure it's a valid Node.js project."
        exit 1
    fi
elif [ "$app_type" == "python" ]; then
    if [ -f "requirements.txt" ]; then
        echo "Installing Python dependencies..."
        python3 -m pip install -r requirements.txt
    else
        echo "No requirements.txt found. Make sure it's a valid Python project."
        exit 1
    fi
else
    echo "Invalid application type. Please enter 'node' or 'python'."
    exit 1
fi

# Run the application (Node.js or Python)
echo "Running the application..."

if [ "$app_type" == "node" ]; then
    # For Node.js, check for the entry point in the backend directory
    if [ -f "backend/server.js" ]; then
        node backend/server.js  # Specify the correct path to the entry point
    else
        echo "No backend/server.js found. Ensure your entry point is correct."
        exit 1
    fi
elif [ "$app_type" == "python" ]; then
    # For Python, check for the entry point (e.g., app.py or main.py)
    if [ -f "app.py" ] || [ -f "main.py" ]; then
        python3 app.py || python3 main.py  # Try both possible entry points for Python
    else
        echo "No app.py or main.py found. Ensure your entry point is correct."
        exit 1
    fi
fi

# If the application runs successfully, print the success message
echo "Project is ready for deployment!"