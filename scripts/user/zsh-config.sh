#!/bin/bash
set -eo pipefail

cd "$(dirname "$0")/../.."

# .zshenv runs for ALL shells including non-interactive (remote agent sessions),
# .zprofile for login shells (re-asserts brew PATH after /etc/zprofile's
# path_helper reorders it), .zshrc for interactive shells.
cp zsh/.zshenv zsh/.zprofile zsh/.zshrc ~

echo "zsh config installed"
