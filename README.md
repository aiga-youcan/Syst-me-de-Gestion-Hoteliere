🏨 Système de Gestion Hôtelière
👨‍💻 Réalisé par : Rida Sabrar
📌 1. Présentation du projet

Ce projet est un système de gestion hôtelière basé sur une base de données relationnelle MySQL.

Il permet de gérer :

Clients
Chambres
Réservations
Séjours
Paiements

🎯 Objectif : remplacer la gestion manuelle par une base centralisée, fiable et rapide.

🎯 2. Objectifs du système
Centraliser les données
Éviter les doublons
Gérer les réservations facilement
Suivre les paiements
Générer des statistiques

👥 3. Acteurs du système
Acteur	Rôle
Réceptionniste	Gérer clients, chambres, réservations
Comptable	Gérer paiements
Directeur	Voir statistiques
Client	Faire réservation

📌 4. User Stories
👤 Clients
US01 : Ajouter un client
US02 : Consulter un client
🛏️ Chambres
US03 : Voir chambres disponibles
US04 : Ajouter/modifier chambre
📅 Réservations
US05 : Créer réservation
US06 : Annuler réservation
US07 : Voir réservations
🏨 Séjours
US08 : Check-in client
US09 : Check-out client
💰 Paiements
US10 : Ajouter paiement
US11 : Voir historique
📊 Statistiques
US12 : Nombre de réservations
US13 : Chiffre d’affaires

⚙️ 5. Règles de gestion
Un client peut avoir plusieurs réservations
Une réservation appartient à un seul client
Une chambre peut être réservée plusieurs fois (dates différentes)
Une réservation concerne une seule chambre
Une réservation peut avoir plusieurs paiements
Un séjour est lié à une réservation
Une chambre a un statut : Disponible / Occupée / Maintenance

🧱 6. Modèle Conceptuel (MCD)
Entités :
CLIENT
CHAMBRE
RESERVATION
SEJOUR
PAIEMENT
Relations :
CLIENT (1,N) → RESERVATION
CHAMBRE (1,N) → RESERVATION
RESERVATION (1,1) → SEJOUR
RESERVATION (1,N) → PAIEMENT

🧾 7. Modèle Logique (MLD)
CLIENT(
id_client PK,
nom,
prenom,
telephone,
email
);

CHAMBRE(
id_chambre PK,
numero,
type,
prix_nuit,
statut
);

RESERVATION(
id_reservation PK,
date_reservation,
date_arrivee,
date_depart,
statut,
id_client FK,
id_chambre FK
);

SEJOUR(
id_sejour PK,
date_checkin,
date_checkout,
id_reservation FK UNIQUE
);

PAIEMENT(
id_paiement PK,
date_paiement,
montant,
mode_paiement,
id_reservation FK
);

🗄️ 8. Création base de données
CREATE DATABASE hotel_db;
USE hotel_db;

🏗️ 9. Création des tables
CREATE TABLE client (
id_client INT AUTO_INCREMENT PRIMARY KEY,
nom VARCHAR(50),
prenom VARCHAR(50),
telephone VARCHAR(20) UNIQUE,
email VARCHAR(100) UNIQUE
);

CREATE TABLE chambre (
id_chambre INT AUTO_INCREMENT PRIMARY KEY,
numero VARCHAR(10) UNIQUE,
type VARCHAR(30),
prix_nuit DECIMAL(10,2),
statut ENUM('Disponible','Occupée','Maintenance') DEFAULT 'Disponible'
);

CREATE TABLE reservation (
id_reservation INT AUTO_INCREMENT PRIMARY KEY,
date_reservation DATE,
date_arrivee DATE,
date_depart DATE,
statut ENUM('Confirmée','Annulée','Terminée') DEFAULT 'Confirmée',
id_client INT,
id_chambre INT,
FOREIGN KEY (id_client) REFERENCES client(id_client),
FOREIGN KEY (id_chambre) REFERENCES chambre(id_chambre)
);

CREATE TABLE sejour (
id_sejour INT AUTO_INCREMENT PRIMARY KEY,
date_checkin DATE,
date_checkout DATE,
id_reservation INT UNIQUE,
FOREIGN KEY (id_reservation) REFERENCES reservation(id_reservation)
);

CREATE TABLE paiement (
id_paiement INT AUTO_INCREMENT PRIMARY KEY,
date_paiement DATE,
montant DECIMAL(10,2),
mode_paiement VARCHAR(30),
id_reservation INT,
FOREIGN KEY (id_reservation) REFERENCES reservation(id_reservation)
);

📥 10. Insertion des données
INSERT INTO client VALUES
(NULL,'Harda','Salma','0600000001','salma@gmail.com'),
(NULL,'Benali','Ahmed','0600000002','ahmed@gmail.com'),
(NULL,'Alaoui','Sara','0600000003','sara@gmail.com');

INSERT INTO chambre VALUES
(NULL,'101','Simple',300,'Disponible'),
(NULL,'102','Double',500,'Disponible'),
(NULL,'201','Suite',900,'Disponible');

🔍 11. Requêtes SQL
Clients
SELECT * FROM client;

Chambres disponibles
SELECT * FROM chambre WHERE statut='Disponible';

Réservations confirmées
SELECT * FROM reservation WHERE statut='Confirmée';

Recherche client
SELECT * FROM client WHERE nom LIKE '%Ben%';

📊 12. Statistiques
Nombre de clients
SELECT COUNT(*) FROM client;
Chiffre d’affaires
SELECT SUM(montant) FROM paiement;
Réservations par chambre
SELECT id_chambre, COUNT(*)
FROM reservation
GROUP BY id_chambre;

📁 13. Structure du projet
Projet_Hotel/
│
├── database.sql
├── MCD.png
├── MLD.png
└── README.md

✅ 14. Conclusion
Ce projet permet de gérer efficacement les opérations d’un hôtel grâce à une base de données relationnelle bien structurée.

👨‍💻 Réalisé par : Rida Sabrar
