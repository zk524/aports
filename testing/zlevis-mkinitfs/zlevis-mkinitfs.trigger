#!/bin/sh

target_file="/usr/share/mkinitfs/initramfs-init"
archive_file="/usr/share/zlevis-mkinitfs/initramfs-init"

if [ -f "$target_file" ]; then
	cp "$archive_file" "$target_file"
fi
