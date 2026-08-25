#!/bin/bash
focused=$(/Users/baptistejouin/.homebrew/bin/aerospace list-windows --focused --format '%{app-bundle-id}')
if [ "$focused" = "com.mitchellh.ghostty" ]; then
    /Users/baptistejouin/.homebrew/bin/aerospace mode ghostty
else
    /Users/baptistejouin/.homebrew/bin/aerospace mode main
fi
