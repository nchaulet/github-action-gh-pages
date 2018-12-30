#!/bin/sh

if [ ! -n "$PUBLIC_PATH" ]; then
  PUBLIC_PATH=public
fi
if [ ! -n "$GITHUB_TOKEN" ]; then
  echo "You need to supply GITHUB_TOKEN"
fi

gh-pages -d $PUBLIC_PATH -b gh-pages -u "github-actions-bot <support+actions@github.com>"

curl --request POST -H "Authorization: token ${GITHUB_TOKEN}" \
  --url "https://api.github.com/repos/$GITHUB_REPOSITORY/pages/builds" \
  --header 'accept:   application/vnd.github.mister-fantastic-preview+json'
