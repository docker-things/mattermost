#!/bin/bash

# Command used to launch docker
DOCKER_CMD='sudo docker'

# Where to store the backups
BACKUP_PATH='/media/store/docker-backup'

# The name of the docker image
PROJECT_NAME="mattermost"

# BUILD ARGS
BUILD_ARGS=(
    --build-arg APP_VERSION="4.2.3"
    )

# LAUNCH ARGS
RUN_ARGS=(
    -e DISPLAY=$DISPLAY
    -v /tmp/.X11-unix:/tmp/.X11-unix

    -v $XAUTHORITY:/tmp/.Xauthority
    -e XAUTHORITY=/tmp/.Xauthority

    --memory="512m"
    --cpu-shares=1024

    -v $(pwd)/data/config/Mattermost:/home/$(whoami)/.config/Mattermost
    -v $HOME/Documents
    -v $HOME/Downloads
    -v $HOME/Desktop
    -v $HOME/Music
    -v $HOME/Pictures

    --rm
    -d
    )
