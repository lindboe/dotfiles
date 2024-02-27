#!/bin/bash
set -eof pipefail

# Pulled from and inspired by https://github.com/sheharyarn/dotfiles

# Always show file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Always show Hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

# Always search within the current folder in Finder
defaults write com.apple.finder FXDefaultSearchScope 'SCcf'

# Show path bar at bottom of finder windows
defaults write com.apple.finder "ShowPathbar" -bool "true"

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Don't use "natural" scrolling
defaults write -g com.apple.swipescrolldirection -int 0

# Don't show recent apps in Dock
defaults write com.apple.dock "show-recents" -bool "false"

# Restart Finder and other Services
killall Finder
killall Dock

# Set initial key repeat delay to shortest normal setting
defaults write -g InitialKeyRepeat -int 10
# Set key repeat to faster than GUI allows
defaults write -g KeyRepeat -int 1

# TODO: Consider the following...
# defaults write -g AppleDisplayScaleFactor -float ...
#

# Ask the User to Reboot
sleep 1

echo "Success! All OS X defaults are set."
echo
echo "Some changes will not take effect until you reboot your machine."
