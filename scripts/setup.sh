#!/bin/bash

set -e

# Function to display messages
function print_message() {
    echo -e "\033[1;32m$1\033[0m"
}

# Check for necessary commands
if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Please install Docker."
    exit 1
fi

# Ensure scripts/latex-env is executable
chmod +x scripts/latex-env

# Check for file or symbolic link and remove it
if [ -e /usr/local/bin/latex-env ] || [ -L /usr/local/bin/latex-env ]; then
    echo "Removing existing file or symbolic link: /usr/local/bin/latex-env"
    sudo rm -f /usr/local/bin/latex-env
fi

# Create a symbolic link for the CLI tool
print_message "Creating symbolic link for latex-env CLI..."
sudo ln -s "$(pwd)/scripts/latex-env" /usr/local/bin/latex-env

# Make all command scripts executable
chmod +x scripts/commands/*.sh

# Build the Docker image
print_message "Building the Docker image..."
docker-compose build

print_message "Setup completed! You can now use the 'latex-env' command."