#!/bin/bash
set -eo pipefail

cd "$(dirname "$0")/../.."

# Point iTerm at the repo's pref folder so prefs sync through git: commit/push
# changes from one machine, pull and restart iTerm on another. (A plain plist
# copy loses the race with cfprefsd/iTerm rewriting prefs on quit.)
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "$PWD/iTermPref"
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true

echo "iTerm pointed at $PWD/iTermPref (restart iTerm to load)"
