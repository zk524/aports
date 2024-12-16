#!/bin/sh

COMPILE="abuild -r"
COMPILE_VERBOSE="abuild -r -v"

#COPY_OF_OUTPUT="tee ./scripts/compile-debug.txt"
#COPY_OF_OUTPUT="2>&1 | tee ./scripts/compile-debug.txt"

SIGNED_KEYS="scripts/sign-modules.sh"

gen() {
	# CLEAN ALL SRC
	abuild clean
	# CHECKSUM
	abuild checksum

	# Check if ./certs directory is empty
	if [ -z "$(ls ./certs)" ]; then
		echo "The ./certs directory is empty. Running sign-modules.sh..."
		# Check if $SIGNED_KEYS exists
		if [ -f "$SIGNED_KEYS" ]; then
			"$SIGNED_KEYS"
		else
			echo "Error: $SIGNED_KEYS not found!"
			exit 1
		fi
	else
		echo "The ./certs directory is not empty. Skipping sign-modules.sh."
	fi

	# COPY CERTIFCATES FOR SIGNING MODULES (if you used the sign-modules.sh script)
	find src/linux-* -type d -exec cp ./certs {}/ \;
}

# Remember To Sign Your Own Modules!:
# ./scripts/sign-modules.sh

# NO VERBOSITY
if [ "$1" = "-n" ]; then
	gen
	time $COMPILE 2>&1 | tee ./scripts/compile-debug.txt
	# $COPY_OF_OUTPUT
# ENABLE VERBOSITY
elif [ "$1" = "-v" ]; then
	gen
	time $COMPILE_VERBOSE 2>&1 | tee ./scripts/compile-debug.txt
	# $COPY_OF_OUTPUT
else
	echo "Invalid Command:"
	echo "Please use -n or -v as arguments"
	echo ""
	echo "-n No verbosity"
	echo "-v Enable verbosity"
fi

