#!/bin/bash

# ThinLinc Installation Script

echo "Installing necessary dependencies..."
sudo apt install -y wget lsb-release gnupg

# Update package list and install necessary dependencies
echo "Obtaining package..."
wget https://www.cendio.com/downloads/server/tl-4.18.0-server.zip

# Extracting archive
unzip tl-4.18.0-server.zip

# Running installer...
cd tl-4.18.0-server
sudo ./install-server


# Start ThinLinc server
echo "Starting ThinLinc server..."
sudo systemctl start tlwebaccess
sudo systemctl enable tlwebaccess
sudo systemctl restart tlwebaccess

# Delete downloaded files...
sudo rm -rf tl-4.18.0-server
rm tl-4.18.0-server.zip

# Provide installation details
echo ""
echo ""
echo ""
echo ""
echo "ThinLinc server installation completed!"
echo "You can access the ThinLinc web admin interface at: http://localhost:300"
