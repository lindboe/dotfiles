#!/bin/bash
set -eo pipefail

cd "$(dirname "$0")/../.."

cp vim/nopluginvimrc ~/.vimrc

echo "vim config (no plugins) installed"
