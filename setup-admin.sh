#!/bin/bash
set -eo pipefail

# Admin setup: installs tools system-wide (brew), then runs the shared per-user
# setup, then admin-only extras. Agent accounts use the tools installed here
# but run only setup-user.sh themselves.

cd "$(dirname "$0")"

./scripts/admin/xcode-cli-tools.sh
./scripts/admin/homebrew.sh
./scripts/admin/brew-packages.sh
./scripts/admin/zsh-admin.sh

./setup-user.sh

# setup-user.sh applied the agent dock list; replace it with the full one
./scripts/user/dock-apps.sh dock/admin.txt

# Interactive (SSH key passphrase + adding the key on github.com), so it goes last
./setup_github.sh
