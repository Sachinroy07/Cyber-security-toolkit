#!/bin/bash

# Update system packages
sudo apt update && sudo apt upgrade -y

# Install necessary dependencies and tools
sudo apt install -y git wget curl unzip golang-go

# Install Subfinder
echo "Installing Subfinder..."
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

# Install Amass
echo "Installing Amass..."
sudo snap install amass

# Install Assetfinder
echo "Installing Assetfinder..."
go install github.com/tomnomnom/assetfinder@latest

# Install httprobe
echo "Installing httprobe..."
go install github.com/tomnomnom/httprobe@latest

# Install Nuclei
echo "Installing Nuclei..."
go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
nuclei -update-templates

# Install Subzy
echo "Installing Subzy..."
go install -v github.com/lukasikic/subzy@latest

# Install crt.sh script
echo "Installing crt.sh script..."
mkdir -p ~/Desktop/tools/crt.sh
cd ~/Desktop/tools/crt.sh
wget https://raw.githubusercontent.com/nahamsec/crt.sh/master/crt.sh
chmod +x crt.sh

# Add Go bin path to ~/.bashrc if not already present
echo 'export PATH=$PATH:$(go env GOPATH)/bin' >> ~/.bashrc
source ~/.bashrc

# Verify installations
echo "Verifying installations..."
subfinder -version
amass -version
assetfinder --help
httprobe --help
nuclei -version
subzy -version

echo "All tools installed successfully!"
