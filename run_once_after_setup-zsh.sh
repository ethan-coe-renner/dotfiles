#!/bin/sh

antigen_file="$HOME"/.config/zsh/antigen.zsh
if [ ! -f "$antigen_file" ]; then
	# TODO: try to simplify this
	mkdir "$HOME"/.config/zsh
	curl -L git.io/antigen > "$antigen_file"
fi
