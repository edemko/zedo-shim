#!/bin/bash
set -e

# This excercises the trace command output.
# This includes request categorization,
# searching for do-scripts,
# and the location of the soruce file.

cd project
rm -rf build
zedo trace file file.a .file.a file.a.b \
    sub1/sub2/file sub1/sub2/file.a.big..ext.b \
    src:file build:file ::file :src:file :build:file src:src:file
