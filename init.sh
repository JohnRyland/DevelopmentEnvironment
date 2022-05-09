#!/bin/bash

# Setup development environment (supports macOS, Ubuntu in WSL and git-bash on Windows 10)

function print_banner()
{
  echo "==================================="
  echo "${@}"
  echo "==================================="
}

print_banner "Installing dependancies..."


# Assuming Linux is a deb/ubuntu based system, and X11 DISPLAY setup assumes WSL.
# Tested with Ubuntu 20.04 in WSL. Not tested on native Linux host.
if [ `uname` == "Linux" ]
then
  # Install required packages
  sudo apt-get update -y

  # Essentials
  sudo apt install -y make g++ git

  # Code quality tools
  sudo apt install -y cppcheck clang-format clang-tidy gcovr

  # Install cmake and other tools
  sudo apt install -y ccache cmake python-is-python3

  # Install documentation related tools
  sudo apt install -y doxygen graphviz plantuml ditaa pandoc mactex librsvg2-bin

  # Install useful utilities
  sudo apt install -y dos2unix sqlite sqlitebrowser universal-ctags
  
  # Install X11 dev packages
  sudo apt install -y x11-apps x11-xserver-utils libx11-dev libxrandr-dev libxinerama-dev libxcursor-dev libxi-dev
  
  # Install other dev packages
  sudo apt install -y zlib1g-dev freeglut3-dev

  # Update symlinks
  sudo /usr/sbin/update-ccache-symlinks
   
  # Prepend ccache into the PATH
  echo 'export PATH="/usr/lib/ccache:$PATH"' | tee -a ~/.bashrc
  
  # Set DISPLAY so it can connect to X server in the WSL host
  if grep -c WSL /proc/sys/kernel/osrelease &> /dev/null ; then
    echo 'export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '\''{print $2}'\''):0.0' | tee -a ~/.bashrc
  fi
fi


# Assuming macOS, installs brew if it is not found
if [ `uname` == "Darwin" ]
then
  # Install required packages - get brew package manager
  if ! which -s brew ; then
    # Install brew if it is not already installed
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  fi

  # Update package manager
  brew update

  # Essentials
  brew install make gcc git

  # Code quality tools
  brew install cppcheck clang-format gcovr

  # Install cmake and other tools
  brew install ccache cmake python

  # Install documentation related tools
  brew install doxygen graphviz plantuml ditaa pandoc basictex librsvg

  # Install useful utilities
  brew install dos2unix sqlite db-browser-for-sqlite universal-ctags
  
  # Set python to python3
  brew link python@3.9

  # For doc generation
  pip install pandoc-latex-environment
fi


# Assuming running this in a git-bash shell on Windows 10, installs scoop as a package manager to get dependancies.
if [ "$(expr substr $(uname) 1 15)" == "MINGW64_NT-10.0" ]
then
  # Install required packages - get scoop package manager
  powershell -Command "Set-ExecutionPolicy RemoteSigned -scope CurrentUser ; iwr -useb get.scoop.sh | iex"
  if ! echo $PATH | grep -c scoop/shims &> /dev/null ; then
    # Add scoop to path
    export PATH="~/scoop/shims/:$PATH"
    echo 'export PATH="~/scoop/shims/:$PATH"' | tee -a ~/.bash_profile
  fi

  # Add searching for extra packages
  scoop bucket add extras

  # Formula for rsvg-convert
  scoop bucket add pomberger_pom https://github.com/pomberger/pom

  # Update package manager
  scoop update

  # Essentials
  scoop install make mingw git

  # Code quality tools
  scoop install cppcheck
     # clang-format clang-tidy gcovr   are missing from scoop

  # Install cmake and other tools
  scoop install ccache cmake python

  # Install documentation related tools
  scoop install doxygen graphviz plantuml pandoc miktex rsvg-convert
     # ditaa    is missing from scoop

  # Install useful utilities
  scoop install dos2unix sqlite sqlitebrowser universal-ctags

  # Install more tools
  scoop install ffmpeg jq neovim rust wget 

  # Various desktop applications
  # scoop install windows-terminal github vscode libreoffice inkscape gimp vcxsrv vlc sourcetree notepadplusplus obs-studio putty cdburnerxp clion crystaldiskinfo crystaldiskmark debugviewpp depends geekbench godot spacesniffer googlechrome handbrake hwinfo inno-setup irfanview kodi magicavoxel makemkv meld mqtt-spy msiafterburner skype
 
  # Mostly already available through git-bash, seems installing the git package will install git-for-windows
  # scoop install busybox curl grep gzip tar unzip which diffutils

  # TODO: should try to install just mingw and git on a fresh windows install and see how
  #       many commands that makes available without installing specifically the other commands

  # Other possible packages
  # scoop install llvm binutils cscope gcc gdb msys


  # Install other dev packages
  # scoop bucket add user https://github.com/excitoon/scoop-user.git
  # scoop install user/zlib-dev

  # Configure dot
  dot -c
fi


# Update the git submodules
print_banner "Updating submodules..."
git submodule update --init --recursive


