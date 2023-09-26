-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: May 15, 2019 at 06:36 PM
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

-- --------------------------------------------------------

--
-- Table structure for table `Articles`
--

CREATE TABLE `Articles` (
  `idArticle` int(11) NOT NULL,
  `intituleArticle` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

-- --------------------------------------------------------

--
-- Table structure for table `Categories`
--

CREATE TABLE `Categories` (
  `idCategorie` int(11) NOT NULL,
  `nomCategorie` varchar(15) NOT NULL,
  `description` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `CategoriesProduits`
--

CREATE TABLE `CategoriesProduits` (
  `idCategorie` int(11) NOT NULL,
  `idProduit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

-- --------------------------------------------------------

--
-- Table structure for table `CommandesProduits`
--

CREATE TABLE `CommandesProduits` (
  `idCommande` int(11) NOT NULL,
  `idProduit` int(11) NOT NULL,
  `quantiteProduit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Contacts`
--

CREATE TABLE `Contacts` (
  `idContact` int(11) NOT NULL,
  `adresseMail` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

-- --------------------------------------------------------

--
-- Table structure for table `Matieres`
--

CREATE TABLE `Matieres` (
  `idMatiere` int(11) NOT NULL,
  `intituleMatiere` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `MatieresPizzas`
--

CREATE TABLE `MatieresPizzas` (
  `idMatiere` int(11) NOT NULL,
  `idPizza` int(11) NOT NULL,
  `quantiteMatiere` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

-- --------------------------------------------------------

--
-- Table structure for table `PersonnelsPointsVente`
--

CREATE TABLE `PersonnelsPointsVente` (
  `idPersonnel` int(11) NOT NULL,
  `idPointvente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Pizzas`
--

CREATE TABLE `Pizzas` (
  `idPizzas` int(11) NOT NULL,
  `nomPizza` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `PointsVente`
--

CREATE TABLE `PointsVente` (
  `idPointvente` int(11) NOT NULL,
  `nomPointVente` varchar(45) NOT NULL,
  `idStock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

-- --------------------------------------------------------

--
-- Table structure for table `Stocks`
--

CREATE TABLE `Stocks` (
  `idStock` int(11) NOT NULL,
  `dateControle` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Telephones`
--

CREATE TABLE `Telephones` (
  `idTelephone` int(11) NOT NULL,
  `numTelephone` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  MODIFY `idAcces` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Adresses`
--
ALTER TABLE `Adresses`
  MODIFY `idAdresse` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Categories`
--
ALTER TABLE `Categories`
  MODIFY `idCategorie` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Clients`
--
ALTER TABLE `Clients`
  MODIFY `idClient` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Commandes`
--
ALTER TABLE `Commandes`
  MODIFY `idCommande` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Contacts`
--
ALTER TABLE `Contacts`
  MODIFY `idContact` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Factures`
--
ALTER TABLE `Factures`
  MODIFY `idFacture` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Livraisons`
--
ALTER TABLE `Livraisons`
  MODIFY `idLivraison` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Matieres`
--
ALTER TABLE `Matieres`
  MODIFY `idMatiere` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Personnels`
--
ALTER TABLE `Personnels`
  MODIFY `idPersonnel` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `PointsVente`
--
ALTER TABLE `PointsVente`
  MODIFY `idPointvente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Produits`
--
ALTER TABLE `Produits`
  MODIFY `idProduit` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Reglements`
--
ALTER TABLE `Reglements`
  MODIFY `idReglement` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Stocks`
--
ALTER TABLE `Stocks`
  MODIFY `idStock` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Telephones`
--
ALTER TABLE `Telephones`
  MODIFY `idTelephone` int(11) NOT NULL AUTO_INCREMENT;

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
