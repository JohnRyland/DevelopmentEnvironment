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
  sudo apt install -y g++ git

  # Install cmake and other tools
  sudo apt install -y ccache cmake python-is-python3

  # Install documentation related tools
  sudo apt install -y doxygen graphviz plantuml ditaa pandoc mactex

  # Install useful utilities
  sudo apt install -y dos2unix
  
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

  # Install cmake and other tools
  brew install ccache cmake python

  # Install documentation related tools
  brew install doxygen graphviz plantuml ditaa pandoc basictex librsvg
  
  # Set python to python3
  brew link python@3.9

  # Install modern ctags version
  brew tap universal-ctags/universal-ctags
  brew install --HEAD universal-ctags

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

  # Update package manager
  scoop update

  # Install cmake and other tools
  scoop install make cmake python

  # Install documentation related tools
  scoop install doxygen graphviz pandoc # TODO: miktex rsvg-convert

  # Install other dev packages
  # scoop bucket add user https://github.com/excitoon/scoop-user.git
  # scoop install user/zlib-dev

  # Configure dot
  dot -c
fi


# Update the git submodules
print_banner "Updating submodules..."
git submodule update --init --recursive


