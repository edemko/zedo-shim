#!/bin/bash
set -e
here="$(realpath "$(dirname "$0")")"

PATH+=":$(realpath "$(dirname "$here")")/bin"
export PATH

exitCode=0
for f in "$here"/cases/*; do
    result=ok
    cd "$(dirname "$here")"
    cd "$f"
    if ! [ -x "./run.sh" ]; then
        echo >&2 "$f/run.sh is not executable"
        result=FAIL
    else
        set +e; ./run.sh >actual.out 2>&1; ec=$?; set -e
        if [ $ec -ne 0 ]; then
            echo >&2 "test $(basename "$f"): run script exited with non-zero exit code ($ec)"
            result=FAIL
        elif ! diff -q {actual,expected}.out 2>/dev/null; then
            echo >&2 "test $(basename "$f"): actual output differs from expected"
            result=FAIL
        fi
    fi
    if [ "$result" = FAIL ]; then exitCode=1; fi
    echo "test $(basename "$f"): $result"
done
exit $exitCode
