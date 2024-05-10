#!/bin/bash
# Script to rotate logs and monitor disk space used by logs

LOG_DIR="/var/log/myapp"
ARCHIVE_DIR="/var/log/archive"

# Rotate logs
find $LOG_DIR -name "*.log" -mtime +7 -exec mv {} $ARCHIVE_DIR \;

# Compress old logs
find $ARCHIVE_DIR -name "*.log" -exec gzip {} \;

echo "Logs rotated and compressed."
