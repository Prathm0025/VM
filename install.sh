#!/bin/bash

# Update system packages
echo "Updating system packages..."
sudo apt-get update -y

# Install Mozilla Firefox (already included in most Ubuntu systems)
echo "Installing Mozilla Firefox..."
sudo apt-get install -y firefox

# Install Brave Browser
echo "Installing Brave Browser..."
sudo apt install -y curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update -y
sudo apt install -y brave-browser

# Install Google Chrome
echo "Installing Google Chrome..."
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb

# Install Microsoft Edge
echo "Installing Microsoft Edge..."
wget -q -O - https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge.list'
sudo apt-get update -y
sudo apt-get install -y microsoft-edge-stable

# Install Midori Web Browser
echo "Installing Midori Browser..."
sudo apt update -y
sudo apt install snapd
sudo snap install midori 

# Install Falkon Web Browser
echo "Installing Falkon Browser..."
sudo apt install -y falkon

# Install Chromium Browser
echo "Installing Chromium Browser..."
sudo apt install -y chromium-browser

# Install Arora Web Browser
echo "Installing Arora Browser..."
sudo apt install -y arora

# Confirm installation of browsers
echo "Installation complete. Verifying installed browsers..."

# Verify Mozilla Firefox installation
if command -v firefox &>/dev/null; then
    echo "Mozilla Firefox installed successfully."
else
    echo "Mozilla Firefox installation failed."
fi

# Verify Google Chrome installation
if command -v google-chrome &>/dev/null; then
    echo "Google Chrome installed successfully."
else
    echo "Google Chrome installation failed."
fi

# Verify Brave Browser installation
if command -v brave-browser &>/dev/null; then
    echo "Brave Browser installed successfully."
else
    echo "Brave Browser installation failed."
fi

# Verify Microsoft Edge installation
if command -v microsoft-edge &>/dev/null; then
    echo "Microsoft Edge installed successfully."
else
    echo "Microsoft Edge installation failed."
fi


# Verify Midori Browser installation
if command -v midori &>/dev/null; then
    echo "Midori Browser installed successfully."
else
    echo "Midori Browser installation failed."
fi

# Verify Falkon Browser installation
if command -v falkon &>/dev/null; then
    echo "Falkon Browser installed successfully."
else
    echo "Falkon Browser installation failed."
fi

# Verify Chromium Browser installation
if command -v chromium-browser &>/dev/null; then
    echo "Chromium Browser installed successfully."
else
    echo "Chromium Browser installation failed."
fi

# Verify Arora Browser installation
if command -v arora &>/dev/null; then
    echo "Arora Browser installed successfully."
else
    echo "Arora Browser installation failed."
fi

echo "Browser installation process complete."
