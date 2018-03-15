#!/bin/bash

echo -e '\nWELLCOME TO ALSIS'
echo -e '\nArch Linux Simple Installer Scripts for Personel Use'
sleep 2
echo -e '\nIf you did not change the script, you have to create home, root, boot and swap partition.'
sleep 4

cfdisk

echo -n "boot partition (sda1, sda2 etc.):"
read bootpart

echo -n "root partition (sda1, sda2 etc.):"
read rootpart

echo -n "home partition (sda1, sda2 etc.):"
read homepart

echo -n "swap partition (sda1, sda2 etc.):"
read swappart

echo -n "Hostname:"
read hostname

echo -n "Username:"
read name

mkfs.ext4 /dev/$rootpart
mkfs.ext4 /dev/$homepart
mkfs.ext4 /dev/$bootpart
mkswap /dev/$swappart

mount /dev/$rootpart /mnt
mkdir /mnt/home
mkdir /mnt/boot
mount /dev/$homepart /mnt/home
mount /dev/$bootpart /mnt/boot
swapon /dev/$swappart

echo -e '\nThis may take 10 minutes...'
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
rankmirrors -n 6 /etc/pacman.d/mirrorlist.bak > /etc/pacman.d/mirrorlist

pacstrap /mnt base base-devel grub
genfstab -L -p /mnt >> /mnt/etc/fstab

cat << EOF | arch-chroot /mnt
  echo $hostname > /etc/hostname
  pacman -Syy --noconfirm networkmanager xorg-server xorg-xinit mesa alsa-lib alsa-utils gamin
  systemctl enable NetworkManager.service
  echo -e "KEYMAP=trq \nFONT=iso09.16" >> /etc/vconsole.conf
  echo 'LANG=tr_TR.UTF-8' >> /etc/locale.conf
  sed -i 's/#tr_TR.UTF-8 UTF-8/tr_TR.UTF-8 UTF-8/g' /etc/locale.gen
  sed -i 's/#tr_TR ISO-8859-9/tr_TR ISO-8859-9/g' /etc/locale.gen
  locale-gen
  mkinitcpio -p linux
  grub-mkconfig -o /boot/grub/grub.cfg
  grub-install --recheck /dev/sda

  useradd -m -g users -G optical,storage,wheel,video,audio,users,power,network,log -s /bin/bash $name

  echo "$name ALL=(ALL) ALL" >> /etc/sudoers

  echo -e '\n[multilib] \nInclude = /etc/pacman.d/mirrorlist' >> /etc/pacman.conf
  echo -e '\n[archlinuxfr] \nSigLevel = Never \nServer = http://repo.archlinux.fr/$arch' >> /etc/pacman.conf

  touch /etc/X11/xorg.conf.d/20-keyboard.conf
  echo -e 'Section "InputClass" \n\tIdentifier "keyboard" \n\tMatchIsKeyboard "yes" \n\tOption "XkbLayout" "tr" \nEndSection' >> /etc/X11/xorg.conf.d/20-keyboard.conf

  timedatectl set-ntp true
  timedatectl set-timezone Europe/Istanbul
  EOF

  passwd -R /mnt $name
  passwd -R /mnt root

  echo -e '\nDone!'
