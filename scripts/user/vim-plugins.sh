#!/bin/bash
set -eo pipefail

# The old plugin-based vim config (pathogen + snippets). Not run by default;
# swap this in for vim-noplugins.sh in setup-user.sh if you want it.

cd "$(dirname "$0")/../.."

cp vim/.vimrc ~/.vimrc
mkdir -p ~/.vim
cp -R vim/.vim/ ~/.vim/

echo "vim config (with plugins) installed"
