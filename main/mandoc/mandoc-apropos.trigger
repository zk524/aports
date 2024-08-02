#!/bin/sh

echo "> indexing manuals (this may take a while)" >&2
exec /usr/sbin/makewhatis -T utf8
