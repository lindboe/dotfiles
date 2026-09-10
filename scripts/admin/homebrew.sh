#!/bin/bash
set -eo pipefail

# Also check the install path directly: brew may be installed but not on this
# shell's PATH (e.g. re-running setup before any configured shell exists)
if command -v brew >/dev/null 2>&1 || [ -x /opt/homebrew/bin/brew ]; then
  echo "Homebrew already installed"
  exit 0
fi

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
