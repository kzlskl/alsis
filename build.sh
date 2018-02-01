#!/bin/bash

echo 'WELLCOME TO HERAKLES'
echo 'Arch Linux Basic Builder Script for Personel Purposes (Lenovo x200)'
sleep 3

echo -n "Username:"
read name
useradd -m -g users -G optical,storage,wheel,video,audio,users,power,network,log -s /bin/bash $name

echo $name ALL=(ALL) ALL >> /etc/sudoers
echo [archlinuxfr] >> /etc/pacman.conf
echo SigLevel = Never >> /etc/pacman.conf
echo Server = http://repo.archlinux.fr/$arch >> /etc/pacman.conf
echo [multilib] >> /etc/pacman.conf
echo Include = /etc/pacman.d/mirrorlist >> /etc/pacman.conf

pacman -Syyu
pacman -S - < programs.both

grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable lightdm.service tlp.service tlp-sleep.service NetworkManager-dispatcher.service
systemctl mask systemd-rfkill.service systemd-rfkill.socket

echo Section "InputClass" >> /etc/X11/xorg.conf.d/20-keyboard.conf
echo    Identifier "keyboard" >> /etc/X11/xorg.conf.d/20-keyboard.conf
echo    MatchIsKeyboard "yes" >> /etc/X11/xorg.conf.d/20-keyboard.conf
echo    Option "XkbLayout" "tr" >> /etc/X11/xorg.conf.d/20-keyboard.conf
echo EndSection >> /etc/X11/xorg.conf.d/20-keyboard.conf

echo "programlar yüklendi, linux-lts'ye geçildi, tlp kuruldu, kullanıcı oluşturuldu."