#!/bin/bash
# Script to create a small size VM in GCE

# Define variables
PROJECT_ID="your-project-id"
ZONE="us-central1-a"
INSTANCE_NAME="small-vm"

# Create the VM instance
gcloud compute instances create $INSTANCE_NAME \
    --project=$PROJECT_ID \
    --zone=$ZONE \
    --machine-type=e2-small \
    --image-family=debian-10 \
    --image-project=debian-cloud \
    --subnet=default
