#!/usr/bin/env bash

# I clone some ghostty themes to git/ghostty-themes
# We must copy them to ~/.config/ghostty/themes

SRC="$HOME/git/ghostty-themes/themes/"
TARGET="$HOME/.config/ghostty/themes/"

mkdir -p $TARGET
rsync -a $SRC $TARGET
