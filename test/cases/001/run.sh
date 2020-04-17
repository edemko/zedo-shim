#!/bin/bash
set -e

echo '==='
zedo --zedo-root=project

echo '==='
cd project
zedo foo ./foo bar/../foo foo/ src:foo ::foo :src:foo src:src:foo

echo '==='
cd subdir
zedo foo/bar/baz.a..nope.b

echo '==='
cd subsubdir
# TODO test when meta flag is on
zedo
