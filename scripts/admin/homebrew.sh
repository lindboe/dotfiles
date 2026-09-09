#!/bin/bash
set -eo pipefail

if command -v brew >/dev/null 2>&1; then
  echo "Homebrew already installed"
  exit 0
fi

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
