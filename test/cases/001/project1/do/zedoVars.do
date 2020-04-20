#!/bin/bash
set -e

echo "parent: $ZEDO__PARENT"
echo "target: $ZEDO__TARGET"

echo "pwd: $(realpath --relative-to "$(git rev-parse --show-toplevel)" "$PWD")"

echo "SRC: $SRC"
echo "BUILD: $BUILD"
echo "DO: $DO"

echo "isa: $1"
echo "dva: $2"
echo "san: $3"
