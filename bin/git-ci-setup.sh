#!/usr/bin/env bash

USER_BIN_DIR="$HOME/bin"
CLONE_DEST="$HOME/src/git-checkout-interactive"

echo "Cloning git-checkout-interactive"

if [ -d "$CLONE_DEST" ]; then
  echo "$CLONE_DEST already exists"
else
  git clone git@github.com:alexmchardy/git-checkout-interactive.git "$CLONE_DEST"
fi


echo "Linking into $USER_BIN_DIR"

ln -s "$CLONE_DEST/git-checkout-interactive" "$USER_BIN_DIR/git-checkout-interactive"
