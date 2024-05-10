#!/bin/bash
# Script to set up network configurations

# Example: Setting up IP tables
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -P INPUT DROP

echo "Network configurations have been set."
