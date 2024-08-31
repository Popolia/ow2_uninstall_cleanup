@echo off
echo Désinstallation d'Overwatch 2 et suppression des fichiers résiduels...

:: Variables
setlocal
set "APPDATA_PATH=%userprofile%\AppData\Roaming"
set "LOCALAPPDATA_PATH=%userprofile%\AppData\Local"
set "OVERWATCH_PATH=%ProgramFiles(x86)%\Overwatch"
set "BATTLE_NET_PATH=%ProgramFiles(x86)%\Battle.net"

:: Supprimer les fichiers de jeu restants
if exist "%OVERWATCH_PATH%" (
    echo Suppression du dossier Overwatch...
    rd /s /q "%OVERWATCH_PATH%"
) else (
    echo Le dossier Overwatch n'existe pas.
)

:: Supprimer les fichiers de Battle.net restants
if exist "%BATTLE_NET_PATH%" (
    echo Suppression du dossier Battle.net...
    rd /s /q "%BATTLE_NET_PATH%"
) else (
    echo Le dossier Battle.net n'existe pas.
)

:: Supprimer les fichiers de cache et de configuration
echo Suppression des fichiers de cache et de configuration...
rd /s /q "%LOCALAPPDATA_PATH%\Blizzard"
rd /s /q "%APPDATA_PATH%\Blizzard"
rd /s /q "%LOCALAPPDATA_PATH%\Battle.net"
rd /s /q "%APPDATA_PATH%\Battle.net"

:: Supprimer les entrées du registre
echo Suppression des clés de registre...
reg delete "HKEY_CURRENT_USER\Software\Blizzard Entertainment" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Blizzard Entertainment" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Blizzard Entertainment" /f

echo Nettoyage terminé.
pause
