#!/bin/bash

echo -e '\nWELLCOME TO ALSIS'
echo -e '\nArch Linux Simple Installer Scripts for Personel Use'
sleep 2

sudo pacman -Syyu
sudo pacman -S - < i3-programs.both

sudo systemctl enable tlp.service tlp-sleep.service NetworkManager-dispatcher.service
sudo systemctl mask systemd-rfkill.service systemd-rfkill.socket

mkdir /home/$LOGNAME/Belgeler
mkdir /home/$LOGNAME/Resimler
mkdir /home/$LOGNAME/Videolar
mkdir /home/$LOGNAME/Müzikler
mkdir /home/$LOGNAME/İndirilenler
mkdir /home/$LOGNAME/Genel

touch /home/$LOGNAME/.xinitrc
echo -e 'exec i3' >> /home/$LOGNAME/.xinitrc

cp /etc/xdg/termite/config ~/.config/termite/config

sudo rm -rf /root/alsis-master /root/XfFpPK

clear
echo -e 'Welldone! ALSIS is completed! \nUse starx for open i3'
sleep 2