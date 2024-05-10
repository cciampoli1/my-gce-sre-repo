#!/bin/bash
# Script to monitor disk space and alert if above threshold

THRESHOLD=90
CURRENT_USAGE=$(df / | grep / | awk '{print $5}' | cut -d'%' -f1)

if [ "$CURRENT_USAGE" -gt "$THRESHOLD" ]; then
  echo "Disk usage is critical: ${CURRENT_USAGE}% on /"
fi
