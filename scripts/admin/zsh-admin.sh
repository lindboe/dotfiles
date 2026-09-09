#!/bin/bash
set -eo pipefail

cd "$(dirname "$0")/../.."

# Admin-only shell extras; the shared .zshrc sources ~/.zshrc.local if present
cp zsh/admin.zshrc.local ~/.zshrc.local

echo "admin zsh extras installed to ~/.zshrc.local"
