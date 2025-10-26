#!/bin/bash

# Exit on any error
set -e

# Define variables
NAME="$1"
TARGET_DIR="/home/kaspars/docker/$NAME"
PROJECT_JAR="/mnt/c/work/learn/$NAME/target/$NAME-1-SNAPSHOT.jar"
DOCKERFILE="/mnt/c/work/learn/$NAME/Dockerfile"
IMAGE_NAME="$NAME"
CONTAINER_NAME="$NAME-container"

echo "Step 1: Creating target directory..."
mkdir -p "$TARGET_DIR"

echo "Step 2: Copying JAR file and Dockerfile..."
cp "$PROJECT_JAR" "$TARGET_DIR/app.jar"
cp "$DOCKERFILE" "$TARGET_DIR/Dockerfile"

echo "Step 3: Building Docker image..."
cd "$TARGET_DIR"
docker build -t "$IMAGE_NAME" .

echo "Step 4: Starting Docker container..."
# Stop and remove existing container if it exists
docker stop "$CONTAINER_NAME" 2>/dev/null || true
docker rm "$CONTAINER_NAME" 2>/dev/null || true

# Run the container
docker run -d \
  --name "$CONTAINER_NAME" \
  -p 8001:8001 \
  -p 5001:5001 \
  "$IMAGE_NAME"

echo "Docker container started successfully!"