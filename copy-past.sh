#!/bin/sh
set -e

IMG="rootfs.img"
SRC="rootfs"
DST="mnt/rootfs"

if [ "$(id -u)" != "0" ]; then
    echo "ERROR: run this script as root (use sudo)"
    exit 1
fi

if [ ! -f "$IMG" ]; then
    echo "ERROR: rootfs.img not found"
    exit 1
fi

if [ ! -d "$SRC" ]; then
    echo "ERROR: source rootfs directory not found"
    exit 1
fi

mkdir -p "$DST"

echo "[+] Mounting rootfs image"
mount -o loop "$IMG" "$DST"

cleanup() {
    echo "[+] Unmounting rootfs image"
    umount "$DST"
}
trap cleanup EXIT INT TERM

echo "[+] Copying rootfs -> image"

rsync -aHAX \
  --one-file-system \
  --delete \
  --exclude=/proc/* \
  --exclude=/sys/* \
  --exclude=/dev/* \
  --exclude=/run/* \
  --exclude=/tmp/* \
  --exclude=/lost+found \
  --exclude=/root/.bash_history \
  "$SRC/" "$DST/"

echo "[+] Recreating runtime directories"
mkdir -p "$DST"/{proc,sys,dev,run,tmp}
chmod 1777 "$DST/tmp"

sync
echo "[✓] Rootfs image updated successfully"

