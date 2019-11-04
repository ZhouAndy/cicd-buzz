
#!/bin/sh
docker login -u $DOCKER_USER -p $DOCKER_PASS
TRAVIS_REPO_SLUG_TOLOWER = $(echo "$TRAVIS_REPO_SLUG" | tr '[:upper:]' '[:lower:]')
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
docker build -f Dockerfile -t $TRAVIS_REPO_SLUG_TOLOWER:$TAG .
docker push $TRAVIS_REPO_SLUG_TOLOWER:$TAG
