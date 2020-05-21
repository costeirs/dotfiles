#!/usr/bin/env bash

sudo -v # Ask for the administrator password upfront
# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

set +e
set -x

softwareupdate --install --all

xcode-select --install
git config --global user.name "Stephen Costeira"
git config --global user.email "costeirs@users.noreply.github.com"

# Homebrew,
# Install if we don't have it
if test ! "$(which brew)"; then
  echo "Installing homebrew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew bundle --verbose install
brew cleanup

# Additional Preferences
cp -n Preferences/* ~/Library/Preferences/
cp -n .bash_profile ~/

# Run all recipes
for script in ./apps/*.sh; do
  bash $script
done
