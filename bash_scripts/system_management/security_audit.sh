#!/bin/bash
# Script to perform a security audit of the system

# Check for no password entries
echo "Checking for users without a password:"
awk -F: '($2 == "") {print $1}' /etc/shadow

# List world-writable files
echo "Listing world-writable files:"
find / -xdev -type f -perm -0002 -print

# Check for rootkits
echo "Rootkit check running:"
rkhunter --check

echo "Security audit completed."
