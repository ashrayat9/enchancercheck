#!/bin/sh

# Array of packages to install
packages="iptables curl wget nano"  # Add or remove packages as needed

# Function to install packages using apk
install_with_apk() {
    echo "Installing packages using apk..."
    apk update
    for package in $packages; do
        echo "Installing $package..."
        apk add "$package"
    done
}

# Function to install packages using apt-get
install_with_apt() {
    echo "Installing packages using apt-get..."
    apt-get update
    for package in $packages; do
        echo "Installing $package..."
        apt-get install -y "$package"
    done
}

# Check if apk is available
if command -v apk >/dev/null 2>&1; then
    install_with_apk
# If apk is not available, check if apt-get is available
elif command -v apt-get >/dev/null 2>&1; then
    install_with_apt
else
    echo "Error: Neither apk nor apt-get package manager found."
    exit 1
fi

echo "All packages installation completed."

echo "Setting up iptables..."
iptables -t nat -N pse
iptables -t nat -A OUTPUT -j pse

# Get the IP address of pse-proxy
PSE_IP=$(getent hosts pse-proxy | awk '{ print $1 }')

iptables -t nat -A pse -p tcp -m tcp --dport 443 -j DNAT --to-destination $PSE_IP:12345
echo "Iptables setup completed."