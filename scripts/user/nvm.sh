#!/bin/bash
set -eo pipefail

# Per-user nvm install (safe to re-run; updates nvm in place).
# PROFILE=/dev/null stops the installer from appending config to ~/.zshrc —
# our zsh/.zshenv already loads nvm.
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.7/install.sh | PROFILE=/dev/null bash

export NVM_DIR="$HOME/.nvm"
# nvm.sh doesn't behave under set -e
set +e
\. "$NVM_DIR/nvm.sh"
set -e

# Install a default node so one exists before any .nvmrc auto-switching kicks in
nvm install --lts
