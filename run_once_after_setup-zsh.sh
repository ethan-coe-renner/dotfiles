#!/bin/sh

antigen_file="$HOME"/.config/zsh/antigen.zsh
if [ ! -f "$antigen_file" ]; then
	touch "$antigen_file"
	curl -L git.io/antigen > "$antigen_file"
fi
