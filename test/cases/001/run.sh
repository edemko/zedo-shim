#!/bin/bash
set -e

# This excercises the setup of the zedo environment.
# This includes the SRC,DO,BUILD envvars,
# ZEDO__{PARENT,TARGET} "private" envvars,
# arguments passed to scripts,
# and the PWD the script is run under.

# In addition, it tests overwriting generated files.

rm -rf project{1,2}/build

echo '=== Testing defaults ==='
zedo --zedo-root=project1 \
    build:zedoVars \
    build:subdir/subsubdir/deep.vars

diff project1/expected/zedoVars project1/build/zedoVars
diff project1/expected/deep.vars project1/build/subdir/subsubdir/deep.vars
echo "ok"


echo "=== Testing overwriting targets ==="
cd project1
zedo build:zedoVars
diff expected/zedoVars build/zedoVars
cd ..
echo "ok"


echo '=== Testing config file ==='
zedo --zedo-root=project2 \
    build:zedoVars \
    build:subdir/subsubdir/deep.vars

diff project2/expected/zedoVars project2/out/zedoVars
diff project2/expected/deep.vars project2/out/subdir/subsubdir/deep.vars
echo "ok"


echo '=== Testing envvar ==='
BUILD=dist zedo --zedo-root=project2 \
    build:zedoVars \
    build:subdir/subsubdir/deep.vars

diff project2/expected/zedoVars-alt project2/dist/zedoVars
diff project2/expected/deep-alt.vars project2/dist/subdir/subsubdir/deep.vars
echo "ok"
