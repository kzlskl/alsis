#!/bin/bash

echo -e '\nWELLCOME TO ALSIS'
echo -e '\nArch Linux Simple Installer Scripts for Personel Use'
sleep 2

echo -n "hostname:"
read hostname
echo $hostname > /etc/hostname

pacman -S networkmanager
systemctl enable NetworkManager.service

echo -e "KEYMAP=trq \nFONT=iso09.16" >> /etc/vconsole.conf

echo 'LANG=tr_TR.UTF-8' >> /etc/locale.conf
sed -i 's/#tr_TR.UTF-8 UTF-8/tr_TR.UTF-8 UTF-8/g' /etc/locale.gen
sed -i 's/#tr_TR ISO-8859-9/tr_TR ISO-8859-9/g' /etc/locale.gen
locale-gen

timedatectl set-ntp true
timedatectl set-timezone Europe/Istanbul

mkinitcpio -p linux
grub-mkconfig -o /boot/grub/grub.cfg
grub-install --recheck /dev/sda

passwd root

clear
echo 'DONE! umount /mnt and reboot. After reboot please run "build.sh"'
