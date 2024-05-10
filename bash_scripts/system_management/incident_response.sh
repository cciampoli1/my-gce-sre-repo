#!/bin/bash
# Script to automatically respond to system incidents, e.g., service failure

SERVICE_NAME="apache2"

# Check if the service is running
if systemctl status $SERVICE_NAME | grep "active (running)" ; then
    echo "$SERVICE_NAME is running normally."
else
    echo "$SERVICE_NAME is not running. Attempting to restart."
    systemctl restart $SERVICE_NAME
    echo "$SERVICE_NAME has been restarted."
fi
