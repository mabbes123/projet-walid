-- phpMyAdmin SQL Dump
-- version 2.7.0-pl2
-- http://www.phpmyadmin.net
-- 
-- Serveur: localhost
-- Généré le : Vendredi 19 Mai 2006 à 14:20
-- Version du serveur: 4.1.18
-- Version de PHP: 5.0.5
-- 
-- Base de données: `supcom`
-- 

-- --------------------------------------------------------

-- 
-- Structure de la table `appartenir`
-- 

DROP TABLE IF EXISTS `appartenir`;
CREATE TABLE IF NOT EXISTS `appartenir` (
  `id_societe` int(2) NOT NULL default '0',
  `id_utilisateur` int(3) NOT NULL default '0',
  `id_batiment_etage` int(2) NOT NULL default '0',
  `id_service` int(2) NOT NULL default '0',
  PRIMARY KEY  (`id_societe`,`id_utilisateur`,`id_batiment_etage`,`id_service`),
  KEY `appartenir_fk2` (`id_utilisateur`),
  KEY `appartenir_fk3` (`id_batiment_etage`),
  KEY `appartenir_fk4` (`id_service`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Contenu de la table `appartenir`
-- 

INSERT INTO `appartenir` (`id_societe`, `id_utilisateur`, `id_batiment_etage`, `id_service`) VALUES (1, 1, 1, 5),
(9, 1, 1, 1),
(9, 2, 1, 1),
(10, 3, 2, 2);

-- --------------------------------------------------------

-- 
-- Structure de la table `batiment_etage`
-- 

DROP TABLE IF EXISTS `batiment_etage`;
CREATE TABLE IF NOT EXISTS `batiment_etage` (
  `id_batiment_etage` int(2) NOT NULL auto_increment,
  `libelle_batiment_etage` char(30) default NULL,
  PRIMARY KEY  (`id_batiment_etage`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- 
-- Contenu de la table `batiment_etage`
-- 

INSERT INTO `batiment_etage` (`id_batiment_etage`, `libelle_batiment_etage`) VALUES (1, ''),
(2, 'Bat A - Rez de chaussé'),
(3, 'Bat B - Rez de chaussé');

-- --------------------------------------------------------

-- 
-- Structure de la table `composant`
-- 

DROP TABLE IF EXISTS `composant`;
CREATE TABLE IF NOT EXISTS `composant` (
  `id_composant` int(3) NOT NULL auto_increment,
  `libelle_composant` varchar(40) NOT NULL default '',
  `id_societe` int(2) NOT NULL default '0',
  `id_type_composant` int(2) NOT NULL default '0',
  PRIMARY KEY  (`id_composant`),
  KEY `id_societe` (`id_societe`),
  KEY `id_type_composant` (`id_type_composant`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- 
-- Contenu de la table `composant`
-- 

INSERT INTO `composant` (`id_composant`, `libelle_composant`, `id_societe`, `id_type_composant`) VALUES (1, 'Pentium 4', 8, 2),
(2, 'Barracuda 120 Go', 11, 3),
(3, '', 11, 4),
(4, 'Intel Pro 10/100', 8, 5),
(5, 'Caviar', 8, 3);

-- --------------------------------------------------------

-- 
-- Structure de la table `composer`
-- 

DROP TABLE IF EXISTS `composer`;
CREATE TABLE IF NOT EXISTS `composer` (
  `id_materiel` int(4) NOT NULL default '0',
  `id_composant` int(3) NOT NULL default '0',
  `precision_composant` varchar(25) default NULL,
  `qte_composant` int(2) NOT NULL default '0',
  PRIMARY KEY  (`id_materiel`,`id_composant`),
  KEY `composer_fk2` (`id_composant`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Contenu de la table `composer`
-- 

INSERT INTO `composer` (`id_materiel`, `id_composant`, `precision_composant`, `qte_composant`) VALUES (7, 1, '', 1),
(7, 2, '', 1),
(9, 3, '', 1),
(10, 2, '60 Go', 1),
(10, 4, '', 1);

-- --------------------------------------------------------

-- 
-- Structure de la table `fonction_utilisateur`
-- 

DROP TABLE IF EXISTS `fonction_utilisateur`;
CREATE TABLE IF NOT EXISTS `fonction_utilisateur` (
  `id_fonction_utilisateur` int(2) NOT NULL auto_increment,
  `libelle_fonction_utilisateur` varchar(40) NOT NULL default '',
  PRIMARY KEY  (`id_fonction_utilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- 
-- Contenu de la table `fonction_utilisateur`
-- 

INSERT INTO `fonction_utilisateur` (`id_fonction_utilisateur`, `libelle_fonction_utilisateur`) VALUES (1, ''),
(2, 'Automaticien'),
(3, 'Responsable du matériel informatique'),
(4, 'Administrateur supcom'),
(5, 'Chef Atelier');

-- --------------------------------------------------------

-- 
-- Structure de la table `installer`
-- 

DROP TABLE IF EXISTS `installer`;
CREATE TABLE IF NOT EXISTS `installer` (
  `id_logiciel` int(3) NOT NULL default '0',
  `id_materiel` int(4) NOT NULL default '0',
  PRIMARY KEY  (`id_logiciel`,`id_materiel`),
  KEY `installer_fk2` (`id_materiel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Contenu de la table `installer`
-- 

INSERT INTO `installer` (`id_logiciel`, `id_materiel`) VALUES (1, 7),
(2, 7),
(1, 10);

-- --------------------------------------------------------

-- 
-- Structure de la table `intervenant`
-- 

DROP TABLE IF EXISTS `intervenant`;
CREATE TABLE IF NOT EXISTS `intervenant` (
  `id_intervenant` int(3) NOT NULL auto_increment,
  `nom_intervenant` varchar(20) NOT NULL default '',
  `prenom_intervenant` varchar(20) NOT NULL default '',
  `nom_complet_intervenant` varchar(50) NOT NULL default '',
  `tel_intervenant` varchar(10) NOT NULL default '',
  `portable_intervenant` varchar(10) default NULL,
  `fax_intervenant` varchar(10) default NULL,
  `email_intervenant` varchar(40) default NULL,
  `observation_intervenant` varchar(160) default NULL,
  `id_type_intervenant` int(2) NOT NULL default '0',
  `id_societe` int(2) NOT NULL default '0',
  PRIMARY KEY  (`id_intervenant`),
  KEY `id_type_intervenant` (`id_type_intervenant`),
  KEY `id_societe` (`id_societe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- 
-- Contenu de la table `intervenant`
-- 

INSERT INTO `intervenant` (`id_intervenant`, `nom_intervenant`, `prenom_intervenant`, `nom_complet_intervenant`, `tel_intervenant`, `portable_intervenant`, `fax_intervenant`, `email_intervenant`, `observation_intervenant`, `id_type_intervenant`, `id_societe`) VALUES (1, '', '', '', '', '', '', '', '', 1, 1),
(2, 'Dupont', 'Claire', 'Dupont Claire', '', '', '', '', '', 2, 3),
(3, 'Bernaille', 'Laurent', 'Bernaille Laurent', '', '', '', '', '', 3, 10);

-- --------------------------------------------------------

-- 
-- Structure de la table `intervention`
-- 

DROP TABLE IF EXISTS `intervention`;
CREATE TABLE IF NOT EXISTS `intervention` (
  `id_intervention` int(5) NOT NULL auto_increment,
  `probleme_intervention` varchar(160) NOT NULL default '',
  `date_probleme` date default NULL,
  `date_intervention` date default NULL,
  `duree_intervention` int(4) NOT NULL default '0',
  `compte_rendu_intervention` varchar(160) default NULL,
  `id_intervenant` int(3) NOT NULL default '0',
  `id_materiel` int(4) NOT NULL default '0',
  PRIMARY KEY  (`id_intervention`),
  KEY `id_intervenant` (`id_intervenant`),
  KEY `id_materiel` (`id_materiel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- 
-- Contenu de la table `intervention`
-- 

INSERT INTO `intervention` (`id_intervention`, `probleme_intervention`, `date_probleme`, `date_intervention`, `duree_intervention`, `compte_rendu_intervention`, `id_intervenant`, `id_materiel`) VALUES (1, 'formatage', '2006-05-17', '2006-05-26', 240, 'ras', 2, 8),
(2, 'Ne démarre plus', '2006-05-12', '2006-05-15', 30, 'coucou', 3, 7);

-- --------------------------------------------------------

-- 
-- Structure de la table `logiciel`
-- 

DROP TABLE IF EXISTS `logiciel`;
CREATE TABLE IF NOT EXISTS `logiciel` (
  `id_logiciel` int(3) NOT NULL auto_increment,
  `nom_logiciel` varchar(30) NOT NULL default '',
  `version_logiciel` varchar(5) default NULL,
  `date_achat_logiciel` date default NULL,
  `observation_logiciel` varchar(160) default NULL,
  `id_societe` int(2) NOT NULL default '0',
  `id_service_pack` int(2) default NULL,
  PRIMARY KEY  (`id_logiciel`),
  KEY `id_societe` (`id_societe`),
  KEY `id_service_pack` (`id_service_pack`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- 
-- Contenu de la table `logiciel`
-- 

INSERT INTO `logiciel` (`id_logiciel`, `nom_logiciel`, `version_logiciel`, `date_achat_logiciel`, `observation_logiciel`, `id_societe`, `id_service_pack`) VALUES (1, 'Windows XP', '', '0000-00-00', '', 13, 2),
(2, 'MS OFFICE', ' 97', '0000-00-00', '', 13, 2),
(3, 'MS OFFICE', '2003', '0000-00-00', '', 13, 2),
(4, 'MS OFFICE', '97', '0000-00-00', '', 13, 2),
(6, 'MS OFFICE', '2000', '0000-00-00', '', 13, 2);

-- --------------------------------------------------------

-- 
-- Structure de la table `materiel`
-- 

DROP TABLE IF EXISTS `materiel`;
CREATE TABLE IF NOT EXISTS `materiel` (
  `id_materiel` int(4) NOT NULL auto_increment,
  `num_serie_materiel` varchar(8) NOT NULL default '',
  `tag_supcom_materiel` varchar(10) NOT NULL default '',
  `nom_materiel` varchar(8) NOT NULL default '',
  `date_achat_materiel` date default NULL,
  `adresseip_materiel` varchar(15) default NULL,
  `observation_materiel` varchar(160) default NULL,
  `id_modele_materiel` int(4) NOT NULL default '0',
  `id_type_materiel` int(2) NOT NULL default '0',
  `id_utilisateur` int(3) default NULL,
  `id_societe` int(2) NOT NULL default '0',
  `id_statut` int(2) default NULL,
  PRIMARY KEY  (`id_materiel`),
  KEY `id_modele` (`id_modele_materiel`),
  KEY `id_type_materiel` (`id_type_materiel`),
  KEY `id_utilisateur` (`id_utilisateur`),
  KEY `id_statut` (`id_statut`),
  KEY `id_societe` (`id_societe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

-- 
-- Contenu de la table `materiel`
-- 

INSERT INTO `materiel` (`id_materiel`, `num_serie_materiel`, `tag_supcom_materiel`, `nom_materiel`, `date_achat_materiel`, `adresseip_materiel`, `observation_materiel`, `id_modele_materiel`, `id_type_materiel`, `id_utilisateur`, `id_societe`, `id_statut`) VALUES (6, 'grrg', 'grrgrg', 'grrg', '0000-00-00', '', '', 1, 6, NULL, 3, 3),
(7, 'grg', 'grgr', 'grg', '0000-00-00', '', '', 1, 6, NULL, 3, 3),
(8, 'dzffzfg', 'IMP312', 'IMP312', '1985-04-22', '', '', 2, 4, NULL, 8, 2),
(9, 'fefefg', 'PORT41', 'PO412', '2007-01-12', '', '', 2, 2, NULL, 8, 4),
(10, '809', 'PO809', 'PO809', '2006-05-02', 'dhcp', 'ceci est un test', 2, 2, 3, 8, 2);

-- --------------------------------------------------------

-- 
-- Structure de la table `modele_materiel`
-- 

DROP TABLE IF EXISTS `modele_materiel`;
CREATE TABLE IF NOT EXISTS `modele_materiel` (
  `id_modele_materiel` int(4) NOT NULL auto_increment,
  `libelle_modele_materiel` varchar(30) NOT NULL default '',
  PRIMARY KEY  (`id_modele_materiel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- 
-- Contenu de la table `modele_materiel`
-- 

INSERT INTO `modele_materiel` (`id_modele_materiel`, `libelle_modele_materiel`) VALUES (1, ''),
(2, 'Optiplex GX270');


-- --------------------------------------------------------

-- 
-- Structure de la table `service`
-- 

DROP TABLE IF EXISTS `service`;
CREATE TABLE IF NOT EXISTS `service` (
  `id_service` int(2) NOT NULL auto_increment,
  `libelle_service` varchar(30) NOT NULL default '',
  PRIMARY KEY  (`id_service`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- 
-- Contenu de la table `service`
-- 

INSERT INTO `service` (`id_service`, `libelle_service`) VALUES (1, ''),
(2, 'Atelier'),
(3, 'Bureau Etude'),
(5, 'Service Comptabilité'),
(6, 'Service développement');

-- --------------------------------------------------------

-- 
-- Structure de la table `service_pack`
-- 

DROP TABLE IF EXISTS `service_pack`;
CREATE TABLE IF NOT EXISTS `service_pack` (
  `id_service_pack` int(2) NOT NULL auto_increment,
  `libelle_service_pack` varchar(4) NOT NULL default '',
  PRIMARY KEY  (`id_service_pack`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- 
-- Contenu de la table `service_pack`
-- 

INSERT INTO `service_pack` (`id_service_pack`, `libelle_service_pack`) VALUES (1, ''),
(2, 'SP1'),
(5, 'SP4'),
(6, 'SP2');

-- --------------------------------------------------------

-- 
-- Structure de la table `societe`
-- 

DROP TABLE IF EXISTS `societe`;
CREATE TABLE IF NOT EXISTS `societe` (
  `id_societe` int(2) NOT NULL auto_increment,
  `nom_societe` varchar(40) NOT NULL default '',
  `adresse_societe` varchar(80) default NULL,
  `ville_societe` varchar(30) default NULL,
  `cp_societe` varchar(5) default NULL,
  `site_web_societe` varchar(60) default NULL,
  `tel_societe` varchar(10) default NULL,
  `portable_societe` varchar(10) default NULL,
  `fax_societe` varchar(10) default NULL,
  `email_societe` varchar(50) default NULL,
  `observation_societe` varchar(160) default NULL,
  `id_type_societe` int(2) default NULL,
  PRIMARY KEY  (`id_societe`),
  KEY `id_type_societe` (`id_type_societe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

-- 
-- Contenu de la table `societe`
-- 

INSERT INTO `societe` (`id_societe`, `nom_societe`, `adresse_societe`, `ville_societe`, `cp_societe`, `site_web_societe`, `tel_societe`, `portable_societe`, `fax_societe`, `email_societe`, `observation_societe`, `id_type_societe`) VALUES (1, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
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

DROP TABLE IF EXISTS `statut`;
CREATE TABLE IF NOT EXISTS `statut` (
  `id_statut` int(2) NOT NULL auto_increment,
  `libelle_statut` varchar(15) default NULL,
  PRIMARY KEY  (`id_statut`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- 
-- Contenu de la table `statut`
-- 

INSERT INTO `statut` (`id_statut`, `libelle_statut`) VALUES (1, ''),
(2, 'En service'),
(3, 'En stock'),
(4, 'En panne');

-- --------------------------------------------------------

-- 
-- Structure de la table `type_composant`
-- 

DROP TABLE IF EXISTS `type_composant`;
CREATE TABLE IF NOT EXISTS `type_composant` (
  `id_type_composant` int(2) NOT NULL auto_increment,
  `libelle_type_composant` varchar(20) default NULL,
  PRIMARY KEY  (`id_type_composant`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- 
-- Contenu de la table `type_composant`
-- 

INSERT INTO `type_composant` (`id_type_composant`, `libelle_type_composant`) VALUES (1, ''),
(2, 'Processeur'),
(3, 'Disque dur'),
(4, 'Carte mère'),
(5, 'Carte Réseau');

-- --------------------------------------------------------

-- 
-- Structure de la table `type_intervenant`
-- 

DROP TABLE IF EXISTS `type_intervenant`;
CREATE TABLE IF NOT EXISTS `type_intervenant` (
  `id_type_intervenant` int(2) NOT NULL auto_increment,
  `libelle_type_intervenant` varchar(20) default NULL,
  PRIMARY KEY  (`id_type_intervenant`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- 
-- Contenu de la table `type_intervenant`
-- 

INSERT INTO `type_intervenant` (`id_type_intervenant`, `libelle_type_intervenant`) VALUES (1, NULL),
(2, 'Commercial'),
(3, 'Réparateur');

-- --------------------------------------------------------

-- 
-- Structure de la table `type_materiel`
-- 

DROP TABLE IF EXISTS `type_materiel`;
CREATE TABLE IF NOT EXISTS `type_materiel` (
  `id_type_materiel` int(2) NOT NULL auto_increment,
  `libelle_type_materiel` varchar(15) default NULL,
  PRIMARY KEY  (`id_type_materiel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- 
-- Contenu de la table `type_materiel`
-- 

INSERT INTO `type_materiel` (`id_type_materiel`, `libelle_type_materiel`) VALUES (1, NULL),
(2, 'Portable'),
(3, 'Serveur'),
(4, 'Imprimante'),
(5, 'Switch'),
(6, 'Ordinateur');

-- --------------------------------------------------------

-- 
-- Structure de la table `type_societe`
-- 

DROP TABLE IF EXISTS `type_societe`;
CREATE TABLE IF NOT EXISTS `type_societe` (
  `id_type_societe` int(2) NOT NULL auto_increment,
  `libelle_type_societe` varchar(25) NOT NULL default '',
  PRIMARY KEY  (`id_type_societe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- 
-- Contenu de la table `type_societe`
-- 

INSERT INTO `type_societe` (`id_type_societe`, `libelle_type_societe`) VALUES (1, ''),
(2, 'Assembleur'),
(3, 'Site supcom'),
(4, 'Editeur'),
(5, 'Développeur');

-- --------------------------------------------------------

-- 
-- Structure de la table `utilisateur`
-- 

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id_utilisateur` int(3) NOT NULL auto_increment,
  `nom_utilisateur` varchar(20) NOT NULL default '',
  `prenom_utilisateur` varchar(20) NOT NULL default '',
  `nom_complet_utilisateur` varchar(50) NOT NULL default '',
  `login_utilisateur` varchar(30) default NULL,
  `tel_bureau_utilisateur` varchar(10) default NULL,
  `portable_utilisateur` varchar(10) default NULL,
  `email_utilisateur` varchar(40) default NULL,
  `mdp_utilisateur` varchar(8) default NULL,
  `observation_utilisateur` varchar(160) default NULL,
  `id_fonction_utilisateur` int(2) default NULL,
  PRIMARY KEY  (`id_utilisateur`),
  KEY `id_fonction_utilisateur` (`id_fonction_utilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- 
-- Contenu de la table `utilisateur`
-- 

INSERT INTO `utilisateur` (`id_utilisateur`, `nom_utilisateur`, `prenom_utilisateur`, `nom_complet_utilisateur`, `login_utilisateur`, `tel_bureau_utilisateur`, `portable_utilisateur`, `email_utilisateur`, `mdp_utilisateur`, `observation_utilisateur`, `id_fonction_utilisateur`) VALUES (1, '', '', '', '', '', '', '', '', '', 1),
(2, 'Viriet', 'Maxime', 'Viriet Maxime', 'viriet', '0344425732', '0674120530', 'maximous2204@hotmail.com', 'lisara', '', 2),
(3, 'Bernaille', 'Laurent', 'Bernaille Laurent', 'bernaille', '153', '', 'bernaille@supcom.tn', 'laurent', '', 3);

-- 
-- Contraintes pour les tables exportées
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