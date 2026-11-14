#!/bin/sh
set -eu

version=v0.16.0
# Alpine names come from the target image, not the build host.
arch=${2:-$(apk --print-arch)}
case "$arch" in
    x86_64)
        target=amd64
        checksum=1075de8f235bb755b43f54c3e5489de48de61fdf782f6eb150c76eb049b52743
        ;;
    aarch64)
        target=arm64
        checksum=13e0b7fc2a14614c206e37c8717526e590d0a98cac0d4224335f13c8fb538267
        ;;
    *) echo "Unsupported dockerize architecture: $arch" >&2; exit 1 ;;
esac
asset="dockerize-alpine-linux-$target-$version.tar.gz"
if [ "${1:-}" = "--artifact" ]; then
    printf '%s  %s\n' "$checksum" "$asset"
    exit 0
fi

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
curl --fail --location --retry 3 \
    "https://github.com/jwilder/dockerize/releases/download/$version/$asset" \
    --output "$tmp/$asset"
echo "$checksum  $tmp/$asset" | sha256sum -c -
tar -xzf "$tmp/$asset" -C /usr/local/bin dockerize
