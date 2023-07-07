#!/bin/bash

function install_apps
{
  echo '~~~~~~~~~~~~~~~'
  echo 'Installing apps'
  echo '~~~~~~~~~~~~~~~'

  sudo apt install -y gnome-tweaks gnome-shell-extensions vim git
  sudo snap install spotify
  sudo snap install code --classic
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo apt install ./google-chrome-stable_current_amd64.deb
  rm -rf google-chrome-stable_current_amd64.deb 
  sudo apt install -y chrome-gnome-shell
}

function install_macos_theme
{
  echo '~~~~~~~~~~~~~~~~~~~~~~'
  echo 'Installing macOS theme'
  echo '~~~~~~~~~~~~~~~~~~~~~~'

  git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git
  cd WhiteSur-gtk-theme
  ./install.sh -t all -N glassy -s 220
  sudo ./tweaks.sh -g
  cd ..
  rm -rf WhiteSur-gtk-theme

  git clone https://github.com/vinceliuice/WhiteSur-wallpapers.git
  cd WhiteSur-wallpapers
  ./install-wallpapers.sh
  cd ..
  rm -rf WhiteSur-wallpapers
 
  git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git 
  cd WhiteSur-icon-theme
  ./install.sh
  cd ..
  rm -rf WhiteSur-icon-theme
}

function apply_settings
{
  echo '~~~~~~~~~~~~~~~~~'
  echo 'Applying settings'
  echo '~~~~~~~~~~~~~~~~~'

  # Light/Dark options
  THEME="WhiteSur-Dark"        # "WhiteSur-Light"
  ICONS="WhiteSur-dark"        # "WhiteSur"
  BACKGROUND="WhiteSur-light"  # "WhiteSur-dark"

  BGFILE="file:///home/${USER}/.local/share/backgrounds/${BACKGROUND}.png"

  gsettings set org.gnome.desktop.wm.preferences titlebar-font "Umpush Bold 10"
  gsettings set org.gnome.desktop.wm.preferences button-layout "close,minimize,maximize:"
  gsettings set org.gnome.desktop.interface gtk-theme "${THEME}"
  gsettings set org.gnome.desktop.interface icon-theme "${ICONS}"
  gsettings set org.gnome.desktop.interface font-name "Umpush 10"
  gsettings set org.gnome.desktop.interface document-font-name "Umpush Light 10"
  gsettings set org.gnome.desktop.interface font-antialiasing "rgba"
  gsettings set org.gnome.desktop.interface font-hinting "full"
  gsettings set org.gnome.desktop.interface clock-show-weekday true
  gsettings set org.gnome.desktop.interface clock-show-date true
  gsettings set org.gnome.desktop.interface clock-show-seconds true
  gsettings set org.gnome.desktop.screensaver picture-uri "${BGFILE}"
  gsettings set org.gnome.desktop.background picture-uri "${BGFILE}"
  gsettings set org.gnome.desktop.background picture-uri-dark "${BGFILE}"
  gsettings set org.gnome.shell disable-user-extensions false
  gsettings set org.gnome.shell enabled-extensions "['user-theme@gnome-shell-extensions.gcampax.github.com', 'ubuntu-dock@ubuntu.com']"
  gsettings set org.gnome.shell.extensions.user-theme name "${THEME}"
  gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
  gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
  gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode FIXED
  gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 48
  gsettings set org.gnome.shell.extensions.dash-to-dock unity-backlit-items false
  gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed true
  gsettings set org.gnome.shell.extensions.dash-to-dock apply-custom-theme true
  gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-shrink true
  gsettings set org.gnome.shell.extensions.dash-to-dock click-action focus-minimize-or-previews
  gsettings set org.gnome.shell.extensions.ding show-home false
  gsettings set org.gnome.shell.extensions.ding show-trash true
  gsettings set org.gnome.shell.extensions.ding show-volumes true
  gsettings set org.gnome.shell.extensions.ding show-network-volumes true
}

function arrange_icons
{
  echo '~~~~~~~~~~~~~~~'
  echo 'Arranging Icons'
  echo '~~~~~~~~~~~~~~~'

  gsettings set org.gnome.desktop.app-folders folder-children "['Utilities', '126f0765-f14b-49fe-bcf5-0216a3bbd2f3', '1aca16ad-a710-495d-a59b-2d877ccd0405', '17af666f-e467-4db1-b319-7d85f3581262']"
  gsettings set org.gnome.shell favorite-apps "['google-chrome.desktop', 'thunderbird.desktop', 'org.gnome.Nautilus.desktop', 'libreoffice-writer.desktop', 'spotify_spotify.desktop', 'shotwell.desktop', 'org.gnome.Terminal.desktop', 'gnome-control-center.desktop', 'snap-store_ubuntu-software.desktop']"
  gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/Utilities/ apps "['org.gnome.tweaks.desktop', 'nm-connection-editor.desktop', 'org.gnome.baobab.desktop', 'org.gnome.DejaDup.desktop', 'org.gnome.DiskUtility.desktop', 'org.gnome.eog.desktop', 'org.gnome.Evince.desktop', 'org.gnome.FileRoller.desktop', 'org.gnome.seahorse.Application.desktop', 'software-properties-drivers.desktop', 'gnome-language-selector.desktop', 'usb-creator-gtk.desktop', 'update-manager.desktop', 'software-properties-gtk.desktop', 'gnome-session-properties.desktop', 'org.gnome.Logs.desktop', 'org.gnome.Characters.desktop', 'org.gnome.font-viewer.desktop']"
  gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/126f0765-f14b-49fe-bcf5-0216a3bbd2f3/ name "Office"
  gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/126f0765-f14b-49fe-bcf5-0216a3bbd2f3/ apps "['libreoffice-startcenter.desktop', 'libreoffice-draw.desktop', 'libreoffice-calc.desktop', 'libreoffice-impress.desktop', 'libreoffice-math.desktop']"
  gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/1aca16ad-a710-495d-a59b-2d877ccd0405/ name "Graphics"
  gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/1aca16ad-a710-495d-a59b-2d877ccd0405/ apps "['org.inkscape.Inkscape.desktop', 'gimp.desktop', 'org.kde.krita.desktop', 'display-im6.q16.desktop']"
  gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/17af666f-e467-4db1-b319-7d85f3581262/ name "Games"
  gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/17af666f-e467-4db1-b319-7d85f3581262/ apps "['org.gnome.Mines.desktop', 'sol.desktop', 'org.gnome.Sudoku.desktop', 'org.gnome.Mahjongg.desktop']"
  gsettings set org.gnome.shell app-picker-layout "[{'Utilities': <{'position': <0>}>, '126f0765-f14b-49fe-bcf5-0216a3bbd2f3': <{'position': <1>}>, '1aca16ad-a710-495d-a59b-2d877ccd0405': <{'position': <2>}>, '17af666f-e467-4db1-b319-7d85f3581262': <{'position': <3>}>}]"
}

# # Commands for tweaking and debugging settings
# dconf watch /
# dconf-editor
# gnome-tweaks
# google-chrome extensions.gnome.org

sudo apt -y update

install_apps
install_macos_theme
apply_settings
arrange_icons

sudo apt autoremove -y
