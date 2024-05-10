#!/bin/bash
# Script to create a large size VM in GCE

# Define variables
PROJECT_ID="your-project-id"
ZONE="us-central1-a"
INSTANCE_NAME="large-vm"

# Create the VM instance
gcloud compute instances create $INSTANCE_NAME \
    --project=$PROJECT_ID \
    --zone=$ZONE \
    --machine-type=e2-standard-4 \
    --image-family=debian-10 \
    --image-project=debian-cloud \
    --subnet=default
