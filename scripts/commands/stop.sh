#!/bin/bash

# Stop and remove Docker containers
echo "Stopping and removing Docker containers..."
docker-compose down
echo "Environment stopped successfully."