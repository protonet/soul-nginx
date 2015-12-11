#!/usr/bin/env bash

set -e

docker info
docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASS

HUB_REPOSITORY="experimentalplatform/soul-nginx"
IMAGE_NAME=$HUB_REPOSITORY:$TRAVIS_BRANCH

# Build the image
docker build --pull -t $IMAGE_NAME .
# Push the image
docker push $IMAGE_NAME