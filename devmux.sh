#!/bin/bash

# Script name: devmux.sh
# Author: Antonio Perretta
# Created on: 05/20/15
# Description: Tmux startup script

tmux -2 new-session -d -s devmux

# create first window

tmux new-window -t devmux:1 -n 'vagrant'
tmux send-keys 'cd vagrant/linuxacademy' C-m

tmux splitw -v -p 50 -t devmux:1
tmux send-keys 'cd vagrant/tunnel' C-m

tmux splitw -v -p 50 -t devmux:1

# create second window

tmux new-window -t devmux:2 -n 'unigy'
tmux splitw -v -p 50 -t devmux:2

# create third window

tmux new-window -t devmux:3 -n 'linuxacademy'
tmux send-keys 'ssh user@'

# set to default window

tmux select-window -t devmux:1

# attach to session

tmux -2 attach-session -t devmux
