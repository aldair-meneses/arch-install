#!/bin/bash
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc
sed -i '#en_US.UTF-8/en_US.UTF-8//' /etc/locale.gen
locale-gen
echo "LANG=pt_BR.UTF-8" >> /etc/locale.conf
echo "KEYMAP=br-abnt2" >> /etc/vconsole.conf
echo "arch" >> /etc/hostname
echo "127.0.0.1" >> /etc/hosts
echo "::1" >> /etc/hosts
echo "127.0.0.1 arch.localdomain arch" >> /etc/hosts
#the root password will be called "passroot". choose you root password changing "passroot" in the line below.
echo root:passroot | chpasswd

pacman -S --noconfirm grub efibootmgr networkmanager network-manager-applet wpa_supplicant mtools dosfstools base-devel pipewire pipewire-alsa pipewire-pulse pipewire-jack pavucontrol reflector ntfs-3g os-prober 

#if your graphics card is intel, uncomment the line below
#pacman -S mesa vulkan-intel

#unless that you want use 2D acceleration in Xorg, don't install the `xf86-video-intel`,
#this package is generally not recommended. if you need to, uncomment the line below
#pacman -S xf86-video-intel

#if your graphic card is amd, uncomment the line below
#pacman -S mesa xf86-video-amdgpu vulkan-radeon 

#if your drivers are Nvidia, uncomment the line below 
#pacman -S --noconfirm nvidia nvidia-utils nvidia-settings

#Display manager
#Uncomment the line below to install xorg and Simple Desktop Display Manger(sddm).
#pacman -S xorg xorg-server xorg-drivers mesa libgl sddm

#A display manager is required to use KDE. Uncomment the line below to enable sddm.
#systemctl enable sddm

#Desktop Enviroment: KDE
#Uncomment the line below to install kde and dependencies.
# sudo pacman -S plasma-meta plasma-desktop plasma-wayland-session egl-wayland kde-applications kde-applications-meta

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB

grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable reflector.timer

#be aware that in the next three lines, you can change the 'myusername' and 'mypassword' fields by your preferences
#remember to set '/etc/sudoers.d/myusername' to your username preference
useradd -m myusername
echo myusername:mypassword | chpasswd
echo "myusername ALL=(ALL) ALL" >> /etc/sudoers.d/myusername #change by your username preferences

printf "\033[1;34mThe Installation is done! you can exit now typing CTRL + d to umount the partitions and reboot the system\n\033[m"
printf "\033[1;34mYou can exit now typing CTRL + d then umount the partitions using 'umount -a' and reboot the system\n\033[m"
