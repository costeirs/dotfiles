#!/usr/bin/env bash

# aliases
git config --global alias.ld 'log --pretty=format:"%C(yellow)%h\ %ad%Cred%d\ %Creset%s%Cblue\ [%cn]" --decorate --date=relative'
git config --global alias.st 'status -s'
git config --global alias.cleanup "!git branch --no-contains --merged | grep --invert-match 'master|develop|main' | xargs -n1 -r git branch -d"

# use main as initial branch name
git config --global init.defaultBranch main
