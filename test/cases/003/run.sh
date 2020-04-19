#!/bin/bash
set -e

# This exercises the build process for source files.

cd project

rm -rf build
echo "=== Testing source files => build directory ==="
for f in 001 subdir/002 subdir/subsubdir/003; do
    mkdir -p "$(dirname "$f")"
    echo "$f" >"$f.src"
    zedo "src:$f.src"
    diff "$f.src" "build/$f.src"
done
echo >&2 "ok"

echo "=== Testing source files overwritten ==="
for f in 001 subdir/002 subdir/subsubdir/003; do
    mkdir -p "$(dirname "$f")"
    echo "new data" >"$f.src"
    zedo "src:$f.src"
    echo "new data" | diff - "build/$f.src"
done
echo >&2 "ok"
