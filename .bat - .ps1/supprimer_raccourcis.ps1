# Dossiers du menu Démarrer pour l'utilisateur actuel et pour tous les utilisateurs
$startMenuPaths = @(
    "$env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs",
    "C:\ProgramData\Microsoft\Windows\Start Menu\Programs"
)

# Dossiers du Bureau pour l'utilisateur actuel et pour tous les utilisateurs
$desktopPaths = @(
    "$env:USERPROFILE\Desktop",
    "C:\Users\Public\Desktop"
)

# Fonction pour supprimer les raccourcis invalides
function Remove-InvalidShortcuts($paths) {
    foreach ($path in $paths) {
        # Récupère tous les fichiers .lnk (raccourcis) dans les dossiers spécifiés
        $shortcuts = Get-ChildItem -Path $path -Recurse -Filter *.lnk -ErrorAction SilentlyContinue

        foreach ($shortcut in $shortcuts) {
            # Crée un objet COM pour lire les propriétés du raccourci
            $shell = New-Object -ComObject WScript.Shell
            $shortcutObject = $shell.CreateShortcut($shortcut.FullName)
            
            # Vérifie si la cible du raccourci n'est pas vide avant d'utiliser Test-Path
            if (![string]::IsNullOrEmpty($shortcutObject.TargetPath)) {
                if (-not (Test-Path $shortcutObject.TargetPath)) {
                    Write-Host "Le raccourci $($shortcut.FullName) pointe vers un chemin invalide et sera supprimé."
                    
                    # Supprime le raccourci invalide
                    Remove-Item $shortcut.FullName
                }
            } else {
                Write-Host "Le raccourci $($shortcut.FullName) n'a pas de chemin cible valide et sera supprimé."
                Remove-Item $shortcut.FullName
            }
        }
    }
}

# Supprimer les raccourcis invalides dans le menu Démarrer
Remove-InvalidShortcuts $startMenuPaths

# Supprimer les raccourcis invalides sur le bureau
Remove-InvalidShortcuts $desktopPaths

# Supprimer les raccourcis épinglés invalides dans les tuiles du menu démarrer
$taskbarPinnedItems = "$env:APPDATA\Microsoft\Internet Explorer\Quick Launch\User Pinned\StartMenu"

if (Test-Path $taskbarPinnedItems) {
    $pinnedShortcuts = Get-ChildItem -Path $taskbarPinnedItems -Filter *.lnk

    foreach ($pinnedShortcut in $pinnedShortcuts) {
        $pinnedShortcutObject = $shell.CreateShortcut($pinnedShortcut.FullName)

        # Vérifie si la cible existe et n'est pas vide
        if (![string]::IsNullOrEmpty($pinnedShortcutObject.TargetPath) -and -not (Test-Path $pinnedShortcutObject.TargetPath)) {
            Write-Host "Le raccourci épinglé $($pinnedShortcut.FullName) est invalide et sera supprimé."
            
            # Supprime le raccourci épinglé invalide
            Remove-Item $pinnedShortcut.FullName
        }
    }
}
