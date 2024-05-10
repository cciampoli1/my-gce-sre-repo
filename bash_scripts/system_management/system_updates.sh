#!/bin/bash
# Script to perform system updates and apply patches

# Update package list and upgrade all packages
sudo apt-get update && sudo apt-get upgrade -y

# Optional: Remove unnecessary packages
sudo apt-get autoremove -y

echo "System updates and patches applied successfully."
