#!/bin/bash

echo -e '\nWELLCOME TO HERAKLES'
echo -e '\nArch Linux Simple Installer Script for Personel Use (Lenovo x200)'

sudo pacman -Syyu
sudo pacman -S - < programs.both

sudo systemctl enable lightdm.service tlp.service tlp-sleep.service NetworkManager-dispatcher.service
sudo systemctl mask systemd-rfkill.service systemd-rfkill.socket

mkdir /home/$LOGNAME/Belgeler
mkdir /home/$LOGNAME/Resimler
mkdir /home/$LOGNAME/Videolar
mkdir /home/$LOGNAME/Müzikler
mkdir /home/$LOGNAME/İndirilenler
mkdir /home/$LOGNAME/Genel

yaourt -S engrampa-thunar paper-icon-theme-git telegram-desktop-bin spotify mugshot

sudo rm -rf /herakles-master /qwqumC /root/herakles-master /root/qwqumC

echo 'Welldone! ALSIS is completed!'