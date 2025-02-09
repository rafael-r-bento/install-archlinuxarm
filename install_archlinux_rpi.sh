#!/bin/bash

device=$1
image="ArchLinuxARM-rpi-armv7-latest.tar.gz"

if [ -z "${device}" ]; then
    echo "Please define device name"
    echo "Usage:"
    echo "    $0 <device>"
    echo
    echo "Example:"
    echo "    $0 sdb"
    exit 1
fi

echo
echo "Going to install Arch Linux (Raspberry Pi Zero 2) on device '/dev/${device}'"
echo
fdisk -l /dev/${device}

echo
echo "All data on this device will be lost!"
echo -n "Do you want to continue? (y/N): "

read confirm

if [ ! "${confirm}" = "y" ]; then
    echo "-- interrupted --"
    exit 2
fi

echo

if [ ! -f "${image}" ]; then
    echo "Downloading latest Raspberry Pi Zero 2 image..."
    wget http://os.archlinuxarm.org/os/${image}
fi

echo "Preparing device..."

umount /dev/${device}1
dd if=/dev/zero of=/dev/${device} bs=8192

echo "Creating partitions..."

(
    echo o;
    echo p;
    echo n;
    echo p;
    echo 1;
    echo ;
    echo +200M;
    echo t;
    echo c;
    echo n;
    echo p;
    echo 2;
    echo ;
    echo ;
    echo w;
) | fdisk /dev/${device}

mkfs.vfat /dev/${device}1
mkdir boot
mount /dev/${device}1 boot
mkfs.ext4 /dev/${device}2
mkdir root
mount /dev/${device}2 root
bsdtar -xpf ${image} -C root

echo "Syncing..."
sync

echo "Move boot files to the first partition"
mv root/boot/* boot

echo "Unmount the two partitions"
umount boot root

echo "Done!"
