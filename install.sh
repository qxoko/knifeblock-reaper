#!/bin/bash

set -e
shopt -s nocaseglob

platform=$(uname -a)

if [[ $platform == *microsoft* ]]; then
    cp ./scripts/* "$(wslpath $(wslvar USERPROFILE)/AppData/Roaming/REAPER/Scripts/)"
    exit 0
fi

# @todo macOS & Linux