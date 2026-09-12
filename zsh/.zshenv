# Runs for ALL zsh shells, including non-interactive ones (remote agent/Claude
# ssh sessions), so everything such sessions need on PATH goes here.
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="/usr/local/bin:$PATH"

# User-local executables (e.g. the maacs link from `node cli/setup.mjs`)
export PATH="$HOME/.local/bin:$PATH"

# Full rbenv init not necessary for non-interactive shells. Admin accounts
# only; harmless no-op where ~/.rbenv doesn't exist (agent accounts).
# https://github.com/rbenv/rbenv/issues/1508#issuecomment-1600531709
export PATH="$HOME/.rbenv/shims:${PATH}"

# Same trick for jenv, so non-interactive shells resolve java
export PATH="$HOME/.jenv/shims:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# corepack (enabled per nvm node in scripts/user/nvm.sh) supplies pnpm/yarn at the
# version a project pins. Download them without asking, so non-interactive shells stay quiet.
export COREPACK_ENABLE_DOWNLOAD_PROMPT=0
