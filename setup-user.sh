#!/bin/bash
set -eo pipefail

# Per-user setup: everything an account needs that doesn't require admin rights.
# This is the complete setup for `agent` accounts; setup-admin.sh runs it too.

cd "$(dirname "$0")"

./scripts/user/git-config.sh
./scripts/user/vim-noplugins.sh # swap for vim-plugins.sh to get the old plugin config
./scripts/user/oh-my-zsh.sh
./scripts/user/zsh-config.sh
./scripts/user/nvm.sh
./scripts/user/jenv-zulu.sh
./scripts/user/iterm.sh
./scripts/user/os-defaults.sh
./scripts/user/dock-apps.sh dock/agent.txt

echo ""
echo "User setup complete. Restart your shell (or open a new terminal)."
