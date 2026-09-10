#!/bin/bash
set -eo pipefail

# Vim with plugins, via Vim's native package loading: each plugin is a plain
# git clone under ~/.vim/pack/plugins/start. Re-running this script updates
# them (pulls existing clones). Swap this in for vim-noplugins.sh in
# setup-user.sh to use it.

cd "$(dirname "$0")/../.."

PLUGINS=(
  https://github.com/luochen1990/rainbow
  https://github.com/godlygeek/tabular
  https://github.com/tpope/vim-surround
  https://github.com/bkad/CamelCaseMotion
)

PACK_DIR="$HOME/.vim/pack/plugins/start"
mkdir -p "$PACK_DIR"

for url in "${PLUGINS[@]}"; do
  name="${url##*/}"
  if [ -d "$PACK_DIR/$name/.git" ]; then
    echo "Updating $name..."
    git -C "$PACK_DIR/$name" pull --ff-only
  else
    git clone "$url" "$PACK_DIR/$name"
  fi
done

cp vim/.vimrc ~/.vimrc

echo "vim config (with plugins) installed"
