Format drives n files, mount /mnt and /mnt/boot/efi

```
chimera-bootstrap /mnt
genfstab -U /mnt >> /mnt/etc/fstab
```

```
chimera-chroot /mnt
```

```
passwd
useradd -m -G wheel nixuris
passwd nixuris
```

```
apk add linux-stable neovim networkmanager systemd-boot chimera-repo-user
apk update
apk add fish-shell curl wget zip unzip
```

```
nvim /etc/hostname
ln -sf /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime
echo localtime > /etc/hwclock
```

```
update-initramfs -c -k all
bootctl install
gen-systemd-boot
```

When boot in:

```
doas dinitctl enable networkmanager
```
