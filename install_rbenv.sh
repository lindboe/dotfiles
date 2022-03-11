#!/bin/bash
set -eof pipefail

## install rbenv
brew install rbenv

# Checking installation
rbenv init
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/main/bin/rbenv-doctor | bash

echo "find verisons to install with `rbenv install -l`"
echo "set your version with `rbenv global/local <version>`"
echo "after installing a new version or gem with commands, run `rbenv rehash`"
