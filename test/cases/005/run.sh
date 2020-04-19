#!/bin/sh
set -e

cd project
rm -rf build

zedo gramps.out

cd build
cat gramps.out
cat mama.out
cat kiddo.out
echo ====================================
cd ../.zedo/log
cat callstack.zedolog
