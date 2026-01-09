-- Base de données : `hotel_db`
CREATE PLUGGABLE DATABASE hotel_db 
  admin user hotel_admin identified by oracle 
  role = (dba)
  data_file '/opt/oracle/oradata/ORCLCDB/HOTEL_DB'
  file_name_convert ('/opt/oracle/oradata/ORCLCDB/pdbseed',
                    '/opt/oracle/oradata/ORCLCDB/HOTEL_DB')
  
-- Structure de la table `chambres`
--

CREATE TABLE `chambres` (
  `chambre_id` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `prix` decimal(10,2) DEFAULT NULL
);

--
-- Déchargement des données de la table `chambres`
--

INSERT INTO `chambres` (`chambre_id`, `hotel_id`, `numero`, `type`, `prix`) VALUES
(1, 105, 'lux', 900.00),
(2, 104, 'Suite', 800.00),
(3, 103, 'Suite', 800.00),
(4, 201, 'lux', 600.00),
(5, 101, 'Standard', 500.00),
(6, 102, 'Suite', 800.00),

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `client_id` int(11) NOT NULL,
   chambre_id int(11) NOT NULL
  `full_name` varchar(100) NOT NULL,
  `tel` varchar(30) DEFAULT NULL,
  `cin` varchar(10) unique
);

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`client_id`, `chambre_id`, `full_name`, `tel`, cin) VALUES
(1, 2, 'Ali Hassan', '06000000', 'T333344'),
(2, 1,  'Jean paul', '06044000', 'T334455'),
(3, 4,  'Amine soussi', '06044090', 'T336665'),
(4, 5,  'Amina Annabi', '06098090', 'T333333'),
(5, 3,  'alae Amor', '06554090', 'T336222'),

-- --------------------------------------------------------
-- Structure de la table `reservations`
--

CREATE TABLE `reservations` (
  `reservation_id` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `chambre_id` int(11) DEFAULT NULL,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL
) ;

--
-- Déchargement des données de la table `reservations`
--

INSERT INTO `reservations` (`reservation_id`, `client_id`, `chambre_id`, `date_debut`, `date_fin`) VALUES
(1, 3, 1, '2025-02-01', '2025-02-05'),
(2, 2, 2, '2025-03-10', '2025-03-12'),
(3, 1, 3, '2025-03-04', '2025-04-12'),
(4, 4, 5, '2025-04-09', '2025-05-11');
--
-- Structure de la table `paiements`
--

CREATE TABLE `paiements` (
  `paiement_id` int(11) NOT NULL,
  `reservation_id` int(11) DEFAULT NULL,
  `montant` decimal(10,2) DEFAULT NULL,
  `date_paiement` date DEFAULT NULL
);

--
-- Déchargement des données de la table `paiements`
--

INSERT INTO `paiements` (`paiement_id`, `reservation_id`, `montant`, `date_paiement`) VALUES
(1, 3, 2000.00, '2025-02-01'),
(2, 2, 1600.00, '2025-03-10');

-- --------------------------------------------------------


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
