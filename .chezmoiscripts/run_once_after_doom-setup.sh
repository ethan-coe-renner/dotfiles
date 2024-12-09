#!/usr/bin/env sh

if [ ! -d "$HOME/.config/emacs" ]; then
    echo "Setting up Doom Emacs"
    git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
    "$HOME"/.config/emacs/bin/doom install
fi
