
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

Run CMD as administator

Right click the icon, then right click again on 'Command Prompt' in the menu:

![](images/run_cmd_as_admin.png)

and then run:

```
wsl.exe --install
```

![](images/install_wsl.png)

Now update:

```
sudo apt update && sudo apt upgrade
```

![](images/update_wsl.png)


#### Windows Terminal:

Install from windows store from here:  https://aka.ms/terminal


#### Git Bash:

Install latest package from here: https://github.com/git-for-windows/git/releases/latest
eg: https://github.com/git-for-windows/git/releases/download/v2.36.0.windows.1/Git-2.36.0-64-bit.exe


#### VcXsrv:

https://sourceforge.net/projects/vcxsrv/

Install from here https://sourceforge.net/projects/vcxsrv/files/latest/download

After it is installed there should be an icon for running it:

![](images/run_xlaunch.png)

Double-click on the icon, then choose 'Multiple Windows':

![](images/xsrv_multiple_windows.png)

And then choose 'No Client':

![](images/xsrv_no_client.png)

Accept the defaults:

![](images/xsrv_accept_defaults.png)

Now test it works by running the included X apps:

![](images/xsrv_test.png)

Wait a short time, and verify that the apps can run and appear similar to this:

![](images/xsrv_working.png)


### Usage:

To use, from inside of WSL, set the DISPLAY environment variable to 0:0, and then run the X application.

```
DISPLAY=0:0 ./splitview2
```

If it works, the Linux application running inside of WSL will be able to display from the X server running in Windows:

![](images/xsrv_using.png)


