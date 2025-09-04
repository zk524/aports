#!/bin/sh
# Adapted from https://github.com/chimera-linux/cports/blob/10967d6/main/sd-tools/sd-tools.trigger

# invoking sysusers is always harmless
sd-sysusers

# always create/remove/set
sd-tmpfiles --create --remove
