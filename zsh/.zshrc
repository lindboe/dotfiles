# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias b="bundle exec"
# Open React Native Debubgger
alias rndbg='open "rndebugger://set-debugger-loc?host=localhost&port=8081"'
# Trigger shake event on Android device
alias ashake="adb -d shell input keyevent 82"
# Trigger shake event on Android emulator
alias eshake="adb shell input keyevent 82"
# Make port 8081 available for Android dev on device
alias adev="adb reverse tcp:8081 tcp:8081"
# Make port 9090 available for Reactotron on Android device
alias atron="adb reverse tcp:9090 tcp:9090"
# Open VS Code TS configuration file to edit to stop TS errors from being truncated
alias vsts="cd /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/extensions/node_modules/typescript/lib"
# Watch port for activity
alias watchport="sudo tcpdump -i any port"
# Run Expo on my Android device
alias emyphone="npx expo run:android --device SM_G991U1"
# Look through all commits by me
alias mygitlog="git log -p --branches --author=\"lindboe\""

# Find branches containing provided commit SHA
function findbranch () {
  git branch -a --contains :$1
}

# Find if anything is using the given port
function usingport() {
  sudo lsof -i :$1
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

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)
export EDITOR="vim"
export ANDROID_HOME=~/Library/Android/sdk
export ANDROID_SDK_ROOT=~/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

source $ZSH/oh-my-zsh.sh

# zsh-completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

PATH_FOR_IDB=/Users/lizzilindboe/Library/Python/3.9/bin
PATH=$PATH:$PATH_FOR_IDB:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:usr/local/sbin
export PATH

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#rvm
eval "$(rbenv init -)"

# Why did I do this? Who knows
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
