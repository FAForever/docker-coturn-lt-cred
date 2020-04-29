#!/bin/bash
set -e
export REPO=faforever/coturn-lt-cred

docker build -t coturn-lt-cred .

if [ -n "${TRAVIS_TAG}" ]; then
      docker login -u="${DOCKER_USERNAME}" -p "${DOCKER_TOKEN}";
      docker tag coturn-lt-cred "${REPO}:${TRAVIS_TAG}";
      docker push "${REPO}";
else
    echo "No tag detected, skipping docker push"
fi
