#!/bin/bash
# Script to monitor system performance and log key metrics

# Log CPU usage
echo "CPU Usage:" >> /var/log/performance.log
mpstat >> /var/log/performance.log

# Log Memory usage
echo "Memory Usage:" >> /var/log/performance.log
free -m >> /var/log/performance.log

# Log Disk usage
echo "Disk Usage:" >> /var/log/performance.log
df -h >> /var/log/performance.log

echo "Performance metrics logged."
