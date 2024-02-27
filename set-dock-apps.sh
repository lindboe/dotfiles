#!/bin/bash
set -eof pipefail

# Pulled from and inspired by https://github.com/sheharyarn/dotfiles

DOCK_APPS=(
  "clue-mac"
  "Multi"
  "Kiwi for Gmail"
  "Firefox"
  "Slack"
  "Notion"
  "iTerm"
  "Visual Studio Code"
  "Android Studio"
  "Xcode"
  "Simulator"
  "Discord"
  "Google Chrome"
  "Activity Monitor"
  "System Settings"
)

# Paths to search for apps
APP_PATHS=(
  "/Applications"
  "/System/Applications"
  "/System/Applications/Utilities"
  "$HOME/Applications"
)

__app_path() {
  for ((i = 0; i < ${#APP_PATHS[@]}; i++)); do
    local full_path="${APP_PATHS[$i]}/$@.app"

    if [[ -d "$full_path" ]]; then
      printf "$full_path"
      return 0
    fi
  done
}


# Helper to generate config for individual dock items
__dock_config() {
  printf "%s%s%s%s%s" \
         "<dict><key>tile-data</key><dict><key>file-data</key><dict>" \
         "<key>_CFURLString</key><string>" \
         "$@" \
         "</string><key>_CFURLStringType</key><integer>0</integer>" \
         "</dict></dict></dict>"
}

DOCK_ARGS=""
for ((i = 0; i < ${#DOCK_APPS[@]}; i++)); do
  app_name="${DOCK_APPS[$i]}"
  full_path="$(__app_path $app_name)"

  if [[ -z "$full_path" ]]; then
    # do nothing if app not found
    >&2 echo "Error: Path not found for '$app_name'"
  else
    DOCK_ARGS+="'$(__dock_config "$full_path")' "
  fi
done


eval "defaults write com.apple.dock persistent-apps -array $DOCK_ARGS"
killall Dock
echo ""
echo "Done! Favorite apps pinned to Dock!"
