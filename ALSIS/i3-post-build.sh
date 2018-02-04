#!/bin/bash

echo -e '\nWELLCOME TO ALSIS'
echo -e '\nArch Linux Simple Installer Scripts for Personel Use'
sleep 2

sudo pacman -Syyu
sudo pacman -S - < i3-programs.both

sudo systemctl enable lightdm.service tlp.service tlp-sleep.service NetworkManager-dispatcher.service
sudo systemctl mask systemd-rfkill.service systemd-rfkill.socket

mkdir /home/$LOGNAME/Belgeler
mkdir /home/$LOGNAME/Resimler
mkdir /home/$LOGNAME/Videolar
mkdir /home/$LOGNAME/Müzikler
mkdir /home/$LOGNAME/İndirilenler
mkdir /home/$LOGNAME/Genel

sudo rm -rf /root/herakles-master /root/qwqumC

clear
echo 'Welldone! ALSIS is completed!'