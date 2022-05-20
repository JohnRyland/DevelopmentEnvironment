@echo off

rem For Windows 10 1709, needed to do this, however I think the better idea is to update windows, keep checking and installing updates until it is past 1709
rem powershell -Command "[Net.ServicePointManager]::SecurityProtocol = 'Tls, Tls11, Tls12, Ssl3' ; Set-ExecutionPolicy RemoteSigned -scope CurrentUser ; iwr -useb get.scoop.sh | iex"

powershell -Command "Set-ExecutionPolicy RemoteSigned -scope CurrentUser ; iwr -useb get.scoop.sh | iex"

set PATH=%USERPROFILE%\scoop\shims;%PATH%
cmd.exe /c scoop install git wget
if not exist "init.sh" wget https://raw.githubusercontent.com/JohnRyland/DevelopmentEnvironment/main/init.sh

rem %USERPROFILE%\scoop\apps\git\current\bin\bash -c ./init.sh
rem echo Done

echo.
echo *********************************************
echo   Please now run ./init.sh in the terminal
echo *********************************************
echo.

rem Show a shell when done
%USERPROFILE%\scoop\apps\git\current\git-bash
