#!/bin/bash
# Script to backup data to Google Cloud Storage

# Define variables
BUCKET_NAME="your-bucket-name"
BACKUP_SOURCE="/var/myapp/data"
BACKUP_DEST="gs://$BUCKET_NAME/$(date +%Y%m%d)/"

# Perform backup using gsutil
gsutil -m cp -r $BACKUP_SOURCE $BACKUP_DEST

echo "Data backup completed successfully to $BACKUP_DEST."
