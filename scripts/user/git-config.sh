#!/bin/bash
set -eo pipefail

cd "$(dirname "$0")/../.."

cp git/.gitconfig ~/.gitconfig
# Global excludes file, referenced by core.excludesfile in the gitconfig
cp git/.gitignore ~/.gitignore

echo "git config installed"
