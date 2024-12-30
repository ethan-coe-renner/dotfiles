# This is a script that I used to run from my zsh config to treat nushell
# as a default shell.

# If nushell isn't installed, return immediately into default shell
command -v nu &> /dev/null || return

# Don't run zellij when connected via ssh
# TODO: maybe run tmux on ssh sessions, usually it is installed
[[ $SESSION_TYPE == remote/ssh ]] && NO_ZELLIJ=1

export ZELLIJ_AUTO_EXIT="true"

# If zellij is not already running and hasn't been disabled, run it
if [[ -z "$ZELLIJ" && -z "$NO_ZELLIJ" ]]; then
    zellij && [[ "$ZELLIJ_AUTO_EXIT" == "true" ]] && exit
fi

# Fallback on nushell
nu && exit
