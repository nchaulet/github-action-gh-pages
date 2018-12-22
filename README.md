# nchaulet/github-action-gh-pages

## Description

simple github action to deploy on github pages

## Configuration

You need to provide the following varaibles:
`GITHUB_TOKEN`: github token
`PUBLIC_PATH`: the directory you want to publish (optionnal)

## Example Workflow

```
workflow "Build and deploy" {
  on = "push"
  resolves = ["nchaulet/github-action-gh-pages@master"]
}

action "GitHub Action for npm" {
  uses = "actions/npm@e7aaefe"
  args = "install"
}

action "Deploy" {
  uses = "actions/npm@e7aaefe"
  needs = ["GitHub Action for npm"]
  args = "run build"
}

action "nchaulet/github-action-gh-pages@master" {
  uses = "nchaulet/github-action-gh-pages@master"
  needs = ["Deploy"]
  secrets = [
    "GITHUB_TOKEN"
  ]
}
```