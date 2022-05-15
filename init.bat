@echo off

powershell -Command "[Net.ServicePointManager]::SecurityProtocol = 'Tls, Tls11, Tls12, Ssl3' ; Set-ExecutionPolicy RemoteSigned -scope CurrentUser ; iwr -useb get.scoop.sh | iex"
if not exist "init.sh" powershell -Command "[Net.ServicePointManager]::SecurityProtocol = 'Tls, Tls11, Tls12, Ssl3' ; iwr -useb https://raw.githubusercontent.com/JohnRyland/DevelopmentEnvironment/main/init.sh"

set PATH=%USERPROFILE%\scoop\shims;%PATH%
cmd.exe /c scoop install git
%USERPROFILE%\scoop\apps\git\current\bin\bash -c ./init.sh
echo Done

rem Show a shell when done
%USERPROFILE%\scoop\apps\git\current\git-bash
