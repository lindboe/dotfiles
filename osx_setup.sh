#!/bin/bash
set -eof pipefail

# install xcode
# xcode-select --install

# install homebrew
if ! command -v brew ; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

brew install git vim zsh-completions emacs ripgrep
# should I install zsh-completions as a plugin instead? maybe

#configure zsh
if [ "$SHELL" != "/bin/zsh" ]; then
  chsh -s $(which zsh)
fi

if [ ! -f ~/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

if [ ! -f ~/.zshrc ]; then
  cp ./zsh/.zshrc ~/.zshrc
  # install powerline fonts
  ./install.sh
  source ~/.zshrc
fi

# install rectangle
brew install --cask rectangle

# configure vim
# this is forked up because the plugins didn't seem to follow. should probably
# just clone a list of them anyways, but some like rainbow parens were
# downloaded from that one site so idk how best to handle??
# just going with a simplified nopluginvimrc for the moment
if [ ! -f ~/.vimrc ]; then
  cp vim/nopluginvimrc ~/.vimrc
fi

# configure spacemacs
if [ ! -d ~/.emacs.d ]; then
  git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
fi

# set up git keys
