#!/bin/sh
set -e

IMG="rootfs.img"
DIR="rootfs"
MNT="mnt/rootfs"

require_root() {
    if [ "$(id -u)" != "0" ]; then
        echo "ERROR: run as root (sudo)"
        exit 1
    fi
}

mount_img() {
    mkdir -p "$MNT"
    mount -o loop "$IMG" "$MNT"
}

umount_img() {
    umount "$MNT"
}

rsync_rootfs() {
    SRC="$1"
    DST="$2"

    echo "[+] Syncing $SRC -> $DST"

    rsync -aHAX \
        --one-file-system \
        --delete \
        --numeric-ids \
        --exclude=/proc/* \
        --exclude=/sys/* \
        --exclude=/dev/* \
        --exclude=/run/* \
        --exclude=/tmp/* \
        --exclude=/lost+found \
        --exclude=/root/.bash_history \
        "$SRC/" "$DST/"

    mkdir -p "$DST"/{proc,sys,dev,run,tmp}
    chmod 1777 "$DST/tmp"
}

require_root

echo "Choose operation:"
echo "1) rootfs  -> rootfs.img  (normal)"
echo "2) rootfs.img -> rootfs  (reverse)"
echo -n "> "
read choice

case "$choice" in
    1)
        [ -f "$IMG" ] || { echo "ERROR: $IMG not found"; exit 1; }
        [ -d "$DIR" ] || { echo "ERROR: $DIR not found"; exit 1; }

        echo "[+] Mounting image"
        mount_img
        trap umount_img EXIT INT TERM

        rsync_rootfs "$DIR" "$MNT"
        sync
        echo "[✓] rootfs → image complete"
        ;;

    2)
        [ -f "$IMG" ] || { echo "ERROR: $IMG not found"; exit 1; }

        echo "[+] Mounting image"
        mount_img
        trap umount_img EXIT INT TERM

        mkdir -p "$DIR"
        rsync_rootfs "$MNT" "$DIR"
        sync
        echo "[✓] image → rootfs complete"
        ;;

    *)
        echo "Invalid option"
        exit 1
        ;;
esac
