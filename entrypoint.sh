#!/bin/sh

if [ ! -n "$PUBLIC_PATH" ]; then
  PUBLIC_PATH=public
fi
if [ ! -n "$GITHUB_TOKEN" ]; then
  echo "You need to supply GITHUB_TOKEN"
  exit 1
fi
gh-pages -d $PUBLIC_PATH -b gh-pages -u "github-actions-bot <support+actions@github.com>"
retval=$?
if [ $retval -ne 0 ]; then
  echo "gh-pages failed: $retval"
  exit 2
fi
