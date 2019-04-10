#!/bin/sh
tmux new-session -d 'nvim'
tmux split-window -h -p 25 'python'
tmux split-window -v
tmux new-window 'Bash'
tmux -2 attach-session -d



