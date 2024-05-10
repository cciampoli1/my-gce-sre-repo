#!/bin/bash
# Script to check health of server by monitoring CPU, memory, and disk usage

# CPU usage check
CPU_THRESHOLD=75
cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
echo "CPU Usage: $cpu_usage%"
if (( $(echo "$cpu_usage > $CPU_THRESHOLD" | bc -l) )); then
    echo "Warning: CPU usage is above threshold."
fi

# Memory usage check
MEM_THRESHOLD=75
memory_usage=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
echo "Memory Usage: $memory_usage%"
if (( $(echo "$memory_usage > $MEM_THRESHOLD" | bc -l) )); then
    echo "Warning: Memory usage is above threshold."
fi

# Disk usage check
DISK_THRESHOLD=90
disk_usage=$(df / | awk '$1 == "/dev/sda1" {print $5}' | sed 's/%//g')
echo "Disk Usage: $disk_usage%"
if [ $disk_usage -gt $DISK_THRESHOLD ]; then
    echo "Warning: Disk usage is above threshold."
fi
