#!/bin/bash

# Script name: devmux.sh
# Author: Antonio Perretta
# Created on: 05/20/15
# Description: Tmux startup script

tmux new-session -d -s devenv

tmux new-window -t devenv:1 -n 'vagrant'
tmux splitw -h -p 50 -t devenv:1
tmux splitw -h -p 50 -t devenv:1

tmux new-window -t devenv:2 -n 'unigy'
tmux splitw -h -p 50 -t devenv:2

tmux new-window -t devenv:3 -n 'linuxacademy'

tmux select-window -t devenv:1
tmux attach-session -t devenv
