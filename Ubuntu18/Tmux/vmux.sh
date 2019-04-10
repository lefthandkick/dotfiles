#!/bin/sh
#!/bin/sh
tmux new-session -d '/nvim/nvim.appimage'
tmux split-window -h -p 25
tmux split-window -v
tmux new-window 'Bash'
tmux -2 attach-session -d




