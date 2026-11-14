#!/bin/sh
set -eu
image=${1:?Usage: sh tests/image.sh IMAGE}
cd "$(dirname "$0")/.."
for uid in 0 1000 1234; do
    home=/home/kool
    [ "$uid" != 0 ] || home=/root
    docker run --rm -i -e ASUSER="$uid" -e EXPECTED_UID="$uid" \
        -e EXPECTED_HOME="$home" "$image" sh -s < tests/container.sh
done
