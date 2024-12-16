#!/bin/sh

grep -v "^#" ./Hardened.config | grep -v "^$" >> nocomments.txt
