#!/bin/bash

echo -e '\nWELLCOME TO ALSIS'
echo -e '\nArch Linux Simple Installer Scripts for Personel Use'
sleep 2

sudo pacman -Syyu
sudo pacman -S - < xfce-programs.both

sed -i 's/#greeter-hide-users=false/greeter-hide-users=true/g' /etc/lightdm/lightdm.conf

sudo systemctl enable lightdm.service tlp.service tlp-sleep.service NetworkManager-dispatcher.service
sudo systemctl mask systemd-rfkill.service systemd-rfkill.socket

mkdir /home/$LOGNAME/Belgeler
mkdir /home/$LOGNAME/Resimler
mkdir /home/$LOGNAME/Videolar
mkdir /home/$LOGNAME/Müzikler
mkdir /home/$LOGNAME/İndirilenler
mkdir /home/$LOGNAME/Genel

yaourt -S engrampa-thunar paper-icon-theme-git telegram-desktop-bin spotify mugshot

sudo rm -rf /root/alsis-master /root/XfFpPK

clear
echo 'Welldone! ALSIS is completed!'
sleep 2