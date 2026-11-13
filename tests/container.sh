#!/bin/sh
set -eu

test "$(id -u)" = "$EXPECTED_UID"
test "$HOME" = "$EXPECTED_HOME"
node -v
for manager in npm yarn pnpm; do
    "$manager" -v >"/tmp/$manager-version" 2>"/tmp/$manager-stderr"
    cat "/tmp/$manager-version"
    if grep -Ei 'unknown.*config|deprecated.*config' "/tmp/$manager-stderr"; then
        exit 1
    fi
done

test "$(pnpm config get globalconfig)" = "$HOME/.config/pnpm/config.yaml"
test "$(pnpm config get storeDir)" = "$HOME/.pnpm-store"
test "$(pnpm config get packageImportMethod)" = copy
test "$(stat -c %u "$HOME/.config/pnpm/config.yaml")" = "$EXPECTED_UID"
test -w "$HOME/.config/pnpm/config.yaml"
dockerize -version
printf 'hello {{ .Env.EXPECTED_UID }}' > /tmp/template
test "$(dockerize -template /tmp/template)" = "hello $EXPECTED_UID"

# Each manager installs a real package in an isolated, user-owned directory.
work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT
for manager in npm yarn pnpm; do
    mkdir "$work/$manager"
    cd "$work/$manager"
    printf '{"private":true,"dependencies":{"is-number":"7.0.0"}}\n' > package.json
    case "$manager" in
        npm) npm install --ignore-scripts --no-audit --no-fund ;;
        yarn) yarn install --ignore-scripts --non-interactive ;;
        pnpm) pnpm install --ignore-scripts ;;
    esac
    node -e 'if (!require("is-number")(42)) process.exit(1)'
    test -z "$(find . ! -user "$(id -un)" -print -quit)"
done
case "$(pnpm store path)" in
    "$HOME/.pnpm-store/"*) ;;
    *) echo "pnpm is not using the configured store" >&2; exit 1 ;;
esac
test -z "$(find "$HOME/.pnpm-store" ! -user "$(id -un)" -print -quit)"
