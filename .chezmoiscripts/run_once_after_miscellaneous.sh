#!/bin/sh

# This is used for various miscellaneous configuration

# Set the kitty theme
if command -v kitten &> /dev/null; then
    kitten themes Gruvbox Dark Hard
fi
