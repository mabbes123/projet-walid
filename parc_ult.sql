-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  Dim 22 mai 2022 à 14:20
-- Version du serveur :  10.1.38-MariaDB
-- Version de PHP :  5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `parc_ult`
--

-- --------------------------------------------------------

--
-- Structure de la table `appartenir`
--

CREATE TABLE `appartenir` (
  `id_societe` int(2) NOT NULL DEFAULT '0',
  `id_utilisateur` int(3) NOT NULL DEFAULT '0',
  `id_batiment_etage` int(2) NOT NULL DEFAULT '0',
  `id_service` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `appartenir`
--

INSERT INTO `appartenir` (`id_societe`, `id_utilisateur`, `id_batiment_etage`, `id_service`) VALUES
(1, 1, 1, 5),
(9, 1, 1, 1),
(9, 2, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `batiment_etage`
--

CREATE TABLE `batiment_etage` (
  `id_batiment_etage` int(2) NOT NULL,
  `libelle_batiment_etage` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `batiment_etage`
--

INSERT INTO `batiment_etage` (`id_batiment_etage`, `libelle_batiment_etage`) VALUES
(1, ''),
(2, 'Bat A - Rez de chauss?'),
(3, 'Bat B - Rez de chauss?');

-- --------------------------------------------------------

--
-- Structure de la table `composant`
--

CREATE TABLE `composant` (
  `id_composant` int(3) NOT NULL,
  `libelle_composant` varchar(40) NOT NULL DEFAULT '',
  `id_societe` int(2) NOT NULL DEFAULT '0',
  `id_type_composant` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `composant`
--

INSERT INTO `composant` (`id_composant`, `libelle_composant`, `id_societe`, `id_type_composant`) VALUES
(1, 'Pentium 4', 8, 2),
(2, 'Barracuda 120 Go', 11, 3),
(3, '', 11, 4),
(4, 'Intel Pro 10/100', 8, 5),
(5, 'Caviar', 8, 3);

-- --------------------------------------------------------

--
-- Structure de la table `composer`
--

CREATE TABLE `composer` (
  `id_materiel` int(4) NOT NULL DEFAULT '0',
  `id_composant` int(3) NOT NULL DEFAULT '0',
  `precision_composant` varchar(25) DEFAULT NULL,
  `qte_composant` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `composer`
--

INSERT INTO `composer` (`id_materiel`, `id_composant`, `precision_composant`, `qte_composant`) VALUES
(7, 1, '', 1),
(7, 2, '', 1),
(9, 3, '', 1);

-- --------------------------------------------------------

--
-- Structure de la table `fonction_utilisateur`
--

CREATE TABLE `fonction_utilisateur` (
  `id_fonction_utilisateur` int(2) NOT NULL,
  `libelle_fonction_utilisateur` varchar(40) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `fonction_utilisateur`
--

INSERT INTO `fonction_utilisateur` (`id_fonction_utilisateur`, `libelle_fonction_utilisateur`) VALUES
(1, ''),
(2, 'Automaticien'),
(3, 'Responsable du mat?riel informatique'),
(4, 'Administrateur supcom'),
(5, 'Chef Atelier');

-- --------------------------------------------------------

--
-- Structure de la table `installer`
--

CREATE TABLE `installer` (
  `id_logiciel` int(3) NOT NULL DEFAULT '0',
  `id_materiel` int(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `installer`
--

INSERT INTO `installer` (`id_logiciel`, `id_materiel`) VALUES
(1, 7),
(2, 7);

-- --------------------------------------------------------

--
-- Structure de la table `intervenant`
--

CREATE TABLE `intervenant` (
  `id_intervenant` int(3) NOT NULL,
  `nom_intervenant` varchar(20) NOT NULL DEFAULT '',
  `prenom_intervenant` varchar(20) NOT NULL DEFAULT '',
  `nom_complet_intervenant` varchar(50) NOT NULL DEFAULT '',
  `tel_intervenant` varchar(10) NOT NULL DEFAULT '',
  `portable_intervenant` varchar(10) DEFAULT NULL,
  `fax_intervenant` varchar(10) DEFAULT NULL,
  `email_intervenant` varchar(40) DEFAULT NULL,
  `observation_intervenant` varchar(160) DEFAULT NULL,
  `id_type_intervenant` int(2) NOT NULL DEFAULT '0',
  `id_societe` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `intervenant`
--

INSERT INTO `intervenant` (`id_intervenant`, `nom_intervenant`, `prenom_intervenant`, `nom_complet_intervenant`, `tel_intervenant`, `portable_intervenant`, `fax_intervenant`, `email_intervenant`, `observation_intervenant`, `id_type_intervenant`, `id_societe`) VALUES
(1, '', '', '', '', '', '', '', '', 1, 1),
(2, 'Dupont', 'Claire', 'Dupont Claire', '', '', '', '', '', 2, 3),
(3, 'Bernaille', 'Laurent', 'Bernaille Laurent', '', '', '', '', '', 3, 10);

-- --------------------------------------------------------

--
-- Structure de la table `intervention`
--

CREATE TABLE `intervention` (
  `id_intervention` int(5) NOT NULL,
  `probleme_intervention` varchar(160) NOT NULL DEFAULT '',
  `date_probleme` date DEFAULT NULL,
  `date_intervention` date DEFAULT NULL,
  `duree_intervention` int(4) NOT NULL DEFAULT '0',
  `compte_rendu_intervention` varchar(160) DEFAULT NULL,
  `id_intervenant` int(3) NOT NULL DEFAULT '0',
  `id_materiel` int(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `intervention`
--

INSERT INTO `intervention` (`id_intervention`, `probleme_intervention`, `date_probleme`, `date_intervention`, `duree_intervention`, `compte_rendu_intervention`, `id_intervenant`, `id_materiel`) VALUES
(1, 'formatage', '2006-05-17', '2006-05-26', 240, 'ras', 2, 8),
(2, 'Ne d?marre plus', '2006-05-12', '2006-05-15', 30, 'coucou', 3, 7);

-- --------------------------------------------------------

--
-- Structure de la table `logiciel`
--

CREATE TABLE `logiciel` (
  `id_logiciel` int(3) NOT NULL,
  `nom_logiciel` varchar(30) NOT NULL DEFAULT '',
  `version_logiciel` varchar(5) DEFAULT NULL,
  `date_achat_logiciel` date DEFAULT NULL,
  `observation_logiciel` varchar(160) DEFAULT NULL,
  `id_societe` int(2) NOT NULL DEFAULT '0',
  `id_service_pack` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `logiciel`
--

INSERT INTO `logiciel` (`id_logiciel`, `nom_logiciel`, `version_logiciel`, `date_achat_logiciel`, `observation_logiciel`, `id_societe`, `id_service_pack`) VALUES
(1, 'WIN10', '21', '0000-00-00', '', 13, 2),
(2, 'MS OFFICE', ' 97', '0000-00-00', '', 13, 2),
(3, 'MS OFFICE', '2003', '0000-00-00', '', 13, 2),
(4, 'MS OFFICE', '97', '0000-00-00', '', 13, 2),
(6, 'MS OFFICE', '2000', '0000-00-00', '', 13, 2),
(7, 'ABAQUS', '14', '0000-00-00', '', 12, 6);

-- --------------------------------------------------------

--
-- Structure de la table `materiel`
--

CREATE TABLE `materiel` (
  `id_materiel` int(4) NOT NULL,
  `num_serie_materiel` varchar(8) NOT NULL DEFAULT '',
  `tag_supcom_materiel` varchar(10) NOT NULL DEFAULT '',
  `nom_materiel` varchar(8) NOT NULL DEFAULT '',
  `date_achat_materiel` date DEFAULT NULL,
  `adresseip_materiel` varchar(15) DEFAULT NULL,
  `observation_materiel` varchar(160) DEFAULT NULL,
  `id_modele_materiel` int(4) NOT NULL DEFAULT '0',
  `id_type_materiel` int(2) NOT NULL DEFAULT '0',
  `id_utilisateur` int(3) DEFAULT NULL,
  `id_societe` int(2) NOT NULL DEFAULT '0',
  `id_statut` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `materiel`
--

INSERT INTO `materiel` (`id_materiel`, `num_serie_materiel`, `tag_supcom_materiel`, `nom_materiel`, `date_achat_materiel`, `adresseip_materiel`, `observation_materiel`, `id_modele_materiel`, `id_type_materiel`, `id_utilisateur`, `id_societe`, `id_statut`) VALUES
(6, 'grrg', 'grrgrg', 'grrg', '0000-00-00', '', '', 1, 6, NULL, 3, 3),
(7, 'grg', 'grgr', 'grg', '0000-00-00', '', '', 1, 6, NULL, 3, 3),
(8, 'dzffzfg', 'IMP312', 'IMP312', '1985-04-22', '', '', 2, 4, 2, 8, 2),
(9, 'fefefg', 'PORT41', 'PO412', '2007-01-12', '', '', 2, 2, NULL, 8, 4),
(11, '123', 'xsrtf', 'EPSON', '0000-00-00', '', '', 2, 4, 2, 13, 4),
(12, '123', 'xsrtf', 'EPSON', '0000-00-00', '192.168.1.1', 'TEST', 2, 4, NULL, 13, 4),
(13, '123', 'xsrtf', 'EPSON', '0000-00-00', '192.168.1.1', 'TEST', 2, 4, NULL, 13, 4),
(14, '123', 'xsrtf', 'EPSON', '2020-03-12', '192.168.1.1', 'TEST', 2, 4, NULL, 13, 4);

-- --------------------------------------------------------

--
-- Structure de la table `modele_materiel`
--

CREATE TABLE `modele_materiel` (
  `id_modele_materiel` int(4) NOT NULL,
  `libelle_modele_materiel` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `modele_materiel`
--

INSERT INTO `modele_materiel` (`id_modele_materiel`, `libelle_modele_materiel`) VALUES
(1, ''),
(2, 'Optiplex GX270');

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

CREATE TABLE `service` (
  `id_service` int(2) NOT NULL,
  `libelle_service` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `service`
--

INSERT INTO `service` (`id_service`, `libelle_service`) VALUES
(1, ''),
(2, 'Atelier'),
(3, 'Bureau Etude'),
(5, 'Service Comptabilit?'),
(6, 'Service d?veloppement');

-- --------------------------------------------------------

--
-- Structure de la table `service_pack`
--

CREATE TABLE `service_pack` (
  `id_service_pack` int(2) NOT NULL,
  `libelle_service_pack` varchar(4) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `service_pack`
--

INSERT INTO `service_pack` (`id_service_pack`, `libelle_service_pack`) VALUES
(1, ''),
(2, 'SP1'),
(5, 'SP4'),
(6, 'SP2');

-- --------------------------------------------------------

--
-- Structure de la table `societe`
--

CREATE TABLE `societe` (
  `id_societe` int(2) NOT NULL,
  `nom_societe` varchar(40) NOT NULL DEFAULT '',
  `adresse_societe` varchar(80) DEFAULT NULL,
  `ville_societe` varchar(30) DEFAULT NULL,
  `cp_societe` varchar(5) DEFAULT NULL,
  `site_web_societe` varchar(60) DEFAULT NULL,
  `tel_societe` varchar(10) DEFAULT NULL,
  `portable_societe` varchar(10) DEFAULT NULL,
  `fax_societe` varchar(10) DEFAULT NULL,
  `email_societe` varchar(50) DEFAULT NULL,
  `observation_societe` varchar(160) DEFAULT NULL,
  `id_type_societe` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `societe`
--

INSERT INTO `societe` (`id_societe`, `nom_societe`, `adresse_societe`, `ville_societe`, `cp_societe`, `site_web_societe`, `tel_societe`, `portable_societe`, `fax_societe`, `email_societe`, `observation_societe`, `id_type_societe`) VALUES
(1, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'JUMANJI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'Dell', '', '', '', '', '', '', '', '', '', 2),
(9, 'IMEC', '', '', '', '', '', '', '', '', '', 3),
(10, 'supcom', '', '', '', '', '', '', '', '', '', 3),
(11, 'Seagate', '', '', '', '', '', '', '', '', '', 2),
(12, 'Aucun', '', '', '', '', '', '', '', '', '', 2),
(13, 'Microsoft', '', '', '', '', '', '', '', '', '', 5);

-- --------------------------------------------------------

--
-- Structure de la table `statut`
--

CREATE TABLE `statut` (
  `id_statut` int(2) NOT NULL,
  `libelle_statut` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `statut`
--

INSERT INTO `statut` (`id_statut`, `libelle_statut`) VALUES
(1, ''),
(2, 'En service'),
(3, 'En stock'),
(4, 'En panne');

-- --------------------------------------------------------

--
-- Structure de la table `type_composant`
--

CREATE TABLE `type_composant` (
  `id_type_composant` int(2) NOT NULL,
  `libelle_type_composant` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `type_composant`
--

INSERT INTO `type_composant` (`id_type_composant`, `libelle_type_composant`) VALUES
(1, ''),
(2, 'Processeur'),
(3, 'Disque dur'),
(4, 'Carte m?re'),
(5, 'Carte R?seau');

-- --------------------------------------------------------

--
-- Structure de la table `type_intervenant`
--

CREATE TABLE `type_intervenant` (
  `id_type_intervenant` int(2) NOT NULL,
  `libelle_type_intervenant` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `type_intervenant`
--

INSERT INTO `type_intervenant` (`id_type_intervenant`, `libelle_type_intervenant`) VALUES
(1, NULL),
(2, 'Commercial'),
(3, 'R?parateur');

-- --------------------------------------------------------

--
-- Structure de la table `type_materiel`
--

CREATE TABLE `type_materiel` (
  `id_type_materiel` int(2) NOT NULL,
  `libelle_type_materiel` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `type_materiel`
--

INSERT INTO `type_materiel` (`id_type_materiel`, `libelle_type_materiel`) VALUES
(1, NULL),
(2, 'Portable'),
(3, 'Serveur'),
(4, 'Imprimante'),
(5, 'Switch'),
(6, 'Ordinateur');

-- --------------------------------------------------------

--
-- Structure de la table `type_societe`
--

CREATE TABLE `type_societe` (
  `id_type_societe` int(2) NOT NULL,
  `libelle_type_societe` varchar(25) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `type_societe`
--

INSERT INTO `type_societe` (`id_type_societe`, `libelle_type_societe`) VALUES
(1, ''),
(2, 'Assembleur'),
(3, 'Site supcom'),
(4, 'Editeur'),
(5, 'D?veloppeur');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id_utilisateur` int(3) NOT NULL,
  `nom_utilisateur` varchar(20) NOT NULL DEFAULT '',
  `prenom_utilisateur` varchar(20) NOT NULL DEFAULT '',
  `nom_complet_utilisateur` varchar(50) NOT NULL DEFAULT '',
  `login_utilisateur` varchar(30) DEFAULT NULL,
  `tel_bureau_utilisateur` varchar(10) DEFAULT NULL,
  `portable_utilisateur` varchar(10) DEFAULT NULL,
  `email_utilisateur` varchar(40) DEFAULT NULL,
  `mdp_utilisateur` varchar(8) DEFAULT NULL,
  `observation_utilisateur` varchar(160) DEFAULT NULL,
  `id_fonction_utilisateur` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_utilisateur`, `nom_utilisateur`, `prenom_utilisateur`, `nom_complet_utilisateur`, `login_utilisateur`, `tel_bureau_utilisateur`, `portable_utilisateur`, `email_utilisateur`, `mdp_utilisateur`, `observation_utilisateur`, `id_fonction_utilisateur`) VALUES
(1, '', '', '', '', '', '', '', '', '', 1),
(2, 'walid', 'loussifi', 'walid loussifi', 'walid', '213', '93980155', 'walid@hotmail.com', 'ult', '', 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `appartenir`
--
ALTER TABLE `appartenir`
  ADD PRIMARY KEY (`id_societe`,`id_utilisateur`,`id_batiment_etage`,`id_service`),
  ADD KEY `appartenir_fk2` (`id_utilisateur`),
  ADD KEY `appartenir_fk3` (`id_batiment_etage`),
  ADD KEY `appartenir_fk4` (`id_service`);

--
-- Index pour la table `batiment_etage`
--
ALTER TABLE `batiment_etage`
  ADD PRIMARY KEY (`id_batiment_etage`);

--
-- Index pour la table `composant`
--
ALTER TABLE `composant`
  ADD PRIMARY KEY (`id_composant`),
  ADD KEY `id_societe` (`id_societe`),
  ADD KEY `id_type_composant` (`id_type_composant`);

--
-- Index pour la table `composer`
--
ALTER TABLE `composer`
  ADD PRIMARY KEY (`id_materiel`,`id_composant`),
  ADD KEY `composer_fk2` (`id_composant`);

--
-- Index pour la table `fonction_utilisateur`
--
ALTER TABLE `fonction_utilisateur`
  ADD PRIMARY KEY (`id_fonction_utilisateur`);

--
-- Index pour la table `installer`
--
ALTER TABLE `installer`
  ADD PRIMARY KEY (`id_logiciel`,`id_materiel`),
  ADD KEY `installer_fk2` (`id_materiel`);

--
-- Index pour la table `intervenant`
--
ALTER TABLE `intervenant`
  ADD PRIMARY KEY (`id_intervenant`),
  ADD KEY `id_type_intervenant` (`id_type_intervenant`),
  ADD KEY `id_societe` (`id_societe`);

--
-- Index pour la table `intervention`
--
ALTER TABLE `intervention`
  ADD PRIMARY KEY (`id_intervention`),
  ADD KEY `id_intervenant` (`id_intervenant`),
  ADD KEY `id_materiel` (`id_materiel`);

--
-- Index pour la table `logiciel`
--
ALTER TABLE `logiciel`
  ADD PRIMARY KEY (`id_logiciel`),
  ADD KEY `id_societe` (`id_societe`),
  ADD KEY `id_service_pack` (`id_service_pack`);

--
-- Index pour la table `materiel`
--
ALTER TABLE `materiel`
  ADD PRIMARY KEY (`id_materiel`),
  ADD KEY `id_modele` (`id_modele_materiel`),
  ADD KEY `id_type_materiel` (`id_type_materiel`),
  ADD KEY `id_utilisateur` (`id_utilisateur`),
  ADD KEY `id_statut` (`id_statut`),
  ADD KEY `id_societe` (`id_societe`);

--
-- Index pour la table `modele_materiel`
--
ALTER TABLE `modele_materiel`
  ADD PRIMARY KEY (`id_modele_materiel`);

--
-- Index pour la table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id_service`);

--
-- Index pour la table `service_pack`
--
ALTER TABLE `service_pack`
  ADD PRIMARY KEY (`id_service_pack`);

--
-- Index pour la table `societe`
--
ALTER TABLE `societe`
  ADD PRIMARY KEY (`id_societe`),
  ADD KEY `id_type_societe` (`id_type_societe`);

--
-- Index pour la table `statut`
--
ALTER TABLE `statut`
  ADD PRIMARY KEY (`id_statut`);

--
-- Index pour la table `type_composant`
--
ALTER TABLE `type_composant`
  ADD PRIMARY KEY (`id_type_composant`);

--
-- Index pour la table `type_intervenant`
--
ALTER TABLE `type_intervenant`
  ADD PRIMARY KEY (`id_type_intervenant`);

--
-- Index pour la table `type_materiel`
--
ALTER TABLE `type_materiel`
  ADD PRIMARY KEY (`id_type_materiel`);

--
-- Index pour la table `type_societe`
--
ALTER TABLE `type_societe`
  ADD PRIMARY KEY (`id_type_societe`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id_utilisateur`),
  ADD KEY `id_fonction_utilisateur` (`id_fonction_utilisateur`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `batiment_etage`
--
ALTER TABLE `batiment_etage`
  MODIFY `id_batiment_etage` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `composant`
--
ALTER TABLE `composant`
  MODIFY `id_composant` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `fonction_utilisateur`
--
ALTER TABLE `fonction_utilisateur`
  MODIFY `id_fonction_utilisateur` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `intervenant`
--
ALTER TABLE `intervenant`
  MODIFY `id_intervenant` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `intervention`
--
ALTER TABLE `intervention`
  MODIFY `id_intervention` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `logiciel`
--
ALTER TABLE `logiciel`
  MODIFY `id_logiciel` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `materiel`
--
ALTER TABLE `materiel`
  MODIFY `id_materiel` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `modele_materiel`
--
ALTER TABLE `modele_materiel`
  MODIFY `id_modele_materiel` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `service`
--
ALTER TABLE `service`
  MODIFY `id_service` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `service_pack`
--
ALTER TABLE `service_pack`
  MODIFY `id_service_pack` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `societe`
--
ALTER TABLE `societe`
  MODIFY `id_societe` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `statut`
--
ALTER TABLE `statut`
  MODIFY `id_statut` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `type_composant`
--
ALTER TABLE `type_composant`
  MODIFY `id_type_composant` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `type_intervenant`
--
ALTER TABLE `type_intervenant`
  MODIFY `id_type_intervenant` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `type_materiel`
--
ALTER TABLE `type_materiel`
  MODIFY `id_type_materiel` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `type_societe`
--
ALTER TABLE `type_societe`
  MODIFY `id_type_societe` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id_utilisateur` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `appartenir`
--
ALTER TABLE `appartenir`
  ADD CONSTRAINT `appartenir_fk1` FOREIGN KEY (`id_societe`) REFERENCES `societe` (`id_societe`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appartenir_fk2` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appartenir_fk3` FOREIGN KEY (`id_batiment_etage`) REFERENCES `batiment_etage` (`id_batiment_etage`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appartenir_fk4` FOREIGN KEY (`id_service`) REFERENCES `service` (`id_service`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `composant`
--
ALTER TABLE `composant`
  ADD CONSTRAINT `composant_fk1` FOREIGN KEY (`id_societe`) REFERENCES `societe` (`id_societe`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `composant_fk2` FOREIGN KEY (`id_type_composant`) REFERENCES `type_composant` (`id_type_composant`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `composer`
--
ALTER TABLE `composer`
  ADD CONSTRAINT `composer_fk1` FOREIGN KEY (`id_materiel`) REFERENCES `materiel` (`id_materiel`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `composer_fk2` FOREIGN KEY (`id_composant`) REFERENCES `composant` (`id_composant`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `installer`
--
ALTER TABLE `installer`
  ADD CONSTRAINT `installer_fk1` FOREIGN KEY (`id_logiciel`) REFERENCES `logiciel` (`id_logiciel`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `installer_fk2` FOREIGN KEY (`id_materiel`) REFERENCES `materiel` (`id_materiel`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `intervenant`
--
ALTER TABLE `intervenant`
  ADD CONSTRAINT `intervenant_fk2` FOREIGN KEY (`id_type_intervenant`) REFERENCES `type_intervenant` (`id_type_intervenant`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `intervention`
--
ALTER TABLE `intervention`
  ADD CONSTRAINT `intervention_fk1` FOREIGN KEY (`id_intervenant`) REFERENCES `intervenant` (`id_intervenant`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `intervention_fk2` FOREIGN KEY (`id_materiel`) REFERENCES `materiel` (`id_materiel`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `logiciel`
--
ALTER TABLE `logiciel`
  ADD CONSTRAINT `logiciel_fk1` FOREIGN KEY (`id_societe`) REFERENCES `societe` (`id_societe`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `logiciel_fk2` FOREIGN KEY (`id_service_pack`) REFERENCES `service_pack` (`id_service_pack`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `materiel`
--
ALTER TABLE `materiel`
  ADD CONSTRAINT `materiel_fk1` FOREIGN KEY (`id_modele_materiel`) REFERENCES `modele_materiel` (`id_modele_materiel`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `materiel_fk2` FOREIGN KEY (`id_type_materiel`) REFERENCES `type_materiel` (`id_type_materiel`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `materiel_fk3` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `materiel_fk5` FOREIGN KEY (`id_statut`) REFERENCES `statut` (`id_statut`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `societe`
--
ALTER TABLE `societe`
  ADD CONSTRAINT `societe_fk1` FOREIGN KEY (`id_type_societe`) REFERENCES `type_societe` (`id_type_societe`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `utilisateur_fk_2` FOREIGN KEY (`id_fonction_utilisateur`) REFERENCES `fonction_utilisateur` (`id_fonction_utilisateur`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
