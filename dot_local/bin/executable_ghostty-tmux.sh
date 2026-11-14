#!/usr/bin/env bash

# Check if a ghostty tmux session already exists
# If one does, attach to it, otherwise create and attach to it
# Inspiration: https://mansoorbarri.com/tmux-ghostty/

SESSION_NAME="ghostty"

# On Macos, we need to ensure tmux is in the PATH here because this script gets
# run before the shell init script
PATH=$PATH:/opt/homebrew/bin

# Check if the session already exists
tmux has-session -t $SESSION_NAME 2>/dev/null

if [ $? -eq 0 ]; then
  # If the session exists, reattach to it
  tmux attach-session -t $SESSION_NAME
else
  # If the session doesn't exist, start a new one
  tmux new-session -s $SESSION_NAME -d
  tmux attach-session -t $SESSION_NAME
fi
