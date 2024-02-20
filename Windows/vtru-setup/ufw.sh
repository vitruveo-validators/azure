#!/bin/bash

# Allowing standard SSH, Ethereum node communication, and web server ports
echo "Allowing necessary ports..."
sudo ufw allow 22/tcp
sudo ufw allow 30303/tcp
sudo ufw allow 8545/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp

# Allowing specific IP addresses and protocols
echo "Configuring rules for specific IP addresses..."
sudo ufw allow from 52.9.172.122/32 to any port 8545 proto tcp
sudo ufw allow from 0.0.0.0 to any port 30303 proto tcp

# Enabling UFW
echo "Enabling UFW..."
sudo ufw --force enable

# Displaying the status of UFW
echo "UFW configuration completed. Current status:"
sudo ufw status verbose

# Instruction to continue with step1.sh
echo "Firewall setup is complete. Please continue by running './step1.sh'"
