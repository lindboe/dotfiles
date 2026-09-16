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
  https://github.com/prettier/vim-prettier
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

# vim-prettier bundles its own prettier as an npm dependency; install it so
# :Prettier works even in projects without a local prettier
if command -v npm >/dev/null; then
  (cd "$PACK_DIR/vim-prettier" && npm install --omit=dev)
else
  echo "npm not found; skipping vim-prettier's bundled prettier install"
fi

cp vim/.vimrc ~/.vimrc

echo "vim config (with plugins) installed"
