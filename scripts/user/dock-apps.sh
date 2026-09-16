#!/bin/bash
set -eo pipefail

# Sets the Dock to exactly the apps named in the given list file (one per line;
# blank lines ignored). Lists live in dock/. Missing apps are skipped with a
# warning. Pulled from and inspired by https://github.com/sheharyarn/dotfiles

if [ $# -ne 1 ] || [ ! -f "$1" ]; then
  echo "Usage: $0 <app-list-file>" >&2
  exit 1
fi

# Paths to search for apps
APP_PATHS=(
  "/Applications"
  "/System/Applications"
  "/System/Applications/Utilities"
  "/Applications/Xcode.app/Contents/Applications"
  "$HOME/Applications"
)

__app_path() {
  local dir
  for dir in "${APP_PATHS[@]}"; do
    if [[ -d "$dir/$1.app" ]]; then
      printf '%s' "$dir/$1.app"
      return 0
    fi
  done
}

# Helper to generate config for individual dock items
__dock_config() {
  printf "%s%s%s%s%s" \
         "<dict><key>tile-data</key><dict><key>file-data</key><dict>" \
         "<key>_CFURLString</key><string>" \
         "$1" \
         "</string><key>_CFURLStringType</key><integer>0</integer>" \
         "</dict></dict></dict>"
}

DOCK_ARGS=()
while IFS= read -r app_name; do
  [ -z "$app_name" ] && continue
  full_path="$(__app_path "$app_name")"

  if [[ -z "$full_path" ]]; then
    # skip if app not found
    >&2 echo "Warning: Path not found for '$app_name'"
  else
    DOCK_ARGS+=("$(__dock_config "$full_path")")
  fi
done < "$1"

defaults write com.apple.dock persistent-apps -array "${DOCK_ARGS[@]}"
killall Dock || true

echo ""
echo "Done! Apps from $1 pinned to Dock!"
