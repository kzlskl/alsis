#!/bin/bash

echo 'WELLCOME TO HERAKLES'
echo 'Arch Linux Basic Builder Script for Personel Purposes (Lenovo x200)'
sleep 3

echo -n "Username:"
read name
useradd -m -g users -G optical,storage,wheel,video,audio,users,power,network,log -s /bin/bash $name
passwd $name

mkdir /home/$name/Belgeler
mkdir /home/$name/Masaüstü
mkdir /home/$name/Resimler
mkdir /home/$name/Videolar
mkdir /home/$name/Müzikler
mkdir /home/$name/İndirilenler
mkdir /home/$name/Genel


echo "$name ALL=(ALL) ALL" >> /etc/sudoers

echo -e '[archlinuxfr] \nSigLevel = Never \nServer = http://repo.archlinux.fr/$arch' >> /etc/pacman.conf
echo -e '[multilib] \nInclude = /etc/pacman.d/mirrorlist' >> /etc/pacman.conf

pacman -Syyu
pacman -S - < programs.both

grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable lightdm.service tlp.service tlp-sleep.service NetworkManager-dispatcher.service
systemctl mask systemd-rfkill.service systemd-rfkill.socket

touch /etc/X11/xorg.conf.d/20-keyboard.conf
echo -e 'Section "InputClass" \n\tIdentifier "keyboard" \n\tMatchIsKeyboard "yes" \n\tOption "XkbLayout" "tr" \nEndSection' >> /etc/X11/xorg.conf.d/20-keyboard.conf

echo 'DONE!'
sleep 1