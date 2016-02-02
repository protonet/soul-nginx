#!/usr/bin/env bash

set -e

docker info
docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASS

HUB_REPOSITORY="experimentalplatform/soul-nginx"
IMAGE_NAME=$HUB_REPOSITORY:$TRAVIS_BRANCH

# Build the image
docker build --pull -t $IMAGE_NAME .

# Verify the config is ok
docker run -i -t --rm \
  --add-host soul-socketio:127.0.0.1 \
  --add-host soul-web:127.0.0.1 \
  --add-host soul-webdav:127.0.0.1 \
  $IMAGE_NAME nginx -t

# Push the image
docker push $IMAGE_NAME