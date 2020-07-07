#!/bin/sh
set -e

# Run as current user
CURRENT_USER=${ASUSER:-${UID:-0}}

if [ ! -z "$CURRENT_USER" ] && [ "$CURRENT_USER" != "0" ]; then
    usermod -u $CURRENT_USER kool
fi

# Run entrypoint if provided
if [ ! -z "$ENTRYPOINT" ] && [ -f "$ENTRYPOINT" ]; then
    bash $ENTRYPOINT
fi

if [ ! -z "$CURRENT_USER" ] && [ "$CURRENT_USER" != "0" ]; then
    exec su-exec kool "$@"
else
    exec "$@"
fi
