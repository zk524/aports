#!/bin/sh

VERSION="$1"

# renamed HARDENED
if [ ! $1 ]; then
	echo "Invalid command"
	echo "Please enter generated linux-kernel's $VERSION."
else
	apk add linux-hardened=$VERSION-r1
fi
