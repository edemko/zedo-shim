#!/bin/sh
set -e


case "$2" in
    gramps)
        echo -n "Oak"
        zedo mama.out
     ;;
    mama)
        echo -n "Delia"
        zedo kiddo.out
    ;;
    kiddo)
        echo -n "Gotta catch 'em all!"
    ;;
esac

echo " --- $ZEDO__PARENT => $ZEDO__TARGET"

echo "  SRC: $SRC"
echo "  BUILD: $BUILD"
echo "  ZEDO__ROOT: $ZEDO__ROOT"
