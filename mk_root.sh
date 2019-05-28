#!/bin/sh
set -e

TIMEZONE="Europe/Dublin"
PACKAGES="alpine-base eudev xf86-input-libinput xf86-video-modesetting xorg-server xrandr xdotool xmessage"

if [ "$#" != 3 ]; then
	echo "usage: $0 <target rootfs path> <overlay dir> <mupdf-x11 .apk>" >&2
	exit 1
fi

sudo rm -rf "$1"
PATH=$PATH:/bin sudo ./alpine-make-rootfs \
	--branch edge \
	--packages "$PACKAGES" \
	--timezone "$TIMEZONE" \
	--script-chroot \
	"$1" \
	"./chroot_init_root.sh" \
	"$2" "$3"
