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


cp -r ~/alsis-devel /mnt

arch-chroot /mnt && {

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

  mkinitcpio -p linux
  grub-mkconfig -o /boot/grub/grub.cfg
  grub-install --recheck /dev/sda

  passwd root

}
