#!/bin/bash

# Script name: devmux.sh
# Author: Antonio Perretta
# Created on: 05/20/15
# Description: Tmux startup script

tmux -2 new-session -d -s vdevmux

# create first window

tmux new-window -t vdevmux:1 -n 'vagrant'
tmux send-keys 'cd vagrant/linuxacademy' C-m

tmux splitw -h -p 50 -t vdevmux:1
tmux send-keys 'cd vagrant/tunnel' C-m

# create second window

tmux new-window -t vdevmux:2 -n 'unigy'
tmux splitw -h -p 50 -t devmux:2

# create third window

tmux new-window -t vdevmux:3 -n 'linuxacademy'
tmux send-keys 'ssh user@'

# set to default window

tmux select-window -t vdevmux:1

# attach to session

tmux -2 attach-session -t vdevmux
