#!/bin/bash

# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root. Use sudo to execute it."
  exit 1
fi

# Variables
ADMIN_USER="admin_user"  # Replace with the admin username
STANDARD_USER="standard_user"  # Replace with the standard username

# Check if the admin and standard users exist
if ! id "$ADMIN_USER" &>/dev/null; then
  echo "Admin user '$ADMIN_USER' does not exist. Please create it first."
  exit 1
fi

if ! id "$STANDARD_USER" &>/dev/null; then
  echo "Standard user '$STANDARD_USER' does not exist. Please create it first."
  exit 1
fi

# Backup the sudoers file
cp /etc/sudoers /etc/sudoers.backup

# Add a custom sudoers rule for the standard user
echo "$STANDARD_USER ALL=(ALL) NOPASSWD: /usr/sbin/installer, /usr/bin/hdiutil, /bin/cp, /bin/mv" | sudo tee /etc/sudoers.d/allow_installer

# Verify the sudoers file
if visudo -cf /etc/sudoers.d/allow_installer; then
  echo "Sudoers file updated successfully. The standard user can now install applications."
else
  echo "There was an error updating the sudoers file. Reverting changes."
  mv /etc/sudoers.backup /etc/sudoers
  rm -f /etc/sudoers.d/allow_installer
  exit 1
fi

echo "Script completed successfully."
exit 0
