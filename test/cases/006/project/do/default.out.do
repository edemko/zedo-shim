#!/bin/sh
set -e


case "$2" in
    gramps)
        printf "Oak"
        echo >&3 "Oak needs Delia"
        zedo mama.out
        echo >&3 "Oak needs Rival"
        zedo rival.out
        echo >&3 "Oak done"
     ;;
    mama)
        printf "Delia"
        echo >&3 "Delia needs Kiddo"
        zedo kiddo.out
        echo >&3 "Delia done"
    ;;
    kiddo)
        printf "Gotta catch 'em all!"
        zedo 001
        echo >&3 "Kiddo done"
    ;;
    rival)
        printf "Smell ya later!"
        zedo 004
        echo >&3 "Rival done"
    ;;
esac

echo " --- $ZEDO__PARENT => $ZEDO__TARGET"

echo "  SRC: $SRC"
echo "  BUILD: $BUILD"
echo "  ZEDO__ROOT: $(realpath --relative-to "$(git rev-parse --show-toplevel)" "$ZEDO__ROOT")"
