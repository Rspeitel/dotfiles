
Need to install dhcpcd to get internet on reboot. 

Partions (cfdisk): 
Main boot partion 10GB (mkfs.ext4, mount /dev/sda1 /mnt)
Swap partition 2GB (mkswap, swapon /dev/sda2)
Home partition 8GB (mkfs.ext4, mount /dev/sda3 /mnt/home)

pacstrap /mnt base linux linux-firmware

Normal Stuff:
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
pacman -S neovim dhcpcd grub os-prober
systemctl enable dhcpcd
ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
hwclock --systohc
(Modify /etc/locale.gen and uncomment en_US.UTF-8 UTF-8) locale-gen
Setup /etc/hosts
passwd

Boot installed using: 
grub-install /dev/sda
grub-mkconfig –o /boot/grub/grub.cfg
