#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

dnf5 remove -y \
  default-editor \
  nano \
  nano-default-editor \
  vim-minimal \
  vim-enhanced \
  vim-data \
  ptyxis

# this installs a package from fedora repos


# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package

dnf5 -y copr enable ublue-os/packages
dnf5 -y copr enable ublue-os/staging

dnf5 -y install bazaar

# setup hyprland from COPR
dnf5 -y copr enable solopasha/hyprland
dnf5 -y install			\
	hyprland			\
	hyprpaper			\
	hyprpicker			\
	hypridle			\
	hyprlock			\
	hyprsunset			\
	hyprpolkitagent		\
	hyprsysteminfo		\
	qt6ct-kde			\
	hyprland-qt-support	\
	hyprland-qtutils
dnf5 -y copr disable solopasha/hyprland

# more desktop-environment utils
dnf5 -y install			\
	tmux			\
	micro			\
	kitty			\
	sddm			\
	pipewire		\
 	waybar			\
	wofi			\
	brightnessctl

# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging
dnf5 -y copr disable ublue-os/packages
dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket
