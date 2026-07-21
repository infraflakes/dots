Format drives n files, mount /mnt and /mnt/boot/efi

```bash
chimera-bootstrap /mnt
genfstab -U /mnt >> /mnt/etc/fstab
```

```bash
chimera-chroot /mnt
```

```bash
passwd
useradd -m -G wheel nixuris
passwd nixuris
```

```bash
apk add linux-stable neovim networkmanager systemd-boot chimera-repo-user
apk update
apk add fish-shell curl wget zip unzip git xdg-utils brightnessctl tailscale unzip zip imv mpv obs-studio fcitx5-gtk power-profiles-daemon
```

```bash
wget -O /etc/apk/keys/builduser-68fcd79c.rsa.pub https://xlibre-alpine.github.io/website/main/builduser-68fcd79c.rsa.pub
echo "https://xlibre-alpine.github.io/website/chimera/main" >> /etc/apk/repositories
apk update
apk add xserver-xlibre
```

```bash
nvim /etc/hostname
ln -sf /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime
echo localtime > /etc/hwclock
```

```bash
update-initramfs -c -k all
bootctl install
gen-systemd-boot
```

When boot in:

```bash
doas dinitctl enable networkmanager
doas dinitctl enable tailscaled
doas dinitctl enable power-profiles-daemon
```
