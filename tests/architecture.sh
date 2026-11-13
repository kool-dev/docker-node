#!/bin/sh
set -eu
cd "$(dirname "$0")/.."
installer=template/install-dockerize.blade.php
test "$(sh "$installer" --artifact x86_64)" = \
    "1075de8f235bb755b43f54c3e5489de48de61fdf782f6eb150c76eb049b52743  dockerize-alpine-linux-amd64-v0.16.0.tar.gz"
test "$(sh "$installer" --artifact aarch64)" = \
    "13e0b7fc2a14614c206e37c8717526e590d0a98cac0d4224335f13c8fb538267  dockerize-alpine-linux-arm64-v0.16.0.tar.gz"
if sh "$installer" --artifact unsupported; then
    echo "Unsupported architecture was accepted" >&2
    exit 1
fi
echo "Architecture selection passed (no ARM binary execution)"
