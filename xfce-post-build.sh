#!/bin/bash

echo -e '\nWELLCOME TO ALSIS'
echo -e '\nArch Linux Simple Installer Scripts for Personel Use'
sleep 2

sudo pacman -Syyu
sudo pacman -S - < xfce-programs.both

sudo systemctl enable lightdm.service tlp.service tlp-sleep.service NetworkManager-dispatcher.service
sudo systemctl mask systemd-rfkill.service systemd-rfkill.socket

sudo sed -i 's/#greeter-hide-users=false/greeter-hide-users=true/g' /etc/lightdm/lightdm.conf

sudo echo -e '[greeter]\ntheme-name = Adapta-Eta\nicon-name-theme = paper\background = /usr/share/backgrounds/xfce/ondasblue.jpg\nhide-user-image = true' > /etc/lightdm/lightdm-gtk-greeter.conf

mkdir /home/$LOGNAME/Belgeler
mkdir /home/$LOGNAME/Resimler
mkdir /home/$LOGNAME/Videolar
mkdir /home/$LOGNAME/Müzikler
mkdir /home/$LOGNAME/İndirilenler
mkdir /home/$LOGNAME/Genel

yaourt -S engrampa-thunar paper-icon-theme-git mugshot

sudo rm -rf /alsis-devel 

clear
echo 'Welldone! ALSIS is completed!'
sleep 2