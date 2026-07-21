#!/usr/bin/env sh

# Exit on unset variables
set -u

LOG_FILE="$HOME/pkg_install.log"
mkdir -p "$(dirname "$LOG_FILE")"

# Package Categorization
sudo dnf copr enable lukenukem/asus-linux -y
sudo dnf copr enable @xlibre/xlibre-xserver -y
UTILS="shadow-utils tailscale supergfxctl tuned nvidia-gpu-firmware"
WM="xlibre-xserver xlibre-xf86-input-libinput xdg-desktop-portal xdg-desktop-portal-gtk slock brightnessctl fcitx5-gtk"
MEDIA="imv mpv obs-studio"
GAME="gamescope mangohud steam lutris" # launch games with `gamescope --mangoapp -W 1920 -H 1080 -r 144 -f -- %command%`
# Merge all into one master list
ALL_PKGS="$UTILS $MEDIA $GAME $WM"

# Execution & Logging
echo "[INFO] Starting installation at $(date)" >> "$LOG_FILE"

if sudo dnf install -y $ALL_PKGS 2>> "$LOG_FILE"; then
    echo "[SUCCESS] All packages checked/installed successfully." | tee -a "$LOG_FILE"
    sudo systemctl enable tailscaled tuned
else
    echo "[ERROR] DNF encountered an error. Check $LOG_FILE for details." >&2
    exit 1
fi
