#!/bin/sh

#apk add kernel-hardening-checker

#kernel-hardening-checker -c ./Alpinelinux-edge.config -s ./sysctl -l ./cmdline-x86_64
#kernel-hardening-checker -c ./Archlinux-hardened.config -s ./sysctl -l ./cmdline-x86_64
kernel-hardening-checker -c ./hardened.x86_64.config -s ./sysctl -l ./cmdline-x86_64
#kernel-hardening-checker -c ./Hardened.config -s ./sysctl -l ./cmdline-x86_64

# 			   	 #
# CHECK FAILURES #
# 			   	 #

#kernel-hardening-checker -c ./Hardened.config -s ./sysctl -l ./cmdline-x86_64 | grep "FAIL"
#kernel-hardening-checker -c ../src/linux-6.11/Hardened.config -s ./sysctl -l ./cmdline-x86_64 | grep "FAIL"

#kernel-hardening-checker -c ../src/linux-6.11/bkup.Hardened.config -s ./sysctl -l ./cmdline-x86_64 | grep "FAIL"
#kernel-hardening-checker -c ../src/linux-6.11/bkup2.Hardened.config -s ./sysctl -l ./cmdline-x86_64 | grep "FAIL"
#kernel-hardening-checker -c ../src/linux-6.11/bkup3.Hardened.config -s ./sysctl -l ./cmdline-x86_64 | grep "FAIL"

#apk del kernel-hardening-checker
