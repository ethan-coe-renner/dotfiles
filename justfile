rustup:
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

crates:
	cargo install bat
	cargo install exa
	cargo install fd-find
	cargo install just
	cargo install ripgrep
	# install dependencies for alacritty
	dnf install cmake freetype-devel fontconfig-devel libxcb-devel libxkbcommon-devel g++
	cargo install alacritty
