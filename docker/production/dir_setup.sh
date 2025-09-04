#!/bin/bash

# Setup script for production Docker environment
# This script ensures proper permissions and sets up environment variables

set -e

# Get current user and group IDs
export UID=$(id -u)
export GID=$(id -g)

echo "Setting up Docker environment for user $(id -un) (UID: $UID, GID: $GID)"

# Create directories if they don't exist
mkdir -p ../../pg_data
mkdir -p ./certbot/conf
mkdir -p ./certbot/www
mkdir -p ../../media

# Set proper ownership for volumes
echo "Setting proper ownership for volumes..."
sudo chown -R $UID:$GID ../../pg_data
sudo chown -R $UID:$GID ./certbot
sudo chown -R $UID:$GID ../../media

# Set proper permissions
chmod -R 755 ../../pg_data
chmod -R 755 ./certbot
chmod -R 755 ../../media

echo "Setup complete. You can now run:"
echo "docker compose -f docker/production/docker-compose.yml up --build"
