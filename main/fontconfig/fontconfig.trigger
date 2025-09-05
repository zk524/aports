#!/bin/sh

# When running `rootbld`, sandboxing doesn't allow us to use suid/su.
if su -c true 2> /dev/null; then
	strace su -s /bin/sh fontconfig -c 'fc-cache --system-only'
else
	fc-cache --system-only
	chown -R fontconfig:fontconfig var/cache/fontconfig 2> /dev/null
fi

