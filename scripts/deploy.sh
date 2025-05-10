#!/usr/bin/env bash
set -e

if [ -z "$1" ]; then
  echo "Usage: $0 <COMMIT>"
  exit 1
fi

COMMIT="$1"
echo "Deploying nodeapp:$COMMIT"

# stop old
docker rm -f nodeapp || true

# run the new image
docker run -d --name nodeapp -p 3000:3000 nodeapp:"$COMMIT"

