-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 01, 2022 at 01:58 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

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
  `GSTNo` varchar(50) DEFAULT NULL,
  `BillDate` date DEFAULT NULL,
  `SGST` decimal(9,2) NOT NULL,
  `CGST` decimal(9,2) NOT NULL,
  `IGST` decimal(9,2) NOT NULL,
  `TaxableValue` decimal(12,2) NOT NULL,
  `TotalBilledValue` decimal(12,2) NOT NULL,
  `InvoiceNo` varchar(50) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `billdetail`
--

CREATE TABLE `billdetail` (
  `ID` int(11) NOT NULL,
  `InvoiceNo` varchar(50) DEFAULT NULL,
  `MaterialID` int(11) NOT NULL,
  `Rate` decimal(12,2) NOT NULL,
  `Qty` int(11) NOT NULL,
  `BilledPercent` decimal(9,2) NOT NULL,
  `Discount` decimal(9,2) NOT NULL,
  `HSNCode` varchar(50) NOT NULL,
  `GSTRate` decimal(9,2) NOT NULL,
  `Amount` decimal(12,2) NOT NULL,
  `AValue` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `challan detail`
--

CREATE TABLE `challan detail` (
  `ID` int(11) NOT NULL,
  `MaterialID` int(11) NOT NULL,
  `ChallanNo` varchar(50) DEFAULT NULL,
  `ReadyQty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `deliverychallan`
--

CREATE TABLE `deliverychallan` (
  `ChallanID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `PONo` varchar(500) DEFAULT NULL,
  `MovementID` int(11) NOT NULL,
  `ShippingAddress` varchar(500) DEFAULT NULL,
  `ChallanDate` date DEFAULT NULL,
  `Delivered` tinyint(4) NOT NULL DEFAULT 0,
  `DeliveryDate` date DEFAULT NULL,
  `ChallanNo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `demands`
--

CREATE TABLE `demands` (
  `ID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `OrderDate` date DEFAULT NULL,
  `DemandDate` date DEFAULT NULL,
  `DemandBy` int(11) DEFAULT NULL,
  `ConfirmedBy` int(11) DEFAULT NULL,
  `ConfirmationDate` date DEFAULT NULL,
  `StatusID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `demands`
--

INSERT INTO `demands` (`ID`, `OrderID`, `OrderDate`, `DemandDate`, `DemandBy`, `ConfirmedBy`, `ConfirmationDate`, `StatusID`) VALUES
(3, 10, '2022-10-28', '2022-10-28', 1, NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `demand_details`
--

CREATE TABLE `demand_details` (
  `MaterialID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `MaterialName` varchar(500) DEFAULT NULL,
  `SrNo` varchar(100) DEFAULT NULL,
  `Qty` int(11) NOT NULL,
  `Unit` varchar(20) NOT NULL,
  `Rate` decimal(9,2) NOT NULL,
  `InspectingAuth` varchar(100) NOT NULL,
  `LabourWork` tinyint(4) NOT NULL DEFAULT 0,
  `DemandDate` date NOT NULL,
  `Status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `demand_details`
--

INSERT INTO `demand_details` (`MaterialID`, `OrderID`, `MaterialName`, `SrNo`, `Qty`, `Unit`, `Rate`, `InspectingAuth`, `LabourWork`, `DemandDate`, `Status`) VALUES
(4, 10, 'Supply of UTP indoor cable CAT 6 ,UTP cable CAT-6 to support 10-100-1000 Mbps .The category 6 cable should consists of 4 pair of solid insulated copper 23 AWG (0.57mm) pairs separated with a central slit film filler, insulation -polyethylene Make D-link, Molex, Dax, Schncider or similar. Inspection by Consignee.', 'Schedule 01-Schedule A Supply Portion Sr. No-1', 10000, 'm', '21.67', 'Inspection by Consignee.', 0, '2022-10-28', 3),
(5, 10, 'Supply of optical fiber cable as per RDSO specification IRS:TC 55-2006 Rev.1 Amnd.1.1 with latest amnd. Inspection by Consignee.', 'Schedule 01-Schedule A Supply Portion Sr. No-2', 2000, 'm', '59.25', 'Inspection by Consignee.', 0, '2022-10-28', 5),
(6, 10, 'Laying of signalling-Power-Telecom cable of various cores-sizes in trenches.', 'Schedule 02-Schedule B Execution Portion-Sr. No-11', 5, 'm', '6820.57', 'Inspection by Authority', 1, '2022-10-28', 1),
(7, 10, 'Cutting of cable trench in mechanadised -concrete and stone paved road-track crossing-culvert-metal-road crossing to a depth of 1.0 mtr and width .30 mtr for laying of cable and restoring the surface with plaster-tiles etc', 'Schedule 02-Schedule B Execution Portion Sr. No-12', 1000, 'm', '275.60', 'Inspection by Consinee', 1, '2022-10-28', 1);

-- --------------------------------------------------------

--
-- Table structure for table `designation`
--

CREATE TABLE `designation` (
  `DesignationID` int(11) NOT NULL,
  `Designation` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `designation`
--

INSERT INTO `designation` (`DesignationID`, `Designation`) VALUES
(1, 'Admin'),
(2, 'Field Employee');

-- --------------------------------------------------------

--
-- Table structure for table `division`
--

CREATE TABLE `division` (
  `DivisionCode` int(11) NOT NULL,
  `OrganizationCode` int(11) NOT NULL,
  `DivisionName` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `MaterialName` varchar(200) NOT NULL,
  `Rate` decimal(9,2) NOT NULL,
  `Qty` int(11) NOT NULL,
  `Unit` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `EmployeeCode` int(11) NOT NULL,
  `EmployeeName` varchar(150) DEFAULT NULL,
  `DesignationID` int(11) NOT NULL,
  `Contact` varchar(13) DEFAULT NULL,
  `Email` varchar(150) DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `Active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`EmployeeCode`, `EmployeeName`, `DesignationID`, `Contact`, `Email`, `Address`, `Active`) VALUES
(3, 'Anant', 2, '+918418826770', 'suryavanshianantsingh@gmail.com', 'ANANT SINGH SURYAVANSHI\nVILLAGE POST DHIRAULI BABU\nCHHAWANI,\nBasti,\nUttar Pradesh,\npincode: 272127', 1),
(4, 'Anant Singh', 2, '+918418826770', 'suryavanshianantsingh@gmail.com', 'ANANT SINGH SURYAVANSHI\nVILLAGE POST DHIRAULI BABU\nCHHAWANI,\nBasti,\nUttar Pradesh,\npincode: 272127', 1);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `ChallanNo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `issuechallan detail`
--

CREATE TABLE `issuechallan detail` (
  `ID` int(11) NOT NULL,
  `ChallanNo` varchar(50) NOT NULL,
  `MaterialID` int(11) NOT NULL,
  `Qty` int(11) NOT NULL,
  `Unit` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `material consumed`
--

CREATE TABLE `material consumed` (
  `ID` int(11) NOT NULL,
  `VerificationID` int(11) NOT NULL,
  `MaterialID` int(11) NOT NULL,
  `Qty` int(11) NOT NULL,
  `Unit` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `movement`
--

CREATE TABLE `movement` (
  `MovementID` int(11) NOT NULL,
  `Movement` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `movement`
--

INSERT INTO `movement` (`MovementID`, `Movement`) VALUES
(1, 'OEM to office'),
(2, 'OEM to client'),
(3, 'OEM to inspection site'),
(4, 'Inspection site to client'),
(5, 'Inspection site to office'),
(6, 'Office to client'),
(7, 'Office to inspection site');

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `OfferID` int(11) NOT NULL,
  `TermID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `MaterialID` int(11) NOT NULL,
  `VendorID` int(11) NOT NULL,
  `ItemName` varchar(500) DEFAULT NULL,
  `ModalNo` varchar(100) DEFAULT NULL,
  `OfferRate` decimal(12,2) NOT NULL,
  `GST` decimal(9,2) NOT NULL,
  `Qty` int(11) NOT NULL,
  `InspectionAt` varchar(200) DEFAULT NULL,
  `OfferDate` date DEFAULT NULL,
  `Finalized` tinyint(4) NOT NULL DEFAULT 0,
  `FinalizedDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`OfferID`, `TermID`, `OrderID`, `MaterialID`, `VendorID`, `ItemName`, `ModalNo`, `OfferRate`, `GST`, `Qty`, `InspectionAt`, `OfferDate`, `Finalized`, `FinalizedDate`) VALUES
(2, 5, 10, 5, 20, 'ABC', 'Modal 1', '2000.00', '0.00', 2000, 'Inspection at OEM', '2022-10-29', 1, '2022-10-29'),
(3, 6, 10, 4, 21, 'Cat-6', 'NA', '100.00', '18.00', 100, 'Inspection at OEM', '2022-10-31', 1, '2022-10-31');

-- --------------------------------------------------------

--
-- Table structure for table `offer terms`
--

CREATE TABLE `offer terms` (
  `TermID` int(11) NOT NULL,
  `PaymentTerms` varchar(500) NOT NULL,
  `WarrantyTerms` varchar(500) NOT NULL,
  `DeliveryTerms` varchar(500) NOT NULL,
  `OtherTerms` varchar(500) DEFAULT NULL,
  `ShippingCharges` decimal(9,2) NOT NULL DEFAULT 0.00,
  `OtherCharges` decimal(9,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `offer terms`
--

INSERT INTO `offer terms` (`TermID`, `PaymentTerms`, `WarrantyTerms`, `DeliveryTerms`, `OtherTerms`, `ShippingCharges`, `OtherCharges`) VALUES
(4, 'payment', 'warranty', 'delivery', '', '0.00', '0.00'),
(5, 'ABC', 'DEF', 'GHI', '', '0.00', '0.00'),
(6, 'ABC', 'ABC', 'Test Report Required.', 'NA', '0.00', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `DivisionCode` int(11) DEFAULT NULL,
  `Description` varchar(800) NOT NULL,
  `LOANo` varchar(200) DEFAULT NULL,
  `LOADate` date DEFAULT NULL,
  `CompletionDate` date DEFAULT NULL,
  `BGAmount` decimal(9,2) NOT NULL,
  `BGDate` date DEFAULT NULL,
  `Warranty` int(11) NOT NULL,
  `OrderingAuth` varchar(200) DEFAULT NULL,
  `BillingAuth` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `DivisionCode`, `Description`, `LOANo`, `LOADate`, `CompletionDate`, `BGAmount`, `BGDate`, `Warranty`, `OrderingAuth`, `BillingAuth`) VALUES
(10, 1, 'for upgradation of LAN environment and provisioning of Hardware for HMIS implementation of  Health establishment', 'JABALPUR DIVISION-S AND T / JBP-N-TELE-TENDER-2022-5/01342370054602		', '2022-05-18', '2022-11-13', '254297.18', '2022-05-30', 12, 'WCR Jabalpur', 'Jabalpur');

-- --------------------------------------------------------

--
-- Table structure for table `organization`
--

CREATE TABLE `organization` (
  `OrganizationCode` int(11) NOT NULL,
  `Organization` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `organization`
--

INSERT INTO `organization` (`OrganizationCode`, `Organization`) VALUES
(1, 'Org 2'),
(2, 'Org 1'),
(3, 'org 3');

-- --------------------------------------------------------

--
-- Stand-in structure for view `organization_details`
-- (See below for the actual view)
--
CREATE TABLE `organization_details` (
`Organization` varchar(200)
,`OrganizationCode` int(11)
,`DivisionName` varchar(200)
,`DivisionCode` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pending_po`
-- (See below for the actual view)
--
CREATE TABLE `pending_po` (
`Organization` varchar(200)
,`DivisionName` varchar(200)
,`OrderID` int(11)
,`PODate` date
,`PONo` varchar(100)
,`POID` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `po`
--

CREATE TABLE `po` (
  `POID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `ShippingAddress` varchar(500) NOT NULL,
  `PODate` date NOT NULL DEFAULT current_timestamp(),
  `PONo` varchar(100) NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `po`
--

INSERT INTO `po` (`POID`, `OrderID`, `ShippingAddress`, `PODate`, `PONo`, `UserID`) VALUES
(1, 10, 'Cyrus House B44/69 SectorQ Aliganj, Lucknow -24 Phone (0522) 4026916, 2746916', '2022-10-29', '2223CE00001', 1),
(2, 10, 'Cyrus House\nB44/69 Sector Q\nAliganj, Lucknow -24\nPhone (0522) 4026916, 2746916', '2022-10-29', '2', 0),
(3, 10, 'Cyrus House\nB44/69 Sector Q\nAliganj, Lucknow -24\nPhone (0522) 4026916, 2746916', '2022-10-29', '2223CE1', 0),
(4, 10, 'Cyrus House\nB44/69 Sector Q\nAliganj, Lucknow -24\nPhone (0522) 4026916, 2746916', '2022-10-29', '2223CE2', 0),
(5, 10, 'Cyrus House\nB44/69 Sector Q\nAliganj, Lucknow -24\nPhone (0522) 4026916, 2746916', '2022-10-29', '2223CE3', 0),
(6, 10, 'Cyrus House\nB44/69 Sector Q\nAliganj, Lucknow -24\nPhone (0522) 4026916, 2746916', '2022-10-29', '2223CE4', 0),
(7, 10, 'Cyrus House\nB44/69 Sector Q\nAliganj, Lucknow -24\nPhone (0522) 4026916, 2746916', '2022-10-29', '2223CE5', 0),
(8, 10, 'Cyrus House\nB44/69 Sector Q\nAliganj, Lucknow -24\nPhone (0522) 4026916, 2746916', '2022-10-31', '2223CE6', 0);

-- --------------------------------------------------------

--
-- Table structure for table `po_details`
--

CREATE TABLE `po_details` (
  `ID` int(11) NOT NULL,
  `POID` int(11) NOT NULL,
  `OfferID` int(11) NOT NULL,
  `POQty` int(11) NOT NULL,
  `ReadyQty` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `po_details`
--

INSERT INTO `po_details` (`ID`, `POID`, `OfferID`, `POQty`, `ReadyQty`) VALUES
(7, 7, 2, 100, 30),
(8, 8, 3, 100, 0);

-- --------------------------------------------------------

--
-- Table structure for table `site`
--

CREATE TABLE `site` (
  `SiteCode` int(11) NOT NULL,
  `DivisionCode` int(11) NOT NULL,
  `SiteName` varchar(200) NOT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `Consignee` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `site`
--

INSERT INTO `site` (`SiteCode`, `DivisionCode`, `SiteName`, `Address`, `Consignee`) VALUES
(1, 1, 'Site 1', 'ABC', 'aaa'),
(8, 1, 'Site 2', 'abc', 'ffgg'),
(9, 1, 'site 3', 'ABC', 'DDD');

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
  `SurveyDate` date NOT NULL DEFAULT current_timestamp(),
  `Status` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sitesurvey`
--

INSERT INTO `sitesurvey` (`SurveyID`, `OrderID`, `SiteCode`, `MaterialID`, `Qty`, `SurveyDate`, `Status`) VALUES
(1, 10, 1, 7, 100, '2022-10-31', 1),
(3, 10, 1, 6, 1, '2022-10-31', 1),
(5, 10, 1, 5, 200, '2022-10-31', 1),
(6, 10, 1, 4, 2000, '2022-10-31', 1);

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
  `Unit` varchar(15) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `EmployeeCode` int(11) NOT NULL,
  `AssignDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `StateCode` int(11) NOT NULL,
  `StateName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tempoffer`
--

CREATE TABLE `tempoffer` (
  `ID` int(11) NOT NULL,
  `MaterialID` int(11) NOT NULL,
  `ItemName` varchar(200) NOT NULL,
  `Rate` decimal(12,2) NOT NULL,
  `Qty` int(11) NOT NULL,
  `Inspection` varchar(100) NOT NULL,
  `VendorID` int(11) NOT NULL,
  `GST` decimal(9,2) NOT NULL,
  `ModalNo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tempoffer`
--

INSERT INTO `tempoffer` (`ID`, `MaterialID`, `ItemName`, `Rate`, `Qty`, `Inspection`, `VendorID`, `GST`, `ModalNo`) VALUES
(6, 7, 'Moda 1', '2000.00', 1, 'Inspection at OEM', 16, '0.00', '');

-- --------------------------------------------------------

--
-- Table structure for table `temprequirement`
--

CREATE TABLE `temprequirement` (
  `ID` int(11) NOT NULL,
  `OrderID` int(11) DEFAULT NULL,
  `SrNo` varchar(50) DEFAULT NULL,
  `MaterialName` varchar(500) DEFAULT NULL,
  `Qty` int(11) DEFAULT NULL,
  `Unit` varchar(50) DEFAULT NULL,
  `Rate` decimal(9,2) DEFAULT 0.00,
  `InspectingAuth` varchar(200) DEFAULT NULL,
  `LabourWork` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `ID` int(11) NOT NULL,
  `Unit` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`ID`, `Unit`) VALUES
(1, 'm'),
(2, 'Kg');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `VendorID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `VendorName` varchar(250) DEFAULT NULL,
  `Address` varchar(150) DEFAULT NULL,
  `GSTNo` varchar(20) DEFAULT NULL,
  `Contact` varchar(13) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`VendorID`, `OrderID`, `VendorName`, `Address`, `GSTNo`, `Contact`, `Email`) VALUES
(20, 10, 'Docket Care System', 'Paper Mill Road, Nishatganj Lucknow', '09AABFD990P1Z1', '+919415422135', 'suryavanshianantsingh@gmail.com'),
(21, 10, 'Vendor 2', 'Lucknow', '09AABFD990P1Z2', '+918418826770', 'suryavanshianantsingh@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_details`
--

CREATE TABLE `vendor_details` (
  `ID` int(11) NOT NULL,
  `MaterialID` int(11) NOT NULL,
  `VendorID` int(11) NOT NULL,
  `Finalized` tinyint(4) NOT NULL DEFAULT 0,
  `FinalizedDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vendor_details`
--

INSERT INTO `vendor_details` (`ID`, `MaterialID`, `VendorID`, `Finalized`, `FinalizedDate`) VALUES
(14, 5, 20, 0, NULL),
(15, 4, 21, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `worktype`
--

CREATE TABLE `worktype` (
  `WorkTypeID` int(11) NOT NULL,
  `Work` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `worktype`
--

INSERT INTO `worktype` (`WorkTypeID`, `Work`) VALUES
(1, 'PF Cutting'),
(2, 'PF Refilling'),
(3, 'Excavation of Cable Trench in Soft Soil'),
(4, 'Excavation of Cable Trench in Hard Soil'),
(5, 'Soft Soil Refilling'),
(6, 'Hard Soil Refilling'),
(7, 'OFC Wiring'),
(8, 'Cat-06 Wiring'),
(9, 'Power Cable Wiring'),
(10, 'Track Crossing'),
(11, 'Installation of Camera'),
(12, 'Installation of Server'),
(13, 'Installation of Work Station'),
(14, 'LED Installation'),
(15, 'Installation of Field Switch'),
(16, 'Installation of Control Room Switch'),
(17, 'Fiber Splicing'),
(18, 'Rack Installation'),
(19, 'Pole Foundation & Erection'),
(20, 'Installation of Video Analytic Software'),
(21, 'Installation of Video Managment Software'),
(22, 'Installation of Face Recognition Software'),
(23, 'Installation of UPS'),
(24, 'Installation of NAS'),
(25, 'Installation of LIU/FMS'),
(26, 'Installation off Server Room Rack'),
(27, 'Installation of Earthing');

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
  `Unit` varchar(20) NOT NULL,
  `WorkDate` date DEFAULT NULL,
  `VerificationRemark` varchar(300) DEFAULT NULL,
  `VerificationByID` int(11) NOT NULL,
  `VerificationDate` date DEFAULT NULL,
  `Accepted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure for view `organization_details`
--
DROP TABLE IF EXISTS `organization_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `organization_details`  AS SELECT `organization`.`Organization` AS `Organization`, `organization`.`OrganizationCode` AS `OrganizationCode`, `division`.`DivisionName` AS `DivisionName`, `division`.`DivisionCode` AS `DivisionCode` FROM (`organization` join `division` on(`organization`.`OrganizationCode` = `division`.`OrganizationCode`))  ;

-- --------------------------------------------------------

--
-- Structure for view `pending_po`
--
DROP TABLE IF EXISTS `pending_po`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pending_po`  AS SELECT `organization_details`.`Organization` AS `Organization`, `organization_details`.`DivisionName` AS `DivisionName`, `orders`.`OrderID` AS `OrderID`, `po`.`PODate` AS `PODate`, `po`.`PONo` AS `PONo`, `po`.`POID` AS `POID` FROM (((`po` join `orders` on(`po`.`OrderID` = `orders`.`OrderID`)) join `organization_details` on(`orders`.`DivisionCode` = `organization_details`.`DivisionCode`)) join `po_details` on(`po`.`POID` = `po_details`.`POID`)) WHERE `po_details`.`POQty` - `po_details`.`ReadyQty` > 00  ;

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
-- Indexes for table `designation`
--
ALTER TABLE `designation`
  ADD PRIMARY KEY (`DesignationID`);

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
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`EmployeeCode`);

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
  ADD PRIMARY KEY (`TermID`);

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
-- Indexes for table `po_details`
--
ALTER TABLE `po_details`
  ADD PRIMARY KEY (`ID`);

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
-- Indexes for table `tempoffer`
--
ALTER TABLE `tempoffer`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `temprequirement`
--
ALTER TABLE `temprequirement`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`VendorID`);

--
-- Indexes for table `vendor_details`
--
ALTER TABLE `vendor_details`
  ADD PRIMARY KEY (`ID`);

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `demand_details`
--
ALTER TABLE `demand_details`
  MODIFY `MaterialID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `designation`
--
ALTER TABLE `designation`
  MODIFY `DesignationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `EmployeeCode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `MovementID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `OfferID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `offer terms`
--
ALTER TABLE `offer terms`
  MODIFY `TermID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `organization`
--
ALTER TABLE `organization`
  MODIFY `OrganizationCode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `po`
--
ALTER TABLE `po`
  MODIFY `POID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `po_details`
--
ALTER TABLE `po_details`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `site`
--
ALTER TABLE `site`
  MODIFY `SiteCode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sitesurvey`
--
ALTER TABLE `sitesurvey`
  MODIFY `SurveyID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sitework`
--
ALTER TABLE `sitework`
  MODIFY `WorkID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tempoffer`
--
ALTER TABLE `tempoffer`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `temprequirement`
--
ALTER TABLE `temprequirement`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `VendorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `vendor_details`
--
ALTER TABLE `vendor_details`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `worktype`
--
ALTER TABLE `worktype`
  MODIFY `WorkTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `work verification`
--
ALTER TABLE `work verification`
  MODIFY `VerificationID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
