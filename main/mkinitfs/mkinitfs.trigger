#!/bin/sh

CONFIG='/etc/mkinitfs/mkinitfs.conf'
if [ -f "$CONFIG" ]; then
	case "$(. "$CONFIG" >/dev/null; printf %s "$disable_trigger")" in
		yes | YES | true | TRUE | 1) exit 0;;
	esac
fi

for i in "$@"; do
	# get last element in path
	abi_release=${i##*/}

	# Strip version to get flavor name
	# abi_release = $pkgver-$pkgrel-$flavor
	flavor=${abi_release#[0-9]*-}
	flavor=${flavor#[0-9]*-}

	# Remove old files
	rm -f "$i/initramfs-suffix"
	rmdir "$i" 2>/dev/null

	if ! [ -e "/boot/vmlinuz-$flavor" ]; then
		# Kernel removed
		rm -f "/boot/initramfs-$flavor"
		continue
	fi

	if ! [ -d "$i" ]; then
		# upgrading
		continue
	fi

	initramfs="/boot/initramfs-$flavor"
	mkinitfs -o "$initramfs" "$abi_release" || {
		echo "  mkinitfs failed!" >&2
		echo "  your system may not be bootable" >&2
		exit 1
	}
done

# extlinux will use path relative partition, so if /boot is on a
# separate partition we want /boot/<kernel> resolve to /<kernel>
if ! [ -e /boot/boot ]; then
	ln -sf . /boot/boot 2>/dev/null # silence error in case of FAT
fi

# sync only the filesystem on /boot as that is where we are writing the initfs.
sync -f /boot
exit 0
