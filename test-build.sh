#!/bin/sh

set -vex

manifest="$(realpath $(dirname $0)/Cargo.toml)"

for path in /tmp/snippet-build-1 /tmp/snippet-build-2; do
    rm -rf "$path"
    mkdir "$path"
    cd "$path"
    CARGO_TARGET_DIR="$PWD" RUSTFLAGS="-Zremap-path-prefix-from=$PWD -Zremap-path-prefix-to=/src" cargo +nightly build -v --manifest-path "$manifest"
    sha1sum debug/deps/*.rlib
done
