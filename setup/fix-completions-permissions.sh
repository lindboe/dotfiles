#!/bin/bash
set -eof pipefail

chmod -R go-w '/opt/homebrew/share'
# This isn't listed by compaudit in my laaatest setup
# chmod -R go-w '/opt/homebrew/share/zsh'

