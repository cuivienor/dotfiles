#!/usr/bin/env bash

# Initial window setup
tmux send-keys "nvim ." c-M
tmux rename-window "nvim"

# Create scratch window
tmux new-window -n scratch
