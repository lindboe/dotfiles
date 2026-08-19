# /etc/zprofile sets path again and overrides this, so we have to do this again
# https://unix.stackexchange.com/a/71258
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="/usr/local/bin:$PATH"
