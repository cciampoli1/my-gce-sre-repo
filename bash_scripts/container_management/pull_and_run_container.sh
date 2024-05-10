#!/bin/bash
# Script to pull an image and run a Docker container

# Define variables
IMAGE_NAME="nginx" # Example using nginx, but you can replace it with your desired image
CONTAINER_NAME="my-nginx"

# Pull the latest version of the image
docker pull $IMAGE_NAME:latest

# Run the container
docker run --name $CONTAINER_NAME -d -p 80:80 $IMAGE_NAME:latest

echo "Container $CONTAINER_NAME is running with image $IMAGE_NAME"
