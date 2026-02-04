#!/bin/sh

config_file="$HOME/.config/niri/config.kdl"

has_off=$(sed -n '/^[[:space:]]*touchpad {/,/^[[:space:]]*}/ { /^[[:space:]]*off[[:space:]]*$/p }' "$config_file")

if [ -n "$has_off" ]; then
  sed -i '/^[[:space:]]*touchpad {/,/^[[:space:]]*}/ {
  /^[[:space:]]*off[[:space:]]*$/d;
  }' "$config_file"
else
  sed -i '/^[[:space:]]*touchpad {/,/^[[:space:]]*}/ {
  /^[[:space:]]*}[[:space:]]*$/i\
  \ \ off
  }' "$config_file"
fi
