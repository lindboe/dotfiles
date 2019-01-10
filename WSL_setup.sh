#!/bin/bash
set -efo pipefail
shopt -s extglob

sudo apt-get update && sudo apt-get install git terminator emacs vim openjdk-8-jdk zsh fonts-powerline

#configure zsh
if [ "$SHELL" != "/usr/bin/zsh" ]; then
  chsh -s $(which zsh)
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  # need another step to pick a theme and preferred plugins

  # this is not what profile is meant for, but will launch a terminator instance
  # for me when I open Ubuntu on Windows with everything I want set, and only do
  # it once.
  if [ ! -e ~/.zprofile ]; then
    echo "Configuring automatic start of terminator"
    cat > ~/.zprofile <<EOL
export DISPLAY=:0
terminator
EOL
  fi
fi

# configure terminator
mkdir -p ~/.config/terminator
touch ~/.config/terminator/config
cp terminator/config ~/.config/terminator/config

# configure vim
cp vim/nopluginvimrc ~/.vimrc

# add configuration for running GUI apps with x server on windows

# configure spacemacs
if [ ! -d ~/.emacs.d ]; then
  git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
fi

# place gitconfig
cp git/.gitconfig ~/.gitconfig
cp git/.gitignore ~/.gitignore

# set up git keys

# install source code pro
wget https://github.com/adobe-fonts/source-code-pro/archive/2.030R-ro/1.050R-it.zip
mkdir temp-fonts
unzip -q 1.050R-it.zip -d temp-fonts
# have to do this to allow the globbing
set +f
sudo cp temp-fonts/*/OTF/*.otf /usr/local/share/fonts
set -f
fc-cache -f
rm 1.050R-it.zip
rm -rf temp-fonts
