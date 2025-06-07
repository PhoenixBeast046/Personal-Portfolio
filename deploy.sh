#!/bin/bash

echo "Stopping existing container (if running)..."
docker stop portfolio-container || true

echo "Removing existing container (if exists)..."
docker rm portfolio-container || true

echo "Building new Docker image..."
docker build -t portfolio-site .

echo "Running new container on port 8081..."
docker run -d -p 8081:80 --name portfolio-container portfolio-site

echo "Deployment completed!"
