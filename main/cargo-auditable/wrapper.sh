#!/bin/sh

# to be used with maturin, for example,
#
# CARGO=/usr/libexec/cargo-auditable-wrapper maturin build

exec "${REAL_CARGO:=/usr/bin/cargo}" auditable "$@"
