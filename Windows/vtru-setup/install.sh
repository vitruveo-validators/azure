#!/bin/bash

# Start by setting up the firewall rules
echo "Configuring UFW rules..."
sudo ufw allow 30303/tcp
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow from 52.9.172.122 to any port 8545 proto tcp
sudo ufw allow 443/tcp
echo "Enabling UFW..."
sudo ufw --force enable
echo "UFW configuration completed. Current status:"
sudo ufw status verbose

# Function to wait for apt system to be free
waitForApt() {
  while sudo fuser /var/lib/dpkg/lock >/dev/null 2>&1 || sudo fuser /var/lib/apt/lists/lock >/dev/null 2>&1 || sudo fuser /var/cache/apt/archives/lock >/dev/null 2>&1; do
    echo "Waiting for other software managers to finish..."
    sleep 5
  done
}

# Updating and upgrading the system
echo "Updating and upgrading the system..."
waitForApt
sudo apt-get update
waitForApt
sudo apt-get upgrade -y

# Download and install Go
echo "Downloading and installing Go..."
wget https://go.dev/dl/go1.19.3.linux-amd64.tar.gz
sudo tar -xvzf go1.19.3.linux-amd64.tar.gz -C /usr/local/
rm go1.19.3.linux-amd64.tar.gz

# Adding Go to PATH in .profile for all future sessions
echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.profile
# Temporarily updating PATH for the current session
export PATH=$PATH:/usr/local/go/bin

# Verify Go installation
go version

# Installing gcc, make, and expect
echo "Installing gcc, make, and expect..."
waitForApt
sudo apt-get install gcc make expect -y

# Checking for Git and installing if necessary
echo "Checking and installing Git..."
waitForApt
if ! command -v git &> /dev/null; then
    sudo apt-get install git -y
fi

# Cloning the validator protocol repository
echo "Cloning the Vitruveo protocol repository..."
git clone https://github.com/Vitruveo/vitruveo-protocol.git

# Navigate to the vitruveo-protocol directory and compile Geth
echo "Navigating to vitruveo-protocol directory and compiling Geth..."
cd vitruveo-protocol/
make geth
cd ..

# Prompt for user input for the folder name and password
echo "Please enter the folder name and password for the new account."
read -p "Enter a simple and short folder name, no special symbols or spaces: " folder_name
read -sp "Create a Password (input will be hidden): " password
echo

# Create the directory as per user input and navigate into it
mkdir "$folder_name"
cd "$folder_name"

# Use 'expect' to automate the account creation process and log output
expect_log="expect_output.log"
expect <<EOF
set timeout -1
log_file -a "$expect_log"
spawn ../vitruveo-protocol/build/bin/geth --datadir "./data" account new
expect "Password:"
send -- "$password\r"
expect "Repeat password:"
send -- "$password\r"
expect eof
EOF

# Extracting public address and path from the log file
public_address=$(grep "Public address of the key:" "$expect_log" | awk '{print $NF}')
secret_key_path=$(grep "Path of the secret key file:" "$expect_log" | awk '{print $NF}')

# Check if the public address and secret key path were extracted successfully
if [[ -n "$public_address" && -n "$secret_key_path" ]]; then
    # Display the extracted information
    echo "Public address of the key: $public_address"
    echo "Path of the secret key file: $secret_key_path"

    # Save the information to info.txt
    echo -e "Public address of the key: $public_address\nPath of the secret key file: $secret_key_path" > info.txt

    echo "The information has been saved to 'info.txt'."
else
    echo "Failed to extract the account details. Please check the '$expect_log' file."
fi

# Save the password to password.txt
echo "$password" > password.txt
echo "The password has been saved to 'password.txt'."

# Optionally, clean up the log file
rm "$expect_log"

# Instructions for user action
echo "Please ensure you have copied and saved your public address and key file path securely."
echo "Continue by reviewing the information you've saved and follow any further instructions provided."

# Final message and prompt for user confirmation
echo "Have you secured your public address and the path to the secret key file? [yes/no]"
read confirmation
if [[ $confirmation == "yes" ]]; then
    echo "Great! Proceed with the next steps of your setup."
else
    echo "Please secure your information before proceeding."
fi

# Create the vitruveo.json file with the given configuration
cat > vitruveo.json <<EOF
{
  "config": {
    "chainId": 1490,
    "homesteadBlock": 0,
    "eip150Block": 0,
    "eip150Hash": "0x0000000000000000000000000000000000000000000000000000000000000000",
    "eip155Block": 0,
    "eip158Block": 0,
    "byzantiumBlock": 0,
    "constantinopleBlock": 0,
    "petersburgBlock": 0,
    "istanbulBlock": 0,
    "clique": {
      "period": 5,
      "epoch": 30000
    }
  },
  "epoch": 0,
  "epochTx": 0,
  "rbx": 100000000,
  "rbxEpoch": 0,
  "supply": 50000000000,
  "nonce": "0x0",
  "timestamp": "0x6459d592",
  "extraData": "0x000000000000000000000000000000000000000000000000000000000000000027313d509fD5fcb45c2300c76914622BB0f4fB838Fd6146E3d6450d9C523a18A99BC33D502cf824f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
  "gasLimit": "0x47b760",
  "difficulty": "0x1",
  "mixHash": "0x0000000000000000000000000000000000000000000000000000000000000000",
  "coinbase": "0x0000000000000000000000000000000000000000",
  "alloc": {
    "ac51c04cb72a5d0f56d71baf3e2f2b28e6426922": {
      "balance":   "24000000000000000000000000"
    },
    "2b3c3fb089301488c96bbc6f55f167fd1b128e9f": {
      "balance":  "14500000000000000000000000"
    },             
    "e7d99d95e0b556b4a618625d9a77f4c2fdb2565e": {
      "balance":   "2500000000000000000000000"
    },            
    "f8fb6f607620d24417fee7b5d829459295aec4f3": {
      "balance":   "7500000000000000000000000"
    },            
    "34bf93b01ff99b89516add329f8454485460ad0d": {
      "balance":   "1000000000000000000000000"
    },            
    "8cc8329b64bea229fd56ee2a123a2b0ddf5d0e0a": {
      "balance":   "1000000000000000000000000"
    },            
    "5dfeb333338ee771e38d8ca5561d606167951c39": {
      "balance":   "5000000000000000000000000"
    },            
    "fd612e96d7330648a3202c114611a071e3b3d51e": {
      "balance":   "4500000000000000000000000"
    }              

  },
  "number": "0x0",
  "gasUsed": "0x0",
  "parentHash": "0x0000000000000000000000000000000000000000000000000000000000000000",
  "baseFeePerGas": null
}
EOF

echo "vitruveo.json file has been created with the provided configuration."

# Initialize the data directory with the vitruveo.json file
../vitruveo-protocol/build/bin/geth --datadir ./data/ init vitruveo.json

echo "The data directory has been initialized with vitruveo.json."

# Assuming public address is saved in info.txt, extract it
public_address=$(grep "Public address of the key:" info.txt | awk '{print $NF}' | tr -d '\r')

nohup ../vitruveo-protocol/build/bin/geth --networkid 1490 --datadir ./data/ --port 30303 --ipcdisable --syncmode full --allow-insecure-unlock --unlock $public_address --password ./password.txt --mine --http.api personal,admin,db,eth,net,web3,miner,shh,txpool,debug,clique --gcmode=archive --bootnodes enode://8a82fd5e140b75207d814ca4a7570dfd99aa53942730f36547c4d79dd603dc67e7aef118b86a4206e253f18cd8a82927cfe0796f24c179bd9bac2c321492df18@52.9.172.122:30303 --miner.gasprice 4000000000 --http --http.port 8545 --http.addr 127.0.0.1 --miner.etherbase $public_address &

echo "Validator Node has been started. Hit control+c to return to a prompt, then type 'tail -f ./$folder_name/nohup.out' to check the service logs."

