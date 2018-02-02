#!/bin/bash

echo 'WELLCOME TO HERAKLES'
echo 'Arch Linux Simple Installer Scripts for Personel Use (Lenovo x200)'
sleep 2

echo -n "hostname:"
read hostname
echo $hostname > /etc/hostname

pacman -S networkmanager
systemctl enable NetworkManager.service

echo -e "KEYMAP=trq \nFONT=iso09.16" >> /etc/vconsole.conf

echo 'LANG=tr_TR.UTF-8' >> /etc/locale.conf
echo -e 'tr_TR.UTF-8 UTF-8 \ntr_TR ISO-8859-9' >> /etc/locale.gen
locale-gen

mkinitcpio -p linux
grub-mkconfig -o /boot/grub/grub.cfg
grub-install --recheck /dev/sda

passwd root

echo 'DONE! umount /mnt and reboot. After reboot please run "build.sh"'
sleep 2
exit 0
exit