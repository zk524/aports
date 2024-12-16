#!/bin/sh

if [ ! "$1" ]; then
	echo "Plase input the kernel-version number as the first argument of this script."
else
	#VERSION=6.11.11
	VERSION="$1"
	PATCH=0006-linux-hardened-v$VERSION-hardened1.patch
	PATCH_SIG=0007-linux-hardened-v$VERSION-hardened1.patch.sig
	APKBUILD=APKBUILD

	rm *linux-hardened-v*

	wget -O \
	$PATCH \
	https://github.com/anthraxx/linux-hardened/releases/download/v$VERSION-hardened1/linux-hardened-v$VERSION-hardened1.patch

	wget -O \
	$PATCH_SIG \
	https://github.com/anthraxx/linux-hardened/releases/download/v$VERSION-hardened1/linux-hardened-v$VERSION-hardened1.patch.sig

	echo "REMOVE EXTRAVERSION IN \"$PATCH\"!"
	nano $PATCH
	echo "UPDATE THE PATCH VERSIONS IN \"$APKBUILD\" (pkgver and source)!"
	nano $APKBUILD
fi
