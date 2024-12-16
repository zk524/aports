#!/bin/sh

#									#
#	Make sure you have APK ZSTD		#
#									#

DIR=./arch
SEC_DIR=./sec

rm -rf $DIR/*
rm -rf $DIR/.*

wget -P $DIR -O $DIR/linux-hardened-headers.pkg.tar.zst https://archlinux.org/packages/extra/x86_64/linux-hardened-headers/download/
tar -xvf $DIR/linux-hardened-headers.pkg.tar.zst -C $DIR

cp $DIR/usr/src/linux-hardened/.config $DIR/Arch_hardened_x86_64.config
cp $DIR/Arch_hardened_x86_64.config ./hardened_x86_64.config
cp $DIR/Arch_hardened_x86_64.config $SEC_DIR/Archlinux-hardened.config

find src/linux-* -type d -exec cp $SEC_DIR/Archlinux-hardened.config {}/hardened.config \;
