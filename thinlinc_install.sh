#!/bin/bash

# ThinLinc Installation Script

# Update package list and install necessary dependencies
echo "Updating package list..."
sudo apt update -y

echo "Installing necessary dependencies..."
sudo apt install -y wget lsb-release gnupg

# Add ThinLinc repository
echo "Adding ThinLinc repository..."
wget -qO - https://www.cendio.com/thinlinc/apt/cendio.gpg.key | sudo apt-key add -
echo "deb https://www.cendio.com/thinlinc/apt/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/thinlinc.list

# Update package list again to include ThinLinc repository
echo "Updating package list to include ThinLinc repository..."
sudo apt update -y

# Install ThinLinc server
echo "Installing ThinLinc server..."
sudo apt install -y thinlinc-server

# Start ThinLinc server
echo "Starting ThinLinc server..."
sudo systemctl start tl-web
sudo systemctl enable tl-web

# Provide installation details
echo ""
echo ""
echo ""
echo ""
echo "ThinLinc server installation completed!"
echo "You can access the ThinLinc web admin interface at: http://localhost:300"
