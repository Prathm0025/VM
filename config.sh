#!/bin/bash

# Update the package list
sudo apt-get update

# Install XFCE desktop environment and LightDM
sudo apt-get install -y xfce4 xfce4-goodies lightdm lightdm-gtk-greeter

# Set up LightDM for automatic login
sudo mkdir -p /etc/lightdm/lightdm.conf.d
echo "[Seat:*]
autologin-user=vagrant
autologin-user-timeout=0
user-session=xfce
greeter-session=lightdm-gtk-greeter" | sudo tee /etc/lightdm/lightdm.conf.d/50-myconfig.conf > /dev/null

# Ensure the vagrant user has an XFCE session
echo "startxfce4" | sudo tee /home/vagrant/.xsession > /dev/null
sudo chown vagrant:vagrant /home/vagrant/.xsession
sudo chmod +x /home/vagrant/.xsession

# Set the password for the vagrant user
echo "vagrant:vagrant" | sudo chpasswd

# Configure SSH to allow password authentication
sudo sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo systemctl restart sshd
