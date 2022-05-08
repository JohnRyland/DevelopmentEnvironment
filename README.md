
# Setting up a development environment

Set up for a development environment on different platforms


There is an init.sh script here that can detect the platform and install the
various packages. On Linux and macOS, the script can run natively. On Windows
the script however requires a shell to be installed first. The recommended
shell for this is git-bash. It is also assumed that for each platform, git
has been installed.

Once a shell/terminal program has been installed, then run this:

```
./init.sh
```

For manual installation of other tools:


## Windows 10

### Recommended Tools:

 - WSL2
 - Windows Terminal
 - Git Bash
 - VcXsrv

### Installation of these Tools:


#### WSL2:

Run CMD as administator, and then run:

```
wsl.exe --install
```


#### Windows Terminal:

Install from windows store from here:  https://aka.ms/terminal


#### Git Bash:

Install latest package from here: https://github.com/git-for-windows/git/releases/latest
eg: https://github.com/git-for-windows/git/releases/download/v2.36.0.windows.1/Git-2.36.0-64-bit.exe


#### VcXsrv:

https://sourceforge.net/projects/vcxsrv/

Install from here https://sourceforge.net/projects/vcxsrv/files/latest/download


### Usage:

To use, from inside of WSL, set the DISPLAY environment variable to 0:0, and then run the X application.

```
DISPLAY=0:0 ./splitview2
```

