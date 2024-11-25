#!/bin/bash

# Restart the Docker environment
echo "Restarting the Docker environment..."
docker-compose down
docker-compose up -d
echo "Docker environment has been restarted."