# Fedora
Fedora Post-install configuration and applications installation

This space is used for Fedora (updated for Fedora 37) post-install scripts.
1) DNF Configuration
2) RPM Fusion installation
3) Codecs installation
4) Flatpak installation
5) Gnome setup
6) Apps installation


First, we need to execute these commands as root
```
sudo -i
```

DNF Configuration
```
echo "fastestmirror=true" >> /etc/dnf/dnf.conf # Rescan mirrors for fastest pick
echo "max_parallel_downloads=10" >> /etc/dnf/dnf.conf # increase package parallel downloads 
echo "countme=false" >> /etc/dnf/dnf.conf # doesn't count your system in repository statistics
```

# Clean Cache DNF
```
dnf clean all
dnf upgrade -y
```

# Install RPM Fusion
```
dnf install -y --nogpgcheck https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf install -y --nogpgcheck https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf install -y rpmfusion-free-appstream-data rpmfusion-nonfree-appstream-data 
dnf install -y rpmfusion-free-release-tainted rpmfusion-nonfree-release-tainted
```

# Install Codecs
```
dnf install -y gstreamer1-plugins-{base,good,bad-free,good-extras,bad-free-extras,ugly-free} gstreamer1-libav
dnf install -y gstreamer1-plugins-{bad-freeworld,ugly}
dnf install -y libdvdcss
```

# Adding Flatpak
```
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak update
```

# GNOME Setup
```
dnf install -y gnome-packagekit gnome-tweaks gnome-extensions-app gnome-shell-extension-dash-to-dock gnome-shell-extension-appindicator gnome-shell-extension-vitals gnome-shell-extension-bing-wallpaper
```

# Optional - Upgrade your devices firmware
```
fwupdmgr refresh
fwupdmgr get-updates && fwupdmgr update
```

# Optional - Add your favorite apps with RPM & Flatpak

Gaming section
```
sudo dnf install -y steam
sudo dnf install -y discord
sudo dnf install -y lutris
sudo dnf install -y wine # TBC

sudo dnf install ./heroic-*.x86_64.rpm
https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/releases/download/v2.6.2/heroic-2.6.2.x86_64.rpm

sudo flatpak install net.davidotek.pupgui2 # Proton-Up QT
sudo flatpak install info.cemu.Cemu # Cemu Nintendo Wii U emulator
sudo flatpak install org.yuzu_emu.yuzu # Yuzu Nintendo Switch emulator
```

System Utils
```
sudo dnf install -y kdiskmark
sudo dnf install -y cpu-x
sudo flatpak install flathub com.github.tchx84.Flatseal
```


sudo dnf install -y vlc
sudo dnf install -y unzip p7zip p7zip-plugins unrar
sudo dnf install -y libreoffice
sudo flatpak install flathub io.github.mimbrero.WhatsAppDesktop
sudo flatpak install flathub com.spotify.Client
sudo flatpak install flathub com.microsoft.Edge
sudo flatpak install flathub com.bitwarden.desktop
```





