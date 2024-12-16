#!/bin/sh

dir="./dir-nocomments"

# Hardened.conf
grep -v "^#" ./Hardened.config | grep -v "^$" > $dir/hardened.txt

# Alpine.conf
grep -v "^#" ./Alpinelinux-edge.config | grep -v "^$" > $dir/alpine.txt

# Arch.conf
grep -v "^#" ./Archlinux-hardened.config | grep -v "^$" > $dir/arch.txt
