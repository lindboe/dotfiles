#!/bin/bash
set -eo pipefail

# Registers the (admin-installed) zulu-17 JDK with this user's jenv.
# jenv registrations live in ~/.jenv, so every account does this itself.

JDK_HOME="/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home"
JENV="/opt/homebrew/bin/jenv"

if [ ! -x "$JENV" ]; then
  echo "jenv not found; ask an admin to run setup-admin.sh (brew install jenv)" >&2
  exit 1
fi

if [ ! -d "$JDK_HOME" ]; then
  echo "zulu-17 JDK not found; ask an admin to run setup-admin.sh (brew install --cask zulu@17)" >&2
  exit 1
fi

if "$JENV" versions --bare 2>/dev/null | grep -q '^zulu\|^17'; then
  echo "zulu-17 already registered with jenv"
else
  "$JENV" add "$JDK_HOME"
fi

# Makes jenv export JAVA_HOME in interactive shells
if [ ! -e ~/.jenv/plugins/export ]; then
  "$JENV" enable-plugin export
fi
