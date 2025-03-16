# sCraft - Système de Craft pour FiveM

## Description
sCraft est un système de craft avancé pour FiveM permettant aux joueurs de créer des objets à partir de ressources. Il propose deux types de craft :

- Craft Personnel : Accessible à tous les joueurs via une touche configurable (par défaut 'C')
- Craft Métier : Points de craft spécifiques aux différents métiers

## Fonctionnalités

- Interface utilisateur intuitive et responsive
- Système de catégories pour organiser les crafts
- Vérification des ressources nécessaires
- Animations pendant le craft
- Temps de fabrication configurables
- Support multilingue (FR par défaut)
- Intégration avec ESX

## Configuration

### Craft Personnel
Le craft personnel se configure dans `sh.lua` via les variables :
- `PersonalCraftItems` : Liste des items craftables
- `PersonalCategories` : Catégories disponibles
- `personalCraftTitle` : Titre du menu

### Craft Whitelist job et non whitelist
Les crafts métiers se configurent dans `sh.lua` via la table `JobsCraftItems` avec :
- Position du point de craft
- Liste des items craftables
- Catégories spécifiques au métier
- Titre personnalisé


## Installation

1. Placer le dossier `sCraft` dans le dossier `resources`
2. Ajouter `ensure sCraft` dans le `server.cfg`
3. Configurer les items et catégories dans `sh.lua`
4. Redémarrer le serveur

## Dépendances

- es_extended

## Support

Pour toute question ou problème, merci de me MP sayroo8
