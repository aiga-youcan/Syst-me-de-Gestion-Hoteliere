-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 08 juin 2026 à 13:23
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `hotel_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `chambre`
--

CREATE TABLE `chambre` (
  `id_chambre` int(11) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `type` varchar(30) NOT NULL,
  `prix_nuit` decimal(10,2) NOT NULL,
  `statut` enum('Disponible','Occupée','Maintenance') DEFAULT 'Disponible'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `chambre`
--

INSERT INTO `chambre` (`id_chambre`, `numero`, `type`, `prix_nuit`, `statut`) VALUES
(1, '101', 'Simple', 300.00, 'Disponible'),
(2, '102', 'Double', 500.00, 'Disponible'),
(3, '201', 'Suite', 900.00, 'Disponible');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id_client`, `nom`, `prenom`, `telephone`, `email`) VALUES
(1, 'Harda', 'Salma', '0600000001', 'salma@gmail.com'),
(2, 'Benali', 'Ahmed', '0600000002', 'ahmed@gmail.com'),
(3, 'Alaoui', 'Sara', '0600000003', 'sara@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `paiement`
--

CREATE TABLE `paiement` (
  `id_paiement` int(11) NOT NULL,
  `date_paiement` date NOT NULL,
  `montant` decimal(10,2) NOT NULL,
  `mode_paiement` varchar(30) DEFAULT NULL,
  `id_reservation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `paiement`
--

INSERT INTO `paiement` (`id_paiement`, `date_paiement`, `montant`, `mode_paiement`, `id_reservation`) VALUES
(1, '2026-06-03', 1800.00, 'Carte bancaire', 1),
(2, '2026-06-04', 2500.00, 'Espèces', 2),
(3, '2026-06-12', 1800.00, 'Carte bancaire', 3);

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `id_reservation` int(11) NOT NULL,
  `date_reservation` date NOT NULL,
  `date_arrivee` date NOT NULL,
  `date_depart` date NOT NULL,
  `statut` enum('Confirmée','Annulée','Terminée') DEFAULT 'Confirmée',
  `id_client` int(11) NOT NULL,
  `id_chambre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`id_reservation`, `date_reservation`, `date_arrivee`, `date_depart`, `statut`, `id_client`, `id_chambre`) VALUES
(1, '2026-06-01', '2026-06-15', '2026-06-18', 'Confirmée', 1, 1),
(2, '2026-06-02', '2026-06-20', '2026-06-25', 'Confirmée', 2, 2),
(3, '2026-06-03', '2026-06-10', '2026-06-12', 'Terminée', 3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `sejour`
--

CREATE TABLE `sejour` (
  `id_sejour` int(11) NOT NULL,
  `date_checkin` date DEFAULT NULL,
  `date_checkout` date DEFAULT NULL,
  `id_reservation` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `sejour`
--

INSERT INTO `sejour` (`id_sejour`, `date_checkin`, `date_checkout`, `id_reservation`) VALUES
(1, '2026-06-10', '2026-06-12', 3);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `chambre`
--
ALTER TABLE `chambre`
  ADD PRIMARY KEY (`id_chambre`),
  ADD UNIQUE KEY `numero` (`numero`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`),
  ADD UNIQUE KEY `telephone` (`telephone`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD PRIMARY KEY (`id_paiement`),
  ADD KEY `id_reservation` (`id_reservation`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id_reservation`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_chambre` (`id_chambre`);

--
-- Index pour la table `sejour`
--
ALTER TABLE `sejour`
  ADD PRIMARY KEY (`id_sejour`),
  ADD UNIQUE KEY `id_reservation` (`id_reservation`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `chambre`
--
ALTER TABLE `chambre`
  MODIFY `id_chambre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `paiement`
--
ALTER TABLE `paiement`
  MODIFY `id_paiement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id_reservation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `sejour`
--
ALTER TABLE `sejour`
  MODIFY `id_sejour` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD CONSTRAINT `paiement_ibfk_1` FOREIGN KEY (`id_reservation`) REFERENCES `reservation` (`id_reservation`);

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`id_chambre`) REFERENCES `chambre` (`id_chambre`);

--
-- Contraintes pour la table `sejour`
--
ALTER TABLE `sejour`
  ADD CONSTRAINT `sejour_ibfk_1` FOREIGN KEY (`id_reservation`) REFERENCES `reservation` (`id_reservation`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
