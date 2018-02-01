#!/bin/bash

echo "Arch Linux Basic Installer Script for Personel Purposes (Lenovo x200)"

mkfs.ext4 /dev/sda1
mkswap /dev/sda2

pacman -Syyu
pacman -S - < programs.both

grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable lightdm.service tlp.service tlp-sleep.service NetworkManager-dispatcher.service
systemctl mask systemd-rfkill.service systemd-rfkill.socket

echo -n "Username:"
read name
useradd -m -g users -G optical,storage,wheel,video,audio,users,power,network,log -s /bin/bash $name

echo "programlar yüklendi, linux-lts'ye geçildi, tlp kuruldu, kullanıcı oluşturuldu."