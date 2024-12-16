About this repo
----

It is a port from Arch Linux Hardened Kernel package to Alpine Linux


Useful scripts in the ./scripts directory!
----

compile.sh - compile kernel, sign (if no keys in ./certs directory)

install-compile.sh - install the kernel (only after you compiled linux-kernel)

update-config.sh - update config from downloading Arch Linux package, extracting it, and placing it to ./sec/hardened.x86_64.config

compile-debug.txt - when you run compile.sh, it will output compile-debug.txt to look back at the printed lines from compiling

copy-to-linux-hardened.sh - to copy linux-lts to linux-hardened

sign-modules.sh - put and generate signed keys into ./certs

update-patch.sh - update the patch file from anthraxx's github release

setup.sh - apk install abuild and sudo, make a user named "user", and run "compile.sh" (this is for the ci/cd for gitlab.alpinelinux.org repo)

check.sh - check if the compile is done and if it put the package in the ~/packages/main/x86_64/ folder
