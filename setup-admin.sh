#!/bin/bash
set -eo pipefail

# Admin setup: installs tools system-wide (brew), then runs the shared per-user
# setup, then admin-only extras. Agent accounts use the tools installed here
# but run only setup-user.sh themselves.

cd "$(dirname "$0")"

./scripts/admin/xcode-cli-tools.sh
./scripts/admin/homebrew.sh
# A fresh brew install happens in a child process and can't put brew on this
# shell's PATH; future shells get it from .zshenv
eval "$(/opt/homebrew/bin/brew shellenv)"
./scripts/admin/brew-packages.sh
./scripts/admin/zsh-admin.sh

./setup-user.sh

# setup-user.sh applied the agent dock list; replace it with the full one
./scripts/user/dock-apps.sh dock/admin.txt

echo ""
echo "Admin setup complete."
echo "Next: run ./setup_github.sh to generate this machine's SSH key and add it to GitHub."
