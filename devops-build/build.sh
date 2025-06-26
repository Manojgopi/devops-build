#!/bin/bash

# Exit on any error
set -e

# Define image name
IMAGE_NAME="devops-build"
TAG="latest"

# Build Docker image
echo "🔨 Building Docker image..."
docker build -t $IMAGE_NAME:$TAG .

# List Docker images
echo "📦 Docker image built successfully!"
docker images | grep $IMAGE_NAME
