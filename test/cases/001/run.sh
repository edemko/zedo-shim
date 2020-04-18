#!/bin/bash
set -e

rm -rf project/build

echo '==='
echo "Testing variables, arguments, pwd:"

zedo --zedo-root=project \
    build:zedoVars \
    build:subdir/subsubdir/deep.vars

diff project/expected/zedoVars project/build/zedoVars
diff project/expected/deep.vars project/build/subdir/subsubdir/deep.vars

echo "ok"


echo '==='
echo "Testing source files => build directory:"

cd project
# TODO omit the `src:` from these (the after-change command should do it)
for f in 001 subdir/002 subdir/subsubdir/003; do
    mkdir -p "$(dirname "$f")"
    echo "$f" >"$f.src"
    zedo "src:$f.src"
    diff "$f.src" "build/$f.src"
done
echo 'new data' >001.src
zedo "src:$f.src"
diff 001.src build/001.src

echo "ok"
cd ..


echo '==='
echo "Testing overwriting targets:"
cd project

zedo src:001.src build:zedoVars
diff 001.src build/001.src
diff expected/zedoVars build/zedoVars

echo "ok"
cd ..

echo '==='
cd project/subdir

zedo \
    build:foo1.out :foo2.out :src:foo3.out ::foo4.out foo5.out bar/../foo6.out \
    .foo7.out ..foo8.out foo.ne..in.out 'foo 10.out'

cd ../build/subdir
[ "$(cat foo1.out)" = subdir@@foo1@@.out ] || echo '' | cat foo1.out -
[ "$(cat foo2.out)" = subdir@@foo2@@.out ] || echo '' | cat foo2.out -
[ "$(cat src:foo3.out)" = subdir@@src:foo3@@.out ] || echo '' | cat src:foo3.out -
[ "$(cat :foo4.out)" = subdir@@:foo4@@.out ] || echo '' | cat :foo4.out -
[ "$(cat foo5.out)" = subdir@@foo5@@.out ] || echo '' | cat foo5.out -
[ "$(cat foo6.out)" = subdir@@foo6@@.out ] || echo '' | cat foo6.out -
[ "$(cat .foo7.out)" = subdir@@.foo7@@.out ] || echo '' | cat .foo7.out -
[ "$(cat ..foo8.out)" = subdir@@..foo8@@.out ] || echo '' | cat ..foo8.out -
[ "$(cat foo.ne..in.out)" = subdir@@foo.ne..in@@.out ] || echo '' | cat foo.ne..in.out -
[ "$(cat 'foo 10.out')" = 'subdir@@foo 10@@.out' ] || echo '' | cat 'foo 10.out' -

cd ../../..
