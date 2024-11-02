# Script de Désinstallation d'Overwatch 2 et Nettoyage Associé

pour les utilisateurs aguerris , vous pouvez utiliser Bulk Crap Uninstaller ;

**le logiciel `Bulk Crap Uninstaller` => https://www.lesnumeriques.com/telecharger/bulk-crap-uninstaller-53124**

un guide débutant à étais mie en place pour les personnes qui voudrais l'utiliser => 

https://github.com/Popolia/ow2_uninstall_cleanup/blob/main/Guide%20D%C3%A9butant%20pour%20Bulk%20Crap%20Uninstaller.pdf

**Désinstallation en masse : **Comme son nom l'indique, BCU permet de désinstaller plusieurs programmes simultanément, ce qui est particulièrement utile si tu souhaites nettoyer ton système.

**Détection automatique :** Il peut détecter automatiquement les logiciels installés, y compris ceux qui ne sont pas visibles dans le panneau de configuration classique de Windows.

**Analyse des fichiers restants :** Après la désinstallation d'un programme, BCU peut scanner le système pour détecter les fichiers et clés de registre laissés par le programme désinstallé, ce qui permet de nettoyer complètement ton système.

**Filtrage et recherche :** Tu peux filtrer les applications par taille, type, ou date d'installation, et rechercher des programmes spécifiques, ce qui facilite la gestion des logiciels installés.

**Options avancées :** Il offre des options pour forcer la désinstallation et gérer les programmes récalcitrants, qui ne se désinstallent pas facilement.

#

pour les utilisateurs classique ce script permet de désinstaller **Blizzard** et **Overwatch 2** (OW2) de votre PC. Veuillez noter que :

- **Seuls** "Battle.net" et "Overwatch 2" seront supprimés.
- **Les autres jeux et applications liés à Blizzard** resteront installés sur votre PC.

## Prérequis

- Pack :

  [![Télécharger le fichier](https://github.com/user-attachments/assets/4c318b41-f48c-4751-8fa6-2265e0156ff1)](https://github.com/Popolia/ow2_uninstall_cleanup.bat/archive/refs/heads/main.zip)

- Il est nécessaire d'utiliser des privilèges administratifs pour exécuter le script.
  (Si vous ne le faites pas, il vous le demandera automatiquement).

- Extraire l'archive.

- Exécuter `ow2_uninstall_cleanup.EXE`.

- Puis exécuter `Supprimer_raccourcis.exe` après avoir terminé avec `ow2_uninstall_cleanup.EXE`.

## Fonctionnalités

1. **Vérification des droits administratifs** : Le script vérifie si l'utilisateur a des privilèges administratifs et redémarre le script avec des droits élevés si nécessaire.
   
2. **Déplacement des fichiers** : Déplace le dossier Overwatch du répertoire "Documents" vers le répertoire "Téléchargements".
   
3. **Suppression des fichiers et dossiers** :
   - Supprime les fichiers d'installation et les dossiers associés à Overwatch 2.
   - Supprime les fichiers de cache et de configuration liés à Blizzard et Battle.net.
   - Supprime les raccourcis liés à Overwatch et Battle.net du bureau et du menu Démarrer.
     
4. **Nettoyage des traces restantes** : Vérifie les lecteurs spécifiés pour tout fichier ou dossier restant associé à Overwatch, Battle.net, ou Blizzard et propose de les supprimer.

## Comment Exécuter le Script

1. **Télécharger le script** : Sauvegardez le code fourni dans un fichier avec l'extension `.bat`, par exemple `uninstall_overwatch.bat`.

2. **Exécuter le script** : 
   - Faites un clic droit sur le fichier `.bat` et sélectionnez "Exécuter en tant qu'administrateur" ou lancez-le directement, il s'adaptera et vous demandera "l'autorisation administrateur".
   - Suivez les instructions à l'écran pour procéder à la désinstallation.

## Instructions

1. **Confirmation** : Le script vous demandera de confirmer si vous souhaitez procéder à la désinstallation.

2. **Sélection des lecteurs** : Vous serez invité à entrer les lettres des lecteurs que vous souhaitez scanner pour détecter les fichiers restants d'Overwatch et de Battle.net.

3. **Progression** : Le script affiche la progression de chaque étape de la désinstallation.

4. **Vérification finale** : Après la suppression des fichiers, le script vérifie les lecteurs spécifiés pour tout fichier ou dossier restant et vous permet de les supprimer si nécessaire.

## Notes

- ⚠️**Sécurité** : Un dossier "parametre" va apparaître dans "Téléchargements", c'est votre dossier "Overwatch" avec vos logs et Settings, etc.⚠️

- **Dépannage** : Si vous rencontrez des problèmes, vérifiez les permissions des dossiers et assurez-vous que vous avez suffisamment d'espace disque.

## Exemple d'Exécution

![image](https://github.com/user-attachments/assets/e606957d-5b02-4393-996d-9b60f6106e6a)
![image](https://github.com/user-attachments/assets/293a8078-5246-4428-8cf0-8769a1783d3b)
![image](https://github.com/user-attachments/assets/c236dfeb-4fdf-418b-ac79-d6bb7fbdcc0a)
![image](https://github.com/user-attachments/assets/68074212-dea1-417f-b4f9-838e8d4e00c3)

