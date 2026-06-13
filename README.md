# 🏨 Système de Gestion de Base de Données pour Hôtel

## 📖 Description du Projet
Système de gestion de base de données pour hôtel remplaçant les registres papier et fichiers Excel par une solution centralisée. Il gère les clients, réservations, chambres, paiements et séjours, tout en assurant la cohérence des données grâce à l'analyse MERISE, la modélisation MCD/MLD et l'implémentation SQL.

## 🎯 Objectifs
- Centraliser toutes les données de l'hôtel dans une base relationnelle.
- Éviter les erreurs humaines, les doublons et la perte d'informations.
- Faciliter la recherche et le suivi des disponibilités des chambres en temps réel.
- Générer automatiquement des statistiques et des rapports financiers pour la direction.

## 🛠️ Fonctionnalités Principales (User Stories)
- **Gestion des Clients :** Enregistrement de nouveaux clients et recherche rapide des dossiers existants.
- **Gestion des Chambres :** Suivi rigoureux des statuts (Disponible, Occupée, Maintenance) et mise à jour des prix.
- **Gestion des Réservations :** Création, annulation et suivi des réservations futures associées aux clients et aux chambres.
- **Gestion des Séjours :** Traitement des arrivées (Check-in) et des départs (Check-out).
- **Gestion des Paiements :** Enregistrement des transactions financières et consultation de l'historique par les comptables.
- **Tableau de Bord & Statistiques :** Calcul du chiffre d'affaires total, analyse des réservations par chambre et suivi du nombre total de clients.

## 🗂️ Structure du Répertoire
Ce dépôt contient l'ensemble des livrables du projet, organisés comme suit :

- 📄 **`Analyse et Conception.PDF`** : Le document métier détaillé contenant l'analyse des besoins, les cas d'utilisation, les user stories et les règles de gestion (RG).
- 📄 **`hotel_MCD.pdf`** : Le schéma du Modèle Conceptuel des Données (MCD) exporté pour une lecture rapide.
- 📄 **`hotel_MLD.pdf`** : Le schéma du Modèle Logique des Données (MLD) détaillant les clés primaires (PK) et étrangères (FK).
- 💾 **`hotel_db.sql`** : Le script SQL prêt à l'emploi. Il contient la création de la base de données, la structure des tables et l'insertion d'un jeu de données de test.
- 🔄 **`hotel_db_MCD.loo`** : Le fichier source de la modélisation, modifiable via le logiciel Looping.
- 📝 **`README.md`** : La présente documentation.

## 💻 Technologies et Outils Utilisés
- **SGBD :** MySQL
- **Méthodologie de conception :** MERISE
- **Logiciel de modélisation :** Looping
- **Environnement de développement :** XAMPP / phpMyAdmin

## 🚀 Installation et Déploiement
Pour tester ce projet en local, suivez ces étapes :

1. **Prérequis :** Installez un environnement de serveur local tel que [XAMPP](https://www.apachefriends.org/), WAMP ou Laragon.
2. **Démarrage des services :** Lancez les modules **Apache** et **MySQL**.
3. **Importation de la base de données :**
   - Ouvrez votre interface de gestion (par exemple, phpMyAdmin via `http://localhost/phpmyadmin/`).
   - Allez dans l'onglet **Importer** et sélectionnez le fichier **`hotel_db.sql`**.
   - *Note : Le script se charge de créer automatiquement la base `hotel_db`, de générer les tables et d'insérer des données factices pour les tests.*
4. **Exécution des requêtes :** Vous pouvez désormais tester le système en exécutant des requêtes SQL (`SELECT`, `COUNT`, `SUM`, `JOIN`) pour simuler les actions des réceptionnistes, comptables et directeurs.

---
*Projet réalisé dans le cadre du module d'Analyse, Modélisation et Implémentation d'une Base de Données.*
