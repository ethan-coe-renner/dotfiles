#!/bin/sh

# install some packages and set up zsh
sudo dnf install zsh cmake difftastic

antigen_file="$HOME"/.config/zsh/antigen.zsh
if [ ! -f "$antigen_file" ]; then
	curl -L git.io/antigen > "$antigen_file"
fi
