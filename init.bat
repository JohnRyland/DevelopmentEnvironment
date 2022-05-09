@echo off

powershell -Command "Set-ExecutionPolicy RemoteSigned -scope CurrentUser ; iwr -useb get.scoop.sh | iex"
set PATH=%USERPROFILE%\scoop\shims;%PATH%
cmd.exe /c scoop install git
%USERPROFILE%\scoop\apps\git\current\bin\bash -c ./init.sh
echo Done

%USERPROFILE%\scoop\apps\git\current\git-bash

