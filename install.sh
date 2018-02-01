#!/bin/bash
echo 'Welcome to HERAKLES'
echo 'Arch Linux Basic Installer Script for Personel Purposes (Lenovo x200)'

echo 'Disk bölümlerini sda1=ext4 sda2=swap için bölümlendirmediyseniz ctrl+c ile betiği durdurun.'
sleep 10
mkfs.ext4 /dev/sda1
mkswap /dev/sda2

mount /dev/sda1 /mnt
swapon /dev/sda2

pacstrap -i /mnt base base-devel grub
genfstab -L -p /mnt >> /mnt/etc/fstab

arch-chroot /mnt

echo herakles > /etc/hostname

pacman -S networkmanager
systemctl enable NetworkManager.service

echo KEYMAP=trq >> /etc/vconsole.conf
echo FONT=iso09.16 >> /etc/vconsole.conf
echo LANG=tr_TR.UTF-8 >> /etc/locale.conf
echo Europe/Istanbul >> /etc/timezone
echo tr_tr.UTF-8 UTF-8 >> /etc/locale.gen
echo tr_TR ISO-8859-9 >> /etc/locale.gen
locale-gen

mkinitcpio -p linux
grub-mkconfig -o /boot/grub/grub.cfg
grub-install --recheck /dev/sda

passwd root

echo 'DONE! Computer will reboot. After reboot please run "build.sh"'
sleep 5
exit
umount /mnt
reboot