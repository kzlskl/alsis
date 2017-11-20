#!/bin/bash

Echo "Arch Linux Basic Program Installer Script for Personel Purposes (Lenovo x200)"

pacman -S xfce4 xfce4-goodies vlc audacious firefox firefox-i18n-tr thunderbird thunderbird-i18n-tr pavucontrol network-manager-applet ntfs-3g engrampa unrar unzip zip p7zip exfat-utils lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings light-locker cups cups-pdf system-config-printer print-manager foomatic-db foomatic-db-nonfree-ppds foomatic-db-ppds arc-gtk-theme numix-gtk-theme pulseaudio pulseaudio-equalizer audacity gtk-recordmydesktop soundconverter gnome-disk-utility evince transmission-gtk pidgin libreoffice-still libreoffice-still-tr gparted dconf-editor thunar-archive-plugin gvfs intel-ucode xf86-video-intel

systemctl enable lightdm.service
