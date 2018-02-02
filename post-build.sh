#!/bin/bash

echo -e '\nWELLCOME TO HERAKLES'
echo -e '\nArch Linux Simple Installer Script for Personel Use (Lenovo x200)'

mkdir /home/$LOGNAME/Belgeler
mkdir /home/$LOGNAME/Masaüstü
mkdir /home/$LOGNAME/Resimler
mkdir /home/$LOGNAME/Videolar
mkdir /home/$LOGNAME/Müzikler
mkdir /home/$LOGNAME/İndirilenler
mkdir /home/$LOGNAME/Genel

echo -e -n "\nDO you want to run post-build script? (y/n)"
read answer
if echo "$answer" | grep -iq "^y" ;then
    yaourt -S engrampa-thunar pamac-aur paper-icon-theme-git telegram-desktop-bin spotify mugshot
    mugshot

    sed -i 's\cd /herakles-master\\g' /home/$LOGNAME/.bashrc
    sed -i 's\./post-build.sh\\g' /home/$LOGNAME/.bashrc
    sed -i 's\chmod +x post-build.sh\\g' /home/$LOGNAME/.bashrc
    sudo rm -rf /herakles-master /qwqumC /root/herakles-master /root/qwqumC

else
    sudo rm -rf /herakles-master /qwqumC /root/herakles-master /root/qwqumC

fi

echo 'Welldone! ALSIS is completed!'