source "$HOME/.cargo/env.fish"
fish_add_path /opt/homebrew/bin

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
    # Commands to run in interactive sessions can go here

    # Autostart zellij
    set -Ux ZELLIJ_AUTO_ATTACH true
    set -Ux ZELLIJ_AUTO_EXIT true
    eval (zellij setup --generate-auto-start fish | string collect)

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

    # --- VI Mode ---
    set -g fish_key_bindings fish_vi_key_bindings
    # Emulates vim's cursor shape behavior
    # Set the normal and visual mode cursors to a block
    set fish_cursor_default block
    # Set the insert mode cursor to a line
    set fish_cursor_insert line
    # Set the replace mode cursors to an underscore
    set fish_cursor_replace_one underscore
    set fish_cursor_replace underscore
    # Set the external cursor to a line. The external cursor appears when a command is started.
    # The cursor shape takes the value of fish_cursor_default when fish_cursor_external is not specified.
    set fish_cursor_external line
    # The following variable can be used to configure cursor shape in
    # visual mode, but due to fish_cursor_default, is redundant here
    set fish_cursor_visual block

    set -gx EDITOR nvim

    # Carapace
    set -Ux CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense' # optional
    mkdir -p ~/.config/fish/completions
    carapace --list | awk '{print $1}' | xargs -I{} touch ~/.config/fish/completions/{}.fish # disable auto-loaded completions (#185)
    carapace _carapace | source

    zoxide init fish | source
    starship init fish | source

end
