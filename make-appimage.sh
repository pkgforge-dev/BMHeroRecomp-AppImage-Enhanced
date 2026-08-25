#!/bin/sh

set -eu

ARCH=$(uname -m)
export ARCH
export OUTPATH=./dist
export ADD_HOOKS="self-updater.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=https://raw.githubusercontent.com/RevoSucks/BMHeroRecomp/refs/heads/master/icons/app.png
export DESKTOP=https://raw.githubusercontent.com/RevoSucks/BMHeroRecomp/refs/heads/master/.github/linux/BMHeroRecompiled.desktop
export STARTUPWMCLASS=BMHeroRecompiled
export DEPLOY_GTK=1
export GTK_DIR=gtk-3.0
export DEPLOY_VULKAN=1

# Deploy dependencies
quick-sharun ./AppDir/bin/BMHeroRecompiled
echo 'SHARUN_WORKING_DIR=${SHARUN_DIR}/bin' >> ./AppDir/.env

# Turn AppDir into AppImage
quick-sharun --make-appimage
