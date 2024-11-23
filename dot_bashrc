# If connected to by TRAMP, immediately return
[[ $TERM == "tramp" ]] && PS1='$ ' && return

source .env

# If this is not an xterm, return immediately into default shell
[[ ! $TERM =~ "xterm" ]] && return

# If nushell isn't installed, return immediately into default shell
command -v nu || return

# Don't run zellij on macos
[[ $OSTYPE == *"darwin"* ]] && export NO_ZELLIJ=1

# Disable zellij if it isn't installed
command -v zellij || export NO_ZELLIJ=1

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
