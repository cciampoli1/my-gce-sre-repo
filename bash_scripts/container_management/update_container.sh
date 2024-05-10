#!/bin/bash
# Script to update a Docker container with a new image

# Define variables
CONTAINER_NAME="my-existing-container"
IMAGE_NAME="my-existing-image"

# Stop the current container
docker stop $CONTAINER_NAME

# Remove the current container (optional)
docker rm $CONTAINER_NAME

# Pull the latest version of the image
docker pull $IMAGE_NAME:latest

# Run the container with the new image
docker run --name $CONTAINER_NAME -d -p 8080:80 $IMAGE_NAME:latest

echo "Updated container $CONTAINER_NAME to the latest image $IMAGE_NAME"
