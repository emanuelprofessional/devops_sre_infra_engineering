#!/bin/bash

# This script is for running a production or development Docker build based on the argument passed.
# Note: Ensure the 

MODE=${1:-prod}     # Default = production

# Stop and remove existing container if it exists
echo "Stopping any existing flask container..."
docker stop flask-app 2>/dev/null || true
docker rm flask-app 2>/dev/null || true

if [[ "$MODE" == "dev" ]]; then
    echo "Building development image..."
    docker build -t flask-app:dev .
    echo "Running development container from image..."
    docker run -d -p 8000:5000 -e FLASK_DEBUG=1 --name flask-app flask-app:dev python app.py
elif [[ "$MODE" == "prod" ]]; then
    echo "Building production image..."
    docker build -t flask-app:latest .
    echo "Running production container from image..."
    docker run -d -p 8000:5000 --name flask-app flask-app:latest
else
    echo "Invalid mode specified. Use 'dev' for development or 'prod' for production."
    exit 1
fi

# Show container status
echo ""
echo "Container status:"
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"