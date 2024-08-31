Ce script est conçu pour supprimer complètement Overwatch 2 et tous les fichiers associés sur votre système, ainsi que pour nettoyer les configurations et caches liés à Blizzard et Battle.net

 ⚠️Apres avoir utiliser le .bat  , un redémarrage n'est pas strictement nécessaire, mais il peut être bénéfique pour assurer que toutes les modifications ont été correctement appliquées,
 
Assurez-vous également de sauvegarder toute donnée importante avant de lancer le script (sensibilité ,audio ,.....), au cas où vous auriez besoin de ces fichiers à l'avenir.⚠️

En résumé, ce script est conçu pour supprimer complètement Overwatch 2 et tous les fichiers associés sur votre système, ainsi que pour nettoyer les configurations et caches liés à Blizzard et Battle.net. Assurez-vous de sauvegarder toute donnée importante avant de lancer le script, au cas où vous auriez besoin de ces fichiers à l'avenir.

Ce que fait le Script:

Déclaration des Variables :

        APPDATA_PATH et LOCALAPPDATA_PATH : Définissent les chemins pour les dossiers de configuration utilisateur.
        OVERWATCH_PATH : Spécifie le chemin d'installation d'Overwatch 2.
        BATTLE_NET_PATH : Spécifie le chemin d'installation de Battle.net (le client de Blizzard).

Suppression des Dossiers de Jeu :

        Overwatch 2 :

        if exist "%OVERWATCH_PATH%" (
    echo Suppression du dossier Overwatch...
    rd /s /q "%OVERWATCH_PATH%") else (
    echo Le dossier Overwatch n'existe pas.)

Cette partie vérifie si le dossier d'installation d'Overwatch 2 existe. Si c'est le cas, il supprime le dossier et tout son contenu. Sinon, il affiche un message indiquant que le dossier n'existe pas.

Battle.net :

    if exist "%BATTLE_NET_PATH%" (
        echo Suppression du dossier Battle.net...
        rd /s /q "%BATTLE_NET_PATH%"
    ) else (
        echo Le dossier Battle.net n'existe pas.
    )
 
Cette partie vérifie si le dossier d'installation de Battle.net existe. Si c'est le cas, il supprime le dossier et tout son contenu. Sinon, il affiche un message indiquant que le dossier n'existe pas.

Suppression des Fichiers de Cache et de Configuration :

    Blizzard dans LOCALAPPDATA et APPDATA :
    echo Suppression des fichiers de cache et de configuration...
    rd /s /q "%LOCALAPPDATA_PATH%\Blizzard"
    rd /s /q "%APPDATA_PATH%\Blizzard"

Ces lignes suppriment les dossiers Blizzard dans les répertoires Local et Roaming. Ces dossiers contiennent les fichiers de configuration et les caches liés à Blizzard et à ses jeux.

Battle.net dans LOCALAPPDATA et APPDATA :

    rd /s /q "%LOCALAPPDATA_PATH%\Battle.net"
    rd /s /q "%APPDATA_PATH%\Battle.net"
  
Ces lignes suppriment les dossiers Battle.net dans les répertoires Local et Roaming. Ces dossiers contiennent les paramètres et les fichiers de cache du client Battle.net.

Affichage du Message de Fin :

    echo Nettoyage terminé.
    pause

Cette partie affiche un message indiquant que le nettoyage est terminé et met en pause le script pour que vous puissiez voir le message avant que la fenêtre de commande ne se ferme.

PAth:

Avertissement et Instructions :

    Ajout d’un avertissement avant la suppression, pour rappeler à l’utilisateur de sauvegarder les données importantes et mentionner que le redémarrage peut être utile mais n'est pas strictement nécessaire.

Suppression des Clés de Registre :

    Les commandes reg delete sont ajoutées pour supprimer les clés de registre spécifiques. Les redirections >nul 2>&1 cachent les messages de succès ou d'erreur pour une sortie plus propre.

Nettoyage des Messages :

    Ajout d'un message de fin et pause pour permettre à l'utilisateur de voir que le script a terminé son exécution.

Ce que le Script Supprime :

    Dossiers d'Installation :
        Overwatch 2 : Supprime le dossier d'installation principal du jeu.
        Battle.net : Supprime le client Battle.net et ses fichiers d'installation (si présents).
        Suppression des Clés de Registre

    Fichiers de Configuration et de Cache :
        Supprime les dossiers contenant les fichiers de configuration et de cache pour Blizzard et Battle.net. Cela peut inclure les paramètres personnels du jeu, les fichiers de configuration utilisateur, et les données temporaires stockées par ces applications.

Ce que le Script NE Supprime PAS :

    Données de Compte :
        Les informations de compte Blizzard ne sont pas affectées, car elles sont stockées sur les serveurs Blizzard.

    Fichiers Non Connexes :
        Le script ne supprime pas les fichiers et dossiers liés à d'autres programmes ou jeux, ni les fichiers personnels de l'utilisateur.
