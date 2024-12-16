#!/bin/sh

# My $WORK_DIRECTORY to copy to repo: https://gitlab.alpinelinux.org/Pursuable1652/linux-hardened
WORK_DIRECTORY="$HOME/mnt"

# From "$WORK_DIRECTORY/alpine-build/aports/main/linux-lts"
LHARDENED_DIR="$WORK_DIRECTORY/alpine-build/linux-hardened/linux-hardened"
LHARDENED_DIR_PUSH="$WORK_DIRECTORY/alpine-build/linux-hardened"
PUSH_SCRIPT_NAME="push-to-repo.sh"

#echo $WORK_DIRECTORY
#echo $LHARDENED_DIR

cp -ra ./000* $LHARDENED_DIR
cp ./APKBUILD $LHARDENED_DIR

cp ./hardened.x86_64.config $LHARDENED_DIR
cp -ra ./sec $LHARDENED_DIR
cp -ra ./virt.x86_64.config $LHARDENED_DIR

# SCRIPTS #
#cp ./scripts/compile-debug.txt $LHARDENED_DIR/scripts
cp ./scripts/README.md $LHARDENED_DIR/scripts
cp ./scripts/setup.sh $LHARDENED_DIR/scripts
cp ./scripts/compile.sh $LHARDENED_DIR/scripts
cp ./scripts/copy-to-linux-hardened.sh $LHARDENED_DIR/scripts
cp ./scripts/install-compile.sh $LHARDENED_DIR/scripts
cp ./scripts/sign-modules.sh $LHARDENED_DIR/scripts
cp ./scripts/update-config.sh $LHARDENED_DIR/scripts
cp ./scripts/update-patch.sh $LHARDENED_DIR/scripts
cp ./scripts/check.sh $LHARDENED_DIR/scripts
cp -ra ./changes $LHARDENED_DIR

cp -ra ./README.md $LHARDENED_DIR

#cp ./.gitlab-ci.yml $LHARDENED_DIR

#echo "Go to $LHARDENED_DIR_PUSH, and run push script"

echo "Merging changes to repo..."
cd $LHARDENED_DIR_PUSH
$LHARDENED_DIR_PUSH/$PUSH_SCRIPT_NAME
