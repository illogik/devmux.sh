#!/bin/bash

# Script name: devmux.sh
# Author: Antonio Perretta
# Created on: 05/20/15
# Description: Tmux startup script

#### Functions

function usage()
{
    echo "usage: devmux [ [-v | --vertical] [-h | --horizontal] ] !--"
}

# setup for vertical monitor

function vertical()
{
tmux -2 new-session -d -s devmux
tmux new-window -t devmux:1 -n 'vagrant'
tmux send-keys 'cd vagrant/linuxacademy' C-m
tmux splitw -v -p 50 -t devmux:1
tmux send-keys 'cd vagrant/tunnel' C-m
tmux splitw -v -p 50 -t devmux:1
tmux new-window -t devmux:2 -n 'unigy'
tmux splitw -v -p 50 -t devmux:2
tmux new-window -t devmux:3 -n 'linuxacademy'
tmux send-keys 'ssh user@'
tmux select-window -t devmux:1
tmux -2 attach-session -t devmux
}

# setup for hotizontal monitor

function horizontal()
{
tmux -2 new-session -d -s devmux
tmux new-window -t devmux:1 -n 'vagrant'
tmux send-keys 'cd vagrant/linuxacademy' C-m
tmux splitw -h -p 50 -t devmux:1
tmux send-keys 'cd vagrant/tunnel' C-m
tmux new-window -t devmux:2 -n 'unigy'
tmux splitw -h -p 50 -t devmux:2
tmux new-window -t devmux:3 -n 'linuxacademy'
tmux send-keys 'ssh user@'
tmux select-window -t devmux:1
tmux -2 attach-session -t devmux
}

### begin execution

while [[ "$1" = "" ]]; do
	usage
	exit 1
done

while [[ "$1" != "" ]]; do
    case $1 in
        -v | --vertical )	shift
							vertical
							;;
		-h | --horizontal ) shift
							horizontal
							;;
		* )			        usage
                            exit 1
    esac
    shift
done
