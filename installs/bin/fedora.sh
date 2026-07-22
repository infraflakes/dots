#!/usr/bin/env sh

# Exit on unset variables
set -u

LOG_FILE="$HOME/pkg_install.log"
mkdir -p "$(dirname "$LOG_FILE")"

# Package Categorization
sudo dnf copr enable lukenukem/asus-linux -y
sudo dnf copr enable @xlibre/xlibre-xserver -y
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
UTILS="git podman openssh-server shadow-utils tailscale supergfxctl tuned nvidia-gpu-firmware akmod-nvidia xorg-x11-drv-nvidia-cuda" # only nvidia-gpu-firmware if using nvk
WM="xdg-utils xlibre-xserver xlibre-xf86-input-libinput slock brightnessctl fcitx5-gtk"
MEDIA="firefox imv mpv obs-studio"
GAME="gamescope mangohud steam lutris" # launch games with `gamescope --mangoapp -W 1920 -H 1080 -r 144 -f -- %command%`
# Merge all into one master list
ALL_PKGS="$UTILS $MEDIA $GAME $WM"

# Execution & Logging
echo "[INFO] Starting installation at $(date)" >> "$LOG_FILE"

if sudo dnf install -y $ALL_PKGS 2>> "$LOG_FILE"; then
    echo "[SUCCESS] All packages checked/installed successfully." | tee -a "$LOG_FILE"
    sudo systemctl enable tailscaled tuned sshd
else
    echo "[ERROR] DNF encountered an error. Check $LOG_FILE for details." >&2
    exit 1
fi
