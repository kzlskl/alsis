#!/bin/bash

echo 'WELLCOME TO HERAKLES'
echo 'Arch Linux Basic Installer Script for Personel Purposes (Lenovo x200)'

echo 'Disk bölümlerini sda1=ext4 sda2=swap için bölümlendirmediyseniz ctrl+c ile betiği durdurun.'
sleep 6
mkfs.ext4 /dev/sda1
mkswap /dev/sda2

mount /dev/sda1 /mnt
swapon /dev/sda2

pacstrap -i /mnt base base-devel grub
genfstab -L -p /mnt >> /mnt/etc/fstab

echo 'arch-chroot komutundan sonra install2.sh betiğini çalıştırın'
sleep 3
arch-chroot /mnt
