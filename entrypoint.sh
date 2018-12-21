#!/bin/sh

if [ ! -n "$PUBLIC_PATH" ]; then
  PUBLIC_PATH=public
fi
if [ ! -n "$GITHUB_TOKEN" ]; then
  echo "You need to supply GITHUB_TOKEN"
fi
if [ ! -n "$GIT_USERNAME" ]; then
  echo "You need to supply GIT_USERNAME"
fi
if [ ! -n "$GIT_EMAIL" ]; then
  echo "You need to supply GIT_EMAIL"
fi

git config --global user.email $GIT_EMAIL
git config --global user.name $GIT_USERNAME

gh-pages -d $PUBLIC_PATH -b gh-pages