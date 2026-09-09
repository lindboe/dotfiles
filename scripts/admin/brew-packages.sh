#!/bin/bash
set -eo pipefail

# node intentionally absent: each account gets its own via nvm (scripts/user/nvm.sh)
brew install git vim ripgrep zsh-completions jenv watchman rbenv

# brew errors on already-installed casks, so guard each
for cask in zulu@17 rectangle; do
  if brew list --cask "$cask" >/dev/null 2>&1; then
    echo "$cask already installed"
  else
    brew install --cask "$cask"
  fi
done

# compinit complains about group/other-writable completion dirs
chmod -R go-w /opt/homebrew/share
