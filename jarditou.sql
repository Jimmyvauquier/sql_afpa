DROP DATABASE if EXISTS  `jarditou`;
CREATE  DATABASE jarditou;
use jarditou;
CREATE TABLE `client` (
  `cli_id` int(11) NOT NULL,
  `cli_type` tinyint(1) DEFAULT NULL,    
  `cli_nom` varchar(50) NOT NULL,
  `cli_prenom` varchar(50) NOT NULL,
  `cli_adresse` varchar(100) NOT NULL,
  `cli_cp` char(5) NOT NULL,
  `cli_ville` varchar(10) NOT NULL,
  `cli_tel` varchar(10) NOT NULL,
  `cli_mail` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `client` (`cli_id`, `cli_type`, `cli_nom`, `cli_prenom`, `cli_adresse`, `cli_cp`, `cli_ville`, `cli_tel`, `cli_mail`) VALUES
(1, NULL, 'Dupont', 'Gérard', '140 rue graville', '80000', 'Amiens', '0658330890', 'dupontdup@sfr.fr'),
(2, NULL, 'Gasset', 'Jean Louis', '37 rue Serafin', '13000', 'Marseille', '0658330891', 'jeannotgasset@gmail.com'),
(3, NULL, 'Diacre', 'Corinne', '158 rue du martyre', '69000', 'Lyon', '0658330892', 'speedygonsales@yahoo.fr'),
(4, NULL, 'Mitterand', 'Francois', '3 rue de verdun', '14000', 'Honfleur', '065833083', 'gauchiste.pres@gmail.com'),
(5, NULL, 'Deshamps', 'Didier', '12 rue du stade de france', '75001', 'Paris', '0658330894', 'dd.ladesch@gmail.com'),
(6, NULL, 'dumasso', 'Luigi', '141--

-- rue de la calle', '76000', 'Rouen', '0658330895', 'peterpanmagic@yahoo.fr'),
(7, NULL, 'Chan', 'Jacky', '113 avenue du prado', '13000', 'Marseille', '0658330896', 'petitpapanoel@gmail.com'),
(8, NULL, 'Eastwood', 'Clint', '8 rue du far west', '64000', 'Pau', '0658330897', 'stadepalois.basket@yahoo.fr'),
(9, NULL, 'Longoria', 'Pablo', '13 rue de l orange Vélodrome', '13000', 'Marseille', '0658330898', 'allezlom.longoria@gmail.com'),
(10, NULL, 'Rongier', 'Valentin', '302 rue de lisbonne', '44000', 'Nantes', '0658330899', 'fcchiotte@yahoo.fr');

CREATE TABLE `commande` (
  `com_id` int(11) NOT NULL,,
  `com_dateCommande` date NOT NULL,
  `com_dateLivraison` date NOT NULL,
  `com_etatCommande` varchar(50) NOT NULL,
  `com_editionFacture` bit(1) DEFAULT NULL,
  `cli_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `commande` (`com_id`, `com_dateCommande`, `com_dateLivraison`, `com_etatCommande`, `com_editionFacture`, `cli_id`) VALUES
(1, '2021-04-24', '2022-05-23', 'En cours', NULL, 1),
(2, '2021-04-24', '2023-12-23', 'En cours', NULL, 2),
(3, '2021-05-22', '2023-11-24',--

(4, '2021-01-13', '2023-05-23', 'En cours', NULL, 2),
(5, '2022-04-27', '2023-10-19', 'En retard', NULL, 6),
(6, '2021-04-24', '2023-08-15', 'En cours', NULL, 5),
(7, '2021-02-11', '2023-07-23', 'En retard', NULL, 4),
(8, '2021-07-08', '2023-01-15', 'Livré', NULL, 8),
(9, '2021-03-03', '2023-05-23', 'En cours', NULL, 3),
(10, '2021-04-12', '2023-01-23', 'Livré', NULL, 9);

CREATE TABLE `fournisseur` (
  `fourni_id` int(11) NOT NULL,
  `fourni_nom` varchar(40) NOT NULL,
  `fourni_adress` varchar(100) NOT NULL,
  `fourni_cp` char(5) NOT NULL,
  `fourni_ville` varchar(40) NOT NULL,
  `fourni_tel` varchar(10) DEFAULT NULL,
  `fourni_mail` varchar(40) DEFAULT NULL,
  `fourni_type` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `fournisseur` (`fourni_id`, `fourni_nom`, `fourni_adress`, `fourni_cp`, `fourni_ville`, `fourni_tel`, `fourni_mail`, `fourni_type`) VALUES
(1, 'Point P', '10 rue Jean Jaures', '76400', 'Fecamp', NULL, NULL, NULL),
(2, 'L epicerie', '34, rue Jules Barny', '76400', 'Sainte Hélène Bondeville', NULL, NULL, NULL),
(3, 'L'Huitriere', '42, avenue Emile Zola', '14180', 'Honfleur', NULL, NULL, NULL),
(4, 'Au paradis', '137, rue général Lagrue', '76400', 'Fecamp', NULL, NULL, NULL),
(5, 'Chez Luigi', '69, rue de la poupée qui tousse', '76640', 'Le havre', NULL, NULL, NULL);

CREATE TABLE `panier` (
  `pan_quantiProduit` int(11) NOT NULL,
  `pan_prixVentePar` float NOT NULL,
  `pan_prixVentePro` float NOT NULL,
  `prod_code` char(6) NOT NULL,
  `com_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `panier` (`pan_quantiProduit`, `pan_prixVentePar`, `pan_prixVentePro`, `prod_code`, `com_id`) VALUES
(10, 2, 1.75, 'AB8164', 2),
(4, 3, 2.1, 'AB8654', 2),
(4, 5, 4.5, 'AB8766', 6),
(2, 3, 2.5, 'AB8854', 2),
(2, 2, 1.75, 'AB8854', 9),
(7, 2, 1.75, 'AD8788', 1),
(1, 2, 1.75, 'AD8788', 4),
(6, 2, 1.75, 'AD8788', 8),
(11, 3, 2, 'CB8349', 1),
(1, 5, 3.5, 'CB8349', 3);

CREATE TABLE `produit` (
  `prod_code` char(6) NOT NULL,
  `prod_lib` varchar(100) NOT NULL,
  `prod_desc` varchar(250) DEFAULT NULL,
  `prod_phot` varchar(250) DEFAULT NULL,
  `prod_affichage` bit(1) DEFAULT NULL,
  `prod_prixAchat` int(11) NOT NULL,
  `prod_stockPhy` int(11) NOT NULL,
  `prod_stockAlerte` int(11) NOT NULL,
  `fourni_id` int(11) DEFAULT NULL,
  `rubri_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `produit` (`prod_code`, `prod_lib`, `prod_desc`, `prod_phot`, `prod_affichage`, `prod_prixAchat`, `prod_stockPhy`, `prod_stockAlerte`, `fourni_id`, `rubri_id`) VALUES
('AB8164', 'Pastèque', NULL, NULL, NULL, 4, 500, 205, 3, NULL),
('AB8436', 'Kiwi', NULL, NULL, NULL, 1, 500, 205, 1, NULL),
('AB8654', 'Lait', NULL, NULL, NULL, 2, 350, 150, 2, NULL),
('AB8733', 'Soda', NULL, NULL, NULL, 8, 500, 250, 2, NULL),
('AB8744', 'parpin', NULL, NULL, NULL, 22, 50, 25, 3, NULL),
('AB8745', 'Pizza', NULL, NULL, NULL, 150, 30, 15, 4, NULL),
('AB8751', 'Parquet', NULL, NULL, NULL, 5, 50, 25, 3, NULL),
('AB8753', 'Poire', NULL, NULL, NULL, 2, 550, 300, 1, NULL),
('AB8755', 'Soja', NULL, NULL, NULL, 3, 500, 250, 2, NULL),
('AB8756', 'Chips', NULL, NULL, NULL, 5, 500, 250, 1, NULL),
('AB8757', 'Fromage', NULL, NULL, NULL, 6, 350, 150, 2, NULL),
('AB8759', 'Sucre', NULL, NULL, NULL, 1, 350, 250, 4, NULL),
('AB8766', 'Rose', NULL, NULL, NULL, 3, 5000, 2500, 3, NULL),
('AB8778', 'Chat', NULL, NULL, NULL, 500, 50, 25, 2, NULL),
('AB8789', 'Set', NULL, NULL, NULL, 6, 500, 205, 2, NULL),
('AB8796', 'pouk huitres', NULL, NULL, NULL, 1, 500, 250, 2, NULL),
('AB8854', 'Oeufs', NULL, NULL, NULL, 5, 5000, 2500, 1, NULL),
('AC8736', 'Bonbons', NULL, NULL, NULL, 35, 50, 25, 1, NULL),
('AD8788', 'beton', NULL, NULL, NULL, 66, 50, 25, 4, NULL),
('CB8349', 'Pates', NULL, NULL, NULL, 4, 500, 205, 4, NULL);

CREATE TABLE `rubrique` (
  `rubri_id` int(11) NOT NULL,
  `rubri_lib` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE `client`
  ADD PRIMARY KEY (`cli_id`),
  ADD KEY `index_nom_client` (`cli_nom`);

ALTER TABLE `commande`
  ADD PRIMARY KEY (`com_id`),
  ADD KEY `cli_id` (`cli_id`),
  ADD KEY `index_date_commande` (`com_dateCommande`);

ALTER TABLE `fournisseur`
  ADD PRIMARY KEY (`fourni_id`);

ALTER TABLE `panier`
  ADD PRIMARY KEY (`prod_code`,`com_id`),
  ADD KEY `com_id` (`com_id`);

ALTER TABLE `produit`
  ADD PRIMARY KEY (`prod_code`),
  ADD KEY `FK_produitFourni` (`fourni_id`),
  ADD KEY `FK_produitRubrique` (`rubri_id`);

ALTER TABLE `rubrique`
  ADD PRIMARY KEY (`rubri_id`);

ALTER TABLE `client`
  MODIFY `cli_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

ALTER TABLE `commande`
  MODIFY `com_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

ALTER TABLE `fournisseur`
  MODIFY `fourni_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `rubrique`
  MODIFY `rubri_id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`cli_id`) REFERENCES `client` (`cli_id`);

ALTER TABLE `panier`
  ADD CONSTRAINT `panier_ibfk_1` FOREIGN KEY (`com_id`) REFERENCES `commande` (`com_id`),
  ADD CONSTRAINT `panier_ibfk_2` FOREIGN KEY (`prod_code`) REFERENCES `produit` (`prod_code`);

ALTER TABLE `produit`
  ADD CONSTRAINT `FK_produitFourni` FOREIGN KEY (`fourni_id`) REFERENCES `fournisseur` (`fourni_id`),
  ADD CONSTRAINT `FK_produitRubrique` FOREIGN KEY (`rubri_id`) REFERENCES `rubrique` (`rubri_id`);
COMMIT;