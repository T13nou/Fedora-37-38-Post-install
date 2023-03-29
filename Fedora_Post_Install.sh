#!/bin/bash
sudo -i
echo "fastestmirror=true" >> /etc/dnf/dnf.conf # Rescan mirrors for fastest pick
echo "max_parallel_downloads=10" >> /etc/dnf/dnf.conf # increase package parallel downloads 
echo "countme=false" >> /etc/dnf/dnf.conf # doesn't count your system in repository statistics
dnf clean all
dnf upgrade -y
dnf install -y --nogpgcheck https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf install -y --nogpgcheck https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf install -y rpmfusion-free-appstream-data rpmfusion-nonfree-appstream-data 
dnf install -y rpmfusion-free-release-tainted rpmfusion-nonfree-release-tainted

dnf install -y gstreamer1-plugins-{base,good,bad-free,good-extras,bad-free-extras,ugly-free} gstreamer1-libav
dnf install -y gstreamer1-plugins-{bad-freeworld,ugly}
dnf install -y libdvdcss

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak update

dnf install -y libgtop2-devel lm_sensors # Necessary dependancies for Vitals Gnome extension
sudo flatpak install -y org.gnome.Extensions
dnf install -y gnome-packagekit gnome-tweaks gnome-extensions-app gnome-shell-extension-dash-to-dock gnome-shell-extension-appindicator
gsettings set org.gnome.desktop.wm.preferences button-layout 'menu:minimize,maximize,close' # Add Mnimize, Maximize and Close buttons to windows

sudo dnf install -y steam
sudo dnf install -y discord
sudo dnf install -y lutris
sudo dnf install -y wine # TBC
wget -c https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/releases/download/v2.6.2/heroic-2.6.2.x86_64.rpm
sudo dnf install -y ./heroic-*.x86_64.rpm
sudo flatpak -y install net.davidotek.pupgui2 # Proton-Up QT
sudo flatpak -y install info.cemu.Cemu # Cemu Nintendo Wii U emulator
sudo flatpak -y install org.yuzu_emu.yuzu # Yuzu Nintendo Switch emulator

sudo dnf install -y kdiskmark
sudo dnf install -y cpu-x
sudo flatpak -y install flathub com.github.tchx84.Flatseal

sudo dnf install -y vlc
sudo dnf install -y unzip p7zip p7zip-plugins unrar
sudo dnf install -y libreoffice
sudo flatpak -y install flathub io.github.mimbrero.WhatsAppDesktop
sudo flatpak -y install flathub com.spotify.Client
sudo flatpak -y install flathub com.microsoft.Edge
sudo flatpak -y install flathub com.bitwarden.desktop
