#!/bin/bash
set -eof pipefail

# install homebrew
if ! command -v brew ; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/lizzi/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

brew install git vim zsh-completions emacs ripgrep
if [ ! -f ~/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

if [ ! -f ~/.zshrc ]; then
  cp ../zsh/.zshrc ~/.zshrc
  # install powerline fonts
  ./install-powerline-fonts.sh
  source ~/.zshrc
fi

# install rectangle
brew install --cask rectangle

# configure vim
# this is forked up because the plugins didn't seem to follow. should probably
# just clone a list of them anyways, but some like rainbow parens were
# downloaded from that one site so idk how best to handle??
# just going with a simplified nopluginvimrc for the moment
# if [ ! -f ~/.vimrc ]; then
#   cp vim/nopluginvimrc ~/.vimrc
# fi

# configure spacemacs
# if [ ! -d ~/.emacs.d ]; then
#   git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
# fi
