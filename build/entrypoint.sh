#!/usr/bin/env bash

# Exit immediately on non-zero return codes.
set -ex

# Use the `dontstarve_dedicated_server_nullrenderer` command if only options were given.
if [ "${1:0:1}" = '-' ]; then
	set -- dontstarve_dedicated_server_nullrenderer "$@"
fi

# Handle running the `dontstarve_dedicated_server_nullrenderer` command.
if [ "$1" = "dontstarve_dedicated_server_nullrenderer" ]; then
	set -- gosu "$STEAM_USER" "$@"
fi

# Execute the command.
exec "$@"
