-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : lun. 31 juil. 2023 à 17:23
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `Shop`
--

-- --------------------------------------------------------

--
-- Structure de la table `Customers`
--

CREATE TABLE `Customers` (
  `Id_Customer` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(150) NOT NULL,
  `Address` varchar(160) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Customers`
--

INSERT INTO `Customers` (`Id_Customer`, `Name`, `Email`, `Address`) VALUES
(1, 'Daouda Diallo', 'charabia@gmail.com', 'Nekhdallouh'),
(2, 'Youssouf', 'lami@gmail.com', 'Foumoudeuk'),
(3, 'Thierno', 'mouni@gmail.com', 'debatown'),
(4, 'Issa', 'mani@gmail.com', 'ndeckitown');

-- --------------------------------------------------------

--
-- Structure de la table `Orders`
--

CREATE TABLE `Orders` (
  `Id_Order` int(11) NOT NULL,
  `Id_Customer` int(50) NOT NULL,
  `Id_Product` int(50) NOT NULL,
  `Quantity` int(100) NOT NULL,
  `Date_Order` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Orders`
--

INSERT INTO `Orders` (`Id_Order`, `Id_Customer`, `Id_Product`, `Quantity`, `Date_Order`) VALUES
(1, 1, 1, 1, '2023-07-31'),
(2, 1, 2, 1, '2023-07-31');

-- --------------------------------------------------------

--
-- Structure de la table `Products`
--

CREATE TABLE `Products` (
  `Id_Product` int(11) NOT NULL,
  `Name` varchar(150) NOT NULL,
  `Price` decimal(60,0) NOT NULL
) ;

--
-- Déchargement des données de la table `Products`
--

INSERT INTO `Products` (`Id_Product`, `Name`, `Price`) VALUES
(1, 'Cafe', 1500),
(2, 'Croissant', 700),
(3, 'Croissant', 700),
(4, 'Sucre', 300),
(5, 'Banane', 800),
(6, 'Nutella', 1300);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Customers`
--
ALTER TABLE `Customers`
  ADD PRIMARY KEY (`Id_Customer`);

--
-- Index pour la table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`Id_Order`),
  ADD KEY `Id_Customer` (`Id_Customer`),
  ADD KEY `Id_Product` (`Id_Product`);

--
-- Index pour la table `Products`
--
ALTER TABLE `Products`
  ADD PRIMARY KEY (`Id_Product`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Customers`
--
ALTER TABLE `Customers`
  MODIFY `Id_Customer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `Orders`
--
ALTER TABLE `Orders`
  MODIFY `Id_Order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `Products`
--
ALTER TABLE `Products`
  MODIFY `Id_Product` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`Id_Customer`) REFERENCES `Customers` (`Id_Customer`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`Id_Product`) REFERENCES `Products` (`Id_Product`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
