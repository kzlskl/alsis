#!/bin/bash

echo 'WELLCOME TO HERAKLES'
echo 'Arch Linux Simple Installer Scripts for Personel Use (Lenovo x200)'

echo 'If you did not create partitions as sda1=ext4 sda2=swap, stop script with CTRL+C and create partition.'
sleep 6

mkfs.ext4 /dev/sda1
mkswap /dev/sda2

mount /dev/sda1 /mnt
swapon /dev/sda2

pacstrap -i /mnt base base-devel grub
genfstab -L -p /mnt >> /mnt/etc/fstab

echo 'After arch-chroot please run install2.sh'
sleep 3
arch-chroot /mnt
