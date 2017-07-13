#!/usr/bin/env bash

set -e

docker info
docker login -u "$QUAY_USER" -p "$QUAY_PASS" quay.io

HUB_REPOSITORY="quay.io/protonetinc/soul-nginx"
IMAGE_NAME="$HUB_REPOSITORY:${TRAVIS_BRANCH////-}"

# Build the image
docker build --pull -t "$IMAGE_NAME" .

# Verify the config is ok
docker run -i -t --rm \
  --add-host soul-socketio:127.0.0.1 \
  --add-host soul-web:127.0.0.1 \
  --add-host soul-webdav:127.0.0.1 \
  "$IMAGE_NAME" nginx -t


if [ "${TRAVIS_PULL_REQUEST}" != "false" ]; then
  echo -e "\n\nWe're not uploading images from pull requests."
else
  # Push the image
  docker push "$IMAGE_NAME"
fi