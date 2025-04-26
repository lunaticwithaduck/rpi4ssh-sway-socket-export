#!/bin/bash

SWAYSOCK_PATH=$(find /run/user/1000 -name 'sway-ipc.*' 2>/dev/null)

if [ -z "$SWAYSOCK_PATH" ]; then
	echo "Couldn't find sway socket."
	exit 1
fi

export SWAYSOCK="$SWAYSOCK_PATH"

if [ -z "$1" ]; then
	echo "Using: $0 '<command to run in sway'"
	exit 1
fi

swaymsg exec "$1"
