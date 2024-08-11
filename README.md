# Dotfiles
[![builds.sr.ht status](https://builds.sr.ht/~code-runner/dotfiles.svg)](https://builds.sr.ht/~code-runner/dotfiles?)

# Install
Currently supports Fedora and MacOS. 

Chezmoi makes installation easy, just run the following:
```
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --promptDefaults --apply https://git.sr.ht/~code-runner/dotfiles
```

This will do the following:
- Install Chezmoi
- Clone this repository
- Deploy dotfiles to targets
- Install packages (listed [here](./.chezmoidata/packages.yaml))
- Enables included systemd services
