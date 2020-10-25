#!/usr/bin/env bash

# Exit immediately on non-zero return codes.
set -ex

# Use the `dontstarvetogether` command if only options were given.
if [ "${1:0:1}" = '-' ]; then
  set -- dontstarvetogether "$@"
fi

# Handle running the `dontstarvetogether` command.
if [ "$1" = "dontstarvetogether" ]; then
  set -- gosu "$STEAM_USER" "$@"
fi

# Execute the command.
exec "$@"
