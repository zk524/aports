#!/bin/sh

for i in "$@"; do
	[ -d "$i" ] || continue
	mkfontdir "$i"
	mkfontscale "$i"
done
