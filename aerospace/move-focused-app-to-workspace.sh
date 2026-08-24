#!/bin/bash
# Move all windows of the currently focused app to a workspace, then follow.
# Usage: move-focused-app-to-workspace.sh <workspace>

ws="$1"
AERO="$HOME/.homebrew/bin/aerospace"

[ -z "$ws" ] && exit 1
[ -x "$AERO" ] || exit 1

# Bundle ID of the focused window's app
bundle=$("$AERO" list-windows --focused --format '%{app-bundle-id}' 2>/dev/null)
[ -z "$bundle" ] && exit 0

# Move every window of that app, across all monitors, to the target workspace
"$AERO" list-windows --monitor all --app-bundle-id "$bundle" --format '%{window-id}' \
  | while read -r id; do
      [ -n "$id" ] && "$AERO" move-node-to-workspace --window-id "$id" "$ws"
    done

# Follow the windows to their new workspace
"$AERO" workspace "$ws"
