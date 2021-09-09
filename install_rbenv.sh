#!/bin/bash
set -eof pipefail

## install rbenv
brew install rbenv

echo "run `rbenv init`, then `rbenv doctor` to check installation is correct."

echo "find verisons to install with `rbenv install -l`"
echo "set your version with `rbenv global/local <version>`"
echo "after installing a new version or gem with commands, run `rbenv rehash`"
