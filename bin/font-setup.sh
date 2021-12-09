#!/usr/bin/env bash

if [ "$USER" != "root" ]; then
  echo "This script needs to be run with sudo"
  exit 1;
fi

NON_ROOT_USER=$SUDO_USER

FONTS_DIR="$HOME/settings/fonts/Fonts"
FONT_COLLECTIONS_DIR="$HOME/settings/fonts/FontCollections"

if [ -d "$FONTS_DIR" ]; then

    if [ -n "$(ls -A $HOME/Library/Fonts 2>/dev/null)" ]; then
      echo "$HOME/Library/Fonts directory is not empty. Not linking $FONTS_DIR."
    else
      echo "Linking $FONTS_DIR to $HOME/Library/Fonts"

      ln -sF $FONTS_DIR $HOME/Library

      echo "Setting $HOME/Library/Fonts owner and permissions"

      chown -h $NON_ROOT_USER $HOME/Library/Fonts
      chmod 700 $HOME/Library/Fonts
    fi
fi

if [ -d "$FONT_COLLECTIONS_DIR" ]; then
    echo "Linking files from $FONT_COLLECTIONS_DIR into $HOME/Library/FontCollections"

    ln -s $FONT_COLLECTIONS_DIR/* $HOME/Library/FontCollections
fi

