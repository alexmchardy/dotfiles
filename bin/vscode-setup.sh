#!/usr/bin/env bash

VSCODE=$(which code)
VSCODE_USER_SETTINGS_DIR="$HOME/Library/Application Support/Code/User"
if [ -f $VSCODE ] && [ -d "$VSCODE_USER_SETTINGS_DIR" ]; then
    echo "Installing extensions"
    extensions=`cat $HOME/settings/vscode/extensions_list`
    for extension in $extensions
    do
      code --install-extension $extension
    done

    keybindings="$VSCODE_USER_SETTINGS_DIR/keybindings.json"
    if [ -f "$keybindings" ]; then
      echo "Backing up $keybindings"
      mv "$keybindings" "$keybindings.bak"
    fi

    settings="$VSCODE_USER_SETTINGS_DIR/settings.json"
    if [ -f "$settings" ]; then
      echo "Backing up $settings"
      mv "$settings" "$settings.bak"
    fi

    echo "Copying keybindings and settings"
    cp $HOME/settings/vscode/keybindings.json "$keybindings"
    cp $HOME/settings/vscode/settings.json "$settings"
fi
