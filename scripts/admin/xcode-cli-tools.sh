#!/bin/bash
set -eo pipefail

if xcode-select -p >/dev/null 2>&1; then
  echo "Xcode command line tools already installed"
  exit 0
fi

# This only kicks off a GUI installer, so setup can't continue until it's done
xcode-select --install
echo "Finish the command line tools install in the GUI dialog, then re-run setup-admin.sh." >&2
exit 1
