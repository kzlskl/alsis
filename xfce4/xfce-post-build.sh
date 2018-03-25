#!/bin/bash

echo -e '\nWELLCOME TO ALSIS'
echo -e '\nArch Linux Simple Installer Scripts for Personel Use'
sleep 2

git clone https://aur.archlinux.org/trizen-git.git
cd trizen-git
makepkg -si

cd ~

sudo pacman -Syyu
sudo pacman -S - < xfce-programs.both

sudo systemctl enable lightdm.service

sudo systemctl enable tlp.service tlp-sleep.service NetworkManager-dispatcher.service bluetooth.service
sudo systemctl mask systemd-rfkill.service systemd-rfkill.socket

sudo sed -i 's/#greeter-hide-users=false/greeter-hide-users=true/g' /etc/lightdm/lightdm.conf

touch ~/lightdm-gtk-greeter.conf

echo -e '[greeter]\ntheme-name = Adapta-Eta\nicon-name-theme = paper\background = /usr/share/backgrounds/xfce/ondasblue.jpg\nhide-user-image = true' > ~/lightdm-gtk-greeter.conf

sudo rm -rf /etc/lightdm/lightdm-gtk-greeter.conf
sudo cp /home/$LOGNAME/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf

rm -rf ~/lightdm-gtk-greeter.conf

mkdir /home/$LOGNAME/Belgeler
mkdir /home/$LOGNAME/Resimler
mkdir /home/$LOGNAME/Videolar
mkdir /home/$LOGNAME/Müzikler
mkdir /home/$LOGNAME/İndirilenler
mkdir /home/$LOGNAME/Genel

trizen -S engrampa-thunar paper-icon-theme-git mugshot

sudo timedatectl set-ntp true
sudo timedatectl set-timezone Europe/Istanbul

sudo rm -rf ~/alsis-devel ~/DxD14f ~/trizen-git

echo 'Welldone! ALSIS is completed!'
sleep 2
