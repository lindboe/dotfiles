#!/bin/bash
set -eo pipefail

if [ -d ~/.oh-my-zsh ]; then
  echo "oh-my-zsh already installed, skipping"
  exit 0
fi

# RUNZSH=no: don't drop into a new shell mid-setup
# KEEP_ZSHRC=yes: don't touch ~/.zshrc; zsh-config.sh manages it
RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
