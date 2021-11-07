-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : Dim 11 avr. 2021 à 20:46
-- Version du serveur :  10.4.17-MariaDB
-- Version de PHP : 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `nipet_assessment`
--
CREATE DATABASE IF NOT EXISTS `nipet_assessment` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `nipet_assessment`;

-- --------------------------------------------------------

--
-- Structure de la table `appointmentforpet`
--

CREATE TABLE `appointmentforpet` (
  `AppointmentID` varchar(4) NOT NULL,
  `Date_of_Appointment` date NOT NULL,
  `Appointment_time` time NOT NULL,
  `ClinicID` varchar(4) NOT NULL,
  `PetID` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `clinicforpet`
--

CREATE TABLE `clinicforpet` (
  `ClinicID` varchar(4) NOT NULL,
  `Street` varchar(50) NOT NULL,
  `City` varchar(30) NOT NULL,
  `Postcode` varchar(15) NOT NULL,
  `TelephoneNumber` varchar(11) NOT NULL,
  `Email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `examinationforpet`
--

CREATE TABLE `examinationforpet` (
  `ExamID` varchar(4) NOT NULL,
  `ExamDate` date NOT NULL,
  `ExamTime` time NOT NULL,
  `ExamResult` varchar(50) NOT NULL,
  `StaffID` varchar(4) NOT NULL,
  `PetID` varchar(4) NOT NULL,
  `ClinicID` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `invoice`
--

CREATE TABLE `invoice` (
  `InvoiceID` varchar(4) NOT NULL,
  `InvoiceDate` date NOT NULL,
  `PaymentDate` time NOT NULL,
  `MethodOfPayment` varchar(50) NOT NULL,
  `PetID` varchar(4) NOT NULL,
  `ExamID` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `invoicetreatment`
--

CREATE TABLE `invoicetreatment` (
  `InvoiceID` varchar(4) NOT NULL,
  `TreatmentID` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `owner`
--

CREATE TABLE `owner` (
  `OwnerID` varchar(4) NOT NULL,
  `OwnerSurname` varchar(25) NOT NULL,
  `OwnerForename` varchar(25) NOT NULL,
  `Street` varchar(50) NOT NULL,
  `City` varchar(30) NOT NULL,
  `Postcode` varchar(50) NOT NULL,
  `Telephone_Number` varchar(11) NOT NULL,
  `Email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `penforpet`
--

CREATE TABLE `penforpet` (
  `PenID` varchar(4) NOT NULL,
  `PenCapacity` double NOT NULL,
  `PenAvailability` varchar(20) NOT NULL,
  `ClinicID` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `penrecords`
--

CREATE TABLE `penrecords` (
  `PenID` varchar(4) NOT NULL,
  `PetID` varchar(4) NOT NULL,
  `PenDateEntered` date NOT NULL,
  `PenDateExit` date NOT NULL,
  `Penadditionalcomments` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `petfortreatment`
--

CREATE TABLE `petfortreatment` (
  `PetID` varchar(4) NOT NULL,
  `PetName` varchar(15) NOT NULL,
  `Typeofpet` varchar(15) NOT NULL,
  `PetDescription` varchar(30) NOT NULL,
  `PetDateOfBirth` date NOT NULL,
  `PetCurrentStatus` varchar(10) NOT NULL,
  `PetRegistered_Date` date NOT NULL,
  `OwnerID` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `prescribedtreatment`
--

CREATE TABLE `prescribedtreatment` (
  `TreatmentID` varchar(4) NOT NULL,
  `ExamID` varchar(15) NOT NULL,
  `PrescribedTreatment_DateBeginning` date NOT NULL,
  `PrescribedTreatment_DateEnd` date NOT NULL,
  `additionalcomments` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `staffforbusiness`
--

CREATE TABLE `staffforbusiness` (
  `StaffID` varchar(4) NOT NULL,
  `Surname` varchar(25) NOT NULL,
  `Forename` varchar(25) NOT NULL,
  `Street` varchar(30) NOT NULL,
  `City` varchar(30) NOT NULL,
  `Postcode` varchar(15) NOT NULL,
  `TelephoneID` varchar(4) NOT NULL,
  `DateOfBirth` date NOT NULL,
  `Sex` varchar(4) NOT NULL,
  `NationalInsuranceNumber` varchar(15) NOT NULL,
  `PositionInBusiness` varchar(25) NOT NULL,
  `Qualification` varchar(50) NOT NULL,
  `Salary` double NOT NULL,
  `EmploymentHistory` varchar(50) NOT NULL,
  `ClinicID` varchar(4) NOT NULL,
  `ManagerID` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `stafftelnb`
--

CREATE TABLE `stafftelnb` (
  `StaffID` varchar(4) NOT NULL,
  `TelNb` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `treatmentforpet`
--

CREATE TABLE `treatmentforpet` (
  `TreatmentID` varchar(4) NOT NULL,
  `Treatment_Description` varchar(50) NOT NULL,
  `Cost` double NOT NULL,
  `Stock` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `appointmentforpet`
--
ALTER TABLE `appointmentforpet`
  ADD PRIMARY KEY (`AppointmentID`),
  ADD UNIQUE KEY `appointment_UN` (`PetID`,`Date_of_Appointment`,`Appointment_time`),
  ADD KEY `appointmentforpet_2FK` (`ClinicID`);

--
-- Index pour la table `clinicforpet`
--
ALTER TABLE `clinicforpet`
  ADD PRIMARY KEY (`ClinicID`),
  ADD UNIQUE KEY `clinicforpet_UN` (`Street`,`City`,`TelephoneNumber`);

--
-- Index pour la table `examinationforpet`
--
ALTER TABLE `examinationforpet`
  ADD PRIMARY KEY (`ExamID`),
  ADD UNIQUE KEY `clinicforpet_UN` (`ExamDate`,`ExamTime`,`StaffID`,`ClinicID`),
  ADD KEY `examinationforpet_FK` (`StaffID`),
  ADD KEY `examinationforpet_2FK` (`ClinicID`),
  ADD KEY `examinationforpet_3FK` (`PetID`);

--
-- Index pour la table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`InvoiceID`),
  ADD UNIQUE KEY `invoice_UN` (`PetID`,`ExamID`,`InvoiceDate`,`PaymentDate`),
  ADD KEY `invoice_2FK` (`ExamID`);

--
-- Index pour la table `invoicetreatment`
--
ALTER TABLE `invoicetreatment`
  ADD PRIMARY KEY (`InvoiceID`,`TreatmentID`),
  ADD KEY `invoicetreatment_2FK` (`TreatmentID`);

--
-- Index pour la table `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`OwnerID`),
  ADD UNIQUE KEY `owner_UK` (`OwnerSurname`,`OwnerForename`,`Telephone_Number`);

--
-- Index pour la table `penforpet`
--
ALTER TABLE `penforpet`
  ADD PRIMARY KEY (`PenID`),
  ADD KEY `penforpet_FK` (`ClinicID`);

--
-- Index pour la table `penrecords`
--
ALTER TABLE `penrecords`
  ADD PRIMARY KEY (`PenID`,`PetID`,`PenDateEntered`),
  ADD KEY `penrecords_2FK` (`PetID`);

--
-- Index pour la table `petfortreatment`
--
ALTER TABLE `petfortreatment`
  ADD PRIMARY KEY (`PetID`),
  ADD KEY `petfortreatment_FK` (`OwnerID`);

--
-- Index pour la table `prescribedtreatment`
--
ALTER TABLE `prescribedtreatment`
  ADD PRIMARY KEY (`TreatmentID`,`ExamID`),
  ADD KEY `Prescribedtreatment_2FK` (`ExamID`);

--
-- Index pour la table `staffforbusiness`
--
ALTER TABLE `staffforbusiness`
  ADD PRIMARY KEY (`StaffID`),
  ADD UNIQUE KEY `staffforbusiness_UK` (`NationalInsuranceNumber`),
  ADD KEY `staffforbusiness_FK` (`ClinicID`),
  ADD KEY `staffforbusiness_FK_1` (`ManagerID`);

--
-- Index pour la table `stafftelnb`
--
ALTER TABLE `stafftelnb`
  ADD PRIMARY KEY (`StaffID`,`TelNb`);

--
-- Index pour la table `treatmentforpet`
--
ALTER TABLE `treatmentforpet`
  ADD PRIMARY KEY (`TreatmentID`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `appointmentforpet`
--
ALTER TABLE `appointmentforpet`
  ADD CONSTRAINT `appointmentforpet_2FK` FOREIGN KEY (`ClinicID`) REFERENCES `clinicforpet` (`ClinicID`),
  ADD CONSTRAINT `appointmentforpet_FK` FOREIGN KEY (`PetID`) REFERENCES `petfortreatment` (`PetID`);

--
-- Contraintes pour la table `examinationforpet`
--
ALTER TABLE `examinationforpet`
  ADD CONSTRAINT `examinationforpet_2FK` FOREIGN KEY (`ClinicID`) REFERENCES `clinicforpet` (`ClinicID`),
  ADD CONSTRAINT `examinationforpet_3FK` FOREIGN KEY (`PetID`) REFERENCES `petfortreatment` (`PetID`),
  ADD CONSTRAINT `examinationforpet_FK` FOREIGN KEY (`StaffID`) REFERENCES `staffforbusiness` (`StaffID`);

--
-- Contraintes pour la table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_2FK` FOREIGN KEY (`ExamID`) REFERENCES `examinationforpet` (`ExamID`),
  ADD CONSTRAINT `invoice_FK` FOREIGN KEY (`PetID`) REFERENCES `petfortreatment` (`PetID`);

--
-- Contraintes pour la table `invoicetreatment`
--
ALTER TABLE `invoicetreatment`
  ADD CONSTRAINT `invoicetreatment_2FK` FOREIGN KEY (`TreatmentID`) REFERENCES `treatmentforpet` (`TreatmentID`),
  ADD CONSTRAINT `invoicetreatment_FK` FOREIGN KEY (`InvoiceID`) REFERENCES `invoice` (`InvoiceID`);

--
-- Contraintes pour la table `penforpet`
--
ALTER TABLE `penforpet`
  ADD CONSTRAINT `penforpet_FK` FOREIGN KEY (`ClinicID`) REFERENCES `clinicforpet` (`ClinicID`);

--
-- Contraintes pour la table `penrecords`
--
ALTER TABLE `penrecords`
  ADD CONSTRAINT `penrecords_2FK` FOREIGN KEY (`PetID`) REFERENCES `petfortreatment` (`PetID`),
  ADD CONSTRAINT `penrecords_FK` FOREIGN KEY (`PenID`) REFERENCES `penforpet` (`PenID`);

--
-- Contraintes pour la table `petfortreatment`
--
ALTER TABLE `petfortreatment`
  ADD CONSTRAINT `petfortreatment_FK` FOREIGN KEY (`OwnerID`) REFERENCES `owner` (`OwnerID`);

--
-- Contraintes pour la table `prescribedtreatment`
--
ALTER TABLE `prescribedtreatment`
  ADD CONSTRAINT `Prescribedtreatment_2FK` FOREIGN KEY (`ExamID`) REFERENCES `examinationforpet` (`ExamID`),
  ADD CONSTRAINT `Prescribedtreatment_FK` FOREIGN KEY (`TreatmentID`) REFERENCES `treatmentforpet` (`TreatmentID`);

--
-- Contraintes pour la table `staffforbusiness`
--
ALTER TABLE `staffforbusiness`
  ADD CONSTRAINT `staffforbusiness_FK` FOREIGN KEY (`ClinicID`) REFERENCES `clinicforpet` (`ClinicID`),
  ADD CONSTRAINT `staffforbusiness_FK_1` FOREIGN KEY (`ManagerID`) REFERENCES `staffforbusiness` (`StaffID`);

--
-- Contraintes pour la table `stafftelnb`
--
ALTER TABLE `stafftelnb`
  ADD CONSTRAINT `stafftelnb` FOREIGN KEY (`StaffID`) REFERENCES `staffforbusiness` (`StaffID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
