#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: ./builder.sh <github_repo> <dockerhub_repo>"
    exit 1
fi

GITHUB_REPO=$1
DOCKERHUB_REPO=$2

echo "Cloning https://github.com/$GITHUB_REPO.git..."
git clone "https://github.com/$GITHUB_REPO.git" temp_repo

cd temp_repo || exit

echo "Building docker image $DOCKERHUB_REPO..."
docker build -t "$DOCKERHUB_REPO" .

echo "Pushing to Docker Hub..."
docker push "$DOCKERHUB_REPO"

cd ..
rm -rf temp_repo

echo "Done!"
