#!/bin/sh

#apk add kernel-hardening-checker

#kernel-hardening-checker -c ./Alpinelinux-edge.config -s ./sysctl -l ./cmdline-x86_64
#kernel-hardening-checker -c ./Archlinux-hardened.config -s ./sysctl -l ./cmdline-x86_64
kernel-hardening-checker -c ./Hardened.config -s ./sysctl -l ./cmdline-x86_64

#apk del kernel-hardening-checker
