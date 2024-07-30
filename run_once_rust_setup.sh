#!/bin/sh

# This script installs rustup and a few crates

if [ ! -d "$HOME"/.cargo ]; then
	# Install rust toolchain if not already installed
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

cargo install bat lsd fd-find ripgrep starship zoxide just difft
