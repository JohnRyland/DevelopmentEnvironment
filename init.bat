@echo off
powershell -Command "Set-ExecutionPolicy RemoteSigned -scope CurrentUser ; iwr -useb get.scoop.sh | iex"
set PATH=%USERPROFILE%\scoop\shims;%PATH%
cmd.exe /C scoop install git wget
if not exist "init.sh" wget https://raw.githubusercontent.com/JohnRyland/DevelopmentEnvironment/main/init.sh
cmd.exe /C %USERPROFILE%\scoop\apps\git\current\bin\bash -c ./init.sh
