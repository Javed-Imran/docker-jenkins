#!/usr/bin/env bash
set -e

if [ -z "$1" ]; then
  echo "Usage: $0 <COMMIT>"
  exit 1
fi

COMMIT="$1"
echo "Building commit $COMMIT inside $(pwd)"

# build latest
docker build -t nodeapp:latest .

# build commit-specific
docker build -t nodeapp:"$COMMIT" .

