@echo off
setlocal enabledelayedexpansion

:: ====================================================
:: Verification des droits administratifs et elevation si necessaire
:: ====================================================
set "IS_ADMIN=0"
openfiles >nul 2>&1 && set "IS_ADMIN=1"

if "%IS_ADMIN%"=="0" (
    echo Ce script doit etre execute en tant qu'administrateur.
    echo Redemarrage du script avec des privileges administratifs...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: ====================================================
:: Variables
:: ====================================================
set "APPDATA_PATH=%userprofile%\AppData\Roaming"
set "LOCALAPPDATA_PATH=%userprofile%\AppData\Local"
set "DOWNLOADS_PATH=%userprofile%\Downloads"
set "OVERWATCH_PATH=%ProgramFiles(x86)%\Overwatch"
set "BATTLE_NET_PATH=%ProgramFiles(x86)%\Battle.net"
set "SETUP_FILE=%DOWNLOADS_PATH%\Battle.net-Setup.exe"
set "DESKTOP_PATH=%userprofile%\Desktop"
set "START_MENU_PATH=%appdata%\Microsoft\Windows\Start Menu\Programs"

:: ====================================================
:: Verification et confirmation
:: ====================================================
echo =========================================
echo Desinstallation d'Overwatch 2 et suppression des fichiers residuels
echo =========================================
echo Ce script va supprimer les fichiers d'Overwatch 2 et de Battle.net ainsi que leurs fichiers residuels.
echo Souhaitez-vous continuer ? (O/N)
set /p CONFIRM="Votre choix : "
if /i not "%CONFIRM%"=="O" (
    echo Annulation de la desinstallation.
    pause
    exit /b
)

:: ====================================================
:: Selection des lecteurs a scanner
:: ====================================================
echo =========================================
echo Selection des lecteurs a scanner pour Overwatch 2 et Battle.net
echo =========================================
echo Entrez les lettres des lecteurs a scanner, separees par des espaces (ex: C D E):
set /p DRIVES="Lecteurs a scanner : "

if "%DRIVES%"=="" (
    echo Aucun lecteur selectionne. Annulation.
    pause
    exit /b
)

:: ====================================================
:: Suppression du fichier Battle.net-Setup.exe s'il existe
:: ====================================================
set /a PROGRESS=10
echo [Progression] Suppression du fichier Battle.net-Setup.exe...
if exist "%SETUP_FILE%" (
    del /q "%SETUP_FILE%"
    echo [##        ] %PROGRESS%%% - Fichier Battle.net-Setup.exe supprime.
) else (
    echo [##        ] %PROGRESS%%% - Le fichier Battle.net-Setup.exe n'existe pas dans le repertoire Telechargements.
)
set /a PROGRESS+=10

:: ====================================================
:: Suppression des fichiers de jeu restants
:: ====================================================
echo [Progression] Suppression du dossier Overwatch...
if exist "%OVERWATCH_PATH%" (
    rd /s /q "%OVERWATCH_PATH%"
    echo [##        ] %PROGRESS%%% - Dossier Overwatch supprime.
) else (
    echo [##        ] %PROGRESS%%% - Le dossier Overwatch n'existe pas.
)
set /a PROGRESS+=10

echo [Progression] Suppression du dossier Battle.net...
if exist "%BATTLE_NET_PATH%" (
    rd /s /q "%BATTLE_NET_PATH%"
    echo [##        ] %PROGRESS%%% - Dossier Battle.net supprime.
) else (
    echo [##        ] %PROGRESS%%% - Le dossier Battle.net n'existe pas.
)
set /a PROGRESS+=10

:: ====================================================
:: Suppression des fichiers de cache et de configuration
:: ====================================================
echo [Progression] Suppression des fichiers de cache et de configuration...
rd /s /q "%LOCALAPPDATA_PATH%\Blizzard" >nul 2>&1
rd /s /q "%APPDATA_PATH%\Blizzard" >nul 2>&1
rd /s /q "%LOCALAPPDATA_PATH%\Battle.net" >nul 2>&1
rd /s /q "%APPDATA_PATH%\Battle.net" >nul 2>&1
set /a PROGRESS+=20
echo [##        ] %PROGRESS%%% - Fichiers de cache et de configuration supprimes.

:: ====================================================
:: Suppression des cles de registre
:: ====================================================
echo [Progression] Suppression des cles de registre...
reg delete "HKEY_CURRENT_USER\Software\Blizzard Entertainment" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Blizzard Entertainment" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Blizzard Entertainment" /f >nul 2>&1
set /a PROGRESS+=20
echo [##        ] %PROGRESS%%% - Cles de registre supprimees.

:: ====================================================
:: Suppression des raccourcis sur le bureau et dans le menu Demarrer
:: ====================================================
echo [Progression] Suppression des raccourcis sur le bureau et dans le menu Demarrer...
for %%R in ("%DESKTOP_PATH%\Overwatch*.lnk" "%DESKTOP_PATH%\Battle.net*.lnk" "%START_MENU_PATH%\Overwatch*.lnk" "%START_MENU_PATH%\Battle.net*.lnk") do (
    if exist %%R (
        del /q %%R
        echo [##        ] Raccourci %%R supprime.
    )
)
set /a PROGRESS+=10
echo [##        ] %PROGRESS%%% - Tous les raccourcis pertinents supprimes.

:: ====================================================
:: Verification finale
:: ====================================================
echo [Progression] Verification finale des traces restantes...
set "FILES_TO_DELETE="
for %%D in (%DRIVES%) do (
    echo [Progression] Verification du lecteur %%D...
    echo Veuillez patienter, une verification est en cours sur le lecteur %%D...
    
    for /f "delims=" %%P in ('dir /s /b /a:d %%D\Overwatch* 2^>nul') do (
        echo [##        ] Trouve : %%P
        set "FILES_TO_DELETE=!FILES_TO_DELETE! %%P"
    )
    for /f "delims=" %%P in ('dir /s /b /a:d %%D\Battle.net* 2^>nul') do (
        echo [##        ] Trouve : %%P
        set "FILES_TO_DELETE=!FILES_TO_DELETE! %%P"
    )
    for /f "delims=" %%P in ('dir /s /b /a:d %%D\Blizzard* 2^>nul') do (
        echo [##        ] Trouve : %%P
        set "FILES_TO_DELETE=!FILES_TO_DELETE! %%P"
    )
)

if not defined FILES_TO_DELETE (
    echo [##        ] Aucun fichier ou dossier trouve sur les lecteurs.
) else (
    echo.
    echo Les fichiers et dossiers suivants ont ete trouves :
    echo !FILES_TO_DELETE!
    echo.
    echo Souhaitez-vous supprimer ces fichiers et dossiers ? (O/N)
    set /p USER_CHOICE="Souhaitez-vous supprimer ces fichiers et dossiers ? Votre choix (O/N) : "
    
    if /i "%USER_CHOICE%"=="O" (
        echo Suppression en cours...
        for %%F in (!FILES_TO_DELETE!) do (
            rd /s /q "%%F"
            echo [##        ] Dossier %%F supprime.
        )
    ) else (
        echo Aucune suppression effectuee.
    )
)

set /a PROGRESS=100
echo [##########] %PROGRESS%%% - Verification terminee.

:: ====================================================
:: Conclusion
:: ====================================================
echo Nettoyage termine.
pause
