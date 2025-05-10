#!/usr/bin/env bash
set -e
COMMIT=$(git rev-parse --short HEAD)
echo "Building commit $COMMIT in $(pwd)"

# Build and tag “latest”
docker build -t nodeapp:latest .

# Build and tag with the current commit hash
docker build -t nodeapp:$COMMIT .