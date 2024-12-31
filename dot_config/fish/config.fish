source "$HOME/.cargo/env.fish"

# --- Aliases ---
alias ls="eza --group-directories-first"
alias ll="ls --long --git"
alias la="ls -A"
alias lal="la --long --grid --git"
alias g="git"
alias cp="cp -i"
alias mv="mv -i"
alias cat="bat"
alias ch="chezmoi"

if status is-interactive
    # Commands to run in interactive sessions can go here
    set -g fish_key_bindings fish_vi_key_bindings
    set fish_greeting

    zoxide init fish | source
    starship init fish | source
end
