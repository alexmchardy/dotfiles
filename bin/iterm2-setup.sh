#!/usr/bin/env bash

ITERM2_SETTINGS_DIR="$HOME/settings/iterm2"
if [ -d "$ITERM2_SETTINGS_DIR" ]; then
    echo "Setting iTerm2 to read/write settings to $ITERM2_SETTINGS_DIR"

    # Specify the preferences directory
    defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$ITERM2_SETTINGS_DIR"

    # Tell iTerm2 to use the custom preferences in the directory
    defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
fi
