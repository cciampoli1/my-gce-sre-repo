#!/bin/bash

# Variables
GCP_PROJECT="app-1-423216"
VM_NAME="App_1"
ZONE="us-central1-a"  # e.g., us-central1-a
MACHINE_TYPE="e2-micro"  # Adjust as needed
REPO_URL="https://github.com/cciampoli1"
STATIC_SITE_CONTAINER="nginx"  # Using nginx to serve the static site

# Create VM instance
gcloud compute instances create $VM_NAME \
    --project=$GCP_PROJECT \
    --zone=$ZONE \
    --machine-type=$MACHINE_TYPE \
    --image-family=cos-stable \
    --image-project=cos-cloud \
    --tags=http-server,https-server

# Wait for the instance to start
echo "Waiting for VM to start..."
sleep 60  # Increase if necessary

# Commands to run on VM
VM_COMMANDS="
sudo usermod -aG docker ${USER}
docker pull rethinkdb
docker run -d --name rethinkdb -p 28015:28015 rethinkdb
docker pull $STATIC_SITE_CONTAINER
mkdir -p /site
cd /site
git clone $REPO_URL .
docker run -d --name website -v /site:/usr/share/nginx/html:ro -p 80:80 $STATIC_SITE_CONTAINER
"

# Execute commands on VM
gcloud compute ssh $VM_NAME --zone=$ZONE --command "$VM_COMMANDS"

# Output the external IP
echo "Deployment complete. Visit http://$(gcloud compute instances describe $VM_NAME --zone=$ZONE --format='get(networkInterfaces[0].accessConfigs[0].natIP)')"
