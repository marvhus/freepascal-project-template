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

# Compile to linux
if [[ "$OSTYPE" = "linux-gnu"* ]]; then # Linux
    fpc -Tlinux src/main.pas
    mkdir -p bin/linux; mv src/main bin/linux/
# Compile to freebsd
elif [[ "$OSTYPE" = "freebsd" ]]; then # FreeBSD
    fpc -Tfreebsd src/main.pas
    mkdir -p bin/freebsd; mv src/main bin/freebsd/
# Compile to win32
elif [[ "$OSTYPE" = "win64" ]]; then # Windows 32 bit
    fpc -Twin64 src/main.pas
    mkdir -p bin/win64; mv src/main bin/win64/
elif [[ "$OSTYPE" = "darwin" ]]; then # Mac OSX
    fpc -Tdarwin src/main.pas
    mkdir -p bin/darwin; mv src/-main bin/darwin/
else # Anything else
        echo "Platform not suported at the moment"
        exit
fi

rm -rf src/*.o
rm -rf src/*.ppu
