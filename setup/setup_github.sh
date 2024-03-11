#!/bin/bash
set -eof pipefail

echo 'Generating new SSH key'
# Generate key in default location, will prompt for passphrase, choose to save it in keychain
read -p 'Email for SSH key: ' email
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -C $email

# Start SSH agent
eval "$(ssh-agent -s)"

echo 'Setting up SSH config file'
# Update ssh config
touch ~/.ssh/config

cat << SSHConfig > ~/.ssh/config
Host github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
SSHConfig

echo 'Adding key to ssh-agent and storing passphrase in keychain'
ssh-add --apple-use-keychain ~/.ssh/id_ed25519

pbcopy < ~/.ssh/id_ed25519.pub
echo 'Public key copied to clipboard. Go to https://github.com/settings/keys to add it.'
