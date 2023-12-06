# Documentation du Jeu de Clic

## Fonctionnalités

### 1. Page d'Accueil - Ressources

Dispose d'une navigation vers la page des recettes et la page inventaire
Affiche les resources à collecter grâce au clic.

- Un clic du bouton correspond à une unité collectée et le total s'affiche dynamiquement dans le widget concerné
- la ressource Charbon est affichée mais n'est pas traitée

### 2. Page Recettes

Affiche toutes les recettes possibles

- Les boutons sont grisés si les ressources nécessaires pour réaliser la recette ne sont pas suffisantes
- par exemple : La Hache (recette modifiée) peut être créé avec 2 bois

### 3. Pages inventaire

- Affiche les recettes réalisées ainsi que leur quantité grâce aux données récupérées de la page Recettes

## Références/Ressources

- Support de cours : pour revoir les bases et les concepte
- Anciens projets Flutter
- Doc Flutter : https://docs.flutter.dev/ : comprendre le fonctionnement de certains widget et leur fonctionnement

## Difficultés

- La gestion de la récupération des données d'une page à une autre grâce au système de Provider

## Choix de design/Implémentation

- Le bouton qui se grise pour une recette qui ne peut pas être produite
- Le bandeau de debug enlevé
- Design simple et basique avec pour la page ressources une grid pour afficher les cards par 4 sur une même ligne

---
