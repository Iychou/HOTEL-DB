-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 25 nov. 2025 à 10:59
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

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
-- Structure de la table `chambres`
--

CREATE TABLE `chambres` (
  `chambre_id` int(11) NOT NULL,
  `hotel_id` int(11) DEFAULT NULL,
  `numero` int(11) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `prix` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `chambres`
--

INSERT INTO `chambres` (`chambre_id`, `hotel_id`, `numero`, `type`, `prix`) VALUES
(1, 1, 101, 'Standard', 500.00),
(2, 1, 102, 'Suite', 800.00),
(3, 2, 201, 'Standard', 600.00),
(4, 1, 101, 'Standard', 500.00),
(5, 1, 102, 'Suite', 800.00),
(6, 2, 201, 'Standard', 600.00),
(7, 1, 101, 'Standard', 500.00),
(8, 1, 102, 'Suite', 800.00),
(9, 2, 201, 'Standard', 600.00),
(10, 1, 101, 'Standard', 500.00),
(11, 1, 102, 'Suite', 800.00),
(12, 2, 201, 'Standard', 600.00);

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `client_id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `tel` varchar(30) DEFAULT NULL,
  `ville` varchar(100) DEFAULT NULL,
  `pays` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`client_id`, `nom`, `tel`, `ville`, `pays`) VALUES
(1, 'Ali Hassan', '06000000', 'Paris', 'France'),
(2, 'Sara Ben', '06123456', 'Rabat', 'Maroc'),
(3, 'John Doe', '05000000', 'Madrid', 'Espagne'),
(4, 'Ali Hassan', '06000000', 'Paris', 'France'),
(5, 'Sara Ben', '06123456', 'Rabat', 'Maroc'),
(6, 'John Doe', '05000000', 'Madrid', 'Espagne'),
(7, 'Ali Hassan', '06000000', 'Paris', 'France'),
(8, 'Sara Ben', '06123456', 'Rabat', 'Maroc'),
(9, 'John Doe', '05000000', 'Madrid', 'Espagne');

-- --------------------------------------------------------

--
-- Structure de la table `hotels`
--

CREATE TABLE `hotels` (
  `hotel_id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `ville` varchar(100) DEFAULT NULL,
  `pays` varchar(100) DEFAULT NULL,
  `tel` varchar(30) DEFAULT NULL,
  `categorie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `hotels`
--

INSERT INTO `hotels` (`hotel_id`, `nom`, `ville`, `pays`, `tel`, `categorie`) VALUES
(1, 'Hotel Atlas', 'Rabat', 'Maroc', '05370000', 4),
(2, 'Hotel Paris Center', 'Paris', 'France', '01556677', 5),
(5, 'Hotel Atlas', 'Rabat', 'Maroc', '05370000', 4),
(7, 'Hotel Paris Center', 'Paris', 'France', '01556677', 5),
(8, 'hotel Nice', 'Nice', 'France', '12348765', 5),
(9, 'hotel hilton', 'Marrakech', 'Maroc', '4321569', 4),
(10, 'hotel hilton', 'Casablanca', 'Maroc', '23541234', 5);

-- --------------------------------------------------------

--
-- Structure de la table `paiements`
--

CREATE TABLE `paiements` (
  `paiement_id` int(11) NOT NULL,
  `reservation_id` int(11) DEFAULT NULL,
  `montant` decimal(10,2) DEFAULT NULL,
  `date_paiement` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `paiements`
--

INSERT INTO `paiements` (`paiement_id`, `reservation_id`, `montant`, `date_paiement`) VALUES
(7, 1, 2000.00, '2025-02-01'),
(8, 2, 1600.00, '2025-03-10');

-- --------------------------------------------------------

--
-- Structure de la table `reservations`
--

CREATE TABLE `reservations` (
  `reservation_id` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `hotel_id` int(11) DEFAULT NULL,
  `chambre_id` int(11) DEFAULT NULL,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `reservations`
--

INSERT INTO `reservations` (`reservation_id`, `client_id`, `hotel_id`, `chambre_id`, `date_debut`, `date_fin`) VALUES
(1, 1, 1, 1, '2025-02-01', '2025-02-05'),
(2, 2, 1, 2, '2025-03-10', '2025-03-12'),
(15, 1, 7, 1, '2025-03-04', '2025-04-12'),
(16, 2, 5, 2, '2025-04-09', '2025-05-11');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `chambres`
--
ALTER TABLE `chambres`
  ADD PRIMARY KEY (`chambre_id`),
  ADD KEY `hotel_id` (`hotel_id`);

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`client_id`);

--
-- Index pour la table `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`hotel_id`);

--
-- Index pour la table `paiements`
--
ALTER TABLE `paiements`
  ADD PRIMARY KEY (`paiement_id`),
  ADD KEY `reservation_id` (`reservation_id`);

--
-- Index pour la table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `hotel_id` (`hotel_id`),
  ADD KEY `chambre_id` (`chambre_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `chambres`
--
ALTER TABLE `chambres`
  MODIFY `chambre_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `clients`
--
ALTER TABLE `clients`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `hotels`
--
ALTER TABLE `hotels`
  MODIFY `hotel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `paiements`
--
ALTER TABLE `paiements`
  MODIFY `paiement_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `chambres`
--
ALTER TABLE `chambres`
  ADD CONSTRAINT `chambres_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`hotel_id`);

--
-- Contraintes pour la table `paiements`
--
ALTER TABLE `paiements`
  ADD CONSTRAINT `paiements_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`reservation_id`);

--
-- Contraintes pour la table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`),
  ADD CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`hotel_id`),
  ADD CONSTRAINT `reservations_ibfk_3` FOREIGN KEY (`chambre_id`) REFERENCES `chambres` (`chambre_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
