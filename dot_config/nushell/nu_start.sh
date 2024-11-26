# If nushell isn't installed, return immediately into default shell
command -v nu &> /dev/null || return

# Don't run zellij when connected via ssh
[[ $SESSION_TYPE == remote/ssh ]] && export NO_ZELLIJ=1

# Disable zellij if it isn't installed
command -v zellij &> /dev/null || export NO_ZELLIJ=1

export ZELLIJ_AUTO_ATTACH="true"
export ZELLIJ_AUTO_EXIT="true"

# If zellij is not already running and hasn't been disabled, run it
if [[ -z "$ZELLIJ" && -z "$NO_ZELLIJ" ]]; then
    if [[ "$ZELLIJ_AUTO_ATTACH" == "true" ]]; then
        zellij attach -c
    else
        zellij
    fi

    if [[ "$ZELLIJ_AUTO_EXIT" == "true" ]]; then
        exit
    fi
fi

# Fallback on nushell
nu && exit
