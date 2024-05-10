#!/bin/bash
# Script to build a Docker image from a Dockerfile and run a container

# Define variables
IMAGE_NAME="my-custom-app"
CONTAINER_NAME="custom-app-instance"

# Build the Docker image
docker build -t $IMAGE_NAME .

# Run the container
docker run --name $CONTAINER_NAME -d -p 8080:80 $IMAGE_NAME

echo "Container $CONTAINER_NAME is running with custom image $IMAGE_NAME"
