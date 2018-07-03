#/bin/sh

set -vex

cargo clean; cargo build

touch src/lib.rs; cargo build
