#!/usr/bin/env bash

if [[ "$1" = "-h" || "$1" = "--help" ]]; then
    echo "
        You can choose an os by writing as the first paramater.
        (if no parameter is suplied, your current os will be selected if it is implemented)
        List over suported operating systems:"
    fpc -it
    exit
fi

# Select Target OS yourself
if [[ $1 ]]; then
    fpc -T$1 src/main.pas
    mkdir -p bin/$1; mv src/main bin/$1

    rm -rf src/*.o
    rm -rf src/*.ppu

    exit
fi

fpc src/main.pas
mkdir -p bin/; mv src/main bin/main

rm -rf src/*.o
rm -rf src/*.ppu
