#!/bin/bash

echo -e '\nWELLCOME TO ALSIS'
echo -e '\nArch Linux Simple Installer Scripts for Personel Use'
sleep 2

cfdisk

echo -n "root partition (sda1, sda2 etc.):"
read rootpart

echo -n "swap partition:"
read swappart

mkfs.ext4 /dev/$rootpart
mkswap /dev/$swappart

mount /dev/$rootpart /mnt
swapon /dev/$swappart

cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
rankmirrors -n 6 /etc/pacman.d/mirrorlist.bak > /etc/pacman.d/mirrorlist

pacstrap -i /mnt base base-devel grub
genfstab -L -p /mnt >> /mnt/etc/fstab


cp -r ~/alsis-master /mnt

arch-chroot /mnt
