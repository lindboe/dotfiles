#!/bin/bash
set -eof pipefail

# configure vim
# this is forked up because the plugins didn't seem to follow. should probably
# just clone a list of them anyways, but some like rainbow parens were
# downloaded from that one site so idk how best to handle??
# just going with a simplified nopluginvimrc for the moment
# if [ ! -f ~/.vimrc ]; then
#   cp vim/nopluginvimrc ~/.vimrc
# fi
