#!/bin/bash

echo -e '\nWELLCOME TO ALSIS'
echo -e '\nArch Linux Simple Installer Scripts for Personel Use'
sleep 2

nmtui

cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
rankmirrors -n 6 /etc/pacman.d/mirrorlist.bak > /etc/pacman.d/mirrorlist

pacman -S xorg-server xorg-xinit mesa alsa-lib alsa-utils gamin

echo -n "Username:"
read name
useradd -m -g users -G optical,storage,wheel,video,audio,users,power,network,log -s /bin/bash $name
passwd $name

echo "$name ALL=(ALL) ALL" >> /etc/sudoers

echo -e '\n[multilib] \nInclude = /etc/pacman.d/mirrorlist' >> /etc/pacman.conf
echo -e '\n[archlinuxfr] \nSigLevel = Never \nServer = http://repo.archlinux.fr/$arch' >> /etc/pacman.conf

touch /etc/X11/xorg.conf.d/20-keyboard.conf
echo -e 'Section "InputClass" \n\tIdentifier "keyboard" \n\tMatchIsKeyboard "yes" \n\tOption "XkbLayout" "tr" \nEndSection' >> /etc/X11/xorg.conf.d/20-keyboard.conf

clear
echo -e 'DONE! \nAfter reboot, login your accont and run ./xfce-post-build.sh. \nAfter using script will remove all ALSIS files.'