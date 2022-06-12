#!/bin/sh

# This script tangles my emacs config, so that I don't need the resulting init file in source control

emacs --batch --eval "(require 'org)" --eval '(org-babel-tangle-file "~/.local/share/chezmoi/dot_emacs.d/emacs.org")' && echo "Succesfully tangled emacs config" || echo "Something went wrong tangling emacs config"
