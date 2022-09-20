-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 17, 2022 at 08:05 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cyrusproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `billbook`
--

CREATE TABLE `billbook` (
  `BillID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `DivisionCode` int(11) NOT NULL,
  `GSTNo` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `BillDate` date DEFAULT NULL,
  `SGST` decimal(9,2) NOT NULL,
  `CGST` decimal(9,2) NOT NULL,
  `IGST` decimal(9,2) NOT NULL,
  `TaxableValue` decimal(12,2) NOT NULL,
  `TotalBilledValue` decimal(12,2) NOT NULL,
  `InvoiceNo` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `ReceivedAmount` decimal(12,2) NOT NULL,
  `ReceivedDate` date DEFAULT NULL,
  `Cancelled` int(11) NOT NULL,
  `SecurityAmt` decimal(12,2) NOT NULL,
  `SecurityDate` date DEFAULT NULL,
  `SecurityReceivedAmt` decimal(12,2) NOT NULL,
  `SecurityReceivedDate` date DEFAULT NULL,
  `OtherRetention` decimal(12,2) NOT NULL,
  `LiquidityDamage` decimal(12,2) NOT NULL,
  `TDS` decimal(12,2) NOT NULL,
  `IncomeTax` decimal(12,2) NOT NULL,
  `ITSirCharge` decimal(12,2) NOT NULL,
  `EducationCess` decimal(12,2) NOT NULL,
  `OtherDetection` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `billdetail`
--

CREATE TABLE `billdetail` (
  `ID` int(11) NOT NULL,
  `InvoiceNo` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `MaterialID` int(11) NOT NULL,
  `Rate` decimal(12,2) NOT NULL,
  `Qty` int(11) NOT NULL,
  `BilledPercent` decimal(9,2) NOT NULL,
  `Discount` decimal(9,2) NOT NULL,
  `HSNCode` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `GSTRate` decimal(9,2) NOT NULL,
  `Amount` decimal(12,2) NOT NULL,
  `AValue` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `challan detail`
--

CREATE TABLE `challan detail` (
  `ID` int(11) NOT NULL,
  `MaterialID` int(11) NOT NULL,
  `ChallanNo` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `ReadyQty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `deliverychallan`
--

CREATE TABLE `deliverychallan` (
  `ChallanID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `PONo` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL,
  `MovementID` int(11) NOT NULL,
  `ShippingAddress` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL,
  `ChallanDate` date DEFAULT NULL,
  `Delivered` tinyint(4) NOT NULL DEFAULT 0,
  `DeliveryDate` date DEFAULT NULL,
  `ChallanNo` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `demands`
--

CREATE TABLE `demands` (
  `ID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `OrderDate` date DEFAULT NULL,
  `DemandDate` date DEFAULT NULL,
  `DemandBy` int(11) NOT NULL,
  `ConfirmedBy` int(11) NOT NULL,
  `ConfirmationDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `demands`
--

INSERT INTO `demands` (`ID`, `OrderID`, `OrderDate`, `DemandDate`, `DemandBy`, `ConfirmedBy`, `ConfirmationDate`) VALUES
(1, 3, '2022-09-09', NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `demand_details`
--

CREATE TABLE `demand_details` (
  `MaterialID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `MaterialName` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `SrNo` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `Qty` int(11) NOT NULL,
  `Unit` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `Rate` decimal(9,2) NOT NULL,
  `InspectingAuth` int(11) NOT NULL,
  `LabourWork` tinyint(4) NOT NULL DEFAULT 0,
  `DemandDate` date NOT NULL,
  `Status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `division`
--

CREATE TABLE `division` (
  `DivisionCode` int(11) NOT NULL,
  `OrganizationCode` int(11) NOT NULL,
  `DivisionName` varchar(200) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `division`
--

INSERT INTO `division` (`DivisionCode`, `OrganizationCode`, `DivisionName`) VALUES
(1, 2, 'Div 1');

-- --------------------------------------------------------

--
-- Table structure for table `employee expense`
--

CREATE TABLE `employee expense` (
  `ExpenseID` int(11) NOT NULL,
  `VerificationID` int(11) NOT NULL,
  `MaterialName` varchar(200) COLLATE utf8mb4_bin NOT NULL,
  `Rate` decimal(9,2) NOT NULL,
  `Qty` int(11) NOT NULL,
  `Unit` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `gst rates`
--

CREATE TABLE `gst rates` (
  `ItemID` int(11) NOT NULL,
  `CatagoryName` varchar(255) DEFAULT NULL,
  `HSNCode` varchar(6) DEFAULT NULL,
  `Rate` int(11) DEFAULT 0,
  `FullHSNCode` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gst rates`
--

INSERT INTO `gst rates` (`ItemID`, `CatagoryName`, `HSNCode`, `Rate`, `FullHSNCode`) VALUES
(1, '6mm or higher power wire', '854411', 18, '85441190'),
(2, 'Alarm/ autodialer PCB', '854231', 18, '85423100'),
(3, 'Alarm/autodialer system', '853110', 18, '85311010'),
(4, 'AMC', '998719', 18, '998719'),
(5, 'Backup charge', '998719', 18, '998719'),
(6, 'Biometric reader', '854370', 18, '85437099'),
(7, 'Camera', '852580', 18, '85258020'),
(8, 'Charger pcb', '854239', 18, '85423900'),
(9, 'DVD Writer', '847170', 18, '84717070'),
(10, 'DVR', '852190', 18, '85219090'),
(11, 'EM Lock', '830140', 18, '83014090'),
(12, 'Fire alarm', '853110', 18, '85311020'),
(13, 'Fire Sensor', '853110', 18, '90279090'),
(14, 'Flap Barrier', '853080', 18, '85308000'),
(15, 'Hard Disk', '847170', 18, '84717020'),
(16, 'Housing', '732690', 18, '73269099'),
(17, 'IC', '854231', 18, '85423100'),
(18, 'Installation Charge', '995461', 18, '995461'),
(19, 'Lens', '852990', 18, '85299090'),
(20, 'Light Sensor', '853620', 18, '85362020'),
(21, 'Lock two way', '853620', 18, '85362020'),
(22, 'Magnetic switch', '853620', 18, '85362020'),
(23, 'Main Switch', '853620', 18, '85362030'),
(24, 'Manual Call Point', '853620', 18, '85362030'),
(25, 'Monitor More than 32\"', '852872', 28, '85287212'),
(26, 'Monitor upto 32\"', '852872', 18, '85287211'),
(27, 'Motorized Siren', '853110', 18, '85311010'),
(28, 'Mouse', '847160', 18, '84716060'),
(29, 'Networking devices ', '851762', 18, '85176290'),
(30, 'Packing and Forwarding ', '998540', 18, '998540'),
(31, 'Panic Switch', '853620', 18, '85362030'),
(32, 'PIR', '853110', 18, '85311090'),
(33, 'Power Supply', '850440', 18, '85044030'),
(34, 'Power Wire', '854411', 18, '85441190'),
(35, 'PVC Pipe/Sadle etc', '391739', 18, '39173990'),
(36, 'Rechargable Battery', '850720', 28, '85072000'),
(37, 'Relay', '853620', 18, '85362020'),
(38, 'Shifting charge', '995461', 18, '995461'),
(39, 'Siren re-winding', '998719', 18, '998719'),
(40, 'SMPS', '850440', 18, '85044030'),
(41, 'Solar panels', '854140', 5, '85414011'),
(42, 'Speaker internal/external', '853110', 18, '85311010'),
(43, 'Transformer', '850440', 18, '85044030'),
(44, 'Turnstile', '853080', 18, '85308000'),
(45, '4 U Rack with key for DVR', '853810', 18, '85381090'),
(46, 'Visit Charge', '998719', 18, '998719'),
(47, 'Wall Mount unit', '852990', 18, '85299090'),
(48, 'Wire 3+1', '854420', 18, '85442010'),
(49, 'Wire RJ59', '854420', 18, '85442010'),
(50, 'Wire RJ6 ', '854420', 18, '85442010'),
(51, 'Proximity Sensor', '852359', 18, '85235910'),
(52, 'Insulating Tape', '854690', 18, '85469090'),
(53, 'BnC/DC PIN', '852990', 18, '85299000'),
(54, 'Flame Sensor', '853110', 18, '853110'),
(55, 'CAT5/CAT6 cable', '854449', 18, '85444992'),
(56, 'Memory Card', '852352', 18, '85235220'),
(57, 'Rent Based', '997319', 18, '997319'),
(58, 'SITC of Govt.', '995465', 12, '99546500'),
(59, 'LED Display', '853120', 28, '85312000'),
(60, 'Repairing Charge', '889719', 18, '998719'),
(61, 'Metal Pipe', '730410', 18, '73041011'),
(62, 'DFMD', '854370', 18, '85437012'),
(63, 'UPS', '850410', 18, '85041010'),
(64, 'Computer', '847130', 18, '84713000'),
(65, 'VGA Cable', '854420', 18, '85442010'),
(66, 'IR Thermometer', '902519', 18, '90251910'),
(67, 'Sanitizer', '842489', 18, '84248990');

-- --------------------------------------------------------

--
-- Table structure for table `issuechallan`
--

CREATE TABLE `issuechallan` (
  `ChallanID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `SiteCode` int(11) NOT NULL,
  `StateCode` int(11) NOT NULL,
  `ChallanDate` date DEFAULT NULL,
  `ChallanNo` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `issuechallan detail`
--

CREATE TABLE `issuechallan detail` (
  `ID` int(11) NOT NULL,
  `ChallanNo` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `MaterialID` int(11) NOT NULL,
  `Qty` int(11) NOT NULL,
  `Unit` varchar(50) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `material consumed`
--

CREATE TABLE `material consumed` (
  `ID` int(11) NOT NULL,
  `VerificationID` int(11) NOT NULL,
  `MaterialID` int(11) NOT NULL,
  `Qty` int(11) NOT NULL,
  `Unit` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `movement`
--

CREATE TABLE `movement` (
  `MovementID` int(11) NOT NULL,
  `Movement` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `OfferID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `MaterialID` int(11) NOT NULL,
  `VenderID` int(11) NOT NULL,
  `ItemName` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL,
  `OfferRate` decimal(12,2) NOT NULL,
  `Qty` int(11) NOT NULL,
  `Unit` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `InspectionAt` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL,
  `OfferDate` date DEFAULT NULL,
  `Finalized` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `offer terms`
--

CREATE TABLE `offer terms` (
  `ID` int(11) NOT NULL,
  `OfferID` int(11) NOT NULL,
  `PaymentTerms` varchar(500) COLLATE utf8mb4_bin NOT NULL,
  `WarrantyTerms` varchar(500) COLLATE utf8mb4_bin NOT NULL,
  `DeliveryTerms` varchar(500) COLLATE utf8mb4_bin NOT NULL,
  `OtherTerms` varchar(500) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `DivisionCode` int(11) DEFAULT NULL,
  `Description` varchar(800) CHARACTER SET utf16 NOT NULL,
  `LOANo` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL,
  `LOADate` date DEFAULT NULL,
  `CompletionDate` date DEFAULT NULL,
  `BGAmount` decimal(9,2) NOT NULL,
  `BGDate` date DEFAULT NULL,
  `Warranty` int(11) NOT NULL,
  `OrderingAuth` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL,
  `BillingAuth` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `DivisionCode`, `Description`, `LOANo`, `LOADate`, `CompletionDate`, `BGAmount`, `BGDate`, `Warranty`, `OrderingAuth`, `BillingAuth`) VALUES
(1, 1, 'Test', '1234/ABC', '2022-09-09', '2022-10-09', '200000.00', '2022-09-30', 12, 'ABC', 'XYZ'),
(2, 1, 'TEST', '1234/ABC', '2022-09-09', '2022-10-31', '150000.00', '2022-09-30', 12, 'ABC', 'XYZ'),
(3, 1, 'TEST', '1234/ABC', '2022-09-09', '2022-09-30', '123456.00', '2022-10-04', 12, 'ABC', 'XYZ');

-- --------------------------------------------------------

--
-- Table structure for table `organization`
--

CREATE TABLE `organization` (
  `OrganizationCode` int(11) NOT NULL,
  `Organization` varchar(200) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `organization`
--

INSERT INTO `organization` (`OrganizationCode`, `Organization`) VALUES
(1, 'Org 2'),
(2, 'Org 1');

-- --------------------------------------------------------

--
-- Table structure for table `po`
--

CREATE TABLE `po` (
  `POID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `MaterialID` int(11) NOT NULL,
  `OfferID` int(11) NOT NULL,
  `Rate` decimal(9,2) NOT NULL,
  `Qty` int(11) NOT NULL,
  `Unit` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `ShippingAddress` varchar(500) COLLATE utf8mb4_bin NOT NULL,
  `PODate` date NOT NULL,
  `PONo` varchar(100) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `site`
--

CREATE TABLE `site` (
  `SiteCode` int(11) NOT NULL,
  `DivisionCode` int(11) NOT NULL,
  `SiteName` varchar(200) CHARACTER SET utf8 NOT NULL,
  `Address` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL,
  `Consignee` varchar(150) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `sitesurvey`
--

CREATE TABLE `sitesurvey` (
  `SurveyID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `SiteCode` int(11) NOT NULL,
  `MaterialID` int(11) NOT NULL,
  `Qty` int(11) NOT NULL,
  `Unit` varchar(15) COLLATE utf8mb4_bin NOT NULL,
  `SurveyDate` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `sitework`
--

CREATE TABLE `sitework` (
  `WorkID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `SiteCode` int(11) NOT NULL,
  `MaterialID` int(11) NOT NULL,
  `WorkTypeID` int(11) NOT NULL,
  `Qty` int(11) NOT NULL,
  `Unit` varchar(15) COLLATE utf8mb4_bin NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `EmployeeCode` int(11) NOT NULL,
  `AssignDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `StateCode` int(11) NOT NULL,
  `StateName` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `VendorID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `MaterialID` int(11) NOT NULL,
  `VenderName` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `Contact` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `Email` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `worktype`
--

CREATE TABLE `worktype` (
  `WorkTypeID` int(11) NOT NULL,
  `Work` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `work verification`
--

CREATE TABLE `work verification` (
  `VerificationID` int(11) NOT NULL,
  `SiteCode` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `WorkID` int(11) NOT NULL,
  `WorkTypeID` int(11) NOT NULL,
  `Qty` int(11) NOT NULL,
  `Unit` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `WorkDate` date DEFAULT NULL,
  `VerificationRemark` varchar(300) COLLATE utf8mb4_bin DEFAULT NULL,
  `VerificationByID` int(11) NOT NULL,
  `VerificationDate` date DEFAULT NULL,
  `Accepted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `billbook`
--
ALTER TABLE `billbook`
  ADD PRIMARY KEY (`BillID`);

--
-- Indexes for table `billdetail`
--
ALTER TABLE `billdetail`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `challan detail`
--
ALTER TABLE `challan detail`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `deliverychallan`
--
ALTER TABLE `deliverychallan`
  ADD PRIMARY KEY (`ChallanID`);

--
-- Indexes for table `demands`
--
ALTER TABLE `demands`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `demand_details`
--
ALTER TABLE `demand_details`
  ADD PRIMARY KEY (`MaterialID`);

--
-- Indexes for table `division`
--
ALTER TABLE `division`
  ADD PRIMARY KEY (`DivisionCode`);

--
-- Indexes for table `employee expense`
--
ALTER TABLE `employee expense`
  ADD PRIMARY KEY (`ExpenseID`);

--
-- Indexes for table `gst rates`
--
ALTER TABLE `gst rates`
  ADD PRIMARY KEY (`ItemID`),
  ADD KEY `FullHSNCode` (`FullHSNCode`),
  ADD KEY `HSNCode` (`HSNCode`);

--
-- Indexes for table `issuechallan`
--
ALTER TABLE `issuechallan`
  ADD PRIMARY KEY (`ChallanID`);

--
-- Indexes for table `issuechallan detail`
--
ALTER TABLE `issuechallan detail`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `material consumed`
--
ALTER TABLE `material consumed`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `movement`
--
ALTER TABLE `movement`
  ADD PRIMARY KEY (`MovementID`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`OfferID`);

--
-- Indexes for table `offer terms`
--
ALTER TABLE `offer terms`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`);

--
-- Indexes for table `organization`
--
ALTER TABLE `organization`
  ADD PRIMARY KEY (`OrganizationCode`);

--
-- Indexes for table `po`
--
ALTER TABLE `po`
  ADD PRIMARY KEY (`POID`);

--
-- Indexes for table `site`
--
ALTER TABLE `site`
  ADD PRIMARY KEY (`SiteCode`);

--
-- Indexes for table `sitesurvey`
--
ALTER TABLE `sitesurvey`
  ADD PRIMARY KEY (`SurveyID`);

--
-- Indexes for table `sitework`
--
ALTER TABLE `sitework`
  ADD PRIMARY KEY (`WorkID`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`VendorID`);

--
-- Indexes for table `worktype`
--
ALTER TABLE `worktype`
  ADD PRIMARY KEY (`WorkTypeID`);

--
-- Indexes for table `work verification`
--
ALTER TABLE `work verification`
  ADD PRIMARY KEY (`VerificationID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `billbook`
--
ALTER TABLE `billbook`
  MODIFY `BillID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `billdetail`
--
ALTER TABLE `billdetail`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `challan detail`
--
ALTER TABLE `challan detail`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliverychallan`
--
ALTER TABLE `deliverychallan`
  MODIFY `ChallanID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `demands`
--
ALTER TABLE `demands`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `demand_details`
--
ALTER TABLE `demand_details`
  MODIFY `MaterialID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `division`
--
ALTER TABLE `division`
  MODIFY `DivisionCode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employee expense`
--
ALTER TABLE `employee expense`
  MODIFY `ExpenseID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gst rates`
--
ALTER TABLE `gst rates`
  MODIFY `ItemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `issuechallan`
--
ALTER TABLE `issuechallan`
  MODIFY `ChallanID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `issuechallan detail`
--
ALTER TABLE `issuechallan detail`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `material consumed`
--
ALTER TABLE `material consumed`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `movement`
--
ALTER TABLE `movement`
  MODIFY `MovementID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `OfferID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offer terms`
--
ALTER TABLE `offer terms`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `organization`
--
ALTER TABLE `organization`
  MODIFY `OrganizationCode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `po`
--
ALTER TABLE `po`
  MODIFY `POID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site`
--
ALTER TABLE `site`
  MODIFY `SiteCode` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sitesurvey`
--
ALTER TABLE `sitesurvey`
  MODIFY `SurveyID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sitework`
--
ALTER TABLE `sitework`
  MODIFY `WorkID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `VendorID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `worktype`
--
ALTER TABLE `worktype`
  MODIFY `WorkTypeID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `work verification`
--
ALTER TABLE `work verification`
  MODIFY `VerificationID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
