source "$HOME/.cargo/env.fish"

# --- Aliases ---
alias ls="eza --group-directories-first"
alias ll="ls --long --git"
alias la="ls -A"
alias lal="la --long --grid --git"
alias g="git"
alias cp="cp -i"
alias mv="mv -i"
alias cat="bat --theme ansi"
alias ch="chezmoi"

if status is-interactive
    # Commands to run in interactive sessions can go here
    set -g fish_key_bindings fish_vi_key_bindings
    set fish_greeting

    set -gx EDITOR nvim
    set -Ux ZELLIJ_AUTO_ATTACH true
    set -Ux ZELLIJ_AUTO_EXIT true

    # Carapace
    set -Ux CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense' # optional
    mkdir -p ~/.config/fish/completions
    carapace --list | awk '{print $1}' | xargs -I{} touch ~/.config/fish/completions/{}.fish # disable auto-loaded completions (#185)
    carapace _carapace | source

    zoxide init fish | source
    starship init fish | source
    # TODO: We don't start zellij until I can figure out how to get vi
    # cursors to work with fish in zellij
    # eval (zellij setup --generate-auto-start fish | string collect)
end
