-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  ven. 10 mai 2019 à 17:16
-- Version du serveur :  10.1.38-MariaDB
-- Version de PHP :  7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gsb_frais`
--

DELIMITER $$
--
-- Procédures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `archiverFicheFrais` ()  MODIFIES SQL DATA
    COMMENT 'Disable old visitor sheets'
BEGIN
DECLARE v_numMois VARCHAR(6);
-- On récupère l'année et le mois courant sous la forme YYYYMM (comme dans nos deux tables ci-dessous)
  SELECT DATE_FORMAT(NOW(),'%Y%m') INTO v_numMois;
    
    -- On archive nos tuples si des fiches sont encore ouvertes du mois précédent
    UPDATE ficheFrais SET idetat = 'CL' WHERE mois < v_numMois;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `etat`
--

CREATE TABLE `etat` (
  `id` char(2) NOT NULL,
  `libelle` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `etat`
--

INSERT INTO `etat` (`id`, `libelle`) VALUES
('CL', 'Saisie clôturée'),
('CR', 'Fiche créée, saisie en cours'),
('PA', 'Mise en paiement'),
('RB', 'Remboursée'),
('VA', 'Validée');

-- --------------------------------------------------------

--
-- Structure de la table `fichefrais`
--

CREATE TABLE `fichefrais` (
  `idmembre` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `nbjustificatifs` int(11) DEFAULT NULL,
  `montantvalide` decimal(10,2) DEFAULT NULL,
  `datemodif` date DEFAULT NULL,
  `idetat` char(2) DEFAULT 'CR',
  `idvehicule` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `fichefrais`
--

INSERT INTO `fichefrais` (`idmembre`, `mois`, `nbjustificatifs`, `montantvalide`, `datemodif`, `idetat`, `idvehicule`) VALUES
('a131', '201901', 0, '0.00', '2019-02-01', 'CL', 1),
('a131', '201902', 0, '0.00', '2019-03-01', 'CL', 1),
('a131', '201903', 0, '0.00', '2019-03-01', 'CL', 3),
('a55', '201901', 1, '3.20', '2019-02-04', 'VA', 0),
('a55', '201902', 1, '7.50', '2019-03-04', 'VA', 0),
('a55', '201903', 1, '9.25', '2019-04-04', 'VA', 0),
('a55', '201904', 1, '17.80', '2019-05-04', 'CL', 1),
('b13', '201901', 1, '16.07', '2019-02-04', 'VA', 0),
('b13', '201902', 1, '19.96', '2019-03-04', 'VA', 0),
('b13', '201903', 1, '5.00', '2019-04-04', 'VA', 3),
('b13', '201904', 1, '2.00', '2019-05-04', 'VA', 0),
('b25', '201901', 1, '26.00', '2019-02-04', 'VA', 0),
('b25', '201902', 1, '35.00', '2019-03-04', 'VA', 0),
('b25', '201903', 1, '123.00', '2019-04-04', 'VA', 0),
('b25', '201904', 1, '95.00', '2019-05-04', 'VA', 0),
('b25', '201905', 1, '80.00', '2019-06-04', 'VA', 0),
('b28', '201901', 1, '4.00', '2019-02-04', 'VA', 1),
('b28', '201902', 1, '65.00', '2019-03-04', 'VA', 3),
('b28', '201903', 1, '12.30', '2019-04-04', 'VA', 0),
('b28', '201904', 1, '9.50', '2019-05-04', 'CL', 0),
('b28', '201905', 1, '1.80', '2019-06-04', 'VA', 0),
('b34', '201901', 1, '26.00', '2019-02-04', 'VA', 0),
('b34', '201902', 1, '35.00', '2019-03-04', 'VA', 0),
('b34', '201903', 1, '123.00', '2019-04-04', 'VA', 0),
('b34', '201904', 1, '95.00', '2019-05-04', 'VA', 0),
('b34', '201905', 1, '80.00', '2019-06-04', 'CL', 0),
('b4', '201901', 1, '64.00', '2019-02-04', 'VA', 0),
('b4', '201902', 1, '125.00', '2019-03-04', 'VA', 0),
('b4', '201903', 1, '13.00', '2019-04-04', 'VA', 1),
('b4', '201904', 1, '5.00', '2019-05-04', 'VA', 2),
('b4', '201905', 1, '94.80', '2019-06-04', 'CL', 0),
('b50', '201902', 0, '0.00', '2019-02-04', 'CL', 1),
('b59', '201901', 1, '41.00', '2019-02-04', 'VA', 1),
('b59', '201902', 1, '3.00', '2019-03-04', 'VA', 0),
('b59', '201903', 1, '1.23', '2019-04-04', 'VA', 0),
('b59', '201904', 1, '1.95', '2019-05-04', 'VA', 0),
('b59', '201905', 1, '8.00', '2019-06-04', 'VA', 0),
('c14', '201901', 1, '2.60', '2019-02-04', 'VA', 0),
('c14', '201902', 1, '47.00', '2019-03-04', 'VA', 1),
('c14', '201903', 1, '1.23', '2019-04-04', 'VA', 0),
('c14', '201904', 1, '9.50', '2019-05-04', 'VA', 0),
('c14', '201905', 1, '3.51', '2019-06-04', 'VA', 0),
('c3', '201901', 0, '16606.38', '2019-02-28', 'VA', 1),
('c3', '201902', 1, '0.00', '2019-02-21', 'VA', 1),
('c3', '201903', 1, '0.00', '2019-03-01', 'CL', 1),
('c3', '201904', 1, '0.00', '2019-03-02', 'VA', 1),
('c54', '201901', 2, '12.30', '2019-02-02', 'VA', 0),
('c54', '201902', 3, '123.00', '2019-03-02', 'VA', 3),
('c54', '201903', 0, '1.30', '2019-04-02', 'VA', 0),
('c54', '201904', 1, '2.30', '2019-05-02', 'VA', 0),
('c54', '201905', 2, '12.00', '2019-06-02', 'VA', 0),
('d13', '201901', 1, '4.56', '2019-02-02', 'VA', 0),
('d13', '201902', 1, '45.60', '2019-03-02', 'VA', 2),
('d13', '201903', 3, '46.00', '2019-04-02', 'VA', 0),
('d13', '201904', 4, '4.30', '2019-05-02', 'VA', 0),
('d13', '201905', 1, '62.30', '2019-06-02', 'VA', 1),
('d51', '201901', 1, '6.23', '2019-02-02', 'VA', 0),
('d51', '201902', 2, '102.10', '2019-03-02', 'VA', 2),
('d51', '201903', 0, '14.20', '2019-04-02', 'VA', 0),
('d51', '201904', 3, '36.17', '2019-05-02', 'VA', 3),
('d51', '201905', 5, '94.20', '2019-06-02', 'VA', 0),
('e22', '201901', 0, '0.00', '2019-02-02', 'VA', 0),
('e22', '201902', 1, '1.30', '2019-03-02', 'VA', 1),
('e22', '201903', 3, '22.30', '2019-04-02', 'VA', 0),
('e22', '201904', 9, '1232.30', '2019-05-02', 'VA', 3),
('e22', '201905', 7, '83.52', '2019-06-02', 'VA', 0),
('e24', '201901', 1, '21.00', '2019-02-02', 'VA', 2),
('e24', '201902', 1, '1.30', '2019-03-02', 'VA', 0),
('e24', '201903', 1, '2.30', '2019-04-02', 'VA', 0),
('e24', '201904', 6, '112.30', '2019-05-02', 'VA', 0),
('e24', '201905', 4, '22.40', '2019-06-02', 'VA', 3),
('e39', '201901', 1, '45.30', '2019-02-02', 'VA', 0),
('e39', '201902', 0, '0.30', '2019-03-02', 'VA', 2),
('e39', '201903', 2, '13.00', '2019-04-02', 'VA', 0),
('e39', '201904', 2, '62.30', '2019-05-02', 'VA', 1),
('e39', '201905', 1, '16.30', '2019-06-02', 'VA', 0),
('e49', '201901', 4, '14.98', '2019-02-02', 'VA', 3),
('e49', '201902', 6, '51.74', '2019-03-02', 'VA', 0),
('e49', '201903', 2, '33.21', '2019-04-02', 'VA', 2),
('e49', '201904', 1, '11.01', '2019-05-02', 'VA', 0),
('e49', '201905', 0, '0.06', '2019-06-02', 'VA', 0),
('e52', '201901', 1, '3.23', '2019-02-02', 'VA', 1),
('e52', '201902', 1, '6.14', '2019-03-02', 'VA', 0),
('e52', '201903', 3, '68.12', '2019-04-02', 'VA', 2),
('e52', '201904', 4, '14.10', '2019-05-02', 'VA', 0),
('e52', '201905', 1, '81.23', '2019-06-02', 'VA', 0),
('f21', '201901', 6, '26.78', '2019-02-02', 'VA', 1),
('f21', '201902', 5, '14.21', '2019-03-02', 'VA', 0),
('f21', '201903', 1, '62.10', '2019-04-02', 'VA', 2),
('f21', '201904', 2, '41.65', '2019-05-02', 'VA', 0),
('f21', '201905', 3, '95.17', '2019-06-02', 'VA', 1),
('f39', '201901', 5, '62.55', '2019-02-02', 'VA', 0),
('f39', '201902', 8, '13.15', '2019-03-02', 'VA', 0),
('f39', '201903', 1, '44.53', '2019-04-02', 'VA', 3),
('f39', '201904', 4, '33.68', '2019-05-02', 'VA', 0),
('f39', '201905', 0, '0.68', '2019-06-02', 'VA', 2),
('f4', '201901', 1, '12.55', '2019-02-02', 'VA', 0),
('f4', '201902', 2, '54.25', '2019-03-02', 'VA', 0),
('f4', '201903', 2, '75.54', '2019-04-02', 'VA', 0),
('f4', '201904', 1, '65.57', '2019-05-02', 'VA', 3),
('f4', '201905', 3, '12.30', '2019-06-02', 'VA', 1);

-- --------------------------------------------------------

--
-- Structure de la table `fraisforfait`
--

CREATE TABLE `fraisforfait` (
  `id` char(3) NOT NULL,
  `libelle` char(20) DEFAULT NULL,
  `montant` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `fraisforfait`
--

INSERT INTO `fraisforfait` (`id`, `libelle`, `montant`) VALUES
('ETP', 'Forfait Etape', '110.00'),
('KM', 'Frais Kilométrique', '0.00'),
('NUI', 'Nuitée Hôtel', '80.00'),
('REP', 'Repas Restaurant', '25.00');

--
-- Déclencheurs `fraisforfait`
--
DELIMITER $$
CREATE TRIGGER `archiverFicheFrais` BEFORE INSERT ON `fraisforfait` FOR EACH ROW CALL archiverFicheFrais()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `lignefraisforfait`
--

CREATE TABLE `lignefraisforfait` (
  `idmembre` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `idfraisforfait` char(3) NOT NULL,
  `quantite` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `lignefraisforfait`
--

INSERT INTO `lignefraisforfait` (`idmembre`, `mois`, `idfraisforfait`, `quantite`) VALUES
('a131', '201901', 'ETP', 9),
('a131', '201901', 'KM', 10),
('a131', '201901', 'NUI', 10),
('a131', '201901', 'REP', 70),
('a131', '201902', 'ETP', 0),
('a131', '201902', 'KM', 0),
('a131', '201902', 'NUI', 0),
('a131', '201902', 'REP', 0),
('a131', '201903', 'ETP', 0),
('a131', '201903', 'KM', 55),
('a131', '201903', 'NUI', 0),
('a131', '201903', 'REP', 0),
('a55', '201901', 'ETP', 9),
('a55', '201901', 'KM', 39),
('a55', '201901', 'NUI', 0),
('a55', '201901', 'REP', 91),
('a55', '201902', 'ETP', 9),
('a55', '201902', 'KM', 39),
('a55', '201902', 'NUI', 0),
('a55', '201902', 'REP', 91),
('a55', '201903', 'ETP', 9),
('a55', '201903', 'KM', 10),
('a55', '201903', 'NUI', 0),
('a55', '201903', 'REP', 91),
('a55', '201904', 'NUI', 10),
('a55', '201905', 'REP', 70),
('b13', '20190', 'REP', 1),
('b13', '201901', 'ETP', 9),
('b13', '201901', 'KM', 39),
('b13', '201901', 'NUI', 0),
('b13', '201901', 'REP', 91),
('b13', '201902', 'ETP', 9),
('b13', '201902', 'KM', 10),
('b13', '201902', 'NUI', 10),
('b13', '201902', 'REP', 11),
('b13', '201903', 'ETP', 9),
('b13', '201903', 'KM', 3),
('b13', '201903', 'NUI', 10),
('b13', '201904', 'ETP', 2),
('b13', '201904', 'KM', 36),
('b13', '201904', 'NUI', 0),
('b13', '201904', 'REP', 70),
('b13', '201905', 'ETP', 0),
('b25', '201901', 'KM', 39),
('b25', '201901', 'NUI', 0),
('b25', '201901', 'REP', 91),
('b25', '201902', 'ETP', 9),
('b25', '201902', 'KM', 0),
('b25', '201902', 'NUI', 0),
('b25', '201902', 'REP', 0),
('b25', '201903', 'ETP', 0),
('b25', '201903', 'KM', 55),
('b25', '201903', 'NUI', 0),
('b25', '201903', 'REP', 1),
('b25', '201904', 'ETP', 2),
('b25', '201904', 'KM', 36),
('b25', '201904', 'NUI', 0),
('b25', '201904', 'REP', 21),
('b25', '201905', 'ETP', 6),
('b25', '201905', 'KM', 6),
('b25', '201905', 'NUI', 10),
('b25', '201905', 'REP', 13),
('b28', '201901', 'ETP', 55),
('b28', '201901', 'KM', 99),
('b28', '201901', 'NUI', 119),
('b28', '201901', 'REP', 91),
('b28', '201902', 'ETP', 9),
('b28', '201902', 'KM', 19),
('b28', '201902', 'REP', 11),
('b28', '201903', 'ETP', 9),
('b28', '201903', 'KM', 3),
('b28', '201903', 'NUI', 0),
('b28', '201903', 'REP', 0),
('b28', '201904', 'ETP', 2),
('b28', '201904', 'KM', 36),
('b28', '201904', 'NUI', 0),
('b28', '201904', 'REP', 21),
('b28', '201905', 'ETP', 2),
('b28', '201905', 'KM', 36),
('b28', '201905', 'NUI', 0),
('b28', '201905', 'REP', 21),
('b34', '201901', 'ETP', 9),
('b34', '201901', 'KM', 10),
('b34', '201901', 'NUI', 10),
('b34', '201901', 'REP', 70),
('b34', '201902', 'ETP', 9),
('b34', '201902', 'KM', 39),
('b34', '201902', 'NUI', 0),
('b34', '201902', 'REP', 91),
('b34', '201903', 'ETP', 9),
('b34', '201903', 'KM', 39),
('b34', '201903', 'NUI', 0),
('b34', '201903', 'REP', 91),
('b34', '201904', 'ETP', 2),
('b34', '201904', 'KM', 36),
('b34', '201904', 'NUI', 0),
('b34', '201904', 'REP', 21),
('b4', '201901', 'ETP', 9),
('b4', '201901', 'KM', 19),
('b4', '201901', 'NUI', 0),
('b4', '201901', 'REP', 39),
('b4', '201902', 'ETP', 0),
('b4', '201902', 'KM', 0),
('b4', '201902', 'NUI', 0),
('b4', '201902', 'REP', 0),
('b4', '201903', 'ETP', 9),
('b4', '201903', 'KM', 3),
('b4', '201903', 'NUI', 0),
('b4', '201903', 'REP', 1),
('b4', '201904', 'ETP', 2),
('b4', '201904', 'KM', 36),
('b4', '201904', 'NUI', 0),
('b4', '201904', 'REP', 21),
('b4', '201905', 'ETP', 2),
('b4', '201905', 'KM', 36),
('b4', '201905', 'NUI', 0),
('b4', '201905', 'REP', 21),
('b59', '201901', 'ETP', 9),
('b59', '201901', 'KM', 19),
('b59', '201901', 'NUI', 0),
('b59', '201901', 'REP', 91),
('b59', '201902', 'ETP', 9),
('b59', '201902', 'KM', 19),
('b59', '201902', 'NUI', 10),
('b59', '201902', 'REP', 11),
('b59', '201903', 'ETP', 0),
('b59', '201903', 'KM', 55),
('b59', '201903', 'NUI', 0),
('b59', '201903', 'REP', 0),
('b59', '201904', 'ETP', 0),
('b59', '201904', 'KM', 36),
('b59', '201904', 'NUI', 0),
('b59', '201904', 'REP', 21),
('b59', '201905', 'ETP', 2),
('b59', '201905', 'KM', 36),
('b59', '201905', 'NUI', 0),
('b59', '201905', 'REP', 21),
('c14', '201901', 'ETP', 9),
('c14', '201901', 'KM', 19),
('c14', '201901', 'NUI', 0),
('c14', '201901', 'REP', 91),
('c14', '201902', 'ETP', 9),
('c14', '201902', 'KM', 19),
('c14', '201902', 'NUI', 10),
('c14', '201902', 'REP', 11),
('c14', '201903', 'ETP', 9),
('c14', '201903', 'KM', 3),
('c14', '201903', 'NUI', 0),
('c14', '201903', 'REP', 1),
('c14', '201904', 'ETP', 2),
('c14', '201904', 'KM', 0),
('c14', '201904', 'NUI', 0),
('c14', '201904', 'REP', 0),
('c14', '201905', 'ETP', 2),
('c14', '201905', 'KM', 36),
('c14', '201905', 'NUI', 0),
('c14', '201905', 'REP', 21),
('c3', '201901', 'ETP', 55),
('c3', '201901', 'KM', 99),
('c3', '201901', 'NUI', 119),
('c3', '201901', 'REP', 39),
('c3', '201902', 'ETP', 0),
('c3', '201902', 'KM', 0),
('c3', '201902', 'NUI', 0),
('c3', '201902', 'REP', 0),
('c3', '201903', 'ETP', 0),
('c3', '201903', 'KM', 55),
('c3', '201903', 'NUI', 0),
('c3', '201903', 'REP', 0),
('c3', '201904', 'ETP', 0),
('c3', '201904', 'KM', 0),
('c3', '201904', 'NUI', 0),
('c3', '201904', 'REP', 0),
('c54', '201901', 'ETP', 9),
('c54', '201901', 'KM', 19),
('c54', '201901', 'NUI', 10),
('c54', '201901', 'REP', 70),
('c54', '201902', 'ETP', 0),
('c54', '201902', 'KM', 0),
('c54', '201902', 'NUI', 0),
('c54', '201902', 'REP', 11),
('c54', '201903', 'ETP', 9),
('c54', '201903', 'KM', 3),
('c54', '201903', 'NUI', 0),
('c54', '201903', 'REP', 1),
('c54', '201904', 'ETP', 2),
('c54', '201904', 'KM', 36),
('c54', '201904', 'NUI', 0),
('c54', '201904', 'REP', 21),
('c54', '201905', 'ETP', 2),
('c54', '201905', 'KM', 36),
('c54', '201905', 'NUI', 0),
('c54', '201905', 'REP', 21),
('d13', '201901', 'ETP', 9),
('d13', '201901', 'KM', 19),
('d13', '201901', 'NUI', 0),
('d13', '201901', 'REP', 91),
('d13', '201902', 'ETP', 9),
('d13', '201902', 'KM', 19),
('d13', '201902', 'NUI', 10),
('d13', '201902', 'REP', 0),
('d13', '201903', 'ETP', 0),
('d13', '201903', 'KM', 55),
('d13', '201903', 'NUI', 0),
('d13', '201903', 'REP', 0),
('d13', '201904', 'ETP', 2),
('d13', '201904', 'KM', 36),
('d13', '201904', 'NUI', 0),
('d13', '201904', 'REP', 21),
('d13', '201905', 'ETP', 2),
('d13', '201905', 'KM', 36),
('d13', '201905', 'NUI', 0),
('d13', '201905', 'REP', 21),
('d51', '201901', 'ETP', 55),
('d51', '201901', 'KM', 99),
('d51', '201901', 'NUI', 119),
('d51', '201901', 'REP', 39),
('d51', '201902', 'ETP', 0),
('d51', '201902', 'KM', 124),
('d51', '201902', 'NUI', 9),
('d51', '201902', 'REP', 8),
('d51', '201903', 'ETP', 6),
('d51', '201903', 'KM', 4),
('d51', '201903', 'NUI', 4),
('d51', '201903', 'REP', 6),
('d51', '201904', 'ETP', 7),
('d51', '201904', 'KM', 3),
('d51', '201904', 'NUI', 9),
('d51', '201904', 'REP', 21),
('d51', '201905', 'ETP', 2),
('d51', '201905', 'KM', 36),
('d51', '201905', 'NUI', 0),
('d51', '201905', 'REP', 21),
('e22', '201901', 'ETP', 6),
('e22', '201901', 'KM', 19),
('e22', '201901', 'NUI', 2),
('e22', '201901', 'REP', 62),
('e22', '201902', 'ETP', 29),
('e22', '201902', 'KM', 0),
('e22', '201902', 'NUI', 0),
('e22', '201902', 'REP', 0),
('e22', '201903', 'ETP', 0),
('e22', '201903', 'KM', 55),
('e22', '201903', 'NUI', 0),
('e22', '201903', 'REP', 0),
('e22', '201904', 'ETP', 7),
('e22', '201904', 'KM', 0),
('e22', '201904', 'NUI', 0),
('e22', '201904', 'REP', 0),
('e22', '201905', 'ETP', 2),
('e22', '201905', 'KM', 36),
('e22', '201905', 'NUI', 0),
('e22', '201905', 'REP', 21),
('e24', '201901', 'ETP', 9),
('e24', '201901', 'KM', 10),
('e24', '201901', 'NUI', 10),
('e24', '201901', 'REP', 70),
('e24', '201902', 'ETP', 29),
('e24', '201902', 'KM', 124),
('e24', '201902', 'NUI', 9),
('e24', '201902', 'REP', 8),
('e24', '201903', 'ETP', 6),
('e24', '201903', 'KM', 4),
('e24', '201903', 'NUI', 4),
('e24', '201903', 'REP', 6),
('e24', '201904', 'ETP', 7),
('e24', '201904', 'KM', 3),
('e24', '201904', 'NUI', 9),
('e24', '201904', 'REP', 21),
('e24', '201905', 'ETP', 2),
('e24', '201905', 'KM', 36),
('e24', '201905', 'NUI', 0),
('e24', '201905', 'REP', 21),
('e39', '201901', 'ETP', 9),
('e39', '201901', 'KM', 10),
('e39', '201901', 'NUI', 10),
('e39', '201901', 'REP', 70),
('e39', '201902', 'ETP', 0),
('e39', '201902', 'KM', 0),
('e39', '201902', 'NUI', 0),
('e39', '201902', 'REP', 0),
('e39', '201903', 'ETP', 0),
('e39', '201903', 'KM', 55),
('e39', '201903', 'NUI', 0),
('e39', '201903', 'REP', 0),
('e39', '201904', 'ETP', 7),
('e39', '201904', 'KM', 3),
('e39', '201904', 'NUI', 9),
('e39', '201904', 'REP', 21),
('e39', '201905', 'ETP', 2),
('e39', '201905', 'KM', 36),
('e39', '201905', 'NUI', 0),
('e39', '201905', 'REP', 21),
('e49', '201901', 'ETP', 55),
('e49', '201901', 'KM', 99),
('e49', '201901', 'NUI', 119),
('e49', '201901', 'REP', 39),
('e49', '201902', 'ETP', 0),
('e49', '201902', 'KM', 0),
('e49', '201902', 'NUI', 0),
('e49', '201902', 'REP', 0),
('e49', '201903', 'ETP', 0),
('e49', '201903', 'KM', 55),
('e49', '201903', 'NUI', 0),
('e49', '201903', 'REP', 0),
('e49', '201904', 'ETP', 0),
('e49', '201904', 'KM', 0),
('e49', '201904', 'NUI', 0),
('e49', '201904', 'REP', 0),
('e49', '201905', 'ETP', 2),
('e49', '201905', 'KM', 36),
('e49', '201905', 'NUI', 0),
('e49', '201905', 'REP', 21),
('e52', '201901', 'ETP', 9),
('e52', '201901', 'KM', 10),
('e52', '201901', 'NUI', 10),
('e52', '201901', 'REP', 70),
('e52', '201902', 'ETP', 29),
('e52', '201902', 'KM', 124),
('e52', '201902', 'NUI', 9),
('e52', '201902', 'REP', 8),
('e52', '201903', 'ETP', 6),
('e52', '201903', 'KM', 4),
('e52', '201903', 'NUI', 4),
('e52', '201903', 'REP', 6),
('e52', '201904', 'ETP', 7),
('e52', '201904', 'KM', 3),
('e52', '201904', 'NUI', 9),
('e52', '201904', 'REP', 21),
('e52', '201905', 'ETP', 2),
('e52', '201905', 'KM', 36),
('e52', '201905', 'NUI', 0),
('e52', '201905', 'REP', 21),
('f21', '201901', 'ETP', 9),
('f21', '201901', 'KM', 10),
('f21', '201901', 'NUI', 2),
('f21', '201901', 'REP', 62),
('f21', '201902', 'ETP', 29),
('f21', '201902', 'KM', 124),
('f21', '201902', 'NUI', 0),
('f21', '201902', 'REP', 0),
('f21', '201903', 'ETP', 0),
('f21', '201903', 'KM', 55),
('f21', '201903', 'NUI', 0),
('f21', '201903', 'REP', 0),
('f21', '201904', 'ETP', 7),
('f21', '201904', 'KM', 3),
('f21', '201904', 'NUI', 9),
('f21', '201904', 'REP', 21),
('f21', '201905', 'ETP', 2),
('f21', '201905', 'KM', 36),
('f21', '201905', 'NUI', 0),
('f21', '201905', 'REP', 21),
('f21f', '201901', 'NUI', 10),
('f21f', '201901', 'REP', 70),
('f21f', '201902', 'ETP', 0),
('f21f', '201902', 'KM', 0),
('f39', '201901', 'ETP', 55),
('f39', '201901', 'KM', 99),
('f39', '201901', 'NUI', 119),
('f39', '201901', 'REP', 39),
('f39', '201902', 'ETP', 0),
('f39', '201902', 'KM', 0),
('f39', '201902', 'NUI', 0),
('f39', '201902', 'REP', 0),
('f39', '201903', 'ETP', 0),
('f39', '201903', 'KM', 55),
('f39', '201903', 'NUI', 0),
('f39', '201903', 'REP', 0),
('f39', '201904', 'ETP', 0),
('f39', '201904', 'KM', 0),
('f39', '201904', 'NUI', 0),
('f39', '201904', 'REP', 0),
('f39', '201905', 'ETP', 2),
('f39', '201905', 'KM', 36),
('f39', '201905', 'NUI', 0),
('f39', '201905', 'REP', 21),
('f4', '201901', 'ETP', 9),
('f4', '201901', 'KM', 10),
('f4', '201901', 'NUI', 10),
('f4', '201901', 'REP', 70),
('f4', '201902', 'ETP', 29),
('f4', '201902', 'KM', 124),
('f4', '201902', 'NUI', 9),
('f4', '201902', 'REP', 8),
('f4', '201903', 'ETP', 6),
('f4', '201903', 'KM', 4),
('f4', '201903', 'NUI', 4),
('f4', '201903', 'REP', 6),
('f4', '201904', 'ETP', 7),
('f4', '201904', 'KM', 3),
('f4', '201904', 'NUI', 9),
('f4', '201904', 'REP', 21),
('f4', '201905', 'ETP', 2),
('f4', '201905', 'KM', 36),
('f4', '201905', 'NUI', 0),
('f4', '201905', 'REP', 21),
('v', '201904', 'ETP', 0);

-- --------------------------------------------------------

--
-- Structure de la table `lignefraishorsforfait`
--

CREATE TABLE `lignefraishorsforfait` (
  `id` int(11) NOT NULL,
  `idmembre` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `libelle` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `montant` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `lignefraishorsforfait`
--

INSERT INTO `lignefraishorsforfait` (`id`, `idmembre`, `mois`, `libelle`, `date`, `montant`) VALUES
(20, 'b16', '201902', 'Repas d&#39;affaires M DUPONT', '2019-02-03', '120.00'),
(21, 'b50', '201902', 'Test', '2019-01-01', '201.00'),
(25, 'a93', '201903', 'Repas avec la Princesse de Monaco', '2019-01-25', '219.00'),
(26, 'c3', '201904', 'REFUSE : Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget(...)', '2019-04-01', '89.00'),
(27, 'b34', '201904', 'REFUSE : Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget(...)', '2019-04-01', '89.00'),
(28, 'b34', '201902', 'Repas d affaire', '2019-01-01', '201.00'),
(29, 'b4', '201903', 'Repas d affaire', '2019-01-25', '219.00'),
(30, 'b59', '201904', '', '2019-01-25', '89.00'),
(31, 'c14', '201902', '', '2019-02-03', '120.00'),
(33, 'c3', '201902', 'Péage', '2019-01-01', '201.00'),
(34, 'c54', '201903', 'Péage avec la Princesse de Monaco', '2019-01-25', '219.00'),
(35, 'd13', '201904', 'Repas d affaire : Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', '2019-04-01', '89.00'),
(36, 'd51', '201902', 'Dépannage', '2019-02-03', '120.00'),
(37, 'e22', '201902', 'Repas', '2019-01-01', '201.00'),
(38, 'e24', '201903', 'Repas d affaire', '2019-01-25', '219.00'),
(39, 'e39', '201904', 'Repas d affaire : Lorem ipsum dolor sit amet', '2019-04-01', '89.00'),
(40, 'e49', '201902', 'Repas d affaires M DUPONT', '2019-02-03', '120.00'),
(41, 'e52', '201902', 'Courses annuelles', '2019-01-01', '201.00'),
(42, 'f21', '201903', 'Repas à l exterieur de la ville', '2019-01-25', '219.00'),
(43, 'f39', '201904', 'Repas d affaire : Lorem ipsum dolor sit amet.', '2019-04-01', '89.00'),
(44, 'f4', '201902', 'Repas d affaire', '2019-02-03', '120.00');

-- --------------------------------------------------------

--
-- Structure de la table `membre`
--

CREATE TABLE `membre` (
  `id` char(4) NOT NULL,
  `nom` char(30) DEFAULT NULL,
  `prenom` char(30) DEFAULT NULL,
  `login` char(20) DEFAULT NULL,
  `mdp` char(60) NOT NULL,
  `ancienmdp` char(20) DEFAULT NULL,
  `adresse` char(30) DEFAULT NULL,
  `cp` char(5) DEFAULT NULL,
  `ville` char(30) DEFAULT NULL,
  `dateembauche` date DEFAULT NULL,
  `idrang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `membre`
--

INSERT INTO `membre` (`id`, `nom`, `prenom`, `login`, `mdp`, `ancienmdp`, `adresse`, `cp`, `ville`, `dateembauche`, `idrang`) VALUES
('a131', 'Villechalane', 'Louis', 'comptable', '$2a$12$cmdpJ4SYnllZiSyRaX.PWeV9DyHqogpuZZhImSdBN6Y41g0UFKi0a', 'comptable', '8 rue des Charmes', '46000', 'Cahors', '2005-12-21', 2),
('a55', 'Bedos', 'Christian', 'cbedos', '$2y$12$7m1EjR9yOJ/pHIxoLVDkVOKHElmw0npgeVyDVxH.3LksLtlqATRHe', 'gmhxd', '1 rue Peranud', '46250', 'Montcuq', '1995-01-12', 1),
('b13', 'Bentot', 'Pascal', 'pbentot', '$2y$12$OU/OgIhiLjzyGFDX.2ciXOUFEdR3a/51inXX5MWUCuGEUrvamHZNO', 'doyw1', '11 allée des Cerises', '46512', 'Bessines', '1992-07-09', 1),
('b25', 'Bunisset', 'Denise', 'dbunisset', '$2y$12$q7BcTYA.KUBsjPyeeeACm.iNTe89YACxNgBYFDUuBmevzmz0Mqvya', 's1y1r', '23 rue Manin', '75019', 'paris', '2010-12-05', 1),
('b28', 'Cacheux', 'Bernard', 'bcacheux', '$2y$12$vNSBhq4nHH6Ff.uu63jKBOz/8o2rQ.VzU5.4xBFz1a9I4AadOYgCu', 'uf7r3', '114 rue Blanche', '75017', 'Paris', '2009-11-12', 1),
('b34', 'Cadic', 'Eric', 'ecadic', '$2y$12$jRum.JqUZIQLckmnlWsonOczC54Dd/ASAdQW63jKIUsPsB1awlOcq', '6u8dc', '123 avenue de la République', '75011', 'Paris', '2008-09-23', 1),
('b4', 'Charoze', 'Catherine', 'ccharoze', '$2y$12$9KLkWwd3bB.OXKOx53QB/uS2avBBGgQX.AZsEzY0PewMbiyBxPgCm', 'u817o', '100 rue Petit', '75019', 'Paris', '2005-11-12', 1),
('b59', 'Cottin', 'Vincenne', 'vcottin', '$2y$12$M//0Sj8a6KYQ.sHkNWcI8uNTnuh/ErJmyV984IxMSMxjyWEB8m3HK', '2hoh9', '36 rue Des Roches', '93100', 'Monteuil', '2001-11-18', 1),
('c14', 'Daburon', 'François', 'fdaburon', '$2y$12$ntzlD.MKNei2PlLvI4/8ru6rD4hwEE9GumvUGy3xtwSMoOn9famZm', '7oqpv', '13 rue de Chanzy', '94000', 'Créteil', '2002-02-11', 1),
('c3', 'De', 'Philippe', 'pde', '$2y$12$Fle68zABeIHUfHihJ0ZIyOjFKsdDMr9Iqa2RLXSr.AVH66Xjg8SCy', 'gk9kx', '13 rue Barthes', '94000', 'Créteil', '2010-12-14', 1),
('c54', 'Debelle', 'Michel', 'mdebelle', '$2y$12$3qJX4tcIugtmjE4hkAYjqeiZI3oGA4QXWabVcpe.X8kPLaWbfCl1G', 'od5rt', '181 avenue Barbusse', '93210', 'Rosny', '2006-11-23', 1),
('d13', 'Debelle', 'Jeanne', 'jdebelle', '$2y$12$xJJuP/LwTjw4oMQ1XDRaM.o2c4vLQeD2rqBVNXTG5UD1HJhrY/IqW', 'nvwqq', '134 allée des Joncs', '44000', 'Nantes', '2000-05-11', 1),
('d51', 'Debroise', 'Michel', 'mdebroise', '$2y$12$btazZIKtLbTIuBhbu7MUdePXqLup5fNa9xHBMh86x0WScGyRw714.', 'sghkb', '2 Bld Jourdain', '44000', 'Nantes', '2001-04-17', 1),
('e22', 'Desmarquest', 'Nathalie', 'ndesmarquest', '$2y$12$W1/5fiOsVyKLRJp5KYsFeeoX2.5tmHUFF/YhwN.8mPf9rzU1BGvsy', 'f1fob', '14 Place d Arc', '45000', 'Orléans', '2005-11-12', 1),
('e24', 'Desnost', 'Pierre', 'pdesnost', '$2y$12$hxicLv6Hl1hSom/8TaXKA.mioW7f8Wwerttn2CaLEr6yPfl2wvYUK', '4k2o5', '16 avenue des Cèdres', '23200', 'Guéret', '2001-02-05', 1),
('e39', 'Dudouit', 'Frédéric', 'fdudouit', '$2y$12$5do/pz47Pn6LrO09Hvn0sut.na93gDyYpO1qFDb3ZG59m/tB7zcm6', '44im8', '18 rue de l église', '23120', 'GrandBourg', '2000-08-01', 1),
('e49', 'Duncombe', 'Claude', 'cduncombe', '$2y$12$eMqXgMEsY1pVQ8Ztk9E6t.PNYYuKyURr6Ru7Vid00peDn4n5E.UG6', 'qf77j', '19 rue de la tour', '23100', 'La souteraine', '1987-10-10', 1),
('e52', 'Eynde', 'Valérie', 'veynde', '$2y$12$fwNqkI/wMCFqxaNSzS1aKuxcpYjpKdVzjbozr0i608wyV6R1ncys2', 'i7sn3', '3 Grand Place', '13015', 'Marseille', '1999-11-01', 1),
('f21', 'Finck', 'Jacques', 'jfinck', '$2y$12$4h6VhcQXLev59BM16koLaOoObyFZDVKvSiSvtvUeURzkZj8Gl6QJW', 'mpb3t', '10 avenue du Prado', '13002', 'Marseille', '2001-11-10', 1),
('f39', 'Frémont', 'Fernande', 'ffremont', '$2y$12$S0W/AY1sKCYlmxa6XY9.PuK/dK3Wnlqbnm0tuVwSSdpYVWeeknuDi', 'xs5tq', '4 route de la mer', '13012', 'Allauh', '1998-10-01', 1),
('f4', 'Gest', 'Alain', 'agest', '$2y$12$PJv/zZofUR/MqFBUK3FxUeWMk2ouCpGzzs2jtnkdkX1Lf2kB4JTNq', 'dywvt', '30 avenue de la mer', '13025', 'Berre', '1985-11-01', 1);

-- --------------------------------------------------------

--
-- Structure de la table `rang`
--

CREATE TABLE `rang` (
  `id` int(11) NOT NULL,
  `libelle` varchar(50) NOT NULL DEFAULT 'visiteur'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `rang`
--

INSERT INTO `rang` (`id`, `libelle`) VALUES
(1, 'visiteur'),
(2, 'comptable');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `etat`
--
ALTER TABLE `etat`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `fichefrais`
--
ALTER TABLE `fichefrais`
  ADD PRIMARY KEY (`idmembre`,`mois`),
  ADD KEY `idetat` (`idetat`),
  ADD KEY `idvehicule` (`idvehicule`);

--
-- Index pour la table `fraisforfait`
--
ALTER TABLE `fraisforfait`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lignefraisforfait`
--
ALTER TABLE `lignefraisforfait`
  ADD PRIMARY KEY (`idmembre`,`mois`,`idfraisforfait`),
  ADD KEY `idfraisforfait` (`idfraisforfait`);

--
-- Index pour la table `lignefraishorsforfait`
--
ALTER TABLE `lignefraishorsforfait`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idvisiteur` (`idmembre`,`mois`);

--
-- Index pour la table `membre`
--
ALTER TABLE `membre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idRang` (`idrang`);

--
-- Index pour la table `rang`
--
ALTER TABLE `rang`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `lignefraishorsforfait`
--
ALTER TABLE `lignefraishorsforfait`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT pour la table `rang`
--
ALTER TABLE `rang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
