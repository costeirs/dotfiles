#!/usr/bin/env bash


sudo -v # Ask for the administrator password upfront
# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

set +e
set -x

xcode-select --install
git config --global user.name "Stephen Costeira"
git config --global user.email "costeirs@users.noreply.github.com"

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update

# Utilities
apps=(
    awscli
    composer
    mas
    node
)

brew tap caskroom/cask
brew tap homebrew/cask-versions
brew tap homebrew/cask-drivers

# Apps (Casks)
apps=(
  angry-ip-scanner
  bettertouchtool
  diffmerge
  docker
  firefox
  flux
  google-chrome
  iterm2
  jetbrains-toolbox
  licecap
  mysqlworkbench
  paw
  qlcolorcode
  qlmarkdown
  qlstephen
  quicklook-csv
  quicklook-json
  sequel-pro-nightly
  sketch
  sonos
  sourcetree
  suspicious-package
  texstudio
  vagrant
  virtualbox
  visual-studio-code
  vlc
)

brew cask install --appdir="/Applications" ${apps[@]}

# Apps (Drivers)
# apps=(
# )
# brew cask install ${apps[@]}

# Apps (AppStore)
apps=(
    497799835 # Xcode (10.2.1)
    425424353 # The Unarchiver (4.1.0)
    406825478 # Telephone (1.4)
    466314666 # Dont Sleep (1.1)
    462058435 # Microsoft Excel (16.25)
    462054704 # Microsoft Word (16.25)
    462062816 # Microsoft PowerPoint (16.25)
    784801555 # Microsoft OneNote (16.25)
    1295203466 # Microsoft Remote Desktop (10.2.13)
    1385985095 # uBlock (1.3)
)
mas upgrade
mas install ${apps[@]}

# Cleanup

brew cleanup

# Preferences

#"Automatically quit printer app once the print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

#"Disable smart quotes and smart dashes as they are annoying when typing code"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

#"Disabling press-and-hold for keys in favor of a key repeat"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

#"Enabling full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

#"Showing icons for hard drives, servers, and removable media on the desktop"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder AppleShowAllFiles -bool true        # Finder: Show hidden files by default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true     # Finder: Show all filename extensions
defaults write com.apple.finder ShowStatusBar -bool true            # Finder: Show status bar
defaults write com.apple.finder ShowPathbar -bool true              # Finder: Show path bar
defaults write com.apple.finder _FXSortFoldersFirst -bool true      # Finder: Keep folders on top when sorting by name

#"Disabling the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

#"Avoiding the creation of .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

#"Setting Dock to auto-hide and removing the auto-hiding delay"
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0

#"Preventing Time Machine from prompting to use new hard drives as backup volume"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

#"Enabling Safari's debug menu"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

#"Enabling the Develop menu and the Web Inspector in Safari"
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1



killall Finder
