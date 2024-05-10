#!/bin/bash
# Script to create snapshots of all disks in a GCP project

PROJECT_ID="your-project-id"
gcloud auth activate-service-account --key-file=/path/to/your/key-file.json

# List all disks and create snapshots
for DISK in $(gcloud compute disks list --project $PROJECT_ID --format="value(name,zone)")
do
  IFS=',' read -r -a array <<< "$DISK"
  DISK_NAME=${array[0]}
  ZONE=${array[1]}
  SNAPSHOT_NAME="${DISK_NAME}-$(date +%Y%m%d)"
  gcloud compute disks snapshot $DISK_NAME --snapshot-names $SNAPSHOT_NAME --zone $ZONE --project $PROJECT_ID
  echo "Snapshot $SNAPSHOT_NAME created for disk $DISK_NAME in zone $ZONE"
done
