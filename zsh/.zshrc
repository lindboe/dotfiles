# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="robbyrussell"

# Open React Native Debugger
alias rndbg='open "rndebugger://set-debugger-loc?host=localhost&port=8081"'
# Trigger shake event on Android device
alias ashake="adb -d shell input keyevent 82"
# Trigger shake event on Android emulator
alias eshake="adb shell input keyevent 82"
# Make port 8081 available for Android dev on device
alias adev="adb -d reverse tcp:8081 tcp:8081"
# Make port 9090 available for Reactotron on Android device
alias atron="adb -d reverse tcp:9090 tcp:9090"
# Look through all commits by me
alias mygitlog="git log -p --branches --author=\"lindboe\""
alias simdata="~/Library/Developer/CoreSimulator/Devices"
alias updatemaestro="curl -Ls \"https://get.maestro.mobile.dev\" | bash"

# Find branches containing provided commit SHA
function findbranch () {
  git branch -a --contains $1
}

# Find if anything is using the given port (without sudo this only sees your
# own processes, which non-admin accounts have to live with anyway)
function usingport() {
  lsof -i :$1
  code=$?
  [ $code -eq 1 ] && echo "No matches found"
}

# Open provided directory in Android Studio
function as() {
  open -a /Applications/Android\ Studio.app $1
}
# For Xcode, open <PROJECT>.xcworkspace
# For VS Code, `code .` in desired directory

# Given a number, get that amount of currently available ports
getPorts() {
    amount=${1}
    found=0
    ports=""
    for ((i=7777;i<=65000;i++))
    do
        (echo > /dev/tcp/127.0.0.1/${i}) >/dev/null 2>&1 || {
            #echo "${i}"
            ports="${ports} ${i}"
            found=$((found+1))
            if [[ ${found} -ge ${amount} ]]
            then
                echo "${ports:1}"
                return 0
            fi
        }
    done

    return 1
}

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(git)

export EDITOR="vim"
export ANDROID_HOME=~/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# zsh-completions
# must go before sourcing oh-my-zsh
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

source $ZSH/oh-my-zsh.sh

# auto-use nvm if applicable
autoload -U add-zsh-hook

load-nvmrc() {
  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version
    nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc

# jenv (installed via brew; shims PATH for non-interactive shells is in .zshenv)
eval "$(jenv init -)"

# maestro
export PATH=$PATH:$HOME/.maestro/bin

# Account-specific extras: admin setup installs one (sudo-dependent functions
# etc.); also the place for per-machine tweaks that shouldn't be in the repo
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
