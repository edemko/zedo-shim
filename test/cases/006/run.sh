#!/bin/sh
set -e

cd project
rm -rf build

if zedo gramps.out; then exit 1; fi

cd .zedo/log
echo === STACK TRACE ===
cat stacktrace.zedolog
echo === GRAMPS STDERR ===
cat gramps.out.stderr
echo === MAMA STDERR ===
cat mama.out.stderr
echo === KIDDO STDERR ===
cat kiddo.out.stderr
echo === RIVAL STDERR ===
cat rival.out.stderr
