#!/bin/sh

currenttheme=$(alacritty-theme current)

[[ "$currenttheme" =~ modus_vivendi ]] && alacritty-theme change modus_operandi
[[ "$currenttheme" =~ modus_operandi ]] && alacritty-theme change modus_vivendi

