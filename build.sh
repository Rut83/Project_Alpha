#!/bin/bash
set -e

# Configuration
KERNEL_BIN="linux/arch/x86_64/boot/bzImage"
ROOTFS_IMG="rootfs.img"
ISO_DIR="iso_root"
INITRAM_DIR="initramfs_root"

echo "--- Starting Project Alpha Build ---"

# 1. Clean up old builds
sudo rm -rf $ISO_DIR $INITRAM_DIR
mkdir -p $ISO_DIR/boot/grub $INITRAM_DIR

# 2. Mount and Extract RootFS
mkdir -p mnt/rootfs
sudo mount -o loop $ROOTFS_IMG mnt/rootfs
sudo cp -a mnt/rootfs/* $INITRAM_DIR/
sudo umount mnt/rootfs

# 4. Pack Initramfs
echo "Packing initramfs..."
cd $INITRAM_DIR
find . -print0 | sudo cpio --null -ov --format=newc | gzip -9 > ../initrd.img
cd ..

# 5. Build ISO
echo "Generating ISO..."
cp $KERNEL_BIN $ISO_DIR/boot/vmlinuz
cp initrd.img $ISO_DIR/boot/initrd.img
cp src/grub.cfg $ISO_DIR/boot/grub/grub.cfg
grub2-mkrescue -o ProjectAlpha.iso $ISO_DIR

echo "--- Build Complete: ProjectAlpha.iso is ready ---"
