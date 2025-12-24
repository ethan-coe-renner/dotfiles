#!/usr/bin/env bash

# Get the current setting
CURRENT_SCHEME=$(gsettings get org.gnome.desktop.interface color-scheme)

if [ "$CURRENT_SCHEME" = "'prefer-dark'" ]; then
    # Switch to Light
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
else
    # Switch to Dark
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
fi
