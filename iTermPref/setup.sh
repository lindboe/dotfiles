#!/bin/bash
set -eof pipefail

defaults write com.googlecode.iterm2 PrefsCustomFolder -string "~/dev/dotfiles/iTermPref"

defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
