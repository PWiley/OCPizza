-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: May 15, 2019 at 06:39 PM
-- Server version: 5.7.25
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `OC Pizza`
--

-- --------------------------------------------------------

--
-- Table structure for table `Acces`
--

CREATE TABLE `Acces` (
  `idAcces` int(11) NOT NULL,
  `typeAcces` varchar(120) NOT NULL,
  `commentaires` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Acces`
--

INSERT INTO `Acces` (`idAcces`, `typeAcces`, `commentaires`) VALUES
(1, 'Consultation', 'Production/Livraison'),
(2, 'Consultation/Modification/Ajout (Commandes/Compte)', 'Client/Accueil'),
(3, 'Consultation/Modification/Ajout/Suppression (Produit/Categorie)', 'Commerciaux');

-- --------------------------------------------------------

--
-- Table structure for table `Adresses`
--

CREATE TABLE `Adresses` (
  `idAdresse` int(11) NOT NULL,
  `voie` varchar(90) NOT NULL,
  `codePostal` int(11) NOT NULL,
  `ville` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Adresses`
--

INSERT INTO `Adresses` (`idAdresse`, `voie`, `codePostal`, `ville`) VALUES
(1, '15 rue de la piètre allée', 75015, 'Paris'),
(2, '134 Avenue du Général', 75013, 'Paris'),
(3, '23 rue de sortie', 91050, 'Montrouge'),
(4, '45 boulevard de route longue', 75012, 'Paris'),
(5, '84 rue Saint Germain', 75007, 'Paris'),
(6, '77 Chemin du Lavarin', 75018, 'Paris'),
(7, '58 rue de Raymond Poincaré', 75004, 'Paris'),
(8, '85 rue des Nations Unies', 97470, 'Saint-Benoît'),
(9, '65 rue du gué Jacquet', 78400, 'Chatou'),
(10, '22 boulevard de Prague', 75010, 'Paris');

-- --------------------------------------------------------

--
-- Table structure for table `Articles`
--

CREATE TABLE `Articles` (
  `idArticle` int(11) NOT NULL,
  `intituleArticle` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Articles`
--

INSERT INTO `Articles` (`idArticle`, `intituleArticle`) VALUES
(1, 'Coca 1L'),
(2, 'Coca Canette'),
(3, 'Orangina 1L'),
(4, 'Orangina Canette'),
(5, 'Fanta 1L'),
(6, 'Fanta Canette'),
(7, 'Glace Bertillon Fraise'),
(8, 'Glace Bertillon Chocolat'),
(9, 'Chicken Wings');

-- --------------------------------------------------------

--
-- Table structure for table `ArticlesStocks`
--

CREATE TABLE `ArticlesStocks` (
  `idArticle` int(11) NOT NULL,
  `idStock` int(11) NOT NULL,
  `stockTheorique` int(11) NOT NULL,
  `stockReel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ArticlesStocks`
--

INSERT INTO `ArticlesStocks` (`idArticle`, `idStock`, `stockTheorique`, `stockReel`) VALUES
(1, 1, 15, 15),
(1, 2, 25, 25),
(1, 3, 30, 30),
(2, 1, 60, 60),
(2, 2, 70, 70),
(2, 3, 75, 75),
(3, 1, 15, 15),
(3, 2, 25, 25),
(3, 3, 30, 30),
(4, 1, 60, 60),
(4, 2, 70, 70),
(4, 3, 75, 75),
(5, 1, 15, 15),
(5, 2, 25, 25),
(5, 3, 30, 30),
(6, 1, 60, 60),
(6, 2, 70, 70),
(6, 3, 75, 75),
(7, 1, 20, 20),
(7, 2, 20, 20),
(7, 3, 20, 20),
(8, 1, 20, 20),
(8, 2, 20, 20),
(8, 3, 20, 20),
(9, 1, 9, 9),
(9, 2, 13, 13),
(9, 3, 14, 13);

-- --------------------------------------------------------

--
-- Table structure for table `Categories`
--

CREATE TABLE `Categories` (
  `idCategorie` int(11) NOT NULL,
  `nomCategorie` varchar(15) NOT NULL,
  `description` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Categories`
--

INSERT INTO `Categories` (`idCategorie`, `nomCategorie`, `description`) VALUES
(1, 'Entrées', 'Entrées chaude/froide'),
(2, 'Pizzas', 'Pizzas'),
(3, 'Desserts', 'Desserts'),
(4, 'Boissons', 'Boissons');

-- --------------------------------------------------------

--
-- Table structure for table `CategoriesProduits`
--

CREATE TABLE `CategoriesProduits` (
  `idCategorie` int(11) NOT NULL,
  `idProduit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CategoriesProduits`
--

INSERT INTO `CategoriesProduits` (`idCategorie`, `idProduit`) VALUES
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 6),
(3, 7),
(3, 8),
(1, 9),
(2, 10),
(2, 11),
(2, 12),
(2, 13),
(2, 14),
(2, 15),
(2, 16),
(2, 17),
(2, 18),
(2, 19);

-- --------------------------------------------------------

--
-- Table structure for table `Clients`
--

CREATE TABLE `Clients` (
  `idClient` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `login` varchar(45) NOT NULL,
  `motPasse` varchar(45) NOT NULL,
  `Adresses_idAdresse` int(11) DEFAULT NULL,
  `Telephones_idTelephone` int(11) NOT NULL,
  `Contacts_idContact` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Clients`
--

INSERT INTO `Clients` (`idClient`, `nom`, `prenom`, `login`, `motPasse`, `Adresses_idAdresse`, `Telephones_idTelephone`, `Contacts_idContact`) VALUES
(1, 'Jardinière', 'Flore', 'FloreJar', 'mee0aeg7U', 1, 3, 4),
(2, 'Klementz', 'Jean', 'KlemJean34', 'aa5paeT4', 3, 2, 7),
(3, 'Oskar', 'Louis', 'Louis75000', 'Antaked', 4, 7, 1),
(4, 'Levi', 'Pierre', 'Vile75Pierre', 'aekOOme5Mah', 2, 1, 5),
(5, 'Josset', 'Lise', 'JossetLise', 'JohLi38KI', 6, 8, 2),
(6, 'Boulay', 'Emile', 'Emil2367', '23EmIL67', 10, 6, 8),
(7, 'Petit', 'Eléonore', 'ElPetit75', 'KoaTheecH2', 8, 4, 10),
(8, 'Devant', 'Constance', 'Constance', 'Duso0xe3Uri', 9, 9, 3),
(9, 'Gonzalez', 'Charles', 'CarlitoParis', 'EeRee3Ajiai', 7, 5, 9),
(10, 'Partuis', 'Sophie', 'SophiePar22', 'Bele19R58', 5, 10, 6);

-- --------------------------------------------------------

--
-- Table structure for table `Commandes`
--

CREATE TABLE `Commandes` (
  `idCommande` int(11) NOT NULL,
  `numCommande` varchar(45) NOT NULL,
  `dateCommande` datetime NOT NULL,
  `etatCommande` varchar(15) NOT NULL,
  `commentaires_Client` varchar(120) DEFAULT NULL,
  `commentaires_Utilisateur` varchar(120) DEFAULT NULL,
  `Clients_idClient` int(11) NOT NULL,
  `Personnels_idPersonnel` int(11) DEFAULT NULL,
  `Factures_idFacture` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Commandes`
--

INSERT INTO `Commandes` (`idCommande`, `numCommande`, `dateCommande`, `etatCommande`, `commentaires_Client`, `commentaires_Utilisateur`, `Clients_idClient`, `Personnels_idPersonnel`, `Factures_idFacture`) VALUES
(1, 'DC15023', '2019-12-09 11:00:00', 'en cours', NULL, NULL, 8, NULL, 1),
(2, 'JL15025', '2019-12-09 11:45:00', 'effectuée', 'Parfait', NULL, 5, NULL, 2),
(3, 'JL15026', '2019-12-09 11:10:00', 'en cours', NULL, 'Le client souhaite être livré à partir de 12h', 5, 3, 3),
(4, 'DV12306', '2019-12-09 11:45:00', 'annulée', NULL, 'Le client a annulé sa commande', 3, 8, 4),
(5, 'GC12985', '2019-12-09 11:15:00', 'en cours', NULL, 'Client fidèle, ne pas arriver en retard', 9, 4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `CommandesProduits`
--

CREATE TABLE `CommandesProduits` (
  `idCommande` int(11) NOT NULL,
  `idProduit` int(11) NOT NULL,
  `quantiteProduit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CommandesProduits`
--

INSERT INTO `CommandesProduits` (`idCommande`, `idProduit`, `quantiteProduit`) VALUES
(1, 1, 1),
(1, 7, 1),
(2, 14, 1),
(3, 15, 1),
(4, 5, 1),
(4, 13, 1),
(5, 2, 2),
(5, 9, 1),
(5, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Contacts`
--

CREATE TABLE `Contacts` (
  `idContact` int(11) NOT NULL,
  `adresseMail` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Contacts`
--

INSERT INTO `Contacts` (`idContact`, `adresseMail`) VALUES
(1, 'rueParadi@hotmail.com'),
(2, 'Lafamille@yahoo.com'),
(3, 'theElement23@yahoo.fr'),
(4, 'floreJar@yahoo.com'),
(5, 'pierreLevi@free.fr'),
(6, 'PartuisS@hotmail.fr'),
(7, 'jeanKlemetz@gmail.com'),
(8, 'emileBoulay@free.fr'),
(9, 'GonzCharles@hotmail.com'),
(10, 'petitEleonor@yahoo.fr');

-- --------------------------------------------------------

--
-- Table structure for table `Factures`
--

CREATE TABLE `Factures` (
  `idFacture` int(11) NOT NULL,
  `referenceFacture` varchar(15) NOT NULL,
  `dateFacture` datetime NOT NULL,
  `montantFacture` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Factures`
--

INSERT INTO `Factures` (`idFacture`, `referenceFacture`, `dateFacture`, `montantFacture`) VALUES
(1, '75PAR1209', '2019-12-09 00:00:00', 25.5),
(2, '75PAR1210', '2019-12-09 00:00:00', 45),
(3, '75PAR1211', '2019-12-09 00:00:00', 37.55),
(4, '75PAR1212', '2019-12-09 00:00:00', 12.5),
(5, '75PAR1213', '2019-12-09 00:00:00', 28.5);

-- --------------------------------------------------------

--
-- Table structure for table `Livraisons`
--

CREATE TABLE `Livraisons` (
  `idLivraison` int(11) NOT NULL,
  `etatLivraison` varchar(15) NOT NULL,
  `dateLivraison` datetime DEFAULT NULL,
  `commentaires` varchar(45) DEFAULT NULL,
  `Commandes_idCommande` int(11) NOT NULL,
  `Commandes_Personnels_idPersonnel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Livraisons`
--

INSERT INTO `Livraisons` (`idLivraison`, `etatLivraison`, `dateLivraison`, `commentaires`, `Commandes_idCommande`, `Commandes_Personnels_idPersonnel`) VALUES
(1, 'en attente', '2019-12-09 12:15:00', NULL, 1, 5),
(2, 'effectuée', '2019-12-09 12:15:00', 'Le client est content', 2, 11),
(3, 'en attente', '2019-12-09 12:20:00', NULL, 3, 10),
(4, 'en attente', '2019-12-09 12:25:00', NULL, 5, 11);

-- --------------------------------------------------------

--
-- Table structure for table `Matieres`
--

CREATE TABLE `Matieres` (
  `idMatiere` int(11) NOT NULL,
  `intituleMatiere` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Matieres`
--

INSERT INTO `Matieres` (`idMatiere`, `intituleMatiere`) VALUES
(1, 'Poivron'),
(2, 'Ruccola'),
(3, 'Tomate'),
(4, 'Oignon'),
(5, 'Parmesan'),
(6, 'Gruyère'),
(7, 'Sauce tomate'),
(8, 'Thon'),
(9, 'Mozarella'),
(10, 'Saumon'),
(11, 'Jambon Parme');

-- --------------------------------------------------------

--
-- Table structure for table `MatieresPizzas`
--

CREATE TABLE `MatieresPizzas` (
  `idMatiere` int(11) NOT NULL,
  `idPizza` int(11) NOT NULL,
  `quantiteMatiere` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `MatieresPizzas`
--

INSERT INTO `MatieresPizzas` (`idMatiere`, `idPizza`, `quantiteMatiere`) VALUES
(2, 3, 2),
(3, 2, 2),
(4, 10, 1),
(5, 4, 1),
(6, 4, 1),
(7, 1, 1),
(7, 2, 1),
(7, 3, 1),
(7, 4, 1),
(7, 5, 1),
(7, 6, 1),
(7, 7, 1),
(7, 8, 1),
(7, 9, 1),
(9, 2, 2),
(9, 4, 2),
(10, 10, 4);

-- --------------------------------------------------------

--
-- Table structure for table `MatieresStocks`
--

CREATE TABLE `MatieresStocks` (
  `idMatiere` int(11) NOT NULL,
  `idStock` int(11) NOT NULL,
  `stockTheorique` float NOT NULL,
  `stockReel` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `MatieresStocks`
--

INSERT INTO `MatieresStocks` (`idMatiere`, `idStock`, `stockTheorique`, `stockReel`) VALUES
(1, 1, 8, NULL),
(1, 2, 8, NULL),
(1, 3, 9, NULL),
(2, 1, 2, NULL),
(2, 2, 2, NULL),
(2, 3, 2.5, NULL),
(3, 1, 2, NULL),
(3, 2, 2, NULL),
(3, 3, 2.5, NULL),
(4, 1, 3, NULL),
(4, 2, 3, NULL),
(4, 3, 3.5, NULL),
(5, 1, 4, NULL),
(5, 2, 4, NULL),
(5, 3, 4, NULL),
(6, 1, 3, NULL),
(6, 2, 3, NULL),
(6, 3, 3, NULL),
(7, 1, 5, NULL),
(7, 2, 5, NULL),
(7, 3, 5, NULL),
(8, 1, 3, NULL),
(8, 2, 3, NULL),
(8, 3, 3, NULL),
(9, 1, 3, NULL),
(9, 2, 3, NULL),
(9, 3, 3, NULL),
(10, 1, 2, NULL),
(10, 2, 2, NULL),
(10, 3, 2.5, NULL),
(11, 1, 1.5, NULL),
(11, 2, 1.5, NULL),
(11, 3, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Personnels`
--

CREATE TABLE `Personnels` (
  `idPersonnel` int(11) NOT NULL,
  `login` varchar(45) NOT NULL,
  `motPasse` varchar(45) NOT NULL,
  `intitulePoste` varchar(45) NOT NULL,
  `Acces_idAcces` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Personnels`
--

INSERT INTO `Personnels` (`idPersonnel`, `login`, `motPasse`, `intitulePoste`, `Acces_idAcces`) VALUES
(1, 'Pierre', 'LaPierre', 'Production', 1),
(2, 'Jean', 'Louis23', 'Production', 1),
(3, 'Louise', 'strer38', 'Accueil', 2),
(4, 'Charles', 'charles78', 'Accueil', 2),
(5, 'Marie', 'Marie98NN', 'Livraison', 1),
(6, 'Marie23', 'MaMaSansPats', 'Commercial', 3),
(7, 'Jean-Louis', '23MaHeidi', 'Directeur', 3),
(8, 'Paul', 'PaulQ29', 'Accueil', 2),
(9, 'Pauline', 'jh85JJ', 'Production', 1),
(10, 'Alphonse', 'al48JD67', 'Livraison', 1),
(11, 'Manfred', 'Mp2311', 'Livraison', 1);

-- --------------------------------------------------------

--
-- Table structure for table `PersonnelsPointsVente`
--

CREATE TABLE `PersonnelsPointsVente` (
  `idPersonnel` int(11) NOT NULL,
  `idPointvente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PersonnelsPointsVente`
--

INSERT INTO `PersonnelsPointsVente` (`idPersonnel`, `idPointvente`) VALUES
(1, 1),
(2, 2),
(3, 1),
(4, 2),
(5, 1),
(6, 1),
(6, 2),
(6, 3),
(7, 1),
(7, 2),
(7, 3),
(8, 3),
(9, 3),
(10, 2),
(11, 3);

-- --------------------------------------------------------

--
-- Table structure for table `Pizzas`
--

CREATE TABLE `Pizzas` (
  `idPizzas` int(11) NOT NULL,
  `nomPizza` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Pizzas`
--

INSERT INTO `Pizzas` (`idPizzas`, `nomPizza`) VALUES
(1, 'Calzone'),
(2, 'Marguerita'),
(3, 'Ruccola'),
(4, 'Quatri Fromagio'),
(5, 'Champignon'),
(6, 'Parma'),
(7, 'Thon'),
(8, 'Poulet'),
(9, 'Végétarienne'),
(10, 'Saumon');

-- --------------------------------------------------------

--
-- Table structure for table `PointsVente`
--

CREATE TABLE `PointsVente` (
  `idPointvente` int(11) NOT NULL,
  `nomPointVente` varchar(45) NOT NULL,
  `idStock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PointsVente`
--

INSERT INTO `PointsVente` (`idPointvente`, `nomPointVente`, `idStock`) VALUES
(1, '75011', 1),
(2, '75012', 2),
(3, '75013', 3);

-- --------------------------------------------------------

--
-- Table structure for table `Produits`
--

CREATE TABLE `Produits` (
  `idProduit` int(11) NOT NULL,
  `nomProduit` varchar(45) NOT NULL,
  `descriptionProduit` varchar(120) NOT NULL,
  `procedureProduit` varchar(240) NOT NULL,
  `tempsPreparation` time NOT NULL,
  `prixVente` float NOT NULL,
  `Articles_idArticle` int(11) DEFAULT NULL,
  `Pizzas_idPizzas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Produits`
--

INSERT INTO `Produits` (`idProduit`, `nomProduit`, `descriptionProduit`, `procedureProduit`, `tempsPreparation`, `prixVente`, `Articles_idArticle`, `Pizzas_idPizzas`) VALUES
(1, 'Coca Cola (1 Litre)', 'Boisson de la marque Coca Cola Company', 'A servir Froid', '00:00:01', 8, 1, NULL),
(2, 'Coca Cola (canette)', 'Boisson de la marque Coca Cola Company', 'A servir Froid', '00:00:01', 3, 2, NULL),
(3, 'Orangina (1 Litre)', 'Boisson de la marque Coca Cola Company', 'A servir Froid', '00:00:01', 8, 3, NULL),
(4, 'Orangina (canette)', 'Boisson de la marque Coca Cola Company', 'A servir Froid', '00:00:01', 3, 4, NULL),
(5, 'Fanta (1 Litre)', 'Boisson de la marque Coca Cola Company', 'A servir Froid', '00:00:01', 8, 5, NULL),
(6, 'Fanta (canette)', 'Boisson de la marque Coca Cola Company', 'A servir Froid', '00:00:01', 3, 6, NULL),
(7, 'Glace Bertillon (Parfum Fraise)', 'Glace Maison Bertillon(Fraise)', 'A servir Glacé', '00:00:01', 9, 7, NULL),
(8, 'Glace Bertillon (Parfum Chocolat)', 'Glace Maison Bertillon(Chocolat)', 'A servir Glacé', '00:00:01', 9, 8, NULL),
(9, 'Chicken Wings', 'Chicken Wings', 'Une portion de 10  Ailes (Cuisson au four)', '00:00:10', 5, 9, NULL),
(10, 'Calzone', 'Pizza Pliée avec jambon', 'Garnir la pâte avec une dose de sauce tomate et une portion de dés de jambon', '00:00:12', 11, NULL, 1),
(11, 'Marguerita', 'Pizza simple avec tomate et mozzarella', 'Garnir la pâte avec une dose de sauce tomate et une portion de mozzarella', '00:00:12', 6, NULL, 2),
(12, 'Ruccola', 'Pizza à la ruccola', 'Garnir la pâte avec une dose de sauce tomate et une poignée de rucolla', '00:00:12', 12, NULL, 3),
(13, 'Quatri Fromagio', 'Pizza aux quatres fromages', 'Garnir la pâte avec une dose de sauce tomate et une dose de chacun des quatres fromages(Bleu, Conté, gruyère, mozzarella).Finir par la mozzarella', '00:00:12', 11, NULL, 4),
(14, 'Champigon', 'Pizza champignon', 'Garnir la pâte avec une dose de sauce tomate et une dose de champignon', '00:00:12', 6, NULL, 5),
(15, 'Parma', 'Pizza au jambon de Parme', 'Garnir la pâte avec une dose de sauce tomate et quatre tranches de jambon de Parme', '00:00:12', 15, NULL, 6),
(16, 'Thon', 'Pizza au thon', 'Garnir la pâte avec une dose de sauce tomate et une dose de thon', '00:00:12', 10, NULL, 7),
(17, 'Poulet', 'Pizza au poulet mariné', 'Garnir la pâte avec une dose de sauce tomate et une dose de poulet mariné', '00:00:12', 11, NULL, 8),
(18, 'Végétarienne', 'Pizza aux légumes', 'Garnir la pâte avec une dose de sauce tomate, une dose de légumes marinés avec de l\'huile d\'olive', '00:00:12', 8, NULL, 9),
(19, 'Saumon', 'Pizza au saumon et crème fraiche', 'Garnir la pâte avec une dose de crème fraiche, garnir avec quatres tranches de saumon fumé', '00:00:12', 15, NULL, 10);

-- --------------------------------------------------------

--
-- Table structure for table `Reglements`
--

CREATE TABLE `Reglements` (
  `idReglement` int(11) NOT NULL,
  `typeReglement` varchar(10) NOT NULL,
  `etatReglement` varchar(20) NOT NULL,
  `dateReglement` datetime DEFAULT NULL,
  `Commandes_idCommande` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Reglements`
--

INSERT INTO `Reglements` (`idReglement`, `typeReglement`, `etatReglement`, `dateReglement`, `Commandes_idCommande`) VALUES
(1, 'CB', 'Validée', '2019-12-09 11:05:00', 1),
(2, 'CB', 'Validée', '2019-12-09 11:50:00', 2),
(3, 'Espèces', 'En attente', NULL, 3),
(4, 'CB', 'Remboursement', '2019-12-09 11:50:00', 4),
(5, 'CB', 'Validée', '2019-12-09 11:20:00', 5);

-- --------------------------------------------------------

--
-- Table structure for table `Stocks`
--

CREATE TABLE `Stocks` (
  `idStock` int(11) NOT NULL,
  `dateControle` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Stocks`
--

INSERT INTO `Stocks` (`idStock`, `dateControle`) VALUES
(1, '2019-01-12 09:00:00'),
(2, '2019-01-12 09:00:00'),
(3, '2019-01-12 09:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `Telephones`
--

CREATE TABLE `Telephones` (
  `idTelephone` int(11) NOT NULL,
  `numTelephone` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Telephones`
--

INSERT INTO `Telephones` (`idTelephone`, `numTelephone`) VALUES
(1, '0116204393'),
(2, '0589970044'),
(3, '0159837027'),
(4, '0149332878'),
(5, '0113031115'),
(6, '0157664533'),
(7, '0144675504'),
(8, '0158049515'),
(9, '0197293642'),
(10, '0126566208');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Acces`
--
ALTER TABLE `Acces`
  ADD PRIMARY KEY (`idAcces`);

--
-- Indexes for table `Adresses`
--
ALTER TABLE `Adresses`
  ADD PRIMARY KEY (`idAdresse`);

--
-- Indexes for table `Articles`
--
ALTER TABLE `Articles`
  ADD PRIMARY KEY (`idArticle`);

--
-- Indexes for table `ArticlesStocks`
--
ALTER TABLE `ArticlesStocks`
  ADD PRIMARY KEY (`idArticle`,`idStock`),
  ADD KEY `fk_Articles_has_Stock_Stock1_idx` (`idStock`),
  ADD KEY `fk_Articles_has_Stock_Articles1_idx` (`idArticle`);

--
-- Indexes for table `Categories`
--
ALTER TABLE `Categories`
  ADD PRIMARY KEY (`idCategorie`);

--
-- Indexes for table `CategoriesProduits`
--
ALTER TABLE `CategoriesProduits`
  ADD PRIMARY KEY (`idCategorie`,`idProduit`),
  ADD KEY `fk_Categories_has_Produits_Produits1_idx` (`idProduit`),
  ADD KEY `fk_Categories_has_Produits_Categories1_idx` (`idCategorie`);

--
-- Indexes for table `Clients`
--
ALTER TABLE `Clients`
  ADD PRIMARY KEY (`idClient`),
  ADD KEY `fk_Clients_Adresses1_idx` (`Adresses_idAdresse`),
  ADD KEY `fk_Clients_Telephones1_idx` (`Telephones_idTelephone`),
  ADD KEY `fk_Clients_Contacts1_idx` (`Contacts_idContact`);

--
-- Indexes for table `Commandes`
--
ALTER TABLE `Commandes`
  ADD PRIMARY KEY (`idCommande`),
  ADD KEY `fk_Commandes_Clients1_idx` (`Clients_idClient`),
  ADD KEY `fk_Commandes_Personnels1_idx` (`Personnels_idPersonnel`),
  ADD KEY `fk_Commandes_Factures1_idx` (`Factures_idFacture`);

--
-- Indexes for table `CommandesProduits`
--
ALTER TABLE `CommandesProduits`
  ADD PRIMARY KEY (`idCommande`,`idProduit`),
  ADD KEY `fk_Produits_has_Commandes_Produits1_idx` (`idProduit`);

--
-- Indexes for table `Contacts`
--
ALTER TABLE `Contacts`
  ADD PRIMARY KEY (`idContact`);

--
-- Indexes for table `Factures`
--
ALTER TABLE `Factures`
  ADD PRIMARY KEY (`idFacture`);

--
-- Indexes for table `Livraisons`
--
ALTER TABLE `Livraisons`
  ADD PRIMARY KEY (`idLivraison`),
  ADD KEY `fk_Livraisons_Commandes1_idx` (`Commandes_idCommande`);

--
-- Indexes for table `Matieres`
--
ALTER TABLE `Matieres`
  ADD PRIMARY KEY (`idMatiere`);

--
-- Indexes for table `MatieresPizzas`
--
ALTER TABLE `MatieresPizzas`
  ADD PRIMARY KEY (`idMatiere`,`idPizza`),
  ADD KEY `fk_Pizzas_has_Matieres_Matieres1_idx` (`idMatiere`),
  ADD KEY `fk_Pizzas_has_Matieres_Pizzas1_idx` (`idPizza`);

--
-- Indexes for table `MatieresStocks`
--
ALTER TABLE `MatieresStocks`
  ADD PRIMARY KEY (`idMatiere`,`idStock`),
  ADD KEY `fk_Matieres_has_Stocks_Stocks1_idx` (`idStock`),
  ADD KEY `fk_Matieres_has_Stocks_Matieres1_idx` (`idMatiere`);

--
-- Indexes for table `Personnels`
--
ALTER TABLE `Personnels`
  ADD PRIMARY KEY (`idPersonnel`),
  ADD KEY `fk_Personnels_Acces1_idx` (`Acces_idAcces`);

--
-- Indexes for table `PersonnelsPointsVente`
--
ALTER TABLE `PersonnelsPointsVente`
  ADD PRIMARY KEY (`idPersonnel`,`idPointvente`),
  ADD KEY `fk_PointsVente_has_Personnels_Personnels1_idx` (`idPersonnel`),
  ADD KEY `fk_PointsVente_has_Personnels_PointsVente1_idx` (`idPointvente`);

--
-- Indexes for table `Pizzas`
--
ALTER TABLE `Pizzas`
  ADD PRIMARY KEY (`idPizzas`);

--
-- Indexes for table `PointsVente`
--
ALTER TABLE `PointsVente`
  ADD PRIMARY KEY (`idPointvente`,`idStock`),
  ADD KEY `fk_PointsVente_Stocks1_idx` (`idStock`);

--
-- Indexes for table `Produits`
--
ALTER TABLE `Produits`
  ADD PRIMARY KEY (`idProduit`),
  ADD KEY `fk_Produits_Articles1_idx` (`Articles_idArticle`),
  ADD KEY `fk_Produits_Pizzas1_idx` (`Pizzas_idPizzas`);

--
-- Indexes for table `Reglements`
--
ALTER TABLE `Reglements`
  ADD PRIMARY KEY (`idReglement`),
  ADD KEY `fk_Reglements_Commandes1_idx` (`Commandes_idCommande`);

--
-- Indexes for table `Stocks`
--
ALTER TABLE `Stocks`
  ADD PRIMARY KEY (`idStock`);

--
-- Indexes for table `Telephones`
--
ALTER TABLE `Telephones`
  ADD PRIMARY KEY (`idTelephone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Acces`
--
ALTER TABLE `Acces`
  MODIFY `idAcces` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Adresses`
--
ALTER TABLE `Adresses`
  MODIFY `idAdresse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Categories`
--
ALTER TABLE `Categories`
  MODIFY `idCategorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Clients`
--
ALTER TABLE `Clients`
  MODIFY `idClient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Commandes`
--
ALTER TABLE `Commandes`
  MODIFY `idCommande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Contacts`
--
ALTER TABLE `Contacts`
  MODIFY `idContact` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Factures`
--
ALTER TABLE `Factures`
  MODIFY `idFacture` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Livraisons`
--
ALTER TABLE `Livraisons`
  MODIFY `idLivraison` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Matieres`
--
ALTER TABLE `Matieres`
  MODIFY `idMatiere` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `Personnels`
--
ALTER TABLE `Personnels`
  MODIFY `idPersonnel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `PointsVente`
--
ALTER TABLE `PointsVente`
  MODIFY `idPointvente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Produits`
--
ALTER TABLE `Produits`
  MODIFY `idProduit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `Reglements`
--
ALTER TABLE `Reglements`
  MODIFY `idReglement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Stocks`
--
ALTER TABLE `Stocks`
  MODIFY `idStock` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Telephones`
--
ALTER TABLE `Telephones`
  MODIFY `idTelephone` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ArticlesStocks`
--
ALTER TABLE `ArticlesStocks`
  ADD CONSTRAINT `fk_Articles_has_Stock_Articles1` FOREIGN KEY (`idArticle`) REFERENCES `Articles` (`idArticle`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Articles_has_Stock_Stock1` FOREIGN KEY (`idStock`) REFERENCES `Stocks` (`idStock`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `CategoriesProduits`
--
ALTER TABLE `CategoriesProduits`
  ADD CONSTRAINT `fk_Categories_has_Produits_Categories1` FOREIGN KEY (`idCategorie`) REFERENCES `Categories` (`idCategorie`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Categories_has_Produits_Produits1` FOREIGN KEY (`idProduit`) REFERENCES `Produits` (`idProduit`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Clients`
--
ALTER TABLE `Clients`
  ADD CONSTRAINT `fk_Clients_Adresses1` FOREIGN KEY (`Adresses_idAdresse`) REFERENCES `Adresses` (`idAdresse`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Clients_Contacts1` FOREIGN KEY (`Contacts_idContact`) REFERENCES `Contacts` (`idContact`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Clients_Telephones1` FOREIGN KEY (`Telephones_idTelephone`) REFERENCES `Telephones` (`idTelephone`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Commandes`
--
ALTER TABLE `Commandes`
  ADD CONSTRAINT `fk_Commandes_Clients1` FOREIGN KEY (`Clients_idClient`) REFERENCES `Clients` (`idClient`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Commandes_Factures1` FOREIGN KEY (`Factures_idFacture`) REFERENCES `Factures` (`idFacture`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Commandes_Personnels1` FOREIGN KEY (`Personnels_idPersonnel`) REFERENCES `Personnels` (`idPersonnel`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `CommandesProduits`
--
ALTER TABLE `CommandesProduits`
  ADD CONSTRAINT `fk_Produits_has_Commandes_Commandes1` FOREIGN KEY (`idCommande`) REFERENCES `Commandes` (`idCommande`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Produits_has_Commandes_Produits1` FOREIGN KEY (`idProduit`) REFERENCES `Produits` (`idProduit`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Livraisons`
--
ALTER TABLE `Livraisons`
  ADD CONSTRAINT `fk_Livraisons_Commandes1` FOREIGN KEY (`Commandes_idCommande`) REFERENCES `Commandes` (`idCommande`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `MatieresPizzas`
--
ALTER TABLE `MatieresPizzas`
  ADD CONSTRAINT `fk_Pizzas_has_Matieres_Matieres1` FOREIGN KEY (`idMatiere`) REFERENCES `Matieres` (`idMatiere`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Pizzas_has_Matieres_Pizzas1` FOREIGN KEY (`idPizza`) REFERENCES `Pizzas` (`idPizzas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `MatieresStocks`
--
ALTER TABLE `MatieresStocks`
  ADD CONSTRAINT `fk_Matieres_has_Stocks_Matieres1` FOREIGN KEY (`idMatiere`) REFERENCES `Matieres` (`idMatiere`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Matieres_has_Stocks_Stocks1` FOREIGN KEY (`idStock`) REFERENCES `Stocks` (`idStock`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Personnels`
--
ALTER TABLE `Personnels`
  ADD CONSTRAINT `fk_Personnels_Acces1` FOREIGN KEY (`Acces_idAcces`) REFERENCES `Acces` (`idAcces`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `PersonnelsPointsVente`
--
ALTER TABLE `PersonnelsPointsVente`
  ADD CONSTRAINT `fk_PointsVente_has_Personnels_Personnels1` FOREIGN KEY (`idPersonnel`) REFERENCES `Personnels` (`idPersonnel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_PointsVente_has_Personnels_PointsVente1` FOREIGN KEY (`idPointvente`) REFERENCES `PointsVente` (`idPointvente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `PointsVente`
--
ALTER TABLE `PointsVente`
  ADD CONSTRAINT `fk_PointsVente_Stocks1` FOREIGN KEY (`idStock`) REFERENCES `Stocks` (`idStock`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Produits`
--
ALTER TABLE `Produits`
  ADD CONSTRAINT `fk_Produits_Articles1` FOREIGN KEY (`Articles_idArticle`) REFERENCES `Articles` (`idArticle`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Produits_Pizzas1` FOREIGN KEY (`Pizzas_idPizzas`) REFERENCES `Pizzas` (`idPizzas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Reglements`
--
ALTER TABLE `Reglements`
  ADD CONSTRAINT `fk_Reglements_Commandes1` FOREIGN KEY (`Commandes_idCommande`) REFERENCES `Commandes` (`idCommande`) ON DELETE NO ACTION ON UPDATE NO ACTION;
