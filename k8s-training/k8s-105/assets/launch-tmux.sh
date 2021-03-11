#!/bin/sh

# Time left
EXPIRES=$(expr 3540 - $(expr $(date +%s) - $(stat -c %Y /tmp/d)))

# Set Session Name
SESSION="tmux-term"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

# Only create tmux session if it doesn't already exist
if [ "$SESSIONEXISTS" = "" ]
then
    # Start New Session with our name
    tmux new-session -d -s $SESSION
    tmux selectp -t 0    # select the first (0) pane
    tmux splitw -v -p 20 # split it into two halves
    tmux send-keys 'termdown -b '"${EXPIRES}s"' -f standard -t "< 5   MINS   LEFT!"' C-m

    tmux selectp -t 0    # select the first (0) pane
    tmux send-keys 'clear' C-m # Switch to bind script?
fi

# Attach Session, on the Main window
tmux attach-session -t $SESSION:0
