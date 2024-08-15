# Dotfiles
[![builds.sr.ht status](https://builds.sr.ht/~code-runner/dotfiles.svg)](https://builds.sr.ht/~code-runner/dotfiles?)

This repository contains my dotfiles and other configuration scripts, all managed with [chezmoi](https://www.chezmoi.io/).

Sourcehut: https://sr.ht/~code-runner/dotfiles/

Codeberg mirror: https://codeberg.org/code-runner/dotfiles

GitHub mirror: https://github.com/ethan-coe-renner/dotfiles

## Install
Currently supports Fedora and MacOS. 

Chezmoi makes installation easy, just run the following:
```
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --promptDefaults --apply https://git.sr.ht/~code-runner/dotfiles
```

This will do the following:
- Install chezmoi
- Clone this repository
- Deploy dotfiles to targets
- Install packages (listed [here](./.chezmoidata/packages.yaml))
- Enable included systemd services

## Desktop Environment
Historically, I have switched between DEs/WMs frequently.
I generally prefer [tiling window managers](https://en.wikipedia.org/wiki/Tiling_window_manager).
I am currently using System76's excellent [COSMIC](https://system76.com/cosmic) desktop environment.
While COSMIC is currently in alpha, I've found it stable enough for my use.
The killer feature of COSMIC for me is native window tiling, which I haven't seen in any other full Desktop Environment.
I am trying to find a clean way to include my COSMIC configuration files with this repository, however currently they are not included.

### [Elkowars Wacky Widgets](https://github.com/elkowar/eww)
I've begun developing some simple desktop widgets with the fantastic EWW.
Currently this just includes a clock on the desktop overlaying the background.
These are DE agnostic, so they can be used when I inevitably switch to another desktop environment.

## [KMonad](https://github.com/kmonad/kmonad)
KMonad is "An advanced keyboard manager" which allows extreme customization of the keyboard.
My (relatively simple) configuration does the following:
- Set the keyboard layout to [Dvorak](https://en.wikipedia.org/wiki/Dvorak_keyboard_layout)
- Turn the caps lock key into a special key which acts as escape when tapped and control when pressed simultaneously with another key.
- Map the keys located at `j`,`k`,`l`,`;` (on a qwerty keyboard) into arrow keys while the spacebar is held

I have configurations for my Thinkpad T480 keyboard, a Keychron K2 keyboard, and a Thinkpad USB keyboard. These configurations are all based on the template at [`.chezmoitemplates/kmonad`](./.chezmoitemplates/kmonad).

*Note: In order for KMonad to work properly on linux, you must give your user Uinput permissions.
The process for doing this is described in the KMonad docs [here](https://github.com/kmonad/kmonad/blob/master/doc/faq.md#q-how-do-i-get-uinput-permissions).*

I have not yet tried to setup KMonad on my Mac.

## Editor
My editor of choice is (and will always be) [GNU Emacs](https://www.gnu.org/software/emacs/).
I use a literate configuration located [here](./dot_emacs.d/emacs.org).
That file is an [org](https://orgmode.org/) file full of elisp snippets which are automatically output into the `init.el` when saved using [`org-tangle`](https://orgmode.org/manual/Extracting-Source-Code.html).

## Shell
I use [`zsh`](https://www.zsh.org/) as my primary shell.
My zsh-specific configuration is located at [`dot_zshrc`](./dot_zshrc).

I use the [antigen](https://github.com/zsh-users/antigen) zsh package manager to install the following packages:
- [`zsh-autosuggestions`](https://github.com/zsh-users/zsh-autosuggestions)
- [`zsh-vi-mode`](https://github.com/jeffreytse/zsh-vi-mode)
- [`zsh-syntax-highlighting`](https://github.com/zsh-users/zsh-syntax-highlighting)
- [`zsh-autopair`](https://github.com/hlissner/zsh-autopair)

Some aliases are set up in [`dot_aliases`](./dot_aliases), these as well as [`dot_env`](./dot_env) are intended to be shell agnostic.

