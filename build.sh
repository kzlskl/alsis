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

pacman -Syyu
pacman -S - < programs.both

systemctl enable lightdm.service tlp.service tlp-sleep.service NetworkManager-dispatcher.service
systemctl mask systemd-rfkill.service systemd-rfkill.socket

touch /etc/X11/xorg.conf.d/20-keyboard.conf
echo -e 'Section "InputClass" \n\tIdentifier "keyboard" \n\tMatchIsKeyboard "yes" \n\tOption "XkbLayout" "tr" \nEndSection' >> /etc/X11/xorg.conf.d/20-keyboard.conf

sed -i 's/#greeter-hide-users=false/greeter-hide-users=true/g' /etc/lightdm/lightdm.conf

echo -e '\ncd /herakles-master \nchmod +x post-build.sh \n./post-build.sh' >> /home/$name/.bashrc

echo -e 'DONE! \nAfter reboot, login your accont and open terminal, follow the script. You have just one chance for use this script. \nAfter use or ignore, script will remove all HERAKLES files.'
sleep 1