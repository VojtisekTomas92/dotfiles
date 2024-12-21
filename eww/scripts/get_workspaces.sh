#!/usr/bin/env bash

workspaces=$(hyprctl workspaces -j | jq [.[] | .name])

echo "$workspaces"