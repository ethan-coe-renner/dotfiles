fish_add_path ~/.local/bin
fish_add_path ~/.local/bin/scripts
fish_add_path ~/.config/emacs/bin
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin

# If this is a dumb terminal, short circuit
if test "$TERM" = "dumb"
    # Set a basic prompt
    function fish_prompt
        echo ">"
    end
    # Skip the rest of the configuration
    return 0
end

if status is-interactive
    set fish_greeting

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
    alias chcd="pushd $(chezmoi source-path)"
    alias hl="hledger"
    alias jnix="just -f ~/git/nixos-config/Justfile"

    set -gx EDITOR nvim
    set -gx LEDGER_FILE ~/git/finance/current.journal
    set -gx RESTIC_REPOSITORY ~/.backup

    # Carapace
    set -Ux CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense' # optional
    carapace _carapace | source

    atuin init fish | source
    zoxide init fish | source
end
