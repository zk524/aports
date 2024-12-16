#!/bin/sh

install_packages() {
	apk add abuild sudo
}

add_user() {
	adduser -D -H user
	su user
}

install_packages

add_user

sudo -u user ./scripts/compile.sh -v
