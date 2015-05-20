#!/bin/bash

# Script name: devmux.sh
# Author: Antonio Perretta
# Created on: 05/20/15
# Description: Tmux startup script

tmux -2 new-session -d -s devenv

# create first window

tmux new-window -t devenv:1 -n 'vagrant'

tmux splitw -v -p 50 -t devenv:1
tmux splitw -v -p 50 -t devenv:1


# create second window

tmux new-window -t devenv:2 -n 'unigy'
tmux splitw -v -p 50 -t devenv:2

# create third window

tmux new-window -t devenv:3 -n 'linuxacademy'

# set to default window

tmux select-window -t devenv:1

# attach to session

tmux -2 attach-session -t devenv
