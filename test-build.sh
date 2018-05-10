#!/bin/sh

set -vex

manifest="$(realpath $(dirname $0)/Cargo.toml)"

for path in /tmp/snippet-build-1 /tmp/snippet-build-2; do
    rm -rf "$path"
    mkdir "$path"
    cd "$path"
    CARGO_TARGET_DIR="$PWD" RUSTFLAGS="--remap-path-prefix=$PWD=/src" cargo +nightly build -v --manifest-path "$manifest"
    sha1sum debug/deps/*.rlib | sort > hashes
done

set +vx

if diff -u /tmp/snippet-build-1/hashes /tmp/snippet-build-2/hashes; then
    echo "Compiler outputs match!"
else
    echo "Compiler outputs do not match!"
fi
