sudo mount rootfs.img mnt/rootfs/
sudo cp -r rootfs/* mnt/rootfs/
sudo sync
sudo umount mnt/rootfs/