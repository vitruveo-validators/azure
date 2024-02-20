#!/bin/bash

# Updating and upgrading the system
echo "Updating and upgrading the system..."
sudo apt-get update
sudo apt-get upgrade -y

# Download and install Go
echo "Downloading and installing Go..."
wget https://go.dev/dl/go1.19.3.linux-amd64.tar.gz
sudo tar -xvzf go1.19.3.linux-amd64.tar.gz -C /usr/local/

# Adding Go to PATH in .profile
echo "Configuring environment variables for Go..."
echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.profile

# Installing gcc and make
echo "Installing gcc and make..."
sudo apt-get install gcc -y
sudo apt-get install make -y

# Checking for Git and installing if necessary
echo "Checking and installing Git..."
if ! command -v git &> /dev/null
then
    sudo apt-get install git -y
fi

# Cloning the validator protocol repository
echo "Cloning the Vitruveo protocol repository..."
git clone https://github.com/Vitruveo/vitruveo-protocol.git

echo "Please type 'exit' and log back into the server to refresh the environment variables..."
echo "After logging back in, type './step2.sh' to continue with installation"

