#!/bin/bash
# Script to manage user accounts

# Create a new user
adduser --disabled-password --gecos "" newuser

# Optional: Add user to sudo group
usermod -aG sudo newuser

echo "User account has been created and configured."
