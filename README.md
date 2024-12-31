# Dotfiles
[![builds.sr.ht status](https://builds.sr.ht/~code-runner/dotfiles.svg)](https://builds.sr.ht/~code-runner/dotfiles?)

This repository contains my dotfiles and other configuration scripts, all managed with [chezmoi](https://www.chezmoi.io/).

Sourcehut: https://sr.ht/~code-runner/dotfiles/

Codeberg mirror: https://codeberg.org/code-runner/dotfiles

GitHub mirror: https://github.com/ethan-coe-renner/dotfiles

## Install
Currently used on Fedora and MacOS. 

I use my Ansible role from [~code-runner/dev.ansible](https://git.sr.ht/~code-runner/dev.ansible) to deploy these configuration files.

## [KMonad](https://github.com/kmonad/kmonad)
KMonad is "An advanced keyboard manager" which allows extreme customization of the keyboard.
My (relatively simple) configuration does the following:
- Set the keyboard layout to [Dvorak](https://en.wikipedia.org/wiki/Dvorak_keyboard_layout)
- Turn the caps lock key into a special key which acts as escape when tapped and control when pressed simultaneously with another key.
- Map the keys located at `j`,`k`,`l`,`;` (on a qwerty keyboard) into arrow keys while the spacebar is held

I have configurations for my Thinkpad T480 keyboard, a Keychron K2 keyboard, and a Thinkpad USB keyboard. These configurations are all based on the template at [`.chezmoitemplates/kmonad`](./.chezmoitemplates/kmonad).

*Note: In order for KMonad to work properly on linux, you must give your user Uinput permissions.
The process for doing this is described in the KMonad docs [here](https://github.com/kmonad/kmonad/blob/master/doc/faq.md#q-how-do-i-get-uinput-permissions). This is done automatically by the aformentioned Ansible role*

I have not yet tried to setup KMonad on my Mac.

## Editor
My editor of choice is (and will always be) [GNU Emacs](https://www.gnu.org/software/emacs/).

I frequently switch between [Doom Emacs](https://github.com/doomemacs/doomemacs) and a vanilla configuration. Currently I am using a Doom Emacs based configuration at [doom](./dot_config/doom).

## Shell
*This may be changing to fish*
I use [`zsh`](https://www.zsh.org/) as my primary shell.
My zsh-specific configuration is located at [`dot_zshrc`](./dot_zshrc).

I use the [antigen](https://github.com/zsh-users/antigen) zsh package manager to install the following packages:
- [`zsh-autosuggestions`](https://github.com/zsh-users/zsh-autosuggestions)
- [`zsh-vi-mode`](https://github.com/jeffreytse/zsh-vi-mode)
- [`zsh-syntax-highlighting`](https://github.com/zsh-users/zsh-syntax-highlighting)
- [`zsh-autopair`](https://github.com/hlissner/zsh-autopair)

Some aliases are set up in [`dot_aliases`](./dot_aliases), these as well as [`dot_env`](./dot_env) are intended to be shell agnostic (at least for bash-like shells).

