Ce script est conçu pour supprimer complètement Overwatch 2 et tous les fichiers associés sur votre système, ainsi que pour nettoyer les configurations et caches liés à Blizzard et Battle.net

 ⚠️Apres avoir utiliser le .bat  , un redémarrage n'est pas strictement nécessaire, mais il peut être bénéfique pour assurer que toutes les modifications ont été correctement appliquées,
 
Assurez-vous également de sauvegarder toute donnée importante avant de lancer le script (sensibilité ,audio ,.....), au cas où vous auriez besoin de ces fichiers à l'avenir.⚠️

En résumé, ce script est conçu pour supprimer complètement Overwatch 2 et tous les fichiers associés sur votre système, ainsi que pour nettoyer les configurations et caches liés à Blizzard et Battle.net. Assurez-vous de sauvegarder toute donnée importante avant de lancer le script, au cas où vous auriez besoin de ces fichiers à l'avenir.

Ce que fait le Script:

Résumé du Script Original

Le script Batch est conçu pour désinstaller Overwatch 2 et supprimer les fichiers et les entrées de registre associées. Voici ce qu'il fait :

    Définition des Variables :
        Définit les chemins des dossiers et fichiers à supprimer (Overwatch, Battle.net, et les fichiers de cache et de configuration).

    Suppression des Dossiers de Jeu :
        Supprime les dossiers de Overwatch et Battle.net s'ils existent.

    Suppression des Fichiers de Cache et de Configuration :
        Supprime les dossiers de cache et de configuration pour Blizzard et Battle.net dans AppData et LocalAppData.

    Suppression des Clés de Registre :
        Supprime les clés de registre liées à Blizzard Entertainment pour nettoyer les informations de configuration persistantes.

    Affichage de la Confirmation :
        Affiche "Nettoyage terminé." et met en pause l'exécution pour que l'utilisateur puisse voir les messages.

Résumé des Modifications Apportées

    Messages d'Erreur pour la Suppression des Dossiers :
        Modification : Ajout de messages d'erreur après chaque tentative de suppression de dossier pour indiquer si la suppression a échoué. Les lignes modifiées sont :

        batch

    rd /s /q "%OVERWATCH_PATH%" || echo Échec de la suppression du dossier Overwatch.
    rd /s /q "%BATTLE_NET_PATH%" || echo Échec de la suppression du dossier Battle.net.
    rd /s /q "%LOCALAPPDATA_PATH%\Blizzard" || echo Échec de la suppression du dossier Blizzard dans LocalAppData.
    rd /s /q "%APPDATA_PATH%\Blizzard" || echo Échec de la suppression du dossier Blizzard dans AppData.
    rd /s /q "%LOCALAPPDATA_PATH%\Battle.net" || echo Échec de la suppression du dossier Battle.net dans LocalAppData.
    rd /s /q "%APPDATA_PATH%\Battle.net" || echo Échec de la suppression du dossier Battle.net dans AppData.

Messages d'Erreur pour la Suppression des Clés de Registre :

    Modification : Ajout de messages d'erreur après chaque tentative de suppression de clé de registre pour indiquer si la suppression a échoué. Les lignes modifiées sont :

    batch

        reg delete "HKEY_CURRENT_USER\Software\Blizzard Entertainment" /f || echo Échec de la suppression de la clé de registre HKEY_CURRENT_USER\Software\Blizzard Entertainment.
        reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Blizzard Entertainment" /f || echo Échec de la suppression de la clé de registre HKEY_LOCAL_MACHINE\SOFTWARE\Blizzard Entertainment.
        reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Blizzard Entertainment" /f || echo Échec de la suppression de la clé de registre HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Blizzard Entertainment.

But des Modifications

    Améliorer le Diagnostic : Fournir des messages d'erreur détaillés pour aider à identifier les problèmes si une opération échoue.
    Assurer une Exécution Robuste : S'assurer que le script donne un retour d'information utile et précis en cas d'erreurs lors de la suppression des fichiers et des clés de registre.
