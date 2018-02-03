#!/bin/bash

echo -e '\nWELLCOME TO HERAKLES'
echo -e '\nArch Linux Simple Installer Scripts for Personel Use (Lenovo x200)'
sleep 3

echo -n "Username:"
read name
useradd -m -g users -G optical,storage,wheel,video,audio,users,power,network,log -s /bin/bash $name
passwd $name

echo "$name ALL=(ALL) ALL" >> /etc/sudoers

echo -e '\n[multilib] \nInclude = /etc/pacman.d/mirrorlist' >> /etc/pacman.conf
echo -e '\n[archlinuxfr] \nSigLevel = Never \nServer = http://repo.archlinux.fr/$arch' >> /etc/pacman.conf

touch /etc/X11/xorg.conf.d/20-keyboard.conf
echo -e 'Section "InputClass" \n\tIdentifier "keyboard" \n\tMatchIsKeyboard "yes" \n\tOption "XkbLayout" "tr" \nEndSection' >> /etc/X11/xorg.conf.d/20-keyboard.conf

sed -i 's/#greeter-hide-users=false/greeter-hide-users=true/g' /etc/lightdm/lightdm.conf

#echo -e '\ncd /herakles-master \nsudo chmod +x post-build.sh \n./post-build.sh' >> /home/$name/.bashrc

echo -e 'DONE! \nAfter reboot, login your accont and run ./post-build.sh. \nAfter using script will remove all ALSIS files.'
sleep 1