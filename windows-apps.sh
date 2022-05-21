#!/bin/bash

# Add buckets
scoop bucket add versions
scoop bucket add games

# Gaming
scoop install minecraft steam dosbox

# Various common desktop applications
scoop install clover libreoffice inkscape gimp vlc notepadplusplus cdburnerxp spacesniffer googlechrome irfanview skype telegram brave zoom slack thunderbird

# Various developer tools
scoop install github vscode clion sourcetree putty depends debugviewpp meld mqtt-spy inno-setup arduino docker cutter qt-creator

# Media and 3D tools
# scoop install obs-studio godot kodi msiafterburner makemkv magicavoxel handbrake autohotkey openshot plex-desktop plex-server plex-desktop

# Benchmarking and diagnostics tools
scoop install crystaldiskinfo crystaldiskmark geekbench hwinfo        

# Utilities
scoop install vncviewer transmission

# Some random buckets can support these:
#  docker-desktop bitcoin-core epicgameslauncher origin
