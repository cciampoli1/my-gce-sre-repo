#!/bin/bash

# Load environment variables from the appropriate .env file
ENV=${1:-dev}
source .env.$ENV

# Check if the instance exists and delete it if it does
if gcloud compute instances describe $VM_NAME --zone=$ZONE > /dev/null 2>&1; then
    echo "Instance $VM_NAME already exists. Deleting instance..."
    gcloud compute instances delete $VM_NAME --zone=$ZONE --quiet
fi

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
VM_COMMANDS=$(echo "
sudo usermod -aG docker \${USER};
sudo mkdir -p /home/site;
sudo chown \${USER} /home/site;
cd /home/site;
git clone $REPO_URL .;
docker pull nginx;
docker run -d --name nginx -p 80:80 -v /home/site:/usr/share/nginx/html:ro nginx;
")

# Execute commands on VM
gcloud compute ssh $VM_NAME --zone=$ZONE --command "$VM_COMMANDS"

echo "Deployment complete. Visit http://$(gcloud compute instances describe $VM_NAME --zone=$ZONE --format='get(networkInterfaces[0].accessConfigs[0].natIP)')"
