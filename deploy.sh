#!/bin/bash

# Exit on error
set -e

IMAGE_NAME="devops-build"
CONTAINER_NAME="devops-container"

echo "🚀 Starting deployment..."

# Stop and remove existing container if it exists
if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    echo "🧹 Removing existing container..."
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
fi

# Run the new container
echo "🚢 Running new container..."
docker run -d \
    --name $CONTAINER_NAME \
    -p 80:80 \
    $IMAGE_NAME

echo "✅ Deployment complete. Access the app at http://localhost"
