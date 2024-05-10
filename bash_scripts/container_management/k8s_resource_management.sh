#!/bin/bash
# Script to manage Kubernetes resource limits and autoscaling

NAMESPACE="default"

# Set resource limits for a namespace
kubectl create limitrange my-limit-range --namespace=$NAMESPACE --limits=cpu=500m,memory=512Mi --type=Container

# Enable Horizontal Pod Autoscaler for a deployment
kubectl autoscale deployment my-deployment --cpu-percent=50 --min=1 --max=10 --namespace=$NAMESPACE

echo "Resource management configurations applied in Kubernetes."
