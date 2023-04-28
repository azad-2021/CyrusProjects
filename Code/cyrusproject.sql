-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 28, 2023 at 05:51 PM
-- Server version: 8.0.27
-- PHP Version: 7.4.3-4ubuntu2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
-- Table structure for table `amcs`
--

CREATE TABLE `amcs` (
  `AMCID` int NOT NULL,
  `SiteCode` int NOT NULL,
  `Description` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `GenDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ExpectedCompletion` date DEFAULT NULL,
  `AssignDate` date DEFAULT NULL,
  `EmployeeCode` int NOT NULL,
  `Attended` tinyint NOT NULL DEFAULT '0',
  `AttendDate` date DEFAULT NULL,
  `ExecutiveRemark` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `VerificationRemark` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EntryDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `amcs_posting`
--

CREATE TABLE `amcs_posting` (
  `ID` int NOT NULL,
  `DivisionCode` int NOT NULL,
  `GadgetID` int NOT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `Amount` decimal(9,2) NOT NULL,
  `PostedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Gen` tinyint NOT NULL DEFAULT '0',
  `GenDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assignlogs`
--

CREATE TABLE `assignlogs` (
  `logID` int NOT NULL,
  `WorkType` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `ID` int NOT NULL,
  `AssignedBy` int NOT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `billbook`
--

CREATE TABLE `billbook` (
  `BillID` int NOT NULL,
  `OrderID` int NOT NULL,
  `DivisionCode` int NOT NULL,
  `GSTNo` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `BillDate` date DEFAULT NULL,
  `SGST` decimal(9,2) NOT NULL,
  `CGST` decimal(9,2) NOT NULL,
  `IGST` decimal(9,2) NOT NULL,
  `TaxableValue` decimal(12,2) NOT NULL,
  `TotalBilledValue` decimal(12,2) NOT NULL,
  `InvoiceNo` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ReceivedAmount` decimal(12,2) NOT NULL,
  `ReceivedDate` date DEFAULT NULL,
  `Cancelled` int NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `billdetail`
--

CREATE TABLE `billdetail` (
  `ID` int NOT NULL,
  `InvoiceNo` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MaterialID` int NOT NULL,
  `Rate` decimal(12,2) NOT NULL,
  `Qty` decimal(9,3) NOT NULL,
  `BilledPercent` decimal(9,2) NOT NULL,
  `Discount` decimal(9,2) NOT NULL,
  `HSNCode` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `GSTRate` decimal(9,2) NOT NULL,
  `Amount` decimal(12,2) NOT NULL,
  `AValue` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `billingtype`
--

CREATE TABLE `billingtype` (
  `ID` int NOT NULL,
  `Type` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `billingtype`
--

INSERT INTO `billingtype` (`ID`, `Type`) VALUES
(1, 'Supply only'),
(3, 'Supply and installation'),
(4, 'Labour Work'),
(5, 'AMC');

-- --------------------------------------------------------

--
-- Table structure for table `challan detail`
--

CREATE TABLE `challan detail` (
  `ID` int NOT NULL,
  `MaterialID` int NOT NULL,
  `ChallanNo` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ReadyQty` decimal(9,3) NOT NULL,
  `Rate` decimal(9,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `ComplaintID` int NOT NULL,
  `SiteCode` int NOT NULL,
  `Description` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `DateofInformation` date DEFAULT NULL,
  `ExpectedCompletion` date DEFAULT NULL,
  `AssignDate` date DEFAULT NULL,
  `EmployeeCode` int DEFAULT NULL,
  `ReceivedBy` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MadeBy` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Attended` tinyint NOT NULL DEFAULT '0',
  `AttendDate` date DEFAULT NULL,
  `ExecutiveRemark` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `VerificationRemark` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EntryDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deliverychallan`
--

CREATE TABLE `deliverychallan` (
  `ChallanID` int NOT NULL,
  `OrderID` int NOT NULL,
  `PONo` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MovementID` int DEFAULT NULL,
  `ShippingAddress` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `StateCode` int NOT NULL,
  `SiteCode` int DEFAULT NULL,
  `EmployeeCode` int DEFAULT NULL,
  `ChallanDate` date DEFAULT NULL,
  `Delivered` tinyint NOT NULL DEFAULT '0',
  `DeliveryDate` date DEFAULT NULL,
  `ChallanNo` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cancelled` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `demands`
--

CREATE TABLE `demands` (
  `ID` int NOT NULL,
  `OrderID` int NOT NULL,
  `OrderDate` date DEFAULT NULL,
  `DemandDate` date DEFAULT NULL,
  `DemandBy` int DEFAULT NULL,
  `ConfirmedBy` int DEFAULT NULL,
  `ConfirmationDate` date DEFAULT NULL,
  `StatusID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `demands`
--

INSERT INTO `demands` (`ID`, `OrderID`, `OrderDate`, `DemandDate`, `DemandBy`, `ConfirmedBy`, `ConfirmationDate`, `StatusID`) VALUES
(1, 1, '2023-03-28', '2023-03-28', 1, NULL, NULL, 2),
(3, 3, '2023-03-28', '2023-04-01', 1, NULL, NULL, 2),
(4, 2, '2023-03-28', '2023-03-28', 1, NULL, NULL, 2),
(7, 4, '2023-03-29', '2023-03-31', 1, NULL, NULL, 2),
(8, 5, '2023-03-31', '2023-04-18', 1, NULL, NULL, 2),
(9, 6, '2023-04-03', '2023-04-08', 1, NULL, NULL, 2),
(10, 7, '2023-04-04', '2023-04-04', 1, NULL, NULL, 2),
(11, 8, '2023-04-06', '2023-04-08', 1, NULL, NULL, 2),
(12, 9, '2023-04-06', '2023-04-08', 1, NULL, NULL, 2),
(13, 10, '2023-04-11', '2023-04-15', 1, NULL, NULL, 2),
(14, 13, '2023-04-12', NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `demand_details`
--

CREATE TABLE `demand_details` (
  `MaterialID` int NOT NULL,
  `OrderID` int NOT NULL,
  `MaterialName` varchar(1200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SrNo` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Qty` decimal(9,3) DEFAULT NULL,
  `Unit` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `Rate` decimal(9,2) NOT NULL,
  `InspectingAuth` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `BillingType` int NOT NULL DEFAULT '0',
  `DemandDate` date NOT NULL,
  `Status` int NOT NULL DEFAULT '1',
  `OnSite` tinyint NOT NULL DEFAULT '0',
  `Issued` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `demand_details`
--

INSERT INTO `demand_details` (`MaterialID`, `OrderID`, `MaterialName`, `SrNo`, `Qty`, `Unit`, `Rate`, `InspectingAuth`, `BillingType`, `DemandDate`, `Status`, `OnSite`, `Issued`) VALUES
(1, 1, 'Supply of optical fiber cable as per RDSO specification IRS:TC 55 or2006 Rev.1 Amnd.1.1 with latest amnd. ', ' A- 2', '2000.000', 'meter', '80.07', 'Consignee', 1, '2023-03-28', 1, 0, 0),
(2, 1, 'Supply of 6U, 19\" covered Rack with (1) front side transparent door with lock arrangement (2) cable organizers (3) provision of one no. of power supply( each consists of 6 nos. x 15A or15A multipin sockets with ON orOFF switch and fuse arrangement) strip HCL or Rittel or APW or President or similar.', 'A-3', '20.000', 'Number', '3538.82', 'Consignee', 1, '2023-03-28', 1, 0, 0),
(3, 1, 'Supply of SC-LC orLC-PC orSC-SC orLCLC fiber patch cord -10 meter length as required by optical interface and FMS used in this work Make TYCO or MOLEX or AMP or3M or PANDUIT or SYSTIMAX orKRONE or Similar. ', 'A-4', '220.000', 'Number', '2011.63', 'Consignee', 1, '2023-03-28', 1, 0, 0),
(4, 1, 'Supply of 1 inch PVC conduit pipe Make Anchour orKrone orSrinath or similar. ', 'A-5', '500.000', 'meter', '12.14', 'Consignee', 1, '2023-03-28', 1, 0, 0),
(5, 1, 'Supply of 12 Fiber unarmoured single mode Optical Fiber Cable Make Finolex or KEC or sterlite or AMP or Molex or similar.', 'A-9', '2000.000', 'meter', '16.76', 'Consignee', 1, '2023-03-28', 1, 0, 0),
(6, 1, 'Supply of PVC insulated flexible 3 core x 2.5 sq.mm multi strand power cable to meet specification of IS 694:1190 re-affirmed 1995 or latest Make Finolex  orPolycab  orAnchor  orHavells or similar. ', 'A-10', '900.000', 'meter', '85.70', 'Consignee', 1, '2023-03-28', 1, 0, 0),
(7, 1, 'Supply of UTP indoor cable CAT 6 ,UTP cable CAT-6 to support 10 or100 or1000 Mbps .The category 6 cable should consists of 4 pair of solid insulated copper 23 AWG (0.57mm) pairs separated with a central slit film filler, insulation -polyethylene Make D-link, Molex, Dax, Schncider or similar.', 'A-1', '10000.000', 'meter', '29.28', 'Consignee', 1, '2023-03-28', 1, 0, 0),
(8, 1, 'Supply, installation, testing & commissioning of Layer-3 manageable switch 24 ports of 10 or100 or1000 Mbps with minimum 4 numbers of 10G base X, SM SFP + port, MAC addresses 48K, Minimum 200 Gbps switching capacity, with redundant power supply, multiple VLAN registration Protocol (MVRP) Make - Alcatel Lucent orCisco orHP orRUCKUS or equivalent.', 'B-1', '1.000', 'Number', '173900.72', 'Consignee', 3, '2023-03-28', 1, 0, 0),
(9, 1, 'Supply, Installation, Testing & commissioning of 24 port Ethernet PoE switch providing of 24- 10 or100 or1000 Base -T ethernet ports and 4 SFP slots for high access capacity.1-24 ports supports PoE+ (30W) power supply and PoE output full power upto 370 W. Providing DC power and data transmission for AP .IP phones and IP camera through category 5 twisted pair. Providing safer protection system. Excellent QoS strategy. Make - Alcatel Lucent orCISCO orHP orRUCKUS or Equivalent', 'B-2', '39.000', 'Number', '155919.98', 'Consignee', 3, '2023-03-28', 1, 0, 0),
(10, 1, 'Supply , Installation, testing and commissioning of 10 ports Gigabit switch with PoE ports -08 Nos and SFP ports -02 Nos. of 10 or100 or1000 base T Ethernet port 1-8 supports PoE +(30 W) power supply and PoE output full power up to 115 W providing DC power and data transmission for AP,IP phone and IP cameras through category 5 twisted pair. Supply item . Make Alcatel lucent orCisco orHP orRUCKUS or Equivalent.', 'B- 3', '8.000', 'Number', '11426.41', 'Consignee', 3, '2023-03-28', 1, 0, 0),
(11, 1, 'Supply and installation of covered 19\" (42U) Racks of size 2200mm X 600mm X 600mm (HCU Vero President orRittal orPuncom make or similar) complete with all fittings including DC Fans(4Bv)-2Nos.and AC power distribution panel ( horizontal fitting} with Power sockets and fuse protection (Minimum 6 Nos.of 230V-15Ai5A combined} and other accessories. The body sho Id be of high quality cold rolled steel, with wheel and caster arrangement, vented front doo borders and rear doors for ventilation and reliable operation.', 'B- 4', '3.000', 'Number', '35230.94', 'Consignee', 3, '2023-03-28', 1, 0, 0),
(12, 1, 'Supply and installation of GLC-LHSMD SFP transceiver for above 10 ports and 24 ports switches. Make - Alcatel lucent orCISCO orHP orRUCKUS or equivalent.', 'B-5', '54.000', 'Number', '25413.83', 'Consignee', 3, '2023-03-28', 1, 0, 0),
(13, 1, 'Laying of OFC orPower cable through HDPE pipe orcasing capping orfall ceiling with laying orfixing of HDPE pipe orcasing capping for networking system and for connecting orinferacing various component (cutting of masonry wall at the entry of room, repairing of masonary wall, cement plastering at site requirement are to be supplied by contractor) and system integration. All materials for jointing and termination of power cable orCAT-6 cable as per site requirement are to be supplied by contractor', 'B- 6', '7500.000', 'meter', '24.89', 'Consignee', 4, '2023-03-28', 1, 0, 0),
(14, 1, 'Supply and fixing of different size PVC casing and capping orPipe in Grey or Cream colour slotted channel through confirming to IS standard as required by Railways at size 25@47&47(47@50mm . By fixing orclamping at a regular interval to the wall for indoor wiring Make Sudhaker  orModi  orSun  orFinolex or orAKG or similar. ', 'B- 7', '7100.000', 'meter', '46.41', 'Consignee', 3, '2023-03-28', 1, 0, 0),
(15, 1, 'Installation, Supply of 19 1U size rack mountable 12 F OFC LIU loaded with SC-SC connectors complaints to meet industrial standard .This includes splicing and termination of 12F cable as per Railway requirements and fixing in rack orwall mounted as directed by Railway Engineer.(OTDR reading to be taken and submitted ) Make Molex or3M orAMP orKRONE or similar.', 'B- 8', '32.000', 'Number', '5952.06', 'Consignee', 3, '2023-03-28', 1, 0, 0),
(16, 1, 'Supply & installation of 3 mtrs length CAT6 UTP patch cord both end RJ 45 crimped .', 'B- 9', '200.000', 'Number', '184.00', 'Consignee', 3, '2023-03-28', 1, 0, 0),
(17, 1, 'Horizontal drilling at an approximately depth of formation level of the earth including insertion of HDPE orWDC pipe with its coupling and insertion of different size of cable etc. as per site requirement.', 'B- 12', '500.000', 'meter', '939.33', 'Consignee', 4, '2023-03-28', 1, 0, 0),
(18, 1, 'Installation and supply of 10 KVA on line UPS single phase Make APC  orNumeric  oremerson or similar ,19 rack mountable type with 1 hrs. backup along with suitable AH capacity battery.', 'B- 13', '2.000', 'Number', '199000.00', 'Consignee', 3, '2023-03-28', 1, 0, 0),
(19, 1, 'Supply and installation of AIO PC for NMS support', 'B- 14', '1.000', 'Number', '54800.00', 'Consignee', 3, '2023-03-28', 1, 0, 0),
(20, 1, 'Supply and installation ACX 2200 routers for central hospital Jabalpur', 'B- 15', '2.000', 'Number', '185300.00', 'Consignee', 3, '2023-03-28', 1, 0, 0),
(21, 1, 'Excavation of trench as per cable route plan, 1.2 mtr deep, 300mm wide at the bottom along main line in normal soil, This work includes covering of cable laid in trenches by loose soil for a layer of 50 mm thickness approximately before covering by stone orbricks , clearing of route, bushes etc and refilling of the trench by excavated soil and ramming after laying of the required quantity of cables as per instructions of Engineer at site. If it is not possible to reach the required depth at any location, then the contractor shall obtain prior approval of Engineer-incharge before commencement of cable laying process and only then shall the proportionate payment be made to the contractor.', 'B-10', '5.450', 'Km', '84560.11', 'Consignee', 4, '2023-03-28', 1, 0, 0),
(22, 1, 'Laying of signalling orPower orTelecom cable of various cores orsizes in trenches', 'B- 11', '5.450', 'Km', '9216.98', 'Consignee', 4, '2023-03-28', 1, 0, 0),
(23, 2, 'Supply and testing of Unify Digital phone end point for PABX system. Make orModel- Unify Openstage 15T or similar', 'A- 1', '12.000', 'Number', '9630.00', 'Consignee', 3, '2023-03-29', 1, 0, 0),
(24, 2, 'Excavation of cable trench as per cable route plan, 1.2 Meter deep and of 0.3 Meter to 0.6 Meter wide at bottom as per RDSO sketch No. SDO orCABLE LAYING or003, issued vide RDSO document no. RDSO orSI orG or2010 Version 1.1 dated 04.02.2014 or latest, alongside the track in normal soil orstrata [including soft rock], conforming to distances as per cable route plan and refilling and ramming of loose soil. This work includes clearing of route from bushes etc, covering of cable laid in trench by loose soil for a layer of 50 mm thickness approximately before covering by bricks. The work shall be done as per the extant practice on North Central Railway and instructions of Railway Engineer at site. In case the full depth is not available, there shall be no proportionate payment and after the approval of minimum JAG officer, the concreting shall be done as per the RDSO drawing no.SDO orCable laying or008, issued vide RDSO document no. RDSO orSI orG or2010 Version 1.1 dated 04.02.2014 or latest.', 'A-2', '1000.000', 'meter', '64.60', 'Consignee', 4, '2023-03-29', 1, 0, 0),
(25, 2, 'Cutting of all types of platforms orroad crossing and trenching and excavation to a width and depth of 300 mm x 300 mm, laying of DWC orHDPE orGI pipe in the trench and refilling and concreting it afterwards as per original condition. In hard rocky ground area , cables will be laid normally on layer of soft earth of 0.05 meter thickness previously deposited at bottom of the trench . The cutting to be filled and finished with cement orconcrete, as per the RDSO drawing no.SDO orCable laying or008, issued vide RDSO document no. RDSO orSI orG or2010 Version 1.1 dated 04.02.2014 or latest.', 'A-3', '500.000', 'meter', '158.88', 'Consignee', 4, '2023-03-29', 1, 0, 0),
(26, 2, '\"Horizontal direction drilling (HDD) orTrenchless digging ormachine drilling with-out damage to surface road  ortrack for laying orinsertion of HDPE orGI orDWC pipe. The bore shall be done at the depth of minimum 1400 mm from the ground level. The ground level shall be considered ignoring the bank height of the bank of the road. Note:- DWC orHDPE orGI Pipe Supply is not covered under this item. Contactor shall provide all material required for work and adequate nos. of labours for proper laying of cables into the bore. Cable shall be laid cautiously so that it should not get damage due to rough handling & pressure on cable. Payment of boring shall be made only after DWC orHDPE orGI pipe is laid in the bore.', 'A-4', '200.000', 'meter', '616.35', 'Consignee', 4, '2023-03-29', 1, 0, 0),
(27, 2, 'Supply and Installation of Fibre distribution management system as per RDSO spec. no. RDSO orSPN orTC or37 or2020 Revision 4.0 or latest. It includes the supply of 19 inch 42U rack with mounting arrangement. It will also include all installation material, splicing, termination, testing of all 2 x 24 fibres. ', 'A-5', '4.000', 'Number', '77346.06', 'Consignee', 3, '2023-03-29', 1, 0, 0),
(28, 2, 'Supply of OFC patch cord or jumper cable, 10 meter long, with [1] FC orPC connectors on both sides or [2] One end FC orPC connector and other end compatible to work with STM-1.', 'A-6', '200.000', 'Number', '1784.18', 'Consignee', 1, '2023-03-29', 1, 0, 0),
(29, 2, 'Supply of FC orPC type connectors of 5 or10 or20 dB and multiple of 5 dB up to 20 dB. ', 'A-7', '85.000', 'Number', '257.94', 'Consignee', 1, '2023-03-29', 1, 0, 0),
(30, 2, 'Supply and Installation of RJ-45 patch cord, seven feet long, of reputed make like Molex or similar, with 02 no. of RJ-45 connectors for every patch cord.', 'A-8', '445.000', 'Number', '173.98', 'Consignee', 3, '2023-03-29', 1, 0, 0),
(31, 2, 'Supply of UTP CAT-6 cable of reputed make Siemen or Systemax  or D-Link or Tyco or Krone or AMP or similar.', 'A-9', '1000.000', 'meter', '22.36', 'Consignee', 1, '2023-03-29', 1, 0, 0),
(32, 2, 'Laying of UTP orSTP CAT-6 cable orpower cable in PVC casing capping of appropriate size. The work also includes supply and fixing of casing and capping, fixing and connection of patch panel, fixing of CAT-6 cable with RJ 45 connectors. Work to be done as per instructions of site incharge. ', 'A-10', '1000.000', 'meter', '45.14', 'Consignee', 4, '2023-03-29', 1, 0, 0),
(33, 2, 'Supply of 06 Core Optical Fiber Cable Armoured Single Mode. Make : D-Link or similar of reputed make.', 'A-11', '8000.000', 'meter', '26.08', 'Consignee', 1, '2023-03-29', 1, 0, 0),
(34, 2, 'Laying of Data cable or Communication cable or Power cable etc. in PVC conduit pipe with all fiitings and accessories [As per site requirement].', 'A-12', '8000.000', 'meter', '18.71', 'Consignee', 4, '2023-03-29', 1, 0, 0),
(35, 2, 'Supply and installation [splicing of fiber] of Rack Mount LIU 12 Core Loaded with SC Adaptors. Make : D-Link or similar of reputed make.', 'A-13', '50.000', 'Number', '6394.13', 'Consignee', 3, '2023-03-29', 1, 0, 0),
(36, 2, 'Supply of permanently lubricated HDPE duct, 40 mm outer dia, as per RDSO spec. No. RDSO orSPN orTC or45 or2013 Rev.2 Amndt.2 or latest, along with all accessories like end caps, collars, bends, couplers etc.', 'A-14', '8.000', 'Km', '76811.42', 'RITES', 1, '2023-03-29', 1, 0, 0),
(37, 2, 'Laying of HDPE duct as per the approved cable route plan in the exavated trenches or other protected works or RCC channel etc. including all accessories like end caps, collars, bends, couplers etc. The ends of the duct to be sealed with end plugs till OFC blowing is done. Important: The laying of OFC cable independently or along with Quad cable or PIJF cable in the same trench shall be governed by the RDSO drawings no. RDSO orTCDO orCOP-6[a] and RDSO orTCDO orCOP-8 [a] respectively, issued vide Chapter-XIII of the Telecomm Manual.', 'A-15', '8.000', 'Km', '8092.25', 'Consignee', 4, '2023-03-29', 1, 0, 0),
(38, 2, 'Supply of Cable fault locator for metallic S&T cables of reputed make Aplab or Stanley or 3M etc. Item to be supplied after successful demonstration and approval of Railways.', 'A-16', '1.000', 'Number', '301578.02', 'Consignee', 1, '2023-03-29', 1, 0, 0),
(39, 2, 'Supply of 8 port Gigabit Lite Managed PoE Layer 2 Switch supports 8 nos 10 or 100 or 1000 BASE-T ports, along with 2 Gigabit SFP ports, green-saving technologies, make model DG-GS1510HPL DIGISOL  or CISCO or JUNIPER or superior. Technical specification attached. ', 'A-17', '35.000', 'Number', '18807.45', 'RITES', 1, '2023-03-29', 1, 0, 0),
(40, 2, 'Supply, installation, testing and commissioning of SFP 1 G to suit and match Gigabit switch.', 'A-18', '70.000', 'Number', '2718.70', 'Consignee', 3, '2023-03-29', 1, 0, 0),
(41, 2, 'Supply, Installation, testing and commissioning of 24 port Layer-2 Managed Gigabit Ethernet Switch with 02 Nos. 1 Gigabit Ports with SFP module. Make : Juniper or CISCO or ARUBA or similar of reputed make. Technical specification attached.', 'A-19', '8.000', 'Number', '68945.68', 'RITES', 3, '2023-03-29', 1, 0, 0),
(42, 2, 'Supply of 2 Mbps Router, 2 LAN or 4 WAN port, 230V AC operated, as per RDSO spec. no. RDSO or SPN or TC or 84 or 2008 Rev. 0 or latest, along with connecting cables, connectors etc. for connecting to the ethernet devices, of reputed make like Cisco or Dlink or better.', 'A-20', '6.000', 'Number', '83565.68', 'RITES', 1, '2023-03-29', 1, 0, 0),
(43, 2, 'Supply, installation, testing and commissioning of Router Cisco ISR 4451-X or latest or similar 1-2 G system throughput as per technical specification.', 'A-21', '1.000', 'Number', '419456.02', 'Consignee', 3, '2023-03-29', 1, 0, 0),
(44, 2, 'Supply, Installation, testing and commissioning of Layer -3 switch with 24 blank SFP slots and 2 blank SFP slots for uplink with redudent power supply. Make: Juniper or CISCO or similar. Technical specification attached.', 'A-22', '4.000', 'Number', '170693.49', 'RITES', 3, '2023-03-29', 1, 0, 0),
(45, 2, 'Supply and testing of 1.25 G SFP with dual Fiber for maximum distance of 20 KM, 1310 nm, LC connectors. Technical specification attached.', 'A-23', '80.000', 'Number', '1862.11', 'Consignee', 3, '2023-03-29', 1, 0, 0),
(46, 2, 'Supply and testing of 10 G SFP with dual Fiber for maximum distance of 20 KM, 1310 nm, LC connectors. Technical specification attached.', 'A-24', '4.000', 'Number', '7758.80', 'Consignee', 3, '2023-03-29', 1, 0, 0),
(47, 2, 'Supply and testing of 1 G 1000 base TX [Copper]. Technical specification attached.', 'A-25', '8.000', 'Number', '4396.65', 'Consignee', 3, '2023-03-29', 1, 0, 0),
(48, 4, 'Excavation of cable trench in all kinds of soil except hard rocky areas including clearing of roots of trees, rocks, bushes etc. to a depth of 1.0 Mtrs and to a width of 0.3 Mtrs. Laying of cables is not included in this schedule.', 'A-1', '1800.000', 'meter', '34.65', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(49, 4, 'Excavation of trench to a depth of 1 Mtr. for track crossing of cables, laying of DWC or RCC pipes with collar orcoupling, refilling of trench by ramming and consolidating it as per the instructions of Railway representative at site. During excavation of trench it has to be ensured that the excavated soil does not mix with the ballast available. The depth of 1m trench shall be from the bottom of sleepers for track crossings. Laying of cables is not included in this schedule.(Supply of DWC orRCC pipes with couplers or collars is not included in this schedule).', 'A-2', '35.000', 'meter', '208.35', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(50, 4, 'Excavation of trench to a depth of 1 Mtr. for road crossing of cables, laying of DWC or RCC pipes with collar or coupling, refilling of trench by ramming and consolidating it and resurfacing it to the original position. Laying of cables is not included in this schedule.(Supply of DWC orRCC pipes with couplers or collars is not included in this schedule).', 'A-3', '20.000', 'meter', '270.83', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(51, 4, 'Provision of GI pipes-(50 or100mm dia) for cable laying with offset at both ends and with couplings over girder bridges by fixing on suitable MS Clamps at an interval of 2 Mtrs. The ends of the pipes shall be closed with brick masonry work so that no cable is exposed, The work shall be carried out as per the instructions of Railway representative at site. Supply of GI pipes with couplings and laying of cables is not included in this schedule.[MS angles, flats, bolts and nuts for manufacturing fixing clamps, bricks, river sand , cement and all other miscellaneous required for the work shall be supplied by the Contractor].', 'A-4', '105.000', 'meter', '215.25', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(52, 4, 'Laying of signaling orpower ortelecommunication cables as per cable plan in cable trenches, masonry ducts, RCC Pipes, DWC pipes, GI Pipes etc. (Supply of cables is not included in this schedule).', 'A-5', '1750.000', 'meter', '9.83', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(53, 4, 'Digging of pit to a depth of 800mm of size 300mmX300mm, casting of concrete foundation of size 300mmX300mmX300mm and Placing of RCC cable markers on top of the foundation and refilling the pit and consolidating it by ramming. The cable markers shall be provided at an interval of 20 Mtrs. within station limits and 50 Mtrs. outside station limits throughout the cable route, diversions and also at every track orroad orcrossing.', 'A-6', '70.000', 'Number', '121.43', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(54, 4, 'Refilling of cable trench 1m depth by 0.3m width throughout, with earth after laying of cables, and consolidating the trench by ramming and leveling.', 'A-7', '2050.000', 'meter', '8.33', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(55, 4, 'Supply of Double walled corrugated pipe - 103.5mm inner dia & 120mm outer dia conforming to specification No. IS 14930(Part 2): 2001 with one coupler for every 6m of pipe as specified in Vol.II of the Tender document.', 'A-8', '55.000', 'meter', '263.20', 'Consignee', 1, '2023-03-31', 1, 0, 0),
(56, 4, 'Supply of RCC cable markers as per drawing No.CSTE orCN orOFC or1. The lettering on the cable marker shall be \"SIG\"  or \"TELE\"  or \"OFC\" as per the instructions of Railway representative at site.', 'A-9', '70.000', 'Number', '166.29', 'Consignee', 1, '2023-03-31', 1, 0, 0),
(57, 4, 'Supply of GI pipes - 50mm dia -3.65mm thick as specified in Vol.II of the Tender document.', 'A-10', '105.000', 'meter', '343.20', 'Consignee', 1, '2023-03-31', 1, 0, 0),
(58, 4, 'Supply of Full HD Bullet Type IP Colour camera as per RDSO spec. No:RDSO orSPN orTC or65 or2021 Rev.6.0 or latest.', 'B-1', '119.000', 'Number', '11182.64', 'RDSO', 1, '2023-03-31', 1, 0, 0),
(59, 4, 'Installation, Testing & Commissioning of Full HD Bullet Type IP Colour camera along with, Mount. All the accessories and fixing materials including mount required for this installation are to be supplied by contractor within the same cost.', 'B-2', '119.000', 'Number', '177.77', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(60, 4, 'Supply of Full HD P orT orZ (Pan orTilt orZoom) IP Colour Camera as per RDSO spec.No: RDSO orSPN orTC or65 or2021 Rev.6.0 or latest .', 'B-3', '44.000', 'Number', '35977.64', 'RDSO', 1, '2023-03-31', 1, 0, 0),
(61, 4, 'Installation, Testing & Commissioning of Full HD P orT orZ (Pan orTilt orZoom) IP Colour Camera with ceiling mounting kit. All the accessories and fixing materials required for this installation are to be supplied by contractor within the same cost.', 'B-4', '44.000', 'Number', '571.88', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(62, 4, 'Supply of 4K UHD Bullet Type IP Colour camera as per RDSO spec. No: RDSO orSPN orTC or 65 or2021 Rev.6.0 or latest.', 'B-5', '15.000', 'Number', '24358.76', 'RDSO', 1, '2023-03-31', 1, 0, 0),
(63, 4, 'Installation, Testing & Commissioning of 4K UHD Bullet Type IP Colour camera along with Mount. All the accessories and fixing materials including mount required for this installation are to be supplied by contractor within the same cost.', 'B-6', '15.000', 'Number', '387.11', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(64, 4, 'Supply, Installation, Testing and commissioning of Full HD Fixed dome type IP colour camera as per RDSO Spec No. RDSO orSPN orTC or65 or2021 Rev 6.0 or latest along with housing and mount and all accessories required for installation are to be supplied by contractor within the same cost.', 'B-7', '13.000', 'Number', '17464.00', 'RDSO', 3, '2023-03-31', 1, 0, 0),
(65, 4, 'Supply of Fully functional multipurpose Digital keyboard (Joystick) complete with all accessories compatible with PTZ camera as per RDSO spec. No: RDSO orSPN orTC or65 or2021 Rev.6.0 or latest', 'B-8', '5.000', 'Number', '11761.00', 'RDSO', 1, '2023-03-31', 1, 0, 0),
(66, 4, 'Installation, Testing & Commissioning of Digital Keyboard (Joystick)', 'B-9', '5.000', 'Number', '186.90', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(67, 4, 'Supply of Server Hardware for Video Management &Recording and all other required accessories to make the system operational, as per RDSO Specification RDSO orSPN orTC or65 or 2021Rev.6.0 with latest amendment and refer technical specification.', 'B-10', '5.000', 'Number', '266897.40', 'RDSO', 1, '2023-03-31', 1, 0, 0),
(68, 4, 'Installation, Testing & Commissioning of Video Management & recording Server with required accessories as per RDSO Specification RDSO orSPN orTC or 65 or2021 Rev. 6.0 or latest amendment and refer technical specification .', 'B-11', '5.000', 'Number', '5337.95', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(69, 4, 'Supply, Installation, Testing & Commissioning of Video Management Software with License as per RDSO Specification RDSO orSPN orTC or65 or2021 Rev 6.0 or latest amendment(Per camera Licence means Video Management (Viewing) at multiple locations such as Station, RPF Post & Server room by same license) and refer technical specification .', 'B-12', '175.000', 'Number', '891.18', 'RDSO', 3, '2023-03-31', 1, 0, 0),
(70, 4, 'Supply, Installation, Testing & Commissioning of Video Recording Software with License as per RDSO Specification RDSO orSPN orTC or65 or 2021 Rev 6.0 or latest amendment and refer chapter technical spec for VSS (Per camera Licence means Video Recording at multiple locations such as Station, RPF Post & Server room by same license) and refer technical specification.', 'B-13', '175.000', 'Number', '534.10', 'RDSO', 3, '2023-03-31', 1, 0, 0),
(71, 4, 'Supply of Server Hardware for Video Analytics and all other required accessories to make the system operational, as per RDSO Specification RDSO orSPN orTC or65 or2021. Rev 6.0 or latest amendment and refer technical specification .', 'B-14', '5.000', 'Number', '266897.40', 'RDSO', 1, '2023-03-31', 1, 0, 0),
(72, 4, 'Installation, Testing & Commissioning of Server for Video Analytics with required accessories as per RDSO Specification RDSO orSPN orTC or65 or 2021. Rev 6.0 or latest amendment and refer technical specification', 'B-15', '5.000', 'Number', '5337.95', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(73, 4, 'Supply, Installation, Testing & Commissioning of Video Analytics Software with License as per RDSO Specification RDSO orSPN orTC or65 or2021 Rev. 6.0 or latest amendment and refer chapter technical spec for VSS (Per camera License means Video analytic at multiple locations such as Station, RPF Post & Server room by same license) and refer technical specification ', 'B-16', '56.000', 'Number', '8540.72', 'RDSO', 3, '2023-03-31', 1, 0, 0),
(74, 4, 'Supply of Server Hardware for Face recognition and all other required accessories to make the system operational, as per RDSO Specification RDSO orSPN orTC or65 or2021 Rev.6.0 with latest amendment and refer technical specification.', 'B-17', '5.000', 'Number', '266897.40', 'RDSO', 1, '2023-03-31', 1, 0, 0),
(75, 4, 'Installation, Testing & Commissioning of Server for Face recognition with required accessories as per RDSO Specification RDSO orSPN orTC or65 or 2021 Rev.6.0 or latest amendment and refer technical specification.', 'B-18', '5.000', 'Number', '5337.95', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(76, 4, 'Supply, Installation, Testing & Commissioning of Face Recognition Software with License as per RDSO Specification RDSO orSPN orTC or65 or 2021 Rev. 6.0 or latest amendment and refer chapter technical spec for VSS (Per camera License means FRS at RPF Post. By same license, Face Recognition can be possible at multiple locations such as Station & Server room) and refer technical specification.', 'B-19', '52.000', 'Number', '33266.80', 'RDSO', 3, '2023-03-31', 1, 0, 0),
(77, 4, 'Supply of Full HD Large Format Display Monitor(55 inch) with HDMI and DVI ports complete with all accessories and HDMI cables, remote controller as per RDSO spec. No: RDSO orSPN orTC or65  or2021 Rev.6.0 or latest and refer technical specification .', 'B-20', '14.000', 'Number', '53789.00', 'RDSO', 1, '2023-03-31', 1, 0, 0),
(78, 4, 'Installation, Testing & Commissioning of Full HD Large Format Display Monitor (55 inch).All the accessories and fixing materials required for this installation are to be supplied by contractor within the same cost.', 'B-21', '14.000', 'Number', '854.89', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(79, 4, 'Supply of PC Workstation for Viewing cameras in multi screen mode, Monitoring and System management and 4K UHD LED Monitor of 24 inch size including all required licensed softwares(like OS, MS Office, Anti-virus-total 3 years security), multifunction device for documentation , accommodate PC workstation & monitor with all accessories, spike buster(minimum 5 nos. 6A points with fuse), 500VA UPS , Mounting Rack and other required materials as per RDSO spec. No: RDSO orSPN orTC or65 or2021 Rev.6.0 or latest and refer technical specification.', 'B-22', '6.000', 'Number', '222365.36', 'RDSO', 1, '2023-03-31', 1, 0, 0),
(80, 4, 'Installation, Testing & Commissioning of PC Workstation with all accessories vide item No.22 of Sch-B', 'B-23', '6.000', 'Number', '3534.07', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(81, 4, 'Supply of 10 KVA UPS at least 1 hour battery back up in full load condition complete with all accessories. Make: NUMERIC or APC  or MICROTEK or similar. This also includes supply of one battery rack and one set (for input and output) compatible MCBs complete with cover & fixing materials. Make: Havells, Anchor or similar.', 'B-24', '7.000', 'Number', '144801.28', 'R.I.T.E.S. LTD', 1, '2023-03-31', 1, 0, 0),
(82, 4, 'Installation, Testing & Commissioning of 10 KVA UPS vide item No-24 of Sch-B. All the accessories required for this installation is to be supplied by contractor within the same cost.', 'B-25', '7.000', 'Number', '2301.39', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(83, 4, 'Supply, Installation, Testing & Commissioning of L3 Core Switch as per RDSO Specification RDSO orSPN orTC or65  or2019 Rev 5.0 with latest amendment.', 'B-26', '7.000', 'Number', '117434.86', 'RDSO', 3, '2023-03-31', 1, 0, 0),
(84, 4, 'Supply of Layer-2 Switch (minimum 8+2 port manageable) with 8 nos. 10 or100 or1000 Mbps Ethernet port, PoE and 2 nos. 1000 BaseX SM SFP port with optical modules complete with all accessories etc. as per RDSO Spec. No. RDSO orSPN orTC or65 or2021, Rev 6.0 or latest and refer technical specification.', 'B-27', '82.000', 'Number', '14510.68', 'RDSO', 1, '2023-03-31', 1, 0, 0),
(85, 4, 'Installation, Testing & Commissioning of Layer-2 PoE Switch (minimum 8+2 port manageable) with 8 nos. 10 or100 or1000 Mbps Ethernet port, PoE and 2 nos. 1000 BaseX SM SFP port with optical modules .All the accessories and fixing materials required for this installation are to be supplied by contractor within the same cost.', 'B-28', '82.000', 'Number', '230.65', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(86, 4, 'Supply, Installation, Testing & Commissioning of Aggregate Switch as per RDSO Specification RDSO orSPN orTC or65 or2021 Rev 6.0 or latest amendment and refer technical specification (Inspection by RDSO)', 'B-29', '10.000', 'Number', '103200.33', 'RDSO', 3, '2023-03-31', 1, 0, 0),
(87, 4, 'Supply of Single mode Single Fibre 10G SFP module compatible to Layer 3 core switch vide item No: 26 of Sch B.', 'B-30', '68.000', 'Number', '5774.48', 'RDSO', 1, '2023-03-31', 1, 0, 0),
(88, 4, 'Installation, Testing & Commissioning of Single mode Single Fibre 10G SFP module compatible to Layer 3 core switch vide item No: 31 of Sch B', 'B-31', '68.000', 'Number', '91.80', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(89, 4, 'Supply of Single mode 1G SFP module compatible to Layer 2 switch vide item No: 28 of Sch B', 'B-32', '406.000', 'Number', '2881.16', 'RDSO', 1, '2023-03-31', 1, 0, 0),
(90, 4, 'Installation, Testing & Commissioning of Single mode 1G SFP module compatible to Layer 2 switch vide item No: 33 of Sch B', 'B-33', '406.000', 'Number', '45.67', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(91, 4, 'Supply to the Consignee store, Transportation to the site of Computer Table (1200 x 600x750) : 1 No. with block board &Sunmica top and Chair steel cushioned 2 Nos (Godrej make or similar) with all accessories and fixing materials to the Consignee store, and Transportation to the site. Note: One set includes one table and two chairs. ', 'B-34', '7.000', 'Number', '13439.08', 'Consignee', 1, '2023-03-31', 1, 0, 0),
(92, 4, 'Supply, Installation, Testing and Commissioning of Storage System for 30 days(32TB) recording at station orRPF orGRP Thana orPost along with all accessories required for installation purposes as per RDSO Specification No. RDSO orSPN orTC or 65 or2021 rev 6.0.', 'B-35', '7.000', 'Set', '173696.00', 'RDSO', 3, '2023-03-31', 1, 0, 0),
(93, 4, 'Supply and installation of 19\" 36 or42 U size floor mountable covered network racks with complete fixing accessories. Front door of transparent type with lock and key arrangement. Rack to be fitted with (1) trays - 1Nos (2) 6x15A or5A SURGE protected vertical power socket (minimum2 nos), (3) cable manager  or organiser strip- 2Nos (4) cooling exhaust fans (2Nos)in one tray of 230V AC working. NETRACK or RITTAL or SCHNEIDER or VERO PRESIDENT or APW makes.', 'B-36', '7.000', 'Number', '18696.96', 'Consignee', 3, '2023-03-31', 1, 0, 0),
(94, 4, 'Supply and Installation of surface Wall mountable type 19 inch 12U network Rack with front glass door with lock and rack fixing multipoint AC Power trip & all accessories (Power extension board with one set of MCB, exhaust fan, cable manager)similar to make HCL, DLINK, IBALL or better', 'B-37', '60.000', 'Number', '5375.53', 'Consignee', 3, '2023-03-31', 1, 0, 0),
(95, 4, 'Cutting of trench across oron the platform for a depth of 10cm with marble cutting machine and refilling with plaster.', 'B-38', '3520.000', 'meter', '156.00', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(96, 4, 'Supply and termination of LIU boxes SC Type Rack mounting type 19\"size for 12 Fibre with FC-PC,SCPC connector loaded and termination orsplicing of OFC cable as per Rly requirement and fixing in Rack  or wall as directed by Rly Engineer (OTDR readings to be taken and to be submitted).', 'B-39', '93.000', 'Number', '5800.00', 'R.I.T.E.S. LTD', 3, '2023-03-31', 1, 0, 0),
(97, 4, 'Supply and laying of permanently solid lubricated HDPE pipes (33 mm inner Dia. 40mm outer dia) as per TEC GR no.G orCDS-08 or02 Nov 2004 or latest with accessories (including slip fit orpush fit type couplers) per KM. to suite the above HDPE pipe) per KM. HDPE duct coil length shall be in 1000Mtrs only with tolerance as per TEC spec including transportation of HDPE duct to site. Specification NO.RDSO orSPN  orTC or45 or2013 with revision 2 or latest(OEM test report & TEC Spec certificate to be produced) (HDPE pipe.', 'B-40', '1736.000', 'meter', '64.50', 'Consignee', 3, '2023-03-31', 1, 0, 0),
(98, 4, 'Blowing of OFC in permanently solid lubricated HDPE Telecom pipe (33mm inner dia). This work includes necessary duct integrity test for solid lubricated HDPE pipe', 'B-41', '1825.000', 'meter', '9.00', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(99, 4, 'Excavation of OFC cable joint pit and provision of RCC joint orloop chambers of 1.2m dia, 60cm height and 50mm thickness with 2 pieces top and bottom cover with holes for drainages (Reinforcement as per DRG No.OFC or2009 or17). This includes filling up of sand complete in the joint chamber after cable laying, back filling and consolidation of soil around the chamber, disposal of excess soil as per plan or as advised by railway engineer at site as well as transportation of joint chamber to site at every KM in the section.', 'B-42', '4.000', 'Number', '4500.00', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(100, 4, 'Supply and installation of joint closure for armoured optical fibre cable conforming to RDSO spec No. SPN orTC or68 or2014 Rev1.0 with latest amendment and splicing of optical fibre cable (24F). Testing of fibres for 1310 & 1550 nm shall be carried out at every joint location as instructed by Railway engineer in charge at site.', 'B-43', '4.000', 'Number', '10000.00', 'Consignee', 3, '2023-03-31', 1, 0, 0),
(101, 4, 'Supply and installation of G.I pipe (50MM dia -3.65mm thick) for laying of cable to the PF shelter from ground level and concreting at base level as directed by Railway Engineer .', 'B-44', '194.000', 'meter', '525.15', 'Consignee', 3, '2023-03-31', 1, 0, 0),
(102, 4, 'Supply and erection of 15 feet GI pipe of 4\" dia of medium quality ISI No: 1230 (Part1) 1990. Having iron base plate 10mm thick 30cm x 30cm welded at the bottom of pipe with 4 supports of iron bars of sizes 10mm dia. The 3 feet pipe shall be buried in the ground and 12 feet shall be above the ground. The work includes digging of pit on platform, laying of cable in between poles in suitable underground GI pipes, erection of pole and filling the pit with 1:3:4 cement, concrete and sand. Final plastering should be done on the surface. The iron bracket on the top of the pole shall be provided to fix the CCTV camera and junction box. The work includes supply of all the material required in this item. ', 'B-45', '160.000', 'meter', '3192.12', 'R.I.T.E.S. LTD', 3, '2023-03-31', 1, 0, 0),
(103, 4, 'Supply of 3 Mtrs length SCSC or SCLC orLC-LC orFC-SC orFC-FC (as per Site requirement) connectors OFC patch chord.', 'B-46', '309.000', 'Number', '130.00', 'Consignee', 1, '2023-03-31', 1, 0, 0),
(104, 4, 'Supply and provision of special earth as per RDSO Specn. No. RDSO orSPN or 197 or2008 or latest and as per typical installation Drg. No. SDO orRDSO or E&B or 001 or latest. (Note - Newly installed earth shall be connected with existing earth as per the direction of Railway representative at site. The miscellaneous materials orwork including connectors, exothermic welding etc. shall be supplied by the contractor).', 'B-47', '10.000', 'Number', '25541.00', 'RDSO', 3, '2023-03-31', 1, 0, 0),
(105, 4, 'Supply and fixing of wall mountable 24 F Nos. fibre management system (FMS) Conforming to RDSO  orSPN orTC -37 or2000 (Rev-3) Amdt-1 or latest similar to RPG make or better, suitable for splicing and front patching for 24F cable with all accessories and terminating the optical fibre cable with splicing and front patching in FMS in the equipment room (OFC pigtail patch chords of suitable length and all other materials required for splicing are to be supplied by contractor)', 'B-48', '12.000', 'Number', '12000.00', 'R.I.T.E.S. LTD', 3, '2023-03-31', 1, 0, 0),
(106, 4, 'Supply of Surge Protection Devices, Make DEHN or Similar Class B (10 or350 Micro Sec ) & Class C (8 or20 Micro sec) type metal encapsulated spark gap for fire safe & fire proof operation based, single phase coordinated. It should have Mechanical failure indicator on L-N & N-E, plugable device. as per IEC 61643 test standard. ', 'B-51', '5.000', 'Number', '11407.60', 'Consignee', 1, '2023-03-31', 1, 0, 0),
(107, 4, 'Installation, Testing &Commissioning of Surge Protection, Devices, Class B (10 or350 Micro Sec ) & Class C (8 or20 Micro sec) vide item No.53of Sch-B. All the accessories and fixing materials required for this installation are to be supplied by contractor within the same cost.', 'B-52', '5.000', 'Number', '181.31', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(108, 4, 'Supply and installation of 5KVA online UPS(Single Phase) (APC orNumeric or TATA LIBERT or Emerson Make) with one Hour backup time with full load along with suitable AH capacity SMF batteries(Exide orAmararaja Make) with battery stand orrack ortrolly.', 'B-54', '1.000', 'Number', '100529.18', 'R.I.T.E.S. LTD', 3, '2023-03-31', 1, 0, 0),
(109, 4, 'Supply and fixing of Standard Rack 19\" size, 6U size height wall mounting type front glass door with lock and 2 key and rack fixing multi point AC Power strip, cable organiser with wall fixing screws.', 'B-55', '22.000', 'Number', '3628.00', 'Consignee', 3, '2023-03-31', 1, 0, 0),
(110, 4, 'Supply of STP CAT6 cable', 'B-56', '2930.000', 'meter', '30.00', 'Consignee', 1, '2023-03-31', 1, 0, 0),
(111, 4, 'Supply of 12 Fiber unarmoured single mode Optic fiber cable similar to finolex orAMP orMolex orStarlite makes', 'B-57', '2300.000', 'meter', '16.76', 'Consignee', 1, '2023-03-31', 1, 0, 0),
(112, 4, 'Supply of 3 core 2.5 sq mm, multi strand copper conductor, PVC insulated armoured power cable, confirming to IS: 1554 Part-I.', 'B-58', '2800.000', 'meter', '65.15', 'Consignee', 1, '2023-03-31', 1, 0, 0),
(113, 4, 'Laying of UTP orOFC cables orpower cables in 1\" PVC conduit (ISI marked) or case capping and clamping on Wall or rooftops orPF shelters with suitable clamping and other accessories to be supplied by the contractor)', 'B-59', '30675.000', 'meter', '4.22', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(114, 4, 'Supply and Fixing of PVC conduit pipe of 25mm dia conforming to IS:9537 with suitable couplers and bends as instructed by Railway representative at site.', 'B-60', '30675.000', 'meter', '33.81', 'R.I.T.E.S. LTD', 3, '2023-03-31', 1, 0, 0),
(115, 4, 'Supply of 24 F armoured OFC cable.', 'B-61', '1000.000', 'meter', '40.00', 'RDSO', 1, '2023-03-31', 1, 0, 0),
(116, 4, 'Training - RPF (5 Persons)', 'B-49', '8.000', 'Lumpsum', '200.00', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(117, 4, 'Training - S&T (5 Persons)', 'B-50', '8.000', 'Lumpsum', '200.00', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(118, 4, 'Preparation of drawing mentioning the location of cameras wiring diagrams of UTP, power cable, OFC cable etc., OTDR reports of OFC cable earth resistance test reports. Technical details of servers, switches, work stations, media converters, storages', 'B-53', '7.000', 'Station', '25000.00', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(119, 4, 'AMC for entire VSS of KKDI station including server orwork station orLFD monitor hardware, cameras, external storage, switches, server orclient software updates, new version, security patches and all the associated peripherals including UPS, Batteries, Power orOptical wiring, SPDs and Earthing for the first year. (inclusive of 18% GST)', 'C-1', '1.000', 'Station', '25000.00', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(120, 4, 'AMC for entire VSS of KKDI station including server orwork station orLFD Monitor hardware, cameras, external storage, switches, server orclient software updates, new version, security patches and all the associated peripherals including UPS, Batteries, Power orOptical wiring, SPDs and Earthing for the second year. (inclusive of 18% GST)', 'C-2', '1.000', 'Station', '25000.00', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(121, 4, 'AMC for entire VSS of KKDI station including server orwork station orLFD Monitor hardware, cameras, external storage, switches, server orclient software updates, new version, security patches and all the associated peripherals including UPS, Batteries, Power orOptical wiring, SPDs and Earthing for the third year. (inclusive of 18% GST)', 'C-3', '1.000', 'Station', '25000.00', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(122, 4, 'AMC for entire VSS of KKDI station including server orwork station orLFD Monitor hardware, cameras, external storage, switches, server orclient software updates, new version, security patches and all the associated peripherals including UPS, Batteries, Power orOptical wiring, SPDs and Earthing for the fourth year. (inclusive of 18% GST)', 'C-4', '1.000', 'Station', '50000.00', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(123, 4, 'AMC for entire VSS of KKDI station including server orwork station orLFD Monitor hardware, cameras, external storage, switches, server orclient software updates, new version, security patches and all the associated peripherals including UPS, Batteries, Power orOptical wiring, SPDs and Earthing for the fifth year. (inclusive of 18% GST)', 'C-5', '1.000', 'Station', '50000.00', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(124, 4, 'AMC for entire VSS of RMD station including server orwork station orLFD Monitor hardware, cameras, external storage, switches, server orclient software updates, new version, security patches and all the associated peripherals including UPS, Batteries, Power orOptical wiring, SPDs and Earthing for the first year. (inclusive of 18% GST)', 'C-6', '1.000', 'Station', '25000.00', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(125, 4, 'AMC for entire VSS of RMD station including server orwork station orLFD Monitor hardware, cameras, external storage, switches, server orclient software updates, new version, security patches and all the associated peripherals including UPS, Batteries, Power orOptical wiring, SPDs and Earthing for the second year. (inclusive of 18% GST)', 'C-7', '1.000', 'Station', '25000.00', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(126, 4, 'AMC for entire VSS of RMD station including server orwork station orLFD Monitor hardware, cameras, external storage, switches, server orclient software updates, new version, security patches and all the associated peripherals including UPS, Batteries, Power orOptical wiring, SPDs and Earthing for the Third year. (inclusive of 18% GST)', 'C-8', '1.000', 'Station', '25000.00', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(127, 4, 'AMC for entire VSS of RMD station including server orwork station orLFD Monitor hardware, cameras, external storage, switches, server orclient software updates, new version, security patches and all the associated peripherals including UPS, Batteries, Power orOptical wiring, SPDs and Earthing for the fourth year. (inclusive of 18% GST)', 'C-9', '1.000', 'Station', '50000.00', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(128, 4, 'AMC for entire VSS of RMD station including server orwork station orLFD Monitor hardware, cameras, external storage, switches, server orclient software updates, new version, security patches and all the associated peripherals including UPS, Batteries, Power orOptical wiring, SPDs and Earthing for the fifth year. (inclusive of 18% GST)', 'C-10', '1.000', 'Station', '50000.00', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(129, 4, 'AMC for entire VSS of TSI station including, cameras, switches, and all the associated peripherals including UPS, Batteries, Power orOptical wiring, SPDs and Earthing for the first year (inclusive of 18% GST)', 'C-11', '1.000', 'Station', '25000.00', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(130, 4, 'AMC for entire VSS of TSI station including, cameras, switches, and all the associated peripherals including UPS, Batteries, Power orOptical wiring, SPDs and Earthing for the second year (inclusive of 18% GST)', 'C-12', '1.000', 'Station', '25000.00', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(131, 4, 'AMC for entire VSS of TSI station including, cameras, switches, and all the associated peripherals including UPS, Batteries, Power orOptical wiring, SPDs and Earthing for the Third year (inclusive of 18% GST)', 'C-13', '1.000', 'Station', '25000.00', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(132, 4, 'AMC for entire VSS of TSI station including, cameras, switches, and all the associated peripherals including UPS, Batteries, Power orOptical wiring, SPDs and Earthing for the fourth year (inclusive of 18% GST)', 'C-14', '1.000', 'Station', '50000.00', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(133, 4, 'AMC for entire VSS of TSI station including, cameras, switches, and all the associated peripherals including UPS, Batteries, Power orOptical wiring, SPDs and Earthing for the fifth year (inclusive of 18% GST)', 'C-15', '1.000', 'Station', '50000.00', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(134, 4, 'AMC for entire VSS of SCT station including server orwork station orLFD Monitor hardware, cameras, external storage, switches, server orclient software updates, new version, security patches and all the associated peripherals including UPS, Batteries, Power orOptical wiring, SPDs and Earthing for the first year. (inclusive of 18% GST)', 'C-16', '1.000', 'Station', '25000.00', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(135, 4, 'AMC for entire VSS of SCT station including server orwork station orLFD Monitor hardware, cameras, external storage, switches, server orclient software updates, new version, security patches and all the associated peripherals including UPS, Batteries, Power orOptical wiring, SPDs and Earthing for the second year. (inclusive of 18% GST)', 'C-17', '1.000', 'Station', '25000.00', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(136, 4, 'AMC for entire VSS of SCT station including server orwork station orLFD Monitor hardware, cameras, external storage, switches, server orclient software updates, new version, security patches and all the associated peripherals including UPS, Batteries, Power orOptical wiring, SPDs and Earthing for the third year. (inclusive of 18% GST)', 'C-18', '1.000', 'Station', '25000.00', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(137, 4, 'AMC for entire VSS of SCT station including server orwork station orLFD Monitor hardware, cameras, external storage, switches, server orclient software updates, new version, security patches and all the associated peripherals including UPS, Batteries, Power orOptical wiring, SPDs and Earthing for the fourth year. (inclusive of 18% GST)', 'C-19', '1.000', 'Station', '50000.00', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(138, 4, 'AMC for entire VSS of SCT station including server orwork station orLFD Monitor hardware, cameras, external storage, switches, server orclient software updates, new version, security patches and all the associated peripherals including UPS, Batteries, Power orOptical wiring, SPDs and Earthing for the fifth year. (inclusive of 18% GST)', 'C-20', '1.000', 'Station', '50000.00', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(139, 4, 'AMC for entire VSS of RJPM station including server orwork station orLFD Monitor hardware, cameras, external storage, switches, server orclient software updates, new version, security patches and all the associated peripherals including UPS, Batteries, Power orOptical wiring, SPDs and Earthing for the first year. (inclusive of 18% GST)', 'C-21', '1.000', 'Station', '25000.00', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(140, 4, 'AMC for entire VSS of RJPM station including server orwork station orLFD Monitor hardware, cameras, external storage, switches, server orclient software updates, new version, security patches and all the associated peripherals including UPS, Batteries, Power orOptical wiring, SPDs and Earthing for the second year (inclusive of 18% GST)', 'C-22', '1.000', 'Station', '25000.00', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(141, 4, 'AMC for entire VSS of RJPM station including server orwork station orLFD Monitor hardware, cameras, external storage, switches, server orclient software updates, new version, security patches and all the associated peripherals including UPS, Batteries, Power orOptical wiring, SPDs and Earthing for the third year (inclusive of 18% GST)', 'C-23', '1.000', 'Station', '25000.00', 'Consignee', 4, '2023-03-31', 1, 0, 0);
INSERT INTO `demand_details` (`MaterialID`, `OrderID`, `MaterialName`, `SrNo`, `Qty`, `Unit`, `Rate`, `InspectingAuth`, `BillingType`, `DemandDate`, `Status`, `OnSite`, `Issued`) VALUES
(142, 4, 'AMC for entire VSS of RJPM station including server orwork station orLFD Monitor hardware, cameras, external storage, switches, server orclient software updates, new version, security patches and all the associated peripherals including UPS, Batteries, Power orOptical wiring, SPDs and Earthing for the fourth year (inclusive of 18% GST)', 'C-24', '1.000', 'Station', '50000.00', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(143, 4, 'AMC for entire VSS of RJPM station including server orwork station orLFD Monitor hardware, cameras, external storage, switches, server orclient software updates, new version, security patches and all the associated peripherals including UPS, Batteries, Power orOptical wiring, SPDs and Earthing for the fifth year (inclusive of 18% GST)', 'C-25', '1.000', 'Station', '50000.00', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(144, 4, 'AMC for entire VSS of PMK station including, cameras, switches, and all the associated peripherals including UPS, Batteries, Power orOptical wiring, and Earthing for the first year. (inclusive of 18% GST)', 'C-26', '1.000', 'Station', '25000.00', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(145, 4, 'AMC for entire VSS of PMK station including, cameras, switches, and all the associated peripherals including UPS, Batteries, Power orOptical wiring, and Earthing for the second year. (inclusive of 18% GST)', 'C-27', '1.000', 'Station', '25000.00', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(146, 4, 'AMC for entire VSS of PMK station including, cameras, switches, and all the associated peripherals including UPS, Batteries, Power orOptical wiring, and Earthing for the third year. (inclusive of 18% GST)', 'C-28', '1.000', 'Station', '25000.00', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(147, 4, 'AMC for entire VSS of PMK station including, cameras, switches, and all the associated peripherals including UPS, Batteries, Power orOptical wiring, and Earthing for the fourth year. (inclusive of 18% GST)', 'C-29', '1.000', 'Station', '50000.00', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(148, 4, 'AMC for entire VSS of PMK station including, cameras, switches, and all the associated peripherals including UPS, Batteries, Power orOptical wiring, and Earthing for the fifth year. (inclusive of 18% GST)', 'C-30', '1.000', 'Station', '50000.00', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(149, 4, 'AMC for entire VSS of MNM station including server orwork station orLFD Monitor hardware, , external storage, switches, server orclient software updates, new version, security patches and all the associated peripherals including UPS, Batteries, Power orOptical wiring and Earthing for the First year. (inclusive of 18% GST)', 'C-31', '1.000', 'Station', '25000.00', 'Consignee', 5, '2023-03-31', 1, 0, 0),
(150, 4, 'AMC for entire VSS of MNM station including server orwork station orLFD Monitor hardware, , external storage, switches, server orclient software updates, new version, security patches and all the associated peripherals including UPS, Batteries, Power orOptical wiring and Earthing for the second year. (inclusive of 18% GST)', 'C-32', '1.000', 'Station', '25000.00', 'Consignee', 5, '2023-03-31', 1, 0, 0),
(151, 4, 'AMC for entire VSS of MNM station including server orwork station orLFD Monitor hardware, , external storage, switches, server orclient software updates, new version, security patches and all the associated peripherals including UPS, Batteries, Power orOptical wiring and Earthing for the third year. (inclusive of 18% GST)', 'C-33', '1.000', 'Station', '25000.00', 'Consignee', 5, '2023-03-31', 1, 0, 0),
(152, 4, 'AMC for entire VSS of MNM station including server orwork station orLFD Monitor hardware, , external storage, switches, server orclient software updates, new version, security patches and all the associated peripherals including UPS, Batteries, Power orOptical wiring and Earthing for the fourth year. (inclusive of 18% GST)', 'C-34', '1.000', 'Station', '50000.00', 'Consignee', 5, '2023-03-31', 1, 0, 0),
(153, 4, 'AMC for entire VSS of MNM station including server orwork station orLFD Monitor hardware, , external storage, switches, server orclient software updates, new version, security patches and all the associated peripherals including UPS, Batteries, Power orOptical wiring and Earthing for the fifth year. (inclusive of 18% GST) software updates, new version, security patches and all the associated peripherals including UPS, Batteries, Power orOptical wiring and Earthing for the fifth year. (inclusive of 18% GST)', 'C-35', '1.000', 'Station', '50000.00', 'Consignee', 5, '2023-03-31', 1, 0, 0),
(154, 4, 'AMC for entire VSS of SRT station including, cameras, switches, and all the associated peripherals including UPS, Batteries, Power orOptical wiring, and Earthing for the first year. (inclusive of 18% GST)', 'C-36', '1.000', 'Station', '25000.00', 'Consignee', 5, '2023-03-31', 1, 0, 0),
(155, 4, 'AMC for entire VSS of SRT station including, cameras, switches, and all the associated peripherals including UPS, Batteries, Power orOptical wiring, and Earthing for the second year. (inclusive of 18% GST)', 'C-37', '1.000', 'Station', '25000.00', 'Consignee', 5, '2023-03-31', 1, 0, 0),
(156, 4, 'AMC for entire VSS of SRT station including, cameras, switches, and all the associated peripherals including UPS, Batteries, Power orOptical wiring, and Earthing for the third year. (inclusive of 18% GST)', 'C-38', '1.000', 'Station', '25000.00', 'Consignee', 5, '2023-03-31', 1, 0, 0),
(157, 4, 'AMC for entire VSS of SRT station including, cameras, switches, and all the associated peripherals including UPS, Batteries, Power orOptical wiring, and Earthing for the fourth year. (inclusive of 18% GST)', 'C-39', '1.000', 'Station', '50000.00', 'Consignee', 5, '2023-03-31', 1, 0, 0),
(158, 4, 'AMC for entire VSS of SRT station including, cameras, switches, and all the associated peripherals including UPS, Batteries, Power orOptical wiring, and Earthing for the fifth year. (inclusive of 18% GST)', 'C-40', '1.000', 'Station', '50000.00', 'Consignee', 5, '2023-03-31', 1, 0, 0),
(159, 5, 'Supply of Full HD Bullet Type IP Colour camera as per Spec. No: RDSO orSPN orTC or65 or2021 Ver.6.0 or latest ', 'B-1', '62.000', 'Number', '11182.64', 'RDSO', 1, '2023-03-31', 1, 0, 0),
(160, 5, 'Supply of Full HD P orT orZ (Pan orTilt orZoom) IP Colour Camera as per RDSO spec. No: RDSO orSPN orTC or65 or2021 Ver.6.0 or latest', 'B-2', '27.000', 'Number', '35977.64', 'RDSO', 1, '2023-03-31', 1, 0, 0),
(161, 5, 'Supply of 4K UHD Bullet Type IP Camera as per RDSO spec. No: RDSO orSPN orTC or65 or2021 Ver.6.0 or latest ', 'B-3', '32.000', 'Number', '24358.76', 'RDSO', 1, '2023-03-31', 1, 0, 0),
(162, 5, 'Supply, Installation of Network Enable Joystick Controller for CCTV (Digital Keyborad) and as per RDSO spec. No: RDSO orSPN orTC or65 or2021 Ver.6.0 or latest ', 'B-7', '4.000', 'Number', '13123.60', 'RDSO', 3, '2023-03-31', 1, 0, 0),
(163, 5, 'Supply of Server Hardware for Video Management & Recording and all other required accessories to make the system operational, as per RDSO spec. No: RDSO orSPN orTC or65 or2021 Ver.6.0 or latest', 'B-8', '8.000', 'Number', '266897.40', 'RDSO', 1, '2023-03-31', 1, 0, 0),
(164, 5, 'Supply, Installation, Testing & Commissioning of Video Management Software with License as per RDSO orSPN orTC or65 or2021 Ver.6.0 or latest (Per camera Licence means Video Management (Viewing) ', 'B-10', '121.000', 'Number', '891.18', 'RDSO', 3, '2023-03-31', 1, 0, 0),
(165, 5, 'Supply, Installation, Testing & Commissioning of Video Recording Software with License as per RDSO spec. No: RDSO orSPN orTC or65 or2021 Ver.6.0 or latest', 'B-11', '121.000', 'Number', '534.10', 'RDSO', 3, '2023-03-31', 1, 0, 0),
(166, 5, 'Supply of Server Hardware for Video Analytics and all other required accessories to make the system operational, as per RDSO spec. No: RDSO orSPN orTC or65 or2021 Ver.6.0 or latest ', 'B-12', '4.000', 'Number', '266897.40', 'RDSO', 1, '2023-03-31', 1, 0, 0),
(167, 5, 'Supply, Installation, Testing & Commissioning of Video Analytics Software with License as per RDSO Specification RDSO orSPN orTC or65 or2019 Rev. 6.0 with latest', 'B-14', '121.000', 'Number', '8541.00', 'RDSO', 3, '2023-03-31', 1, 0, 0),
(168, 5, 'Supply of Server Hardware for Face recognition and all other required accessories to make the system operational,as per Spec. No: RDSO orSPN orTC or65 or2021 Ver.6.0 or latest ', 'B-15', '4.000', 'Number', '266897.40', 'RDSO', 1, '2023-03-31', 1, 0, 0),
(169, 5, 'Supply, Installation, Testing & Commissioning of Face Recognition Software with License as per Spec. No: RDSO orSPN orTC or65 or2021 Ver.6.0 or latest ', 'B-17', '32.000', 'Number', '33266.80', 'RDSO', 3, '2023-03-31', 1, 0, 0),
(170, 5, 'Supply of full HD large format display 55\" as per Spec. No: RDSO orSPN orTC or65 or2021 Ver.6.0 or latest', 'B-18', '8.000', 'Number', '53789.00', 'RDSO', 1, '2023-03-31', 1, 0, 0),
(171, 5, 'Supply of PC work station for viewing cameras in multi screen mode and monitoring as per Spec. No: RDSO orSPN orTC or65 or2021 Ver.6.0 or latest', 'B-19', '8.000', 'Number', '222365.36', 'RDSO', 1, '2023-03-31', 1, 0, 0),
(172, 5, 'Supply, Installation, Testing & Commissioning of 24 Port manageble Layer 3 Switch with 4 Nos of 10G SFP port and 24 Nos of GE port with all accessories as per Spec. No: RDSO orSPN orTC or83 or2020 Ver.2.0 or latest ', 'B-21', '4.000', 'Number', '138786.65', 'RDSO', 3, '2023-03-31', 1, 0, 0),
(173, 5, 'Supply, Installation,Testing & Commissioning of Core Switch as per Spec. No: RDSO orSPN orTC or65 or2021 Ver.6.0 or latest', 'B-22', '4.000', 'Number', '117434.86', 'RDSO', 3, '2023-03-31', 1, 0, 0),
(174, 5, 'Supply, Installation, Testing & Commissioning of 24Port Layer 2 Switch as per Spec. No: RDSO orSPN orTC or65 or2021 Ver.6.0 or latest', 'B-23', '4.000', 'Number', '34519.00', 'RDSO', 3, '2023-03-31', 1, 0, 0),
(175, 5, 'Supply, Installation, Testing & Commissioning of Field Switch 8POE port and 2 Nos of 1G Optical port as per Spec. No: RDSO orSPN orTC or65 or2021 Ver.6.0 or latest ', 'B-24', '71.000', 'Number', '16724.96', 'RDSO', 3, '2023-03-31', 1, 0, 0),
(176, 5, 'Supply, Installation, Testing & Commissioning of Agregate Switch as per Spec. No: RDSO orSPN orTC or65 or2021 Ver.6.0 or latest ', 'B-25', '8.000', 'Number', '103200.33', 'RDSO', 3, '2023-03-31', 1, 0, 0),
(177, 5, 'Supply of single mode single fibre 10G SFP module compatible with Layer 3, Layer 2 and Agregate switches to suit NS21, NS23 & NS25.', 'B-26', '160.000', 'Number', '5774.48', 'RDSO', 1, '2023-03-31', 1, 0, 0),
(178, 5, 'Supply of single mode single fibre 1G SFP module compatible with Field and Agregate switches to suit NS24 & NS25. ', 'B-27', '419.000', 'Number', '909.84', 'RDSO', 1, '2023-03-31', 1, 0, 0),
(179, 5, 'Supply, Installation, Testing and Commissioning of Storage System for 30 days(37TB) recording at station orRPF orGRP Thana orPost along with all accessories required for installation purposes', 'B-33', '8.000', 'Number', '200944.56', 'RDSO', 3, '2023-03-31', 1, 0, 0),
(180, 5, 'Supply of 3core 2.5sqmm power cable (Copper) confirming to IS:1554 part 1', 'B-39', '8400.000', 'meter', '65.15', 'RDSO', 1, '2023-03-31', 1, 0, 0),
(181, 5, 'Supply of 24 F armoured OFC cable as per RDSO Specification. ', 'B-63', '1000.000', 'meter', '40.00', 'RDSO', 1, '2023-03-31', 1, 0, 0),
(182, 5, 'Supply and installation of 05 KVA UPS at least 1 hour battery back up in full load condition complete with all accessories as per technical Specification Make: NUMERIC or APC  or MICROTEK or similar. The UPS should have SNMP port for remote monitoring, data logging facility with USB port to download and audiovisual alarm for load on bypass mode. This also includes supply of one battery rack and one set (for input and output) compatible MCBs complete with cover & fixing materials. Make: Havells, Anchor or similar. The SMF orVRLA battery should be of minimum 8000VAH capacity. Make:Exide orAmararaja or similar. ', 'B-20', '8.000', 'Number', '100529.18', 'R.I.T.E.S. LTD', 3, '2023-03-31', 1, 0, 0),
(183, 5, 'Supply and Fixing of rack mountable 12 F LIU including all accessories with splicing as instructed by the Railway representative at the site (pigtiles and other miscellaneous material required for the work shall be supplied by the contractor)', 'B-44', '83.000', 'Number', '6300.00', 'R.I.T.E.S. LTD', 3, '2023-03-31', 1, 0, 0),
(184, 5, 'Supply and erection of 15 feet GI pipe of 4 dia of medium quality ISI No 1230 (part 1) 1990. Having iron base plate 10mm thick 30cm x 30 cm weild at the bottom of the pipe with 4 supports of iron bars of size 10mm dia. The 3 feet pipe shall be burried in the ground and 12 feet shall be above the ground. The work includes digging of pit on platform, laying of cable, erection of pole, filling the pit with 1:3:4 cement, concrete and sand. Final plastering should be done on the surface. The iron bracket on the top of the pole shall be provided for the fixing of CCTV camera and junction box or6U outdoor cabinate etc. (Necessary fixing and other materials required for fixing should be brone by the contractor) ', 'B-49', '32.000', 'Number', '3192.12', 'R.I.T.E.S. LTD', 3, '2023-03-31', 1, 0, 0),
(185, 5, 'supply of 3 Mtrs length SC SC orSC-LC orLC-LC orFCSC orFC-FC (as per Site requriement) connectors OFC patch chord', 'B-51', '579.000', 'Number', '1693.00', 'R.I.T.E.S. LTD', 1, '2023-03-31', 1, 0, 0),
(186, 5, 'Installation, Testing & Commissioning of Full HD Bullet or Doom IP Colour camera along with the mount. All the accessories and fixing materials including mount required for this installation are to be supplied by contractor within the same cost', 'B-4', '62.000', 'Number', '177.79', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(187, 5, 'Installation, Testing & Commissioning of Full HD orP orT orZ (Pan orTilt orZoom) IP Colour camera along with the mount. All the accessories and fixing materials including mount required for this installation are to be supplied by contractor within the same cost.', 'B-5', '27.000', 'Number', '571.89', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(188, 5, 'Installation, Testing & Commissioning of4K UHD Bullet Type IP Camera along with the mount. All the accessories and fixing materials including mount required for this installation are to be supplied by contractor within the same cost.', 'B-6', '32.000', 'Number', '387.12', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(189, 5, 'Installation, Testing & Commissioning of Video Management & recording Server with required accessories as per RDSO spec. No: RDSO orSPN orTC or65 or2021 Ver.6.0 or latest', 'B-9', '8.000', 'Number', '5337.95', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(190, 5, 'Installation, Testing & Commissioning of Server for Video Analytics with required accessories as per Spec. No: RDSO orSPN orTC or65 or2021 Ver.6.0 or latest ', 'B-13', '4.000', 'Number', '5337.95', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(191, 5, 'Installation, Testing & Commissioning of Server for Face recognition with required accessoriesas per Spec. No: RDSO orSPN orTC or65 or2021 Ver.6.0 or latest', 'B-16', '4.000', 'Number', '5337.95', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(192, 5, 'Installation, testing and commissioning of large format display monitor unit 55\"', 'B-28', '8.000', 'Number', '854.89', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(193, 5, 'Installation, testing and commissioning of PC work station with all accessories ', 'B-29', '8.000', 'Number', '3520.30', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(194, 5, 'Installation, testing and commissioning of single mode single fibre 10G SFP module compatible with Laye 3, Layer 2 and Agregate switches', 'B-30', '160.000', 'Number', '91.80', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(195, 5, 'Installation, testing and commissioning of single mode single fibre 1G SFP module compatible with Field and Agregate switches', 'B-31', '419.000', 'Number', '45.67', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(196, 5, 'Supply to the Consignee store , Transportation to the site of Computer Table (1200 x 600x750) : 1 No. with block board & Sunmica top and Chair steel cushioned 2 Nos (Godrej make or similar) with all accessories ', 'B-32', '8.000', 'Set', '13439.08', 'Consignee', 1, '2023-03-31', 1, 0, 0),
(197, 5, 'Supply of covered 19\" (42U) Racks of size 2200mm x 600mm x 600mm (similar to Vero president  or HCL  or RITTAL Make) complete with all fittings including DC Fan (48V) - 2 Nos and AC power distribution panel (horizontal fitting) with power sockets and fuse protection (minimum 6 Nos of 230V 15A or5A combined) and other accessories. The body should be of high quality cold rolled steel. with wheel and caster arrangement, vented from door borders and rear doors for ventilation and reliable operation. All the accessories and fixing materials required for this installation are to be supplied by contractor within the same cost.', 'B-34', '4.000', 'Number', '25199.32', 'Consignee', 1, '2023-03-31', 1, 0, 0),
(198, 5, 'Installation of 19\" 42 U size floor mountable covered network racks with complete fixing accessories', 'B-35', '4.000', 'Number', '400.59', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(199, 5, 'Supply and Installation of surface Wall mountable type 19 inch 6U network Rack with front glass door with lock and rack fixing multipoint AC Power trip & all accessories ', 'B-36', '71.000', 'Number', '3628.00', 'Consignee', 3, '2023-03-31', 1, 0, 0),
(200, 5, 'Supply of STP cat 6 outdoor cable as per RDSO specification No. RDSO orSPN orTC or65 or2021 Ver.6.0 or latest ', 'B-37', '10880.000', 'meter', '30.00', 'Consignee', 1, '2023-03-31', 1, 0, 0),
(201, 5, 'Supply of 12 Fiber unarmoured single mode Optic fiber cable similar to finolex orAMP orMolex orStarlite makes ', 'B-38', '8400.000', 'meter', '16.76', 'Consignee', 1, '2023-03-31', 1, 0, 0),
(202, 5, 'Laying of UTP orOFC cables orpower cables in 1\" PVC conduit (ISI marked) or case capping and clamping on wall or rooftops orPF shelters with suitable clamping and other accessories to be supplied by the contractor)', 'B-40', '27680.000', 'meter', '4.22', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(203, 5, 'Supply and fixing of various size of multi coloured alpha numeric PVC ferrules for cable ID marking  or labeling whether resistance extra heavy duty, cable ties utilised during cable laying work ', 'B-42', '4.000', 'Lumpsum', '25393.50', 'Consignee', 3, '2023-03-31', 1, 0, 0),
(204, 5, 'Supply and Fixing of PVC conduit pipe of 25mm dia conforming to IS: 9537 with suitable couplers and bends as instructed by Railway representative at site', 'B-41', '23500.000', 'meter', '33.81', 'Consignee', 3, '2023-03-31', 1, 0, 0),
(205, 5, 'Cutting of trench across oron the platform for a depth of 10cm with marble cutting machine and refilling with plaster.', 'B-43', '4500.000', 'meter', '250.00', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(206, 5, 'Supply and laying of permanently solid lubricated HDPE pipes (33 mm inner Dia. 40mm outer dia) as per TEC GR no.G orCDS-08 or02 Nov 2004 or latest ', 'B-45', '1400.000', 'meter', '64.50', 'Consignee', 3, '2023-03-31', 1, 0, 0),
(207, 5, 'Blowing of OFC in permanently solid lubricated HDPE Telecom pipe (33mm inner dia).', 'B-46', '1400.000', 'meter', '9.00', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(208, 5, 'Supply and installation of optical joint closure for Optical fiber cable as per RDSO Specification.', 'B-47', '20.000', 'Number', '150.00', 'Consignee', 3, '2023-03-31', 1, 0, 0),
(209, 5, 'Supply and errection of G.I pipe (50MM dia -3.65mm thick) for laying of cable to the PF shelter orBuilding wall orFOB pillar from ground level and concreating at base level and extending by suitable dia HDPE pipe or PVC pipe on either side as directed by Railway Engineer. All the clamping & fixing materials are to be supplied by the contractor. ', 'B-48', '210.000', 'meter', '525.15', 'Consignee', 3, '2023-03-31', 1, 0, 0),
(210, 5, 'Supply of 6U Outdoor cabinate enclosure IP66 complied pole mount similar to Rackom 6UIP66 or similar', 'B-50', '32.000', 'Number', '10030.00', 'Consignee', 1, '2023-03-31', 1, 0, 0),
(211, 5, 'Supply of CAT 6 UTP patch cord of 3 meter length', 'B-52', '59.000', 'Number', '120.00', 'Consignee', 1, '2023-03-31', 1, 0, 0),
(212, 5, 'Supply and fixing of wall mountable 24F nos FMS conforming to RDSO orSPN orT C-37 or2000 (REV-3) amdt -1 or latest', 'B-53', '9.000', 'Number', '12000.00', 'Consignee', 3, '2023-03-31', 1, 0, 0),
(213, 5, 'Road crossing or Track crossing through horizontal boring method at a depth of 1mtr and inserting 120mm outer dia and 103.5mm inner  dia DWC pipe specification No. IS 14930 (part II) :2001 or latest and pushing cables in DWC pipe through it. (DWC pipe 120mm outer dia and 103.5mm inner dia with couplers shall be supplied by the contractor) ', 'B-55', '600.000', 'meter', '645.19', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(214, 5, 'Supply and instllation of wall mountable power distribution panel with 8nos x16Amp MCBs mounted and also with one earth leakage circuit breaker arrangement fitted.', 'B-56', '4.000', 'Number', '3800.00', 'Consignee', 3, '2023-03-31', 1, 0, 0),
(215, 5, 'supply and provision of multipin power socket with switch 15A or5A(6Nos) wired with 2.5 Sq.mm coper multistrand wire.', 'B-57', '8.000', 'Number', '1800.00', 'Consignee', 3, '2023-03-31', 1, 0, 0),
(216, 5, 'Supply of Surge protection devices of class B(10 or350µ Sec) & class C (8 or20µ Sec) type metal encapsulated spark gap for fire safe and fire proof operation based single phase coordinated. It should have Mechanical failure indicator on L-N & N-E, plugable device as per IEC 61643 test standard ', 'B-58', '4.000', 'Number', '11407.60', 'Consignee', 1, '2023-03-31', 1, 0, 0),
(217, 5, 'Installation of Surge protection devices of class B(10 or350µ Sec) & class C (8 or20µ Sec). All the accessories required for the installation atre to be supplied by the contractor within the same cost', 'B-59', '4.000', 'Number', '181.30', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(218, 5, 'Training - RPF (3 Persons)', 'B-60', '4.000', 'Lumpsum', '800.00', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(219, 5, 'Training - S&T (3 Persons) ', 'B-61', '4.000', 'Lumpsum', '200.00', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(220, 5, 'Preparation of drawing mentioning the location of cameras wiring diagrams of UTP, power cable, OFC cable etc., OTDR reports of OFC cable earth resitence test reports. Technical details of servers, switches, work stations, media converters, storages ', 'B-62', '4.000', 'Station', '25000.00', 'Consignee', 4, '2023-03-31', 1, 0, 0),
(221, 5, 'Supply of 3core 2.5 Sqmm multi strand copper conductor PVC insulated armoured power cable ', 'B-64', '1000.000', 'meter', '40.00', 'Consignee', 1, '2023-03-31', 1, 0, 0),
(222, 5, 'Supply and installation of optical joint closure for Optical fiber cable as per RDSO specification ', 'B-65', '2.000', 'Number', '10884.00', 'Consignee', 3, '2023-03-31', 1, 0, 0),
(223, 5, 'Supply of Optical fibre Splicing machine Dual monitor position with automatic image orientation, Automatic arc calibration with clever, adaptor, sheath clamp etc similar to the make of splice master 60S or better.', 'B-66', '1.000', 'Number', '135000.00', 'Consignee', 1, '2023-03-31', 1, 0, 0),
(224, 5, 'Supply of optical time domain reflectometer (OTDR) 7.0 Inch Capacitive Touch Screen (Daylight Readable) High Dynamic Range from 32- 45Db, Rugged Design, Light Weight Built-in Light Source similar to the make of UW 6000A or better ', 'B-67', '1.000', 'Number', '72600.00', 'Consignee', 1, '2023-03-31', 1, 0, 0),
(225, 5, 'Supply of Optical power meter wave length 800 - 1600nm, range 45 to + 10 dBm similar to the make of EXFO or better.', 'B-68', '1.000', 'Number', '48852.00', 'Consignee', 1, '2023-03-31', 1, 0, 0),
(226, 5, 'Supply of fiber optical light source with wave length of 850 or1300nm laser output for multimode fiber measurements similar to FOLS-106 or better', 'B-69', '1.000', 'Number', '17700.00', 'Consignee', 1, '2023-03-31', 1, 0, 0),
(227, 5, 'Supply and installation of Media converter fiber to ethernet as per RDSO as per spec.No. RDSO orSPN orTC or65 or2013 Rev.5.0', 'B-54', '8.000', 'Pair', '5500.00', 'Consignee', 3, '2023-03-31', 1, 0, 0),
(228, 5, 'AMC for entire VSS of ALU station including server hardware, camera, external storage, switches and all the associated peripherals including UPS, Power orOptical wiring, SPDs and Earthing for the fourth year', 'AMC-4', '1.000', 'Station', '75000.00', 'Consignee', 5, '2023-03-31', 1, 0, 0),
(229, 5, 'AMC for entire VSS of ALU station including server hardware, camera, external storage, switches and all the associated peripherals including UPS, Power orOptical wiring, SPDs and Earthing for the first year ', 'AMC-1', '1.000', 'Station', '50000.00', 'Consignee', 5, '2023-03-31', 1, 0, 0),
(230, 5, 'AMC for entire VSS of ALU station including server hardware, camera, external storage, switches and all the associated peripherals including UPS, Power orOptical wiring, SPDs and Earthing for the second year', 'AMC-2', '1.000', 'Station', '50000.00', 'Consignee', 5, '2023-03-31', 1, 0, 0),
(231, 5, 'AMC for entire VSS of ALU station including server hardware, camera, external storage, switches and all the associated peripherals including UPS, Power orOptical wiring, SPDs and Earthing for the third year', 'AMC-3', '1.000', 'Station', '75000.00', 'Consignee', 5, '2023-03-31', 1, 0, 0),
(232, 5, 'AMC for entire VSS of ALU station including server hardware, camera, external storage, switches and all the associated peripherals including UPS, Power orOptical wiring, SPDs and Earthing for the fifth year', 'AMC-5', '1.000', 'Station', '100000.00', 'Consignee', 5, '2023-03-31', 1, 0, 0),
(233, 5, 'AMC for entire VSS of VRI station including server hardware, camera, external storage, switches and all the associated peripherals including UPS, Power orOptical wiring, SPDs and Earthing for the first year ', 'AMC-6', '1.000', 'Station', '50000.00', 'Consignee', 5, '2023-03-31', 1, 0, 0),
(234, 5, 'AMC for entire VSS of VRI station including server hardware, camera, external storage, switches and all the associated peripherals including UPS, Power orOptical wiring, SPDs and Earthing for the second year', 'AMC-7', '1.000', 'Station', '50000.00', 'Consignee', 5, '2023-03-31', 1, 0, 0),
(235, 5, 'AMC for entire VSS of VRI station including server hardware, camera, external storage, switches and all the associated peripherals including UPS, Power orOptical wiring, SPDs and Earthing for the third year', 'AMC-8', '1.000', 'Station', '75000.00', 'Consignee', 5, '2023-03-31', 1, 0, 0),
(236, 5, 'AMC for entire VSS of VRI station including server hardware, camera, external storage, switches and all the associated peripherals including UPS, Power orOptical wiring, SPDs and Earthing for the fourth year ', 'AMC-9', '1.000', 'Station', '75000.00', 'Consignee', 5, '2023-03-31', 1, 0, 0),
(237, 5, 'AMC for entire VSS of VRI station including server hardware, camera, external storage, switches and all the associated peripherals including UPS, Power orOptical wiring, SPDs and Earthing for the fifth year', 'AMC-10', '1.000', 'Station', '100000.00', 'Consignee', 5, '2023-03-31', 1, 0, 0),
(238, 5, 'AMC for entire VSS of NGT station including server hardware, camera, external storage, switches and all the associated peripherals including UPS, Power orOptical wiring, SPDs and Earthing for the first year', 'AMC-11', '1.000', 'Station', '50000.00', 'Consignee', 5, '2023-03-31', 1, 0, 0),
(239, 5, 'AMC for entire VSS of NGT station including server hardware, camera, external storage, switches and all the associated peripherals including UPS, Power orOptical wiring, SPDs and Earthing for the second year', 'AMC-12', '1.000', 'Station', '50000.00', 'Consignee', 5, '2023-03-31', 1, 0, 0),
(240, 5, 'AMC for entire VSS of NGT station including server hardware, camera, external storage, switches and all the associated peripherals including UPS, Power orOptical wiring, SPDs and Earthing for the third year', 'AMC-13', '1.000', 'Station', '75000.00', 'Consignee', 5, '2023-03-31', 1, 0, 0),
(241, 5, 'AMC for entire VSS of NGT station including server hardware, camera, external storage, switches and all the associated peripherals including UPS, Power orOptical wiring, SPDs and Earthing for the fourth year', 'AMC-14', '1.000', 'Station', '75000.00', 'Consignee', 5, '2023-03-31', 1, 0, 0),
(242, 5, 'AMC for entire VSS of NGT station including server hardware, camera, external storage, switches and all the associated peripherals including UPS, Power orOptical wiring, SPDs and Earthing for the fifth year', 'AMC-15', '1.000', 'Station', '100000.00', 'Consignee', 5, '2023-03-31', 1, 0, 0),
(243, 5, 'AMC for entire VSS of PDY station including server hardware, camera, external storage, switches and all the associated peripherals including UPS, Power orOptical wiring, SPDs and Earthing for the first year ', 'AMC-16', '1.000', 'Station', '50000.00', 'Consignee', 5, '2023-03-31', 1, 0, 0),
(244, 5, 'AMC for entire VSS of PDY station including server hardware, camera, external storage, switches and all the associated peripherals including UPS, Power orOptical wiring, SPDs and Earthing for the second year', 'AMC-17', '1.000', 'Station', '50000.00', 'Consignee', 5, '2023-03-31', 1, 0, 0),
(245, 5, 'AMC for entire VSS of PDY station including server hardware, camera, external storage, switches and all the associated peripherals including UPS, Power orOptical wiring, SPDs and Earthing for the third year ', 'AMC-18', '1.000', 'Station', '75000.00', 'Consignee', 5, '2023-03-31', 1, 0, 0),
(246, 5, 'AMC for entire VSS of PDY station including server hardware, camera, external storage, switches and all the associated peripherals including UPS, Power orOptical wiring, SPDs and Earthing for the fourth year', 'AMC-19', '1.000', 'Station', '75000.00', 'Consignee', 5, '2023-03-31', 1, 0, 0),
(247, 5, 'AMC for entire VSS of PDY station including server hardware, camera, external storage, switches and all the associated peripherals including UPS, Power orOptical wiring, SPDs and Earthing for the fifth year', 'AMC-20', '1.000', 'Station', '100000.00', 'Consignee', 5, '2023-03-31', 1, 0, 0),
(248, 3, 'Supply and testing of Unify Digital phone end point for PABX system. Make orModel- Unify Openstage 15T or similar.', 'A-1', '12.000', 'Number', '9630.00', 'Consignee', 3, '2023-04-01', 1, 0, 0),
(249, 3, 'Excavation of cable trench as per cable route plan, 1.2 Meter deep and of 0.3 Meter to 0.6 Meter wide at bottom as per RDSO sketch No. SDO orCABLE LAYING or003, issued vide RDSO document no. RDSO orSI orG or2010 Version 1.1 dated 04.02.2014 or latest, alongside the track in normal soil orstrata [including soft rock], conforming to distances as per cable route plan and refilling and ramming of loose soil. This work includes clearing of route from bushes etc, covering of cable laid in trench by loose soil for a layer of 50 mm thickness approximately before covering by bricks. The work shall be done as per the extant practice on North Central Railway and instructions of Railway Engineer at site. In case the full depth is not available, there shall be no proportionate payment and after the approval of minimum JAG officer, the concreting shall be done as per the RDSO drawing  no.SDO orCable laying or008, issued vide RDSO document no. RDSO orSI orG or2010 Version 1.1 dated 04.02.2014 or latest. ', 'A-2', '1000.000', 'meter', '64.60', 'Consignee', 4, '2023-04-01', 1, 0, 0),
(250, 3, 'Cutting of all types of platforms orroad crossing and trenching and excavation to a width and depth of 300 mm x 300 mm, laying of DWC orHDPE orGI pipe in the trench and refilling and concreting it afterwards as per original condition. In hard rocky ground area , cables will be laid normally on layer of soft earth of 0.05 meter thickness previously deposited at bottom of the trench . The cutting to be filled and finished with cement orconcrete, as per the RDSO drawing no.SDO orCable laying or008, issued vide RDSO document no. RDSO orSI orG or2010 Version 1.1 dated 04.02.2014 or latest.', 'A-3', '500.000', 'meter', '158.88', 'Consignee', 4, '2023-04-01', 1, 0, 0),
(251, 3, '\"Horizontal direction drilling (HDD) orTrenchless digging ormachine drilling with-out damage to surface road  ortrack for laying orinsertion of HDPE orGI orDWC pipe. The bore shall be done at the depth of minimum 1400 mm from the ground level. The ground level shall be considered ignoring the bank height of the bank of the road. Note:- DWC orHDPE orGI Pipe Supply is not covered under this item. Contactor shall provide all material required for work and adequate nos. of labours for proper laying of cables into the bore. Cable shall be laid cautiously so that it should not get damage due to rough handling & pressure on cable. Payment of boring shall be made only after DWC orHDPE orGI pipe is laid in the bore.', 'A-4', '200.000', 'meter', '616.35', 'Consignee', 4, '2023-04-01', 1, 0, 0),
(252, 3, 'Supply and Installation of Fibre distribution management system as per RDSO spec. no. RDSO orSPN orTC or37 or2020 Revision 4.0 or latest. It includes the supply of 19 inch 42U rack with mounting arrangement. It will also include all installation material, splicing, termination, testing of all 2 x 24 fibres.', 'A-5', '4.000', 'Number', '77346.06', 'Consignee', 3, '2023-04-01', 1, 0, 0),
(253, 3, 'Supply of OFC patch cord or jumper cable, 10 meter long, with [1] FC orPC connectors on both sides or [2] One end FC orPC connector and other end compatible to work with STM-1. ', 'A-6', '200.000', 'Number', '1784.18', 'Consignee', 1, '2023-04-01', 1, 0, 0),
(254, 3, 'Supply of FC orPC type connectors of 5 or10 or20 dB and multiple of 5 dB up to 20 dB. ', 'A-7', '85.000', 'Number', '257.94', 'Consignee', 1, '2023-04-01', 1, 0, 0),
(255, 3, 'Supply and Installation of RJ-45 patch cord, seven feet long, of reputed make like Molex or similar, with 02 no. of RJ-45 connectors for every patch cord.', 'A-8', '445.000', 'Number', '173.98', 'Consignee', 3, '2023-04-01', 1, 0, 0),
(256, 3, 'Supply of UTP CAT-6 cable of reputed make Siemen or Systemax  or D-Link or Tyco or Krone or AMP or similar.', 'A-9', '1000.000', 'meter', '22.36', 'Consignee', 1, '2023-04-01', 1, 0, 0),
(257, 3, 'Laying of UTP orSTP CAT-6 cable orpower cable in PVC casing capping of appropriate size. The work also includes supply and fixing of casing and capping, fixing and connection of patch panel, fixing of CAT-6 cable with RJ 45 connectors. Work to be done as per instructions of site incharge. ', 'A-10', '1000.000', 'meter', '45.14', 'Consignee', 4, '2023-04-01', 1, 0, 0),
(258, 3, 'Supply of 06 Core Optical Fiber Cable Armoured Single Mode. Make : D-Link or similar of reputed make. ', 'A-11', '8000.000', 'meter', '26.08', 'Consignee', 1, '2023-04-01', 1, 0, 0),
(259, 3, 'Laying of Data cable or Communication cable or Power cable etc. in PVC conduit pipe with all fiitings and accessories [As per site  requirement]. ', 'A-12', '8000.000', 'meter', '18.71', 'Consignee', 4, '2023-04-01', 1, 0, 0),
(260, 3, 'Supply and installation [splicing of fiber] of Rack Mount LIU 12 Core Loaded with SC Adaptors. Make : D-Link or similar of reputed make.', 'A-13', '50.000', 'Number', '6394.13', 'Consignee', 3, '2023-04-01', 1, 0, 0),
(261, 3, 'Supply of permanently lubricated HDPE duct, 40 mm outer dia, as per RDSO spec. No. RDSO orSPN orTC or45 or2013 Rev.2 Amndt.2 or latest, along with all accessories like end caps, collars, bends, couplers etc. ', 'A-14', '8.000', 'Km', '76811.42', 'R.I.T.E.S. LTD', 1, '2023-04-01', 1, 0, 0),
(262, 3, 'Laying of HDPE duct as per the approved cable route plan in the exavated trenches or other protected works or RCC channel etc. including all accessories like end caps, collars, bends, couplers etc. The ends of the duct to be sealed with end plugs till OFC blowing is done. Important: The laying of OFC cable independently or along with Quad cable or PIJF cable in the same trench shall be governed by the RDSO drawings no. RDSO orTCDO orCOP-6[a] and RDSO orTCDO orCOP-8 [a] respectively, issued vide Chapter-XIII of the Telecomm Manual.', 'A-15', '8.000', 'Km', '8092.25', 'Consignee', 4, '2023-04-01', 1, 0, 0),
(263, 3, 'Supply of Cable fault locator for metallic S&T cables of reputed make Aplab or Stanley or 3M etc. Item to be supplied after successful demonstration and approval of Railways.', 'A-16', '1.000', 'Number', '301578.02', 'Consignee', 1, '2023-04-01', 1, 0, 0),
(264, 3, 'Supply of 8 port Gigabit Lite Managed PoE Layer 2 Switch supports 8 nos 10 or 100 or 1000 BASE-T ports, along with 2 Gigabit SFP ports, green-saving technologies, make model DG-GS1510HPL DIGISOL  or CISCO or JUNIPER or superior. Technical specification attached.', 'A-17', '35.000', 'Number', '18807.45', 'R.I.T.E.S. LTD', 1, '2023-04-01', 1, 0, 0),
(265, 3, 'Supply, installation, testing and commissioning of SFP 1 G to suit and match Gigabit switch. ', 'A-18', '70.000', 'Number', '2718.70', 'Consignee', 3, '2023-04-01', 1, 0, 0),
(266, 3, 'Supply, Installation, testing and commissioning of 24 port Layer-2 Managed Gigabit Ethernet Switch with 02 Nos. 1 Gigabit Ports with SFP module. Make : Juniper or CISCO or ARUBA or similar of reputed make. Technical specification attached. ', 'A-19', '8.000', 'Number', '68945.68', 'R.I.T.E.S. LTD', 3, '2023-04-01', 1, 0, 0),
(267, 3, 'Supply of 2 Mbps Router, 2 LAN or 4 WAN port, 230V AC operated, as per RDSO spec. no. RDSO or SPN or TC or 84 or 2008 Rev. 0 or latest, along with connecting cables, connectors etc. for connecting to the ethernet devices, of reputed make like Cisco or Dlink or better', 'A-20', '6.000', 'Number', '83565.68', 'R.I.T.E.S. LTD', 1, '2023-04-01', 1, 0, 0),
(268, 3, 'Supply, installation, testing and commissioning of Router Cisco ISR 4451-X or latest or similar 1-2 G system throughput as per technical specification.', 'A-21', '1.000', 'Number', '419456.02', 'Consignee', 3, '2023-04-01', 1, 0, 0),
(269, 3, 'Supply, Installation, testing and commissioning of Layer -3 switch with 24 blank SFP slots and 2 blank SFP slots for uplink with redudent power supply. Make: Juniper or CISCO or similar. Technical specification attached. ', 'A-22', '4.000', 'Number', '170693.49', 'R.I.T.E.S. LTD', 3, '2023-04-01', 1, 0, 0),
(270, 3, 'Supply and testing of 1.25 G SFP with dual Fiber for maximum distance of 20 KM, 1310 nm, LC connectors. Technical specification attached.', 'A-23', '80.000', 'Number', '1862.11', 'Consignee', 3, '2023-04-01', 1, 0, 0),
(271, 3, 'Supply and testing of 10 G SFP with dual Fiber for maximum distance of 20 KM, 1310 nm, LC connectors. Technical specification attached.', 'A-24', '4.000', 'Number', '7758.80', 'Consignee', 3, '2023-04-01', 1, 0, 0),
(272, 3, 'Supply and testing of 1 G 1000 base TX [Copper]. Technical specification attached.', 'A-25', '8.000', 'Number', '4396.65', 'Consignee', 3, '2023-04-01', 1, 0, 0),
(273, 6, 'Supply of Out Door HD PTZ Camera', '1', '3.000', 'Number', '45000.00', 'Consignee', 1, '2023-04-03', 1, 0, 0),
(274, 6, 'Supply of In Door HD PTZ Camera', '2', '3.000', 'Number', '45000.00', 'Consignee', 1, '2023-04-03', 1, 0, 0),
(275, 6, 'Supply of Out Door HD IP Camera', '3', '1.000', 'Number', '21000.00', 'Consignee', 1, '2023-04-03', 1, 0, 0),
(276, 6, 'Supply of In Door HD IP fixed Camera', '4', '9.000', 'Number', '23000.00', 'Consignee', 1, '2023-04-03', 1, 0, 0),
(277, 6, 'Supply of Screen Display 32\" HD LED Monitor', '6', '1.000', 'Number', '35000.00', 'Consignee', 1, '2023-04-03', 1, 0, 0),
(278, 6, '32 CH NVR: Supply of NVR orCamera Server, Database Server With Raid Facility, Video analyics server  working in redundant configuration  or fail safe operation, each complete with HDD and all accessories.', '5', '1.000', 'Number', '60000.00', 'Consignee', 1, '2023-04-03', 1, 0, 0),
(279, 6, '  Equipment rack (6 U) wall Mount with power strip, tray and fans etc.', '7', '1.000', 'Number', '10000.00', 'Consignee', 1, '2023-04-03', 1, 0, 0),
(280, 6, 'Cat 6 Cable with laying charge.', '8', '600.000', 'meter', '48.00', 'Consignee', 3, '2023-04-03', 1, 0, 0),
(281, 6, 'UPS (on line) 2 KVA with battery and Rack, One Hour backup.', '10', '1.000', 'Number', '52000.00', 'Consignee', 1, '2023-04-03', 1, 0, 0),
(282, 6, ' Installation and Commissioning with other accessories (POE switches, Connectors, fitting accessories etc.)', '11', '1.000', 'Number', '40000.00', 'Consignee', 3, '2023-04-03', 1, 0, 0),
(283, 6, 'Conduit Pipe (ISI Mark) with laying charge.', '9', '600.000', 'meter', '48.00', 'Consignee', 3, '2023-04-03', 1, 0, 0),
(284, 7, 'Supply, installation, testing & commissioning of NVR, make-CP PLUS DAHUA, HIKVISION. Tech.specf.-16  CH 4K NVR support to 4  sata HDD up to 24 TB or200Mbps 25 fps @1080 P orup to 8MP, it includes video operation, management, recording & processing software( standard but latest version).', 'A-1', '1.000', 'Number', '48750.00', 'Consignee', 3, '2023-04-04', 1, 0, 0),
(285, 7, 'Supply, installation, testing & commissioning of camera make-CP PLUS, DAHUA , HIKVISION, Tech. specf.- 4MP Bullet Camera, 4 MP 3.6 mm,20fps@4MP resolution, IR-Distance-50 mts. It includes suitable orpopular mounting brackets, housing for equipments &accessories(in weather proof enclosure).', 'A-2', '6.000', 'Number', '19500.00', 'Consignee', 3, '2023-04-04', 1, 0, 0),
(286, 7, 'Supply, installation, testing & commissioning of 4TB HDD surveillance supporting to item  1 of schedule A, make- SIGET, TOSIBA, WD. ', 'A-3', '1.000', 'Number', '14250.00', 'Consignee', 3, '2023-04-04', 1, 0, 0),
(287, 7, 'Supply, installation, testing & commissioning of switch, make -CP PLUS , DAHUA, HIKVISION, Tech. specf.-POE 8 Port switch.', 'A-4', '3.000', 'Number', '16900.00', 'Consignee', 3, '2023-04-04', 1, 0, 0),
(288, 7, 'Supply, installation, testing & commissioning of of PTZ camera, make -CP PLUS, DAHUA, HIKVISION, Tech.specf. PTZ camera,25fps@2MP, IR- Distance-100 mts. It includes suitable orpopular mounting brackets, housing for equipments & accessories (in weather proof enclosure).', 'A-5', '1.000', 'Number', '79990.00', 'Consignee', 3, '2023-04-04', 1, 0, 0),
(289, 7, 'Supply & Laying of D Link or similar cat 6 cable suitable to camera network.', 'A-6', '1000.000', 'meter', '45.00', 'Consignee', 3, '2023-04-04', 1, 0, 0),
(290, 7, 'Supply & casing capping of PVC pipe of reputed brand having size 30 or15 mm.', 'A-7', '800.000', 'meter', '50.00', 'Consignee', 3, '2023-04-04', 1, 0, 0),
(291, 7, 'Supply, installation, testing & commissioning D link RJ 45 IO BOX make-D link or similar.', 'A-8', '18.000', 'Number', '1000.00', 'Consignee', 3, '2023-04-04', 1, 0, 0),
(292, 7, 'Supply, installation, testing & commissioning of Television , make- LG SAMSUNG, SONY TV of 40\"\" (40 inch) with 2 port HDMI 1080 P.', 'A-9', '1.000', 'Number', '55000.00', 'Consignee', 3, '2023-04-04', 1, 0, 0),
(293, 7, 'Supply, installation, testing & commissioning 1 KVA UPS line offline or interactive, make- Numeric  or Luminous orMicrotek.', 'A-10', '1.000', 'Number', '14000.00', 'Consignee', 3, '2023-04-04', 1, 0, 0),
(294, 7, 'Installation of all equipments mentioned in schedule A which includes any civil work & electrical work. Electrical power point as required at site & installation wire length up to 50 mtrs.', 'A-11', '1.000', 'Set', '39700.00', 'Consignee', 4, '2023-04-04', 1, 0, 0),
(295, 7, 'Transportation charge.', 'A-12', '1.000', 'Set', '20000.00', 'Consignee', 4, '2023-04-04', 1, 0, 0),
(296, 7, 'Supply, installation, testing & commissioning 19\" wall U rack with inbuilt fan, make- walrack  or similar.', 'A-13', '1.000', 'Number', '12000.00', 'Consignee', 3, '2023-04-04', 1, 0, 0),
(297, 7, 'Comprehensive AMC of whole system of this schedule for 2 years from the expiry of warranty period.', 'A-14', '1.000', 'Set', '121965.00', 'Consignee', 5, '2023-04-04', 1, 0, 0),
(298, 7, 'Supply, installation, testing & commissioning of Rapid N automatic barrier up to fench length  7 m  long, Boom with rest post & safety sensor and type : Electro-mechanical with Lubricant filled gear box, make-Toshi, Alaska, Vantage, Technical specification-Opening closing time (sec)-6 to 8 sec, Height of boom from ground-800 to 900 mm, Duty use-Intense use, controller protecting rating Microprocessor based. It includes operation, management & processing software (standard but latest version) ', 'B-1', '3.000', 'Number', '139000.00', 'Consignee', 3, '2023-04-04', 1, 0, 0),
(299, 7, 'Supply, installation, testing & commissioning 1 KVA UPS line offline or interactive, make- Numeric orLuminous orMicrotek.', 'B-2', '2.000', 'Number', '14000.00', 'Consignee', 3, '2023-04-04', 1, 0, 0),
(300, 7, 'Installation of all equipments mentioned in schedule B which includes any civil work & electrical work. Electrical power point as required at site & installation wire length up to 50 mtrs.', 'B-3', '3.000', 'Job', '10000.00', 'Consignee', 4, '2023-04-04', 1, 0, 0),
(301, 7, 'Transportation charge (Boom barriers)', 'B-4', '1.000', 'Set', '15000.00', 'Consignee', 4, '2023-04-04', 1, 0, 0),
(302, 7, 'Comprehensive AMC of whole system of this schedule (B) for 2 years from the expiry of warranty period.', 'B-5', '1.000', 'Set', '96300.00', 'Consignee', 5, '2023-04-04', 1, 0, 0),
(303, 9, 'Supply of Out Door HD PTZ Camera.', '1', '3.000', 'Number', '45000.00', 'Consignee', 1, '2023-04-06', 1, 0, 0),
(304, 9, 'Supply of In Door HD PTZ camera.', '2', '3.000', 'Number', '45000.00', 'Consignee', 1, '2023-04-06', 1, 0, 0),
(305, 9, 'Supply of Out Door HD IP Fixed Camera.', '3', '1.000', 'Number', '21000.00', 'Consignee', 1, '2023-04-06', 1, 0, 0),
(306, 9, 'Supply of In Door HD IP fixed Camera.', '4', '9.000', 'Number', '23000.00', 'Consignee', 1, '2023-04-06', 1, 0, 0),
(307, 9, '32 CH NVR: Supply of NVR orCamera Server, Database Server With Rajd Facility, Video analyics Server working in redundant configuration  or fail safe operation, each complete with HDD and all accessories.', '5', '1.000', 'Number', '60000.00', 'Consignee', 3, '2023-04-06', 1, 0, 0),
(308, 9, 'Supply of Screen Display 32\" HD LED Monitor.', '6', '1.000', 'Number', '35000.00', 'Consignee', 1, '2023-04-06', 1, 0, 0),
(309, 9, 'Equipment rack (6 U) Wall mount with power strip, tray and fans etc.', '7', '1.000', 'Number', '10000.00', 'Consignee', 3, '2023-04-06', 1, 0, 0),
(310, 9, 'UPS (on line) 2 KVA with battery and Rack, One Hour backup.', '10', '1.000', 'Number', '52000.00', 'Consignee', 3, '2023-04-06', 1, 0, 0),
(311, 9, 'Conduit Pipe (ISI Mark) with laying charge.', '9', '600.000', 'meter', '48.00', 'Consignee', 3, '2023-04-06', 1, 0, 0),
(312, 9, 'Cat 6 Cable with laying charge.', '8', '600.000', 'meter', '48.00', 'Consignee', 3, '2023-04-06', 1, 0, 0),
(313, 9, 'Installation and Commissioning with other accessories (POE switchs, Connectors, fitting accessories etc.)', '11', '1.000', 'Number', '40000.00', 'Consignee', 3, '2023-04-06', 1, 0, 0),
(314, 8, 'Supply of Out Door HD PTZ Camera.', '1', '3.000', 'Number', '45000.00', 'Consignee', 1, '2023-04-06', 1, 0, 0),
(315, 8, 'Supply of In Door HD PTZ camera.', '2', '3.000', 'Number', '45000.00', 'Consignee', 1, '2023-04-06', 1, 0, 0),
(316, 8, 'Supply of Out Door HD IP Fixed Camera.', '3', '1.000', 'Number', '21000.00', 'Consignee', 1, '2023-04-06', 1, 0, 0),
(317, 8, 'Supply of In Door HD IP fixed Camera.', '4', '9.000', 'Number', '23000.00', 'Consignee', 1, '2023-04-06', 1, 0, 0),
(318, 8, '32 CH NVR: Supply of NVR orCamera Server, Database Server With Rajd Facility, Video analyics Server working in redundant configuration  or fail safe operation, each complete with HDD and all accessories.', '5', '1.000', 'Number', '60000.00', 'Consignee', 1, '2023-04-06', 1, 0, 0),
(319, 8, 'Supply of Screen Display 32\" HD LED Monitor.', '6', '1.000', 'Number', '35000.00', 'Consignee', 1, '2023-04-06', 1, 0, 0),
(320, 8, 'Equipment rack (6 U) Wall mount with power strip, tray and fans etc.', '7', '1.000', 'Number', '10000.00', 'Consignee', 1, '2023-04-06', 1, 0, 0),
(321, 8, 'Cat 6 Cable with laying charge.', '8', '600.000', 'meter', '48.00', 'Consignee', 3, '2023-04-06', 1, 0, 0),
(322, 8, 'Conduit Pipe (ISI Mark) with laying charge.', '9', '600.000', 'meter', '48.00', 'Consignee', 3, '2023-04-06', 1, 0, 0),
(323, 8, 'UPS (On line) 2 KVA with battery and Rack, One Hour backup.', '10', '1.000', 'Number', '52000.00', 'Consignee', 1, '2023-04-06', 1, 0, 0),
(324, 8, 'Installation and Commissioning with other accessories (POE switches, Connectors, fitting accessories etc.)', '11', '1.000', 'Number', '40000.00', 'Consignee', 3, '2023-04-06', 1, 0, 0),
(325, 6, 'Post warranty CAMC for 5 years.', '12', '1.000', 'Number', '75000.00', 'Consignee', 5, '2023-04-08', 1, 0, 0),
(326, 8, 'Post warranty CAMC for 5 years.', '12', '1.000', 'Number', '75000.00', 'Consignee', 5, '2023-04-08', 1, 0, 0),
(327, 9, 'Post warranty CAMC for 5 years.', '12', '1.000', 'Number', '75000.00', 'Consignee', 5, '2023-04-08', 1, 0, 0),
(365, 10, 'Supply, installation, testing and commissioning of large format 42” LCD orLED display monitor as per clause 9.0 of RDSO orSPN orTC or65 or 2016, Rev.4.0 or latest.', 'A-2', '4.000', 'Number', '77447.60', 'Consignee', 3, '2023-04-15', 1, 0, 0),
(366, 10, 'Supply, installation, testing and commissioning of Network video management server with printer and all accessories i.e., Housing and mount as per clause number 10.0 of RDSO orSPN orTC or65 or2016 Rev.4.0 or latest .', 'A-3', '1.000', 'Number', '273833.76', 'Consignee', 3, '2023-04-15', 1, 0, 0),
(367, 10, 'Supply, installation testing & commissioning of Server Hardware for network video recording with all accessories as per clause 10.1 of RDSO orSPN orTC or65 or2016. Rev.4.0 or latest.', 'A-4', '1.000', 'Number', '294432.24', 'Consignee', 3, '2023-04-15', 1, 0, 0);
INSERT INTO `demand_details` (`MaterialID`, `OrderID`, `MaterialName`, `SrNo`, `Qty`, `Unit`, `Rate`, `InspectingAuth`, `BillingType`, `DemandDate`, `Status`, `OnSite`, `Issued`) VALUES
(368, 10, 'Supply, Installation, testing and commissioning of Server Hardware for network video analytics &Face Recognition with all accessories as per clause 10.1 of RDSO orSPN orTC or65 or2016. Rev4.0 or latest.', 'A-5', '1.000', 'Number', '284547.15', 'Consignee', 3, '2023-04-15', 1, 0, 0),
(369, 10, 'Supply, installation, testing and commissioning of PC Workstation for viewing, monitoring & system management as per clause 11.0 RDSO orSPN orTC or65 or2016, Rev.4.0 or latest. LED monitor 24’ size with UHD resolution to be provided along with PC workstation.', 'A-6', '2.000', 'Number', '76367.71', 'Consignee', 3, '2023-04-15', 1, 0, 0),
(370, 10, 'Supply, installation, testing and commissioning of external storage with all accessories as per clause no.12.0 of RDSO orSPN orTC or65 or2016, Rev.4.0 or latest. Hardware and software (clause no.12.0) Capable of storing video for thirty days for the stations) with minimum 72 TB RAW usable storage capacity ager RAID 5 or6 Configuration. ', 'A-7', '2.000', 'Number', '729128.98', 'R.I.T.E.S. LTD', 3, '2023-04-15', 1, 0, 0),
(371, 10, 'Supply of 8 ports 10 or100 or1000 Base T PoE with 2 or more 1000 Base X ports Layer 2 Switch with Required Fiber module (Configuration of ports shall be as per site requirement), switch as per clause 13.0 of RDSO orSPN orTC or65 or2016 Rev.4.0 or latest .', 'A-9', '18.000', 'Number', '24329.29', 'Consignee', 1, '2023-04-15', 1, 0, 0),
(372, 10, 'Installation, testing and Commissioning of 8 ports 10 or100 or1000Base T PoE with 2 or more 1000 Base X ports Layer 2 Switch with Required fiber module as per site requirement, switch as per clause 13.0 of RDSO orSPN orTC or65 or2016 Rev.4.0 or latest.', 'A-10', '18.000', 'Number', '3707.88', 'Consignee', 4, '2023-04-15', 1, 0, 0),
(373, 10, 'Supply & installation of Digital keyboard (joystick) with all accessories compatible with PTZ camera as per clause 8.0 of RDSO orSPN orTC or65 or16 Rev.4.0 or latest. ', 'A-11', '1.000', 'Number', '2372.80', 'Consignee', 3, '2023-04-15', 1, 0, 0),
(374, 10, 'Supply of 24 port Layer 3 managed switch with 16 nos. 1000baseXSM SFP port. 4 nos. 1000 base T Ethernet. 1 Stackable dedicated 10G port with stack cable with fiber optical module (Configuration of ports shall be as per site requirement) with all accessories as per clause no. 14.0 of RDSO Spec RDSO orSPN orTC or65 or2016 (Rev 4.0) or latest.', 'A-12', '1.000', 'Number', '170002.80', 'Consignee', 1, '2023-04-15', 1, 0, 0),
(375, 10, 'Installation. Testing and Commissioning of 24 ports Layer 3 managed switch.', 'A-13', '1.000', 'Number', '6296.40', 'Consignee', 4, '2023-04-15', 1, 0, 0),
(376, 10, 'Supply of STP (shielded twisted pair) CAT-6 cable as per clause 17.1 of RDSO specification No. RDSO orSPN orTC or 65 or2016 Rev.4.0 or latest. ', 'A-14', '3000.000', 'meter', '33.48', 'Consignee', 1, '2023-04-15', 1, 0, 0),
(377, 10, 'Supply of Optic fiber cable single mode 6 fiber armored cable as per clause 5.15.12 of RDSO orSPN orTC or 65 or2009 or latest.', 'A-15', '5000.000', 'meter', '45.49', 'Consignee', 1, '2023-04-15', 1, 0, 0),
(378, 10, 'Laying of OFC orCAT-6 orUTP cable in 1\" PVC conduit orcasing capping ISI marked heavy (HMS) series as per IS:9537-part III1983 standard or latest with suitable clamping & other accessories  (PVC conduit or casing capping  with suitable clamping & other accessories to Be  supplied by Contractor).', 'A-16', '8000.000', 'meter', '23.40', 'Consignee', 4, '2023-04-15', 1, 0, 0),
(379, 10, 'Supply of Power Cable 3 Core 2.5 sq mm, multi strand copper conductor, PVC insulated, Armored, confirming to IS: 1554 Part-I as per clause 17.3 of RDSO specification No. RDSO or SPN orTC or65 or2016 Rev.4.0 or latest.', 'A-17', '4500.000', 'meter', '109.21', 'Consignee', 1, '2023-04-15', 1, 0, 0),
(380, 10, 'Laying of Power cable in 1\" PVC  conduit  orcasing capping ISI marked heavy (HMS) series as per IS:9537- part III1983 standard or latest with suitable clamping & other accessories (PVC conduit  orcasing capping with suitable clamping & other accessories to be -supplied by Contractor).', 'A-18', '4500.000', 'meter', '36.77', 'Consignee', 4, '2023-04-15', 1, 0, 0),
(381, 10, 'Supply & Installation of 19 42U smart rack of APW president or rittal or HCL make. rack with all accessories like electrical fitting, fan tray, patch panel etc. for housing IP storage unit as per technical specification given.', 'A-19', '1.000', 'Number', '56053.51', 'Consignee', 3, '2023-04-15', 1, 0, 0),
(382, 10, 'Supply of rack form factor 9U wall mount 19\" equipment rack, with power supply board, protection cable ground, front cover glass make by VERLACK or APW PRESIDENT or Rittal or HCL.', 'A-20', '19.000', 'Number', '8124.48', 'Consignee', 1, '2023-04-15', 1, 0, 0),
(383, 10, 'Supply of furniture for surveillance control room a) Executive chair revolving (Godrej Make Model no. PCH-7102R or better) bearing series low back floating chair with normal arms cushioned chair -3 Nos, (b) Executive table size. 66\"X36X 30\" with 3 drawers one side, lockers cabinet on other side - 3 Nos (Godrej make model No. T- 104 or better).', 'A-21', '1.000', 'Set', '24480.00', 'Consignee', 1, '2023-04-15', 1, 0, 0),
(384, 10, 'Supply of fiber optic patching cord FC-FC orFC-PC orFC-SC orLC-SC orLC-LC (10 Mtrs length) as per site requirement or Site Engineer. MAKE- Priston or STS or better.', 'A-22', '60.000', 'Number', '1049.93', 'Consignee', 1, '2023-04-15', 1, 0, 0),
(385, 10, 'Supply of UPS (online) 10 KVA capacity as per RDSO Specification no. RDSO orPE orSPEC orPS or0023·2001 (Rev-0) Amendment no. 2 or latest.', 'A-23', '1.000', 'Number', '221760.00', 'Consignee', 1, '2023-04-15', 1, 0, 0),
(386, 10, 'installation, Testing & commissioning of UPS (online) 10 KVA capacity as per RDSO Specification no. RDSO orPE or SPEC orPS or0023-2001(Rev-0) Amendt no. 2 or latest Installation includes prov. or required UPS points through. power distribution panel consisting or required MCBs, Switches and Sockets or suitable ratings with all wiring & termination accessories in control. Room to run the system on UPS.', 'A-24', '1.000', 'Number', '6600.00', 'Consignee', 4, '2023-04-15', 1, 0, 0),
(387, 10, 'Supply of Program maintenance console for system monitoring as per specification attached. Make HP or Dell or Sony.', 'A-26', '1.000', 'Number', '36445.59', 'Consignee', 1, '2023-04-15', 1, 0, 0),
(388, 10, 'Supply and installation of maintenance free earth as per specs. RDSO orSPN or197 or2008 or latest with amendments, consisting of i) Copper bonded steel Earth electrodes 3.0mtr. long, dia 17.0mm - 04 Nos. ii) Earth Enhancing compound (Bags sealed 35 Kg per electrode). iii) Copper bus bar at earth electrode 25mm width x 6mm thick x 150mm long one per electrode iv) Copper tape of size 25mm x 2mm of required length as per location for interconnecting earth electrode - 04 Nos. v) Copper bus bar near equipment 25mm width x 6mm thick x 300mm long (MEEB) - 2 Nos. vi) Supply of PVC Insulated multistrand 35 Sq.mm Copper Cable as per IS: 694 to connect Main Earth Busbar to Busbar of Main Earth Electrode in duplicate. -100 mtr. vii) Supply of PVC · Insulated multistrand 10 Sq.mm Copper Cable as per IS: 694 to connect Individual equipment to Main Earth Busbar. - 100 mtr. viii) Inspection Chamber of size 300X300X300 mm (Inside dimension) concrete box with smooth cement plaster finish, A concrete lid, painted black; approx. 50 mm thick.', 'A-27', '2.000', 'Set', '26290.66', 'Consignee', 3, '2023-04-15', 1, 0, 0),
(389, 10, 'Supply, installation testing & commissioning of software consisting of the following requirement: - a) Network video management b) Network video recording c) video analytics d) Graphical user interface client software e) Face recognition software. License to Support for (i)32 Camera for video analytics.(ii) 6 Camera for Face recognition with 50000 Face Database.(iii) User licenses for viewing and Playback videos.With lifetime license validity as per clause 18.0,19.0 &20.0 of RDSO orSPN orTC or65 or2016 Rev. 4.0 or latest network management software for monitoring and troubleshooting the network also to be provided with 2 copy backup CD per camera point price for software for any decreases or increases (Clause no. 18.0and 20.0) with licensing to various features and to support the entire installed camera at 1 station.', 'A-8', '1.000', 'Lot', '1110493.60', 'R.I.T.E.S. LTD', 3, '2023-04-15', 1, 0, 0),
(390, 10, 'Cutting of trench on or across platform for a depth of 10 cm. and a width of 10 cm with marble cutting machine and filling the trench after cable laying and restoring the surface with plaster etc. as per instruction given by railway site engineer.', '25-a', '600.000', 'meter', '81.48', 'Consignee', 4, '2023-04-15', 1, 0, 0),
(391, 10, 'Excavation and refilling of trench to the level of ground with rammed earth so as to not to form a drain 0.3 mtr. Wide & 1 mtr. Deep from the foot or the rail or stone paved  or Concrete or Platform earth profile whichever is lower, on other side of the station along the track It shall confirm to the safe distance as per telecom practice and cable plan in all type or soil .it also includes clearance or roots of trees & bushes . Execution as per Railway site engineer.', '25-b', '500.000', 'meter', '81.48', 'Consignee', 4, '2023-04-15', 1, 0, 0),
(392, 10, 'Laying of cable of different sizes and corage in all different type of trench. ', '25-c', '1100.000', 'meter', '81.48', 'Consignee', 4, '2023-04-15', 1, 0, 0),
(393, 10, 'Supply, installation, testing and commissioning of all cameras along with housing and mount as per RDSO Specification RDSO orSPN or TC or65 or2016, Rev. 4.0 or latest. Inspection or material.(a) P orT orZ (Pan orTift orZoom) IP Color Camera.(10 Nos.) (b)Full HD Fixed BOX Type IP Color camera.(38 Nos.) (c)4K UHD Fixed Box Type IP Color camera(6 Nos.)', 'A-1', '54.000', 'Number', '64951.12', 'RDSO', 3, '2023-04-15', 1, 0, 0),
(394, 10, 'AMC of Full HD Fixed Box Type IP Colour Camera Varifocal Lens, Housing and Mount as per RDSO clause 5.0 of RDSO orSPN orTC or65 or 2016 Rev.4 .0 or latest.(Oty 38 No.per year x 5 Years = 190 Nos for 5 years.)', 'B-1', '190.000', 'Number', '2773.03', 'Consignee', 5, '2023-04-15', 1, 0, 0),
(395, 10, 'AMC of Full HD P orT orZ IP Colour camera along with housing and mount as per clause 7.0 of RDSO orSPN orTC or65 or2016 Rev 4 .0 or latest.(Qty 10 No. per year X 5 Years =50 No s for 5 years )', 'B-2', '50.000', 'Number', '10180.78', 'Consignee', 5, '2023-04-15', 1, 0, 0),
(396, 10, 'AMC of 4K UHD Fixed Box Type IP Colour Camera. Varifocal Lens. Housing and Mount as per RDSO clause·5.0 of RDSO orSPN orTC or65 or2016 Rev 4.0 or latest. (Qty.6 No per year X 5 Years = 30 No’s for 5 years )', 'B-3', '30.000', 'Number', '7437.95', 'Consignee', 5, '2023-04-15', 1, 0, 0),
(397, 10, 'AMC of 42\" Large Format Display Monitor (LED) as per clause 9.0 of RDSO orSPN orTC or65 or2016 Rev.4.0 or latest. (Qty.4. No per year X 5 Years: 20 No’s for 5 years', 'B-4', '20.000', 'Number', '5560.34', 'Consignee', 5, '2023-04-15', 1, 0, 0),
(398, 10, 'AMC of Network video management server with printer and all accessories i.e., housing and mount as per clause no 10.0 of RDSO orSPN orTC or65 or2016 Rev.4.0 or latest. (Qty. 1 No. per year X 5 Years = 5 No’s for 5 years)', 'B-5', '5.000', 'Number', '19659.86', 'Consignee', 5, '2023-04-15', 1, 0, 0),
(399, 10, 'AMC of Server Hardware for Network video recording with all accessories as per clause 10.1 of RDSO orSPN orTC or65 or2016 Rev.4.0 or latest . (Qty. 1 No per year X 5 Years = 5 No’s for 5 years.)', 'B-6', '5.000', 'Number', '21138.72', 'Consignee', 5, '2023-04-15', 1, 0, 0),
(400, 10, 'AMC of Server Hardware for Network video analytics & Face Recognition with all accessories as per clause 10.1 of RDSO orSPN orTC or65 or2016 Rev.4.0 or latest. (Qty 1 No. per year X 5 Years = 5 No’s for 5 years.)', 'B-7', '5.000', 'Number', '20213.64', 'Consignee', 5, '2023-04-15', 1, 0, 0),
(401, 10, 'AMC of PC Workstation viewing monitoring and system management as per clause 11.0 or RDSO orSPN orTC or65 or2016 Rev. 4.0 or latest.(Oty 2.No. per year x 5 Years = 10 No s for 5 years.)', 'B-8', '10.000', 'Number', '5482.81', 'Consignee', 5, '2023-04-15', 1, 0, 0),
(402, 10, 'AMC of external storage with all accessories as per clause no. 12.0 of RDSO orSPN orTC or65 or2016, Rev 4.0 or latest Hardware and software clause no 12.0) (Capable of storing video for thirty days for the stations) With minimum 72 TB RAW usable storage capacity ager RAID 5 or6 configuration.(Qty 2 No.per year X 5 Years = 10 No s for 5 years)', 'B-9', '10.000', 'Number', '52347.72', 'Consignee', 5, '2023-04-15', 1, 0, 0),
(403, 10, 'AMC or software Consisting or the following requirements: - a) Network video management b) Network video recording. c) Video analytics d) Graphical user Interface client software e) Face recognition software. License to support for (i)32 Camera for Video Analytics (ii) 6 Cameras for Face Recognition with 50,000 Face Database,.(iii) 5 User Licenses for Viewing and Playback videos.With life time license validity as per clause 18.0,19.0 and 20.0 or RDSO or SPN orTC or65 or2016 Rev.4.0 or latest Network management software for monitoring and troubleshooting the network also to be provided with 2 copy backup CD per camera point price for software for any decrease or increase (Clause no 18.0 and 20. 0) with licensing to various features and to support the entire installed camera at 01 station Inspection by Consignee. (Qty 1 No per year X 5 Years = 5 Nos for 5 years)', 'B-10', '5.000', 'Lot', '79727.75', 'Consignee', 5, '2023-04-15', 1, 0, 0),
(404, 10, 'AMC of 8 ports 10 or100 or1000 Base T PoE with 2 or mere 1000 Base X ports Layer 2 Switch with Required Fiber module (Configuration of ports shall be as per site requirement), switch as per clause 13.0 of RDSO or SPN orTC or65 or2016 Rev.4.0 or latest. (Qty. 18 No. per year X 5 Years =90 Nos for 5 years )', 'B-11', '90.000', 'Number', '1746.72', 'Consignee', 5, '2023-04-15', 1, 0, 0),
(405, 10, 'AMC of Digital keyboard (Joystick) with all accessories compatible with PTZ camera as per clause 8.0 of RDSO orSPN orTC or65 or2016 Rev 4.0 or latest. (Qty 1 No. per year X 5 Years =5 Nos for 5 years)', 'B-12', '5.000', 'Number', '170.35', 'Consignee', 5, '2023-04-15', 1, 0, 0),
(406, 10, 'AMC of 24 port Layer 3 managed switch with 16 nos. 1000 base X SM SFP port. 4 nos. 1000 base T Ethernet, 1 Stackable dedicated 10G port with stack cable with fiber optical module (Configuration of ports shall be as per site requirement) with all accessories as per clause no 14.0 of RDSO Spec RDSO or SPN orTC or65 or2016 (Rev .4.0) or latest. (Qty. 1 No per year X 5 Years =5 No s for 5 years)', 'B-13', '5.000', 'Number', '12205.33', 'Consignee', 5, '2023-04-15', 1, 0, 0),
(407, 10, 'AM of UPS (Online) 10 KVA Capacity as per RDSO Specification no RDSO orPE orSPEC orPS or0023 -2001 (Rev-0) Amendment no 2 or latest. (Oty 1 No per year X 5 Years =5Nos for 5 years)', 'B-14', '5.000', 'Number', '15921.23', 'Consignee', 5, '2023-04-15', 1, 0, 0),
(408, 5, 'Excavation of cable trench in all kinds of soil except hard rocky areas including clearing of roots of trees, rocks, bushes etc. to a depth of 1.0 Mtrs and to a width of 0.3 Mtrs. Laying of cables is not included in this schedule.', 'IIA-1', '400.000', 'meter', '34.65', 'Consignee', 4, '2023-04-18', 1, 0, 0),
(409, 5, 'Laying of signaling orpower ortelecommunication cables as per cable plan in cable trenches, masonry ducts, RCC Pipes, DWC pipes, GI Pipes etc.(Supply of cables is not included in this schedule).', 'IIA-2', '400.000', 'meter', '9.83', 'Consignee', 4, '2023-04-18', 1, 0, 0),
(410, 5, 'Refilling of cable trench 1m depth by 0.3m width throughout, with earth after laying of cables, and consolidating the trench by ramming and leveling.', 'IIA-3', '400.000', 'meter', '8.33', 'Consignee', 4, '2023-04-18', 1, 0, 0),
(411, 5, 'Provision of earth electrodes as per drawing No.SG orSN or02 or13 and earthing of metallic sheath and armour of all cables in all apparatus cases, relay room, equipment room, SMs room for block and control, and earthing of all equipments in apparatus cases, power room, relay rack, cable termination rack, control panel, signals, lever frames with MS flat 35mm X 6mm or19c cable (MS flat for closure by areas and MS flat or19c cable combination for farther areas) as per the instructions of Railway representative at site. The work includes painting of earth resistance value on the earth pit. Supply of 19C cable is not covered in the scope of this schedule.[MS flat for earthing 35mm X 6mm, cement, GI earth electrodes, common salt, charcoal, country bricks, river sand, soldering materials and all other miscellaneous materials required for the work shall be supplied by the Contractor].', 'IIA-4', '8.000', 'Number', '1799.00', 'Consignee', 4, '2023-04-18', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `designation`
--

CREATE TABLE `designation` (
  `DesignationID` int NOT NULL,
  `Designation` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `designation`
--

INSERT INTO `designation` (`DesignationID`, `Designation`) VALUES
(1, 'Admin'),
(2, 'Field Employee'),
(3, 'Backend Support');

-- --------------------------------------------------------

--
-- Table structure for table `district`
--

CREATE TABLE `district` (
  `DistrictCode` int NOT NULL,
  `StateCode` int DEFAULT NULL,
  `DistrictName` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `district`
--

INSERT INTO `district` (`DistrictCode`, `StateCode`, `DistrictName`) VALUES
(1, 35, 'Nicobar'),
(2, 35, 'North Middle Andaman'),
(3, 35, 'South Andaman'),
(4, 28, 'Anantapur'),
(5, 28, 'Chittoor'),
(6, 28, 'East Godavari'),
(7, 28, 'Alluri Sitarama Raju'),
(8, 28, 'Anakapalli'),
(9, 28, 'Annamaya'),
(10, 28, 'Bapatla'),
(11, 28, 'Eluru'),
(12, 28, 'Guntur'),
(13, 28, 'Kadapa'),
(14, 28, 'Kakinada'),
(15, 28, 'Konaseema'),
(16, 28, 'Krishna'),
(17, 28, 'Kurnool'),
(18, 28, 'Manyam'),
(19, 28, 'N T Rama Rao'),
(20, 28, 'Nandyal'),
(21, 28, 'Nellore'),
(22, 28, 'Palnadu'),
(23, 28, 'Prakasam'),
(24, 28, 'Sri Balaji'),
(25, 28, 'Sri Satya Sai'),
(26, 28, 'Srikakulam'),
(27, 28, 'Visakhapatnam'),
(28, 28, 'Vizianagaram'),
(29, 28, 'West Godavari'),
(30, 12, 'Anjaw'),
(31, 12, 'Changlang'),
(32, 12, 'Dibang Valley'),
(33, 12, 'East Kameng'),
(34, 12, 'East Siang'),
(35, 12, 'Kamle'),
(36, 12, 'Kra Daadi'),
(37, 12, 'Kurung Kumey'),
(38, 12, 'Lepa Rada'),
(39, 12, 'Lohit'),
(40, 12, 'Longding'),
(41, 12, 'Lower Dibang Valley'),
(42, 12, 'Lower Siang'),
(43, 12, 'Lower Subansiri'),
(44, 12, 'Namsai'),
(45, 12, 'Pakke Kessang'),
(46, 12, 'Papum Pare'),
(47, 12, 'Shi Yomi'),
(48, 12, 'Siang'),
(49, 12, 'Tawang'),
(50, 12, 'Tirap'),
(51, 12, 'Upper Siang'),
(52, 12, 'Upper Subansiri'),
(53, 12, 'West Kameng'),
(54, 12, 'West Siang'),
(55, 18, 'Bajali'),
(56, 18, 'Baksa'),
(57, 18, 'Barpeta'),
(58, 18, 'Biswanath'),
(59, 18, 'Bongaigaon'),
(60, 18, 'Cachar'),
(61, 18, 'Charaideo'),
(62, 18, 'Chirang'),
(63, 18, 'Darrang'),
(64, 18, 'Dhemaji'),
(65, 18, 'Dhubri'),
(66, 18, 'Dibrugarh'),
(67, 18, 'Dima Hasao'),
(68, 18, 'Goalpara'),
(69, 18, 'Golaghat'),
(70, 18, 'Hailakandi'),
(71, 18, 'Hojai'),
(72, 18, 'Jorhat'),
(73, 18, 'Kamrup Metropolitan'),
(74, 18, 'Kamrup Rural'),
(75, 18, 'Karbi Anglong'),
(76, 18, 'Karimganj'),
(77, 18, 'Kokrajhar'),
(78, 18, 'Lakhimpur'),
(79, 18, 'Majuli'),
(80, 18, 'Morigaon'),
(81, 18, 'Nagaon'),
(82, 18, 'Nalbari'),
(83, 18, 'Sivasagar'),
(84, 18, 'Sonitpur'),
(85, 18, 'South Salmara-Mankachar'),
(86, 18, 'Tamulpur'),
(87, 18, 'Tinsukia'),
(88, 18, 'Udalguri'),
(89, 18, 'West Karbi Anglong'),
(90, 10, 'Araria'),
(91, 10, 'Arwal'),
(92, 10, 'Aurangabad'),
(93, 10, 'Banka'),
(94, 10, 'Begusarai'),
(95, 10, 'Bhagalpur'),
(96, 10, 'Bhojpur'),
(97, 10, 'Buxar'),
(98, 10, 'Darbhanga'),
(99, 10, 'East Champaran'),
(100, 10, 'Gaya'),
(101, 10, 'Gopalganj'),
(102, 10, 'Jamui'),
(103, 10, 'Jehanabad'),
(104, 10, 'Kaimur'),
(105, 10, 'Katihar'),
(106, 10, 'Khagaria'),
(107, 10, 'Kishanganj'),
(108, 10, 'Lakhisarai'),
(109, 10, 'Madhepura'),
(110, 10, 'Madhubani'),
(111, 10, 'Munger'),
(112, 10, 'Muzaffarpur'),
(113, 10, 'Nalanda'),
(114, 10, 'Nawada'),
(115, 10, 'Patna'),
(116, 10, 'Purnia'),
(117, 10, 'Rohtas'),
(118, 10, 'Saharsa'),
(119, 10, 'Samastipur'),
(120, 10, 'Saran'),
(121, 10, 'Sheikhpura'),
(122, 10, 'Sheohar'),
(123, 10, 'Sitamarhi'),
(124, 10, 'Siwan'),
(125, 10, 'Supaul'),
(126, 10, 'Vaishali'),
(127, 10, 'West Champaran'),
(128, 4, 'Chandigarh'),
(129, 22, 'Balod'),
(130, 22, 'Baloda Bazar'),
(131, 22, 'Balrampur'),
(132, 22, 'Bastar'),
(133, 22, 'Bemetara'),
(134, 22, 'Bijapur'),
(135, 22, 'Bilaspur'),
(136, 22, 'Dantewada'),
(137, 22, 'Dhamtari'),
(138, 22, 'Durg'),
(139, 22, 'Gariaband'),
(140, 22, 'Gaurela Pendra Marwahi'),
(141, 22, 'Janjgir Champa'),
(142, 22, 'Jashpur'),
(143, 22, 'Kabirdham'),
(144, 22, 'Kanker'),
(145, 22, 'Khairagarh'),
(146, 22, 'Kondagaon'),
(147, 22, 'Korba'),
(148, 22, 'Koriya'),
(149, 22, 'Mahasamund'),
(150, 22, 'Manendragarh'),
(151, 22, 'Mohla Manpur'),
(152, 22, 'Mungeli'),
(153, 22, 'Narayanpur'),
(154, 22, 'Raigarh'),
(155, 22, 'Raipur'),
(156, 22, 'Rajnandgaon'),
(157, 22, 'Sakti'),
(158, 22, 'Sarangarh Bilaigarh'),
(159, 22, 'Sukma'),
(160, 22, 'Surajpur'),
(161, 22, 'Surguja'),
(162, 26, 'Dadra and Nagar Haveli'),
(163, 26, 'Daman'),
(164, 26, 'Diu'),
(165, 7, 'Central Delhi'),
(166, 7, 'East Delhi'),
(167, 7, 'New Delhi'),
(168, 7, 'North Delhi'),
(169, 7, 'North East Delhi'),
(170, 7, 'North West Delhi'),
(171, 7, 'Shahdara'),
(172, 7, 'South Delhi'),
(173, 7, 'South East Delhi'),
(174, 7, 'South West Delhi'),
(175, 7, 'West Delhi'),
(176, 30, 'North Goa'),
(177, 30, 'South Goa'),
(178, 24, 'Ahmedabad'),
(179, 24, 'Amreli'),
(180, 24, 'Anand'),
(181, 24, 'Aravalli'),
(182, 24, 'Banaskantha'),
(183, 24, 'Bharuch'),
(184, 24, 'Bhavnagar'),
(185, 24, 'Botad'),
(186, 24, 'Chhota Udaipur'),
(187, 24, 'Dahod'),
(188, 24, 'Dang'),
(189, 24, 'Devbhoomi Dwarka'),
(190, 24, 'Gandhinagar'),
(191, 24, 'Gir Somnath'),
(192, 24, 'Jamnagar'),
(193, 24, 'Junagadh'),
(194, 24, 'Kheda'),
(195, 24, 'Kutch'),
(196, 24, 'Mahisagar'),
(197, 24, 'Mehsana'),
(198, 24, 'Morbi'),
(199, 24, 'Narmada'),
(200, 24, 'Navsari'),
(201, 24, 'Panchmahal'),
(202, 24, 'Patan'),
(203, 24, 'Porbandar'),
(204, 24, 'Rajkot'),
(205, 24, 'Sabarkantha'),
(206, 24, 'Surat'),
(207, 24, 'Surendranagar'),
(208, 24, 'Tapi'),
(209, 24, 'Vadodara'),
(210, 24, 'Valsad'),
(211, 6, 'Ambala'),
(212, 6, 'Bhiwani'),
(213, 6, 'Charkhi Dadri'),
(214, 6, 'Faridabad'),
(215, 6, 'Fatehabad'),
(216, 6, 'Gurugram'),
(217, 6, 'Hisar'),
(218, 6, 'Jhajjar'),
(219, 6, 'Jind'),
(220, 6, 'Kaithal'),
(221, 6, 'Karnal'),
(222, 6, 'Kurukshetra'),
(223, 6, 'Mahendragarh'),
(224, 6, 'Nuh'),
(225, 6, 'Palwal'),
(226, 6, 'Panchkula'),
(227, 6, 'Panipat'),
(228, 6, 'Rewari'),
(229, 6, 'Rohtak'),
(230, 6, 'Sirsa'),
(231, 6, 'Sonipat'),
(232, 6, 'Yamunanagar'),
(233, 2, 'Bilaspur'),
(234, 2, 'Chamba'),
(235, 2, 'Hamirpur'),
(236, 2, 'Kangra'),
(237, 2, 'Kinnaur'),
(238, 2, 'Kullu'),
(239, 2, 'Lahaul Spiti'),
(240, 2, 'Mandi'),
(241, 2, 'Shimla'),
(242, 2, 'Sirmaur'),
(243, 2, 'Solan'),
(244, 2, 'Una'),
(245, 1, 'Anantnag'),
(246, 1, 'Bandipora'),
(247, 1, 'Baramulla'),
(248, 1, 'Budgam'),
(249, 1, 'Doda'),
(250, 1, 'Ganderbal'),
(251, 1, 'Jammu'),
(252, 1, 'Kathua'),
(253, 1, 'Kishtwar'),
(254, 1, 'Kulgam'),
(255, 1, 'Kupwara'),
(256, 1, 'Poonch'),
(257, 1, 'Pulwama'),
(258, 1, 'Rajouri'),
(259, 1, 'Ramban'),
(260, 1, 'Reasi'),
(261, 1, 'Samba'),
(262, 1, 'Shopian'),
(263, 1, 'Srinagar'),
(264, 1, 'Udhampur'),
(265, 20, 'Bokaro'),
(266, 20, 'Chatra'),
(267, 20, 'Deoghar'),
(268, 20, 'Dhanbad'),
(269, 20, 'Dumka'),
(270, 20, 'East Singhbhum'),
(271, 20, 'Garhwa'),
(272, 20, 'Giridih'),
(273, 20, 'Godda'),
(274, 20, 'Gumla'),
(275, 20, 'Hazaribagh'),
(276, 20, 'Jamtara'),
(277, 20, 'Khunti'),
(278, 20, 'Koderma'),
(279, 20, 'Latehar'),
(280, 20, 'Lohardaga'),
(281, 20, 'Pakur'),
(282, 20, 'Palamu'),
(283, 20, 'Ramgarh'),
(284, 20, 'Ranchi'),
(285, 20, 'Sahebganj'),
(286, 20, 'Seraikela Kharsawan'),
(287, 20, 'Simdega'),
(288, 20, 'West Singhbhum'),
(289, 29, 'Bagalkot'),
(290, 29, 'Bangalore Rural'),
(291, 29, 'Bangalore Urban'),
(292, 29, 'Belgaum'),
(293, 29, 'Bellary'),
(294, 29, 'Bidar'),
(295, 29, 'Chamarajanagar'),
(296, 29, 'Chikkaballapur'),
(297, 29, 'Chikkamagaluru'),
(298, 29, 'Chitradurga'),
(299, 29, 'Dakshina Kannada'),
(300, 29, 'Davanagere'),
(301, 29, 'Dharwad'),
(302, 29, 'Gadag'),
(303, 29, 'Kalaburagi'),
(304, 29, 'Hassan'),
(305, 29, 'Haveri'),
(306, 29, 'Kodagu'),
(307, 29, 'Kolar'),
(308, 29, 'Koppal'),
(309, 29, 'Mandya'),
(310, 29, 'Mysore'),
(311, 29, 'Raichur'),
(312, 29, 'Ramanagara'),
(313, 29, 'Shimoga'),
(314, 29, 'Tumkur'),
(315, 29, 'Udupi'),
(316, 29, 'Uttara Kannada'),
(317, 29, 'Vijayanagara'),
(318, 29, 'Vijayapura'),
(319, 29, 'Yadgir'),
(320, 32, 'Alappuzha'),
(321, 32, 'Ernakulam'),
(322, 32, 'Idukki'),
(323, 32, 'Kannur'),
(324, 32, 'Kasaragod'),
(325, 32, 'Kollam'),
(326, 32, 'Kottayam'),
(327, 32, 'Kozhikode'),
(328, 32, 'Malappuram'),
(329, 32, 'Palakkad'),
(330, 32, 'Pathanamthitta'),
(331, 32, 'Thiruvananthapuram'),
(332, 32, 'Thrissur'),
(333, 32, 'Wayanad'),
(334, 31, 'Lakshadweep Islands'),
(335, 23, 'Agar Malwa'),
(336, 23, 'Alirajpur'),
(337, 23, 'Anuppur'),
(338, 23, 'Ashoknagar'),
(339, 23, 'Balaghat'),
(340, 23, 'Barwani'),
(341, 23, 'Betul'),
(342, 23, 'Bhind'),
(343, 23, 'Bhopal'),
(344, 23, 'Burhanpur'),
(345, 23, 'Chachaura'),
(346, 23, 'Chhatarpur'),
(347, 23, 'Chhindwara'),
(348, 23, 'Damoh'),
(349, 23, 'Datia'),
(350, 23, 'Dewas'),
(351, 23, 'Dhar'),
(352, 23, 'Dindori'),
(353, 23, 'Guna'),
(354, 23, 'Gwalior'),
(355, 23, 'Harda'),
(356, 23, 'Hoshangabad'),
(357, 23, 'Indore'),
(358, 23, 'Jabalpur'),
(359, 23, 'Jhabua'),
(360, 23, 'Katni'),
(361, 23, 'Khandwa'),
(362, 23, 'Khargone'),
(363, 23, 'Maihar'),
(364, 23, 'Mandla'),
(365, 23, 'Mandsaur'),
(366, 23, 'Morena'),
(367, 23, 'Nagda'),
(368, 23, 'Narsinghpur'),
(369, 23, 'Neemuch'),
(370, 23, 'Niwari'),
(371, 23, 'Panna'),
(372, 23, 'Raisen'),
(373, 23, 'Rajgarh'),
(374, 23, 'Ratlam'),
(375, 23, 'Rewa'),
(376, 23, 'Sagar'),
(377, 23, 'Satna'),
(378, 23, 'Sehore'),
(379, 23, 'Seoni'),
(380, 23, 'Shahdol'),
(381, 23, 'Shajapur'),
(382, 23, 'Sheopur'),
(383, 23, 'Shivpuri'),
(384, 23, 'Sidhi'),
(385, 23, 'Singrauli'),
(386, 23, 'Tikamgarh'),
(387, 23, 'Ujjain'),
(388, 23, 'Umaria'),
(389, 23, 'Vidisha'),
(390, 27, 'Ahmednagar'),
(391, 27, 'Akola'),
(392, 27, 'Amravati'),
(393, 27, 'Aurangabad'),
(394, 27, 'Beed'),
(395, 27, 'Bhandara'),
(396, 27, 'Buldhana'),
(397, 27, 'Chandrapur'),
(398, 27, 'Dhule'),
(399, 27, 'Gadchiroli'),
(400, 27, 'Gondia'),
(401, 27, 'Hingoli'),
(402, 27, 'Jalgaon'),
(403, 27, 'Jalna'),
(404, 27, 'Kolhapur'),
(405, 27, 'Latur'),
(406, 27, 'Mumbai City'),
(407, 27, 'Mumbai Suburban'),
(408, 27, 'Nagpur'),
(409, 27, 'Nanded'),
(410, 27, 'Nandurbar'),
(411, 27, 'Nashik'),
(412, 27, 'Osmanabad'),
(413, 27, 'Palghar'),
(414, 27, 'Parbhani'),
(415, 27, 'Pune'),
(416, 27, 'Raigad'),
(417, 27, 'Ratnagiri'),
(418, 27, 'Sangli'),
(419, 27, 'Satara'),
(420, 27, 'Sindhudurg'),
(421, 27, 'Solapur'),
(422, 27, 'Thane'),
(423, 27, 'Wardha'),
(424, 27, 'Washim'),
(425, 27, 'Yavatmal'),
(426, 14, 'Bishnupur'),
(427, 14, 'Chandel'),
(428, 14, 'Churachandpur'),
(429, 14, 'Imphal East'),
(430, 14, 'Imphal West'),
(431, 14, 'Jiribam'),
(432, 14, 'Kakching'),
(433, 14, 'Kamjong'),
(434, 14, 'Kangpokpi'),
(435, 14, 'Noney'),
(436, 14, 'Pherzawl'),
(437, 14, 'Senapati'),
(438, 14, 'Tamenglong'),
(439, 14, 'Tengnoupal'),
(440, 14, 'Thoubal'),
(441, 14, 'Ukhrul'),
(442, 17, 'East Garo Hills'),
(443, 17, 'East Jaintia Hills'),
(444, 17, 'East Khasi Hills'),
(445, 17, 'Mairang'),
(446, 17, 'North Garo Hills'),
(447, 17, 'Ri Bhoi'),
(448, 17, 'South Garo Hills'),
(449, 17, 'South West Garo Hills'),
(450, 17, 'South West Khasi Hills'),
(451, 17, 'West Garo Hills'),
(452, 17, 'West Jaintia Hills'),
(453, 17, 'West Khasi Hills'),
(454, 15, 'Aizawl'),
(455, 15, 'Champhai'),
(456, 15, 'Hnahthial'),
(457, 15, 'Khawzawl'),
(458, 15, 'Kolasib'),
(459, 15, 'Lawngtlai'),
(460, 15, 'Lunglei'),
(461, 15, 'Mamit'),
(462, 15, 'Saiha'),
(463, 15, 'Saitual'),
(464, 15, 'Serchhip'),
(465, 13, 'Chumukedima'),
(466, 13, 'Dimapur'),
(467, 13, 'Kiphire'),
(468, 13, 'Kohima'),
(469, 13, 'Longleng'),
(470, 13, 'Mokokchung'),
(471, 13, 'Mon'),
(472, 13, 'Niuland'),
(473, 13, 'Noklak'),
(474, 13, 'Peren'),
(475, 13, 'Phek'),
(476, 13, 'Shamator'),
(477, 13, 'Tseminyu'),
(478, 13, 'Tuensang'),
(479, 13, 'Wokha'),
(480, 13, 'Zunheboto'),
(481, 21, 'Angul'),
(482, 21, 'Balangir'),
(483, 21, 'Balasore'),
(484, 21, 'Bargarh'),
(485, 21, 'Bhadrak'),
(486, 21, 'Boudh'),
(487, 21, 'Cuttack'),
(488, 21, 'Debagarh'),
(489, 21, 'Dhenkanal'),
(490, 21, 'Gajapati'),
(491, 21, 'Ganjam'),
(492, 21, 'Jagatsinghpur'),
(493, 21, 'Jajpur'),
(494, 21, 'Jharsuguda'),
(495, 21, 'Kalahandi'),
(496, 21, 'Kandhamal'),
(497, 21, 'Kendrapara'),
(498, 21, 'Kendujhar'),
(499, 21, 'Khordha'),
(500, 21, 'Koraput'),
(501, 21, 'Malkangiri'),
(502, 21, 'Mayurbhanj'),
(503, 21, 'Nabarangpur'),
(504, 21, 'Nayagarh'),
(505, 21, 'Nuapada'),
(506, 21, 'Puri'),
(507, 21, 'Rayagada'),
(508, 21, 'Sambalpur'),
(509, 21, 'Subarnapur'),
(510, 21, 'Sundergarh'),
(511, 34, 'Karaikal'),
(512, 34, 'Mahe'),
(513, 34, 'Pondicherry'),
(514, 34, 'Yanam'),
(515, 3, 'Amritsar'),
(516, 3, 'Barnala'),
(517, 3, 'Bathinda'),
(518, 3, 'Faridkot'),
(519, 3, 'Fatehgarh Sahib'),
(520, 3, 'Fazilka'),
(521, 3, 'Firozpur'),
(522, 3, 'Gurdaspur'),
(523, 3, 'Hoshiarpur'),
(524, 3, 'Jalandhar'),
(525, 3, 'Kapurthala'),
(526, 3, 'Ludhiana'),
(527, 3, 'Malerkotla'),
(528, 3, 'Mansa'),
(529, 3, 'Moga'),
(530, 3, 'Mohali'),
(531, 3, 'Muktsar'),
(532, 3, 'Pathankot'),
(533, 3, 'Patiala'),
(534, 3, 'Rupnagar'),
(535, 3, 'Sangrur'),
(536, 3, 'Shaheed Bhagat Singh Nagar'),
(537, 3, 'Tarn Taran'),
(538, 8, 'Ajmer'),
(539, 8, 'Alwar'),
(540, 8, 'Banswara'),
(541, 8, 'Baran'),
(542, 8, 'Barmer'),
(543, 8, 'Bharatpur'),
(544, 8, 'Bhilwara'),
(545, 8, 'Bikaner'),
(546, 8, 'Bundi'),
(547, 8, 'Chittorgarh'),
(548, 8, 'Churu'),
(549, 8, 'Dausa'),
(550, 8, 'Dholpur'),
(551, 8, 'Dungarpur'),
(552, 8, 'Hanumangarh'),
(553, 8, 'Jaipur'),
(554, 8, 'Jaisalmer'),
(555, 8, 'Jalore'),
(556, 8, 'Jhalawar'),
(557, 8, 'Jhunjhunu'),
(558, 8, 'Jodhpur'),
(559, 8, 'Karauli'),
(560, 8, 'Kota'),
(561, 8, 'Nagaur'),
(562, 8, 'Pali'),
(563, 8, 'Pratapgarh'),
(564, 8, 'Rajsamand'),
(565, 8, 'Sawai Madhopur'),
(566, 8, 'Sikar'),
(567, 8, 'Sirohi'),
(568, 8, 'Sri Ganganagar'),
(569, 8, 'Tonk'),
(570, 8, 'Udaipur'),
(571, 11, 'East Sikkim'),
(572, 11, 'North Sikkim'),
(573, 11, 'Pakyong'),
(574, 11, 'Soreng'),
(575, 11, 'South Sikkim'),
(576, 11, 'West Sikkim'),
(577, 33, 'Ariyalur'),
(578, 33, 'Chengalpattu'),
(579, 33, 'Chennai'),
(580, 33, 'Coimbatore'),
(581, 33, 'Cuddalore'),
(582, 33, 'Dharmapuri'),
(583, 33, 'Dindigul'),
(584, 33, 'Erode'),
(585, 33, 'Kallakurichi'),
(586, 33, 'Kanchipuram'),
(587, 33, 'Kanyakumari'),
(588, 33, 'Karur'),
(589, 33, 'Krishnagiri'),
(590, 33, 'Madurai'),
(591, 33, 'Mayiladuthurai'),
(592, 33, 'Nagapattinam'),
(593, 33, 'Namakkal'),
(594, 33, 'Nilgiris'),
(595, 33, 'Perambalur'),
(596, 33, 'Pudukkottai'),
(597, 33, 'Ramanathapuram'),
(598, 33, 'Ranipet'),
(599, 33, 'Salem'),
(600, 33, 'Sivaganga'),
(601, 33, 'Tenkasi'),
(602, 33, 'Thanjavur'),
(603, 33, 'Theni'),
(604, 33, 'Thoothukudi'),
(605, 33, 'Tiruchirappalli'),
(606, 33, 'Tirunelveli'),
(607, 33, 'Tirupattur'),
(608, 33, 'Tiruppur'),
(609, 33, 'Tiruvallur'),
(610, 33, 'Tiruvannamalai'),
(611, 33, 'Tiruvarur'),
(612, 33, 'Vellore'),
(613, 33, 'Viluppuram'),
(614, 33, 'Virudhunagar'),
(615, 36, 'Adilabad'),
(616, 36, 'Bhadradri Kothagudem'),
(617, 36, 'Hanamkonda'),
(618, 36, 'Hyderabad'),
(619, 36, 'Jagtial'),
(620, 36, 'Jangaon'),
(621, 36, 'Jayashankar'),
(622, 36, 'Jogulamba'),
(623, 36, 'Kamareddy'),
(624, 36, 'Karimnagar'),
(625, 36, 'Khammam'),
(626, 36, 'Komaram Bheem'),
(627, 36, 'Mahabubabad'),
(628, 36, 'Mahbubnagar'),
(629, 36, 'Mancherial'),
(630, 36, 'Medak'),
(631, 36, 'Medchal Malkajgiri'),
(632, 36, 'Mulugu'),
(633, 36, 'Nagarkurnool'),
(634, 36, 'Nalgonda'),
(635, 36, 'Narayanpet'),
(636, 36, 'Nirmal'),
(637, 36, 'Nizamabad'),
(638, 36, 'Peddapalli'),
(639, 36, 'Rajanna Sircilla'),
(640, 36, 'Ranga Reddy'),
(641, 36, 'Sangareddy'),
(642, 36, 'Siddipet'),
(643, 36, 'Suryapet'),
(644, 36, 'Vikarabad'),
(645, 36, 'Wanaparthy'),
(646, 36, 'Warangal'),
(647, 36, 'Yadadri Bhuvanagiri'),
(648, 16, 'Dhalai'),
(649, 16, 'Gomati'),
(650, 16, 'Khowai'),
(651, 16, 'North Tripura'),
(652, 16, 'Sepahijala'),
(653, 16, 'South Tripura'),
(654, 16, 'Unakoti'),
(655, 16, 'West Tripura'),
(656, 9, 'Agra'),
(657, 9, 'Aligarh'),
(658, 9, 'Ambedkar Nagar'),
(659, 9, 'Amethi'),
(660, 9, 'Amroha'),
(661, 9, 'Auraiya'),
(662, 9, 'Ayodhya'),
(663, 9, 'Azamgarh'),
(664, 9, 'Baghpat'),
(665, 9, 'Bahraich'),
(666, 9, 'Ballia'),
(667, 9, 'Balrampur'),
(668, 9, 'Banda'),
(669, 9, 'Barabanki'),
(670, 9, 'Bareilly'),
(671, 9, 'Basti'),
(672, 9, 'Bhadohi'),
(673, 9, 'Bijnor'),
(674, 9, 'Budaun'),
(675, 9, 'Bulandshahr'),
(676, 9, 'Chandauli'),
(677, 9, 'Chitrakoot'),
(678, 9, 'Deoria'),
(679, 9, 'Etah'),
(680, 9, 'Etawah'),
(681, 9, 'Farrukhabad'),
(682, 9, 'Fatehpur'),
(683, 9, 'Firozabad'),
(684, 9, 'Gautam Buddha Nagar'),
(685, 9, 'Ghaziabad'),
(686, 9, 'Ghazipur'),
(687, 9, 'Gonda'),
(688, 9, 'Gorakhpur'),
(689, 9, 'Hamirpur'),
(690, 9, 'Hapur'),
(691, 9, 'Hardoi'),
(692, 9, 'Hathras'),
(693, 9, 'Jalaun'),
(694, 9, 'Jaunpur'),
(695, 9, 'Jhansi'),
(696, 9, 'Kannauj'),
(697, 9, 'Kanpur Dehat'),
(698, 9, 'Kanpur Nagar'),
(699, 9, 'Kasganj'),
(700, 9, 'Kaushambi'),
(701, 9, 'Lakhimpur Kheri'),
(702, 9, 'Kushinagar'),
(703, 9, 'Lalitpur'),
(704, 9, 'Lucknow'),
(705, 9, 'Maharajganj'),
(706, 9, 'Mahoba'),
(707, 9, 'Mainpuri'),
(708, 9, 'Mathura'),
(709, 9, 'Mau'),
(710, 9, 'Meerut'),
(711, 9, 'Mirzapur'),
(712, 9, 'Moradabad'),
(713, 9, 'Muzaffarnagar'),
(714, 9, 'Pilibhit'),
(715, 9, 'Pratapgarh'),
(716, 9, 'Prayagraj'),
(717, 9, 'Raebareli'),
(718, 9, 'Rampur'),
(719, 9, 'Saharanpur'),
(720, 9, 'Sambhal'),
(721, 9, 'Sant Kabir Nagar'),
(722, 9, 'Shahjahanpur'),
(723, 9, 'Shamli'),
(724, 9, 'Shravasti'),
(725, 9, 'Siddharthnagar'),
(726, 9, 'Sitapur'),
(727, 9, 'Sonbhadra'),
(728, 9, 'Sultanpur'),
(729, 9, 'Unnao'),
(730, 9, 'Varanasi'),
(731, 5, 'Almora'),
(732, 5, 'Bageshwar'),
(733, 5, 'Chamoli'),
(734, 5, 'Champawat'),
(735, 5, 'Dehradun'),
(736, 5, 'Haridwar'),
(737, 5, 'Nainital'),
(738, 5, 'Pauri'),
(739, 5, 'Pithoragarh'),
(740, 5, 'Rudraprayag'),
(741, 5, 'Tehri'),
(742, 5, 'Udham Singh Nagar'),
(743, 5, 'Uttarkashi'),
(744, 19, 'Alipurduar'),
(745, 19, 'Bankura'),
(746, 19, 'Birbhum'),
(747, 19, 'Cooch Behar'),
(748, 19, 'Dakshin Dinajpur'),
(749, 19, 'Darjeeling'),
(750, 19, 'Hooghly'),
(751, 19, 'Howrah'),
(752, 19, 'Jalpaiguri'),
(753, 19, 'Jhargram'),
(754, 19, 'Kalimpong'),
(755, 19, 'Kolkata'),
(756, 19, 'Malda'),
(757, 19, 'Murshidabad'),
(758, 19, 'Nadia'),
(759, 19, 'North 24 Parganas'),
(760, 19, 'Paschim Bardhaman'),
(761, 19, 'Paschim Medinipur'),
(762, 19, 'Purba Bardhaman'),
(763, 19, 'Purba Medinipur'),
(764, 19, 'Purulia'),
(765, 19, 'South 24 Parganas'),
(766, 19, 'Uttar Dinajpur'),
(767, 33, 'Puducherry');

-- --------------------------------------------------------

--
-- Table structure for table `division`
--

CREATE TABLE `division` (
  `DivisionCode` int NOT NULL,
  `OrganizationCode` int NOT NULL,
  `DivisionName` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `StateCode` int DEFAULT NULL,
  `GSTIN` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `division`
--

INSERT INTO `division` (`DivisionCode`, `OrganizationCode`, `DivisionName`, `StateCode`, `GSTIN`) VALUES
(1, 5, 'Jabalpur', 23, NULL),
(2, 5, 'Prayagraj ', 9, NULL),
(3, 5, 'Tiruchchirappalli', 33, NULL),
(4, 5, 'Madurai', 33, NULL),
(6, 15, 'Eastern Region', 19, NULL),
(7, 16, 'Head Office', 10, NULL),
(8, 5, 'Firozpur', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dochistory`
--

CREATE TABLE `dochistory` (
  `ID` int NOT NULL,
  `OrderID` int DEFAULT NULL,
  `CompletionDate` date DEFAULT NULL,
  `Updatedby` int DEFAULT NULL,
  `UpdatedOn` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `dochistory`
--

INSERT INTO `dochistory` (`ID`, `OrderID`, `CompletionDate`, `Updatedby`, `UpdatedOn`) VALUES
(9, 1, '2022-11-13', 5, '2023-04-19'),
(10, 2, '2022-11-14', 5, '2023-04-20'),
(11, 2, '2023-03-23', 5, '2023-04-20'),
(12, 3, '2022-11-14', 5, '2023-04-20'),
(13, 4, '2022-02-12', 5, '2023-04-20'),
(14, 5, '2022-02-23', 5, '2023-04-20'),
(15, 5, '2022-08-22', 5, '2023-04-20'),
(16, 7, '2019-05-17', 5, '2023-04-20'),
(17, 7, '2019-08-16', 5, '2023-04-21'),
(18, 10, '2018-12-11', 5, '2023-04-21');

-- --------------------------------------------------------

--
-- Table structure for table `employee expense`
--

CREATE TABLE `employee expense` (
  `ExpenseID` int NOT NULL,
  `VerificationID` int NOT NULL,
  `MaterialName` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `Rate` decimal(9,2) NOT NULL,
  `Qty` decimal(9,2) NOT NULL,
  `Unit` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `EmployeeCode` int NOT NULL,
  `EmployeeName` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DesignationID` int NOT NULL,
  `Contact` varchar(13) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Email` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Password` varchar(30) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'cyrus@123',
  `Address` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Active` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`EmployeeCode`, `EmployeeName`, `DesignationID`, `Contact`, `Email`, `Password`, `Address`, `Active`) VALUES
(3, 'Anant', 1, '+918418826770', 'suryavanshianantsingh@gmail.com', 'cyrus@123', 'ANANT SINGH SURYAVANSHI\nVILLAGE POST DHIRAULI BABU\nCHHAWANI,\nBasti,\nUttar Pradesh,\npincode: 272127', 1),
(5, 'Sooraj Maurya', 3, '+918090249066', 'project.support@cyruselectronics.co.in', 'cyrus@123', 'NA', 1),
(6, 'Triveni Prasad', 2, '+917617007514', 'Triveni51286@gmail.com', 'cyrus@123', 'Village-Khajuri\nPost- Tikariya\nDistt- Amethi, Uttar Pradesh- 227409', 1),
(7, 'Pradeep Kumar', 2, '+919695354052', 'py34347@gmail.com', 'cyrus@123', 'Village - Dashamada\nPost- Dheka Pakhanpur\nDistt- Sultanpur, Uttar Pradesh- 228151', 1),
(8, 'Pawan Kumar', 2, '+919005855055', 'pawansinghelexengg@gmail.com', 'cyrus@123', 'Village- Shivdaspur\nPost- Lahartara\nDistt-Varanasi', 1),
(9, 'Amit Kumar', 2, '+917617007532', 'amittiwari310791@gmail.com', 'cyrus@123', 'Village & Post- Majhawan\nDistt- Kanpur Nagar, uttar Pradesh-208001\n', 1),
(10, 'Kuldeep yadav', 2, '+917617007510', 'ykuldip685@gmailcom', 'cyrus@123', 'Village - Dashamada\nPost- Dheka Pakhanpur\nDistt- Sultanpur, Uttar Pradesh- 228151', 1);

-- --------------------------------------------------------

--
-- Table structure for table `gadget`
--

CREATE TABLE `gadget` (
  `GadgetID` int NOT NULL,
  `Gadget` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gst rates`
--

CREATE TABLE `gst rates` (
  `ItemID` int NOT NULL,
  `CatagoryName` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HSNCode` varchar(6) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Rate` int DEFAULT '0',
  `FullHSNCode` varchar(8) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Table structure for table `inspectingauth`
--

CREATE TABLE `inspectingauth` (
  `ID` int NOT NULL,
  `InspectionAuthority` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `inspectingauth`
--

INSERT INTO `inspectingauth` (`ID`, `InspectionAuthority`) VALUES
(1, 'Consignee'),
(2, 'RDSO'),
(3, 'R.I.T.E.S. LTD');

-- --------------------------------------------------------

--
-- Table structure for table `issuechallan`
--

CREATE TABLE `issuechallan` (
  `ChallanID` int NOT NULL,
  `OrderID` int NOT NULL,
  `SiteCode` int NOT NULL,
  `StateCode` int NOT NULL,
  `ChallanDate` date DEFAULT NULL,
  `ChallanNo` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `issuechallan detail`
--

CREATE TABLE `issuechallan detail` (
  `ID` int NOT NULL,
  `ChallanNo` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `MaterialID` int NOT NULL,
  `Qty` decimal(9,3) NOT NULL,
  `Unit` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loginlogs`
--

CREATE TABLE `loginlogs` (
  `ID` int NOT NULL,
  `UserID` int NOT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loginlogs`
--

INSERT INTO `loginlogs` (`ID`, `UserID`, `TimeStamp`) VALUES
(26, 3, '2023-03-25 05:41:09'),
(27, 3, '2023-03-27 07:13:58'),
(28, 3, '2023-03-27 09:44:03'),
(29, 3, '2023-03-27 09:51:32'),
(30, 3, '2023-03-27 11:49:03'),
(31, 3, '2023-03-28 04:11:23'),
(32, 5, '2023-03-28 06:54:31'),
(33, 5, '2023-03-28 07:06:21'),
(34, 5, '2023-03-28 07:19:35'),
(35, 5, '2023-03-28 09:17:12'),
(36, 3, '2023-03-28 10:15:56'),
(37, 5, '2023-03-28 11:12:49'),
(38, 5, '2023-03-28 11:12:51'),
(39, 5, '2023-03-28 11:12:52'),
(40, 5, '2023-03-29 04:37:30'),
(41, 3, '2023-03-29 04:39:21'),
(42, 5, '2023-03-29 05:12:46'),
(43, 3, '2023-03-29 05:55:49'),
(44, 5, '2023-03-29 09:51:35'),
(45, 3, '2023-03-29 10:18:23'),
(46, 3, '2023-03-29 10:35:43'),
(47, 5, '2023-03-29 11:44:20'),
(48, 5, '2023-03-31 04:41:18'),
(49, 3, '2023-03-31 04:42:30'),
(50, 5, '2023-03-31 06:31:29'),
(51, 3, '2023-03-31 06:36:01'),
(52, 5, '2023-03-31 08:00:39'),
(53, 3, '2023-03-31 11:38:25'),
(54, 5, '2023-04-01 04:26:07'),
(55, 5, '2023-04-01 05:52:33'),
(56, 5, '2023-04-01 09:38:43'),
(57, 5, '2023-04-01 11:30:40'),
(58, 5, '2023-04-01 11:43:47'),
(59, 5, '2023-04-01 12:09:59'),
(60, 5, '2023-04-03 04:08:11'),
(61, 5, '2023-04-03 05:31:16'),
(62, 5, '2023-04-03 07:14:06'),
(63, 5, '2023-04-03 07:53:13'),
(64, 5, '2023-04-03 07:57:46'),
(65, 5, '2023-04-03 08:58:38'),
(66, 5, '2023-04-03 09:04:08'),
(67, 5, '2023-04-03 12:12:31'),
(68, 5, '2023-04-03 12:21:16'),
(69, 5, '2023-04-04 04:08:11'),
(70, 5, '2023-04-04 04:42:38'),
(71, 5, '2023-04-04 09:29:56'),
(72, 5, '2023-04-04 10:37:55'),
(73, 5, '2023-04-05 04:57:16'),
(74, 5, '2023-04-05 11:00:30'),
(75, 5, '2023-04-05 11:13:24'),
(76, 5, '2023-04-06 04:21:06'),
(77, 5, '2023-04-06 09:05:07'),
(78, 5, '2023-04-06 09:34:31'),
(79, 5, '2023-04-08 04:33:30'),
(80, 5, '2023-04-08 05:24:32'),
(81, 5, '2023-04-08 10:32:09'),
(82, 5, '2023-04-08 11:44:27'),
(83, 5, '2023-04-10 04:25:02'),
(84, 5, '2023-04-10 12:27:47'),
(85, 3, '2023-04-10 14:47:50'),
(86, 5, '2023-04-11 05:47:46'),
(87, 5, '2023-04-11 07:58:05'),
(88, 5, '2023-04-11 10:53:07'),
(89, 5, '2023-04-11 11:11:52'),
(90, 5, '2023-04-11 11:23:39'),
(91, 5, '2023-04-12 05:46:43'),
(92, 5, '2023-04-12 05:48:27'),
(93, 5, '2023-04-12 09:46:26'),
(94, 5, '2023-04-13 07:39:17'),
(95, 5, '2023-04-14 04:25:32'),
(96, 5, '2023-04-14 07:49:58'),
(97, 5, '2023-04-14 09:31:44'),
(98, 5, '2023-04-14 10:02:00'),
(99, 5, '2023-04-14 11:26:05'),
(100, 5, '2023-04-15 05:01:13'),
(101, 5, '2023-04-15 05:33:43'),
(102, 5, '2023-04-15 09:20:00'),
(103, 5, '2023-04-15 10:14:29'),
(104, 5, '2023-04-17 04:32:19'),
(105, 5, '2023-04-17 04:56:37'),
(106, 5, '2023-04-17 05:12:28'),
(107, 5, '2023-04-17 06:29:14'),
(108, 5, '2023-04-17 07:10:47'),
(109, 5, '2023-04-18 05:31:30'),
(110, 5, '2023-04-18 06:52:31'),
(111, 5, '2023-04-18 07:45:31'),
(112, 5, '2023-04-18 08:07:34'),
(113, 5, '2023-04-18 11:05:06'),
(114, 5, '2023-04-18 15:01:47'),
(115, 5, '2023-04-19 05:11:45'),
(116, 5, '2023-04-19 06:06:34'),
(117, 5, '2023-04-19 09:44:53'),
(118, 5, '2023-04-19 11:56:24'),
(119, 5, '2023-04-20 04:26:33'),
(120, 5, '2023-04-20 07:18:09'),
(121, 5, '2023-04-20 09:41:59'),
(122, 5, '2023-04-20 10:11:16'),
(123, 5, '2023-04-20 11:05:05'),
(124, 5, '2023-04-20 11:17:39'),
(125, 5, '2023-04-20 11:48:24'),
(126, 5, '2023-04-21 04:35:56'),
(127, 5, '2023-04-21 05:46:57'),
(128, 5, '2023-04-21 10:47:19'),
(129, 5, '2023-04-22 17:50:36'),
(130, 5, '2023-04-24 04:40:12'),
(131, 5, '2023-04-24 05:21:08'),
(132, 5, '2023-04-24 06:37:45'),
(133, 5, '2023-04-24 08:29:56'),
(134, 5, '2023-04-24 09:15:59'),
(135, 5, '2023-04-25 04:48:14'),
(136, 5, '2023-04-25 05:18:13'),
(137, 5, '2023-04-25 09:38:32'),
(138, 5, '2023-04-25 10:17:45'),
(139, 5, '2023-04-26 04:31:43'),
(140, 5, '2023-04-26 05:38:34'),
(141, 5, '2023-04-26 05:52:57'),
(142, 5, '2023-04-26 11:00:41'),
(143, 5, '2023-04-26 11:34:57'),
(144, 5, '2023-04-27 04:43:27'),
(145, 5, '2023-04-27 04:55:11'),
(146, 5, '2023-04-27 06:38:50'),
(147, 5, '2023-04-27 08:05:06'),
(148, 5, '2023-04-27 09:15:39'),
(149, 5, '2023-04-27 09:34:35'),
(150, 5, '2023-04-27 09:42:14'),
(151, 5, '2023-04-27 11:02:44'),
(152, 5, '2023-04-28 04:50:23'),
(153, 5, '2023-04-28 06:25:22'),
(154, 6, '2023-04-28 10:29:48'),
(155, 5, '2023-04-28 11:40:42');

-- --------------------------------------------------------

--
-- Table structure for table `material consumed`
--

CREATE TABLE `material consumed` (
  `ID` int NOT NULL,
  `VerificationID` int NOT NULL,
  `MaterialID` int NOT NULL,
  `Qty` decimal(9,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `material_status`
--

CREATE TABLE `material_status` (
  `StatusID` int NOT NULL,
  `Status` varchar(20) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `material_status`
--

INSERT INTO `material_status` (`StatusID`, `Status`) VALUES
(1, 'Accessing Vendor'),
(2, 'Offer Received'),
(3, 'Vendor Finalized'),
(4, 'PO Placed'),
(5, 'PO Ready');

-- --------------------------------------------------------

--
-- Table structure for table `movement`
--

CREATE TABLE `movement` (
  `MovementID` int NOT NULL,
  `Movement` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `OfferID` int NOT NULL,
  `TermID` int NOT NULL,
  `OrderID` int NOT NULL,
  `MaterialID` int NOT NULL,
  `VendorID` int NOT NULL,
  `ItemName` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ModalNo` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `OfferRate` decimal(12,2) NOT NULL,
  `GST` decimal(9,2) NOT NULL,
  `Qty` decimal(9,3) NOT NULL,
  `InspectionAt` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `OfferDate` date DEFAULT NULL,
  `Finalized` tinyint NOT NULL DEFAULT '0',
  `FinalizedDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offer terms`
--

CREATE TABLE `offer terms` (
  `TermID` int NOT NULL,
  `PaymentTerms` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `WarrantyTerms` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `DeliveryTerms` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `OtherTerms` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ShippingCharges` decimal(9,2) NOT NULL DEFAULT '0.00',
  `OtherCharges` decimal(9,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int NOT NULL,
  `DivisionCode` int DEFAULT NULL,
  `Description` varchar(1050) COLLATE utf8mb4_general_ci NOT NULL,
  `OrderNo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `OrderDate` date DEFAULT NULL,
  `CompletionDate` date DEFAULT NULL,
  `PGAmount` decimal(9,2) NOT NULL,
  `PGTypeID` int DEFAULT NULL,
  `PGDate` date DEFAULT NULL,
  `PGValidDate` date DEFAULT NULL,
  `Warranty` int NOT NULL,
  `OrderingAuth` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `BillingAuth` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `OrderStatusID` int NOT NULL DEFAULT '1',
  `Requirement` tinyint NOT NULL DEFAULT '0',
  `RequirementDate` date DEFAULT NULL,
  `AMCIncluded` tinyint NOT NULL DEFAULT '0',
  `AMCPeriod` int DEFAULT NULL,
  `AMCPosted` tinyint NOT NULL DEFAULT '0',
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `DivisionCode`, `Description`, `OrderNo`, `OrderDate`, `CompletionDate`, `PGAmount`, `PGTypeID`, `PGDate`, `PGValidDate`, `Warranty`, `OrderingAuth`, `BillingAuth`, `OrderStatusID`, `Requirement`, `RequirementDate`, `AMCIncluded`, `AMCPeriod`, `AMCPosted`, `TimeStamp`) VALUES
(1, 1, 'Up gradation of LAN environment and provisioning of Hardware for HMIS implementation in Health establishment', 'JABALPUR DIVISION-S AND T / JBL-N-TELE-TENDER-2022-5 /01342370054602', '2022-05-18', '2023-04-30', '254297.18', 1, '2022-05-30', '2023-09-30', 12, 'Sr. Divisional Signal & Telecom Engineer', 'Sr. Divisional Finance manager', 4, 0, NULL, 0, NULL, 0, '2023-03-29 07:08:44'),
(2, 2, 'OFC based networking for centralised monitoring\nof vital safety assets as EI system, Data Logger, MSDAC\netc for improving and upgrading in KAA-GZB. ', 'PRAYAGRAJ DIVISION-S AND T / PRYJSig-40-2021-22 / 01342370054450', '2022-05-14', '2023-06-30', '165261.32', 1, '2022-05-27', '2023-12-31', 12, 'Sr. Divisional Signal & Telecom Engineer/Co.', 'Sr. Divisional Finance manager', 3, 0, NULL, 0, NULL, 0, '2023-03-29 07:08:44'),
(3, 2, 'OFC based networking for centralised monitoring\nof vital safety assets as EI system, Data Logger, MSDAC etc\nfor improving and upgrading in PCOI-MRE. ', ' PRAYAGRAJ DIVISION-S AND T / PRYJSig-41-2021-22 / 01342370054449 ', '2022-05-14', '2023-03-31', '154292.65', 1, '2022-05-27', '2023-12-31', 12, 'Sr.DSTE/Co', 'Sr.DFM', 3, 0, NULL, 0, NULL, 0, '2023-03-29 07:08:44'),
(4, 4, 'Provision of Integrated Emergency Response Management System (Video\nSurveillance System) at Stations Virudunagar, Kovilpatti,\nRameswaram,Tenkasi Jn., Sengottai, Karaikkudi and Ramanathapuram in\nMadurai Division. Provision of Integrated Emergency Response\nManagement System (Video Surveillance System) at Stations Kollam Jn.,\nNagercoil Jn., Kochuveli in Tiruvananthapuram Division and Tuticorin and\nRajapalaiyam in Madurai Division. Provision of Integrated Emergency\nResponse Management System (Video Surveillance System) at Stations\nParamakudi, Sattur, Tirunelveli Jn and Dindigul Jn., in Madurai Division\nand Mayiladuturai, Thanjavur Jn., Puducherry, Nagappattinam in\nTiruchchirappalli Division. [At seven stations of Madurai Division:\nKaraikudi, Ramanathapuram, Sengottai, Tenkasi, Rajapalayam, Sattur and\nParamakudi].', ' MADURAI DIVISION-S AND T / U-SG-02-2021-22-1 / 01342370040015', '2021-08-12', '2023-08-11', '942102.66', 1, '2021-08-18', '2023-08-15', 12, 'Sr. Divisional Signal & Telecom Engineer', 'Sr.Divisional Finance Manager', 3, 0, NULL, 1, 60, 0, '2023-03-29 07:24:43'),
(5, 3, ' Provision of Integrated Emergency Response Management\nSystem (Video Surveillance System) at stations ALU, VRI, PDY\nand NGT in Tiruchchirappalli Division.', 'TRICHCHIRAPPALLI DIVISION-S AND T / T-SG-36-I-2-2021-2022 / 01342370040422', '2021-08-23', '2023-06-20', '929780.87', 1, '2021-09-01', '2023-08-22', 12, 'Sr. Divisional Signal & Telecom Engineer', 'Sr. Divisional Finance Manager', 3, 0, NULL, 1, 60, 0, '2023-03-31 05:36:08'),
(6, 6, 'SITC of SCCTV work for Darbhanga RCS Airport under Eastern Region with one year standard warranty and post warranty Comprehensive Annual Maintenance  Contract (CAMC) for 5 years', 'AAI/ER/AS/SCCTV-RCS/RH-22/2019/284-287', '2019-10-21', '2020-11-08', '82760.00', 1, '2019-11-15', '2026-04-20', 12, 'GM (CNS-ER)', 'GM (Finance),ER,Kolkata', 3, 0, NULL, 1, 60, 0, '2023-04-03 07:52:49'),
(7, 7, '\"Supply , installation testing & commissioning of remote operated automatic boom barriers & CCTV cameras for operation of Officers colony & ORH of RWP, Bela , Dist.:- Saran (Bihar).', 'RWP/Elect(S&T)/Colony& ORH operation/OT/2018-19', '2019-04-03', '2023-10-19', '51695.00', 1, '2023-04-06', '2020-11-02', 12, 'Deputy Chief Electrical Engineer', 'FA & CAO/RWP', 3, 0, NULL, 1, 24, 0, '2023-04-04 05:16:50'),
(8, 6, 'SITC of SCCTV work for Dumka RCS Airport under Eastern Region with one year standard warranty and post warranty Comprehensive  Annual Maintenance Contract (CAMC) for 5 year.', 'AAI/ER/AS/SCCTV-RCS/RH-22/2020/101-103', '2020-03-11', '2022-01-16', '82760.00', 1, '2020-11-26', '2026-12-31', 12, 'GM (CNS-ER)', 'GM (Finance)', 3, 0, NULL, 1, 60, 0, '2023-04-06 06:50:22'),
(9, 6, 'SITC of SCCTV work for Bokaro RCS Airport under Eastern Region with one year standard warranty and post warranty Comprehensive Annual Maintenance Contract (CAMC) for 5 year.', 'AAI/ER/AS/SCCTV-RCS/RH-22/2020-21/187-189', '2020-09-15', '2021-09-03', '82760.00', 1, '2020-11-26', '2026-12-31', 12, 'GM (CNS-ER)', 'GM (Finance), ER, Kolkata', 3, 0, NULL, 1, 60, 0, '2023-04-06 07:33:51'),
(10, 8, 'Provision and AMC of CCTV Monitoring System at Sri\nMata  Vaishno Devi, Katra over Firozpur Division.', '433-Sig/T/44/17-18', '2018-06-12', '2020-03-31', '417103.00', 2, '2018-07-02', '2023-07-02', 12, 'Sr, Divisional Signal & Telecom Engineer/C', 'Sr, DFM/NR/Firozpur', 3, 0, NULL, 1, 60, 0, '2023-04-11 07:54:04');

-- --------------------------------------------------------

--
-- Table structure for table `orderstatus`
--

CREATE TABLE `orderstatus` (
  `StatusID` int NOT NULL,
  `Status` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderstatus`
--

INSERT INTO `orderstatus` (`StatusID`, `Status`) VALUES
(1, 'Pending for requirement'),
(2, 'Pending for site survey'),
(3, 'Pending for work   plaining'),
(4, 'Work in progress');

-- --------------------------------------------------------

--
-- Table structure for table `organization`
--

CREATE TABLE `organization` (
  `OrganizationCode` int NOT NULL,
  `Organization` varchar(200) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `organization`
--

INSERT INTO `organization` (`OrganizationCode`, `Organization`) VALUES
(5, 'Railways'),
(15, 'Airports Authority Of India'),
(16, 'Rail Wheel Plant');

-- --------------------------------------------------------

--
-- Stand-in structure for view `organization_details`
-- (See below for the actual view)
--
CREATE TABLE `organization_details` (
`Organization` varchar(200)
,`OrganizationCode` int
,`DivisionName` varchar(200)
,`DivisionCode` int
,`GSTIN` varchar(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `pendingworklog`
--

CREATE TABLE `pendingworklog` (
  `ID` int NOT NULL,
  `WorkType` varchar(50) NOT NULL,
  `WorkID` int NOT NULL,
  `EmployeeCode` int NOT NULL,
  `LogDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `pending_po`
-- (See below for the actual view)
--
CREATE TABLE `pending_po` (
`Organization` varchar(200)
,`DivisionName` varchar(200)
,`OrderID` int
,`PODate` timestamp
,`PONo` varchar(100)
,`POID` int
,`VendorName` varchar(250)
);

-- --------------------------------------------------------

--
-- Table structure for table `pghistory`
--

CREATE TABLE `pghistory` (
  `ID` int NOT NULL,
  `OrderID` int NOT NULL,
  `PGDate` date DEFAULT NULL,
  `Updatedby` int DEFAULT NULL,
  `UpdatedOn` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pghistory`
--

INSERT INTO `pghistory` (`ID`, `OrderID`, `PGDate`, `Updatedby`, `UpdatedOn`) VALUES
(3, 7, '2019-11-02', 5, '2023-04-06'),
(4, 7, '2019-11-02', 5, '2023-04-06'),
(5, 3, '2023-05-23', 5, '2023-04-20'),
(6, 2, '2023-05-23', 5, '2023-04-20'),
(7, 5, '2022-08-22', 5, '2023-04-20'),
(8, 1, '2023-05-23', 5, '2023-04-20'),
(9, 7, '2019-11-02', 5, '2023-04-20');

-- --------------------------------------------------------

--
-- Table structure for table `pgtype`
--

CREATE TABLE `pgtype` (
  `PGTypeID` int NOT NULL,
  `PGType` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pgtype`
--

INSERT INTO `pgtype` (`PGTypeID`, `PGType`) VALUES
(1, 'BG'),
(2, 'FD'),
(3, 'DD'),
(4, 'Cash');

-- --------------------------------------------------------

--
-- Table structure for table `po`
--

CREATE TABLE `po` (
  `POID` int NOT NULL,
  `OrderID` int NOT NULL,
  `ShippingAddress` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `PODate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PONo` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `UserID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `po_details`
--

CREATE TABLE `po_details` (
  `ID` int NOT NULL,
  `POID` int NOT NULL,
  `OfferID` int NOT NULL,
  `POQty` decimal(9,3) NOT NULL,
  `ReadyQty` decimal(9,3) NOT NULL DEFAULT '0.000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `site`
--

CREATE TABLE `site` (
  `SiteCode` int NOT NULL,
  `DivisionCode` int NOT NULL,
  `SiteName` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `Address` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DistrictCode` int DEFAULT NULL,
  `Consignee` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `site`
--

INSERT INTO `site` (`SiteCode`, `DivisionCode`, `SiteName`, `Address`, `DistrictCode`, `Consignee`) VALUES
(10, 1, 'DAMOH RAILWAY HOSPITAL', 'D.R.M Office, complex South Civil Lines, Jabalpur, Madhya Pradesh 482001', 348, 'SSE/TELE/JBP'),
(11, 1, 'NARSINGHPUR HOSPITAL', 'D.R.M Office, complex South Civil Lines, Jabalpur, Madhya Pradesh 482001', 368, 'SSE/TELE/JBP'),
(12, 1, 'NEW KATNI HOSPITAL', 'D.R.M Office, complex ,South Civil Lines, Jabalpur, Madhya Pradesh 482001', 360, 'SSE/TELE/JBP'),
(13, 1, 'KATNI HOSPITAL', 'D.R.M Office, complex South Civil Lines, Jabalpur, Madhya Pradesh 482001', 360, 'SSE/TELE/JBP'),
(14, 1, 'SAGAR HOSPITAL', 'D.R.M Office, complex, South Civil Lines, Jabalpur, Madhya Pradesh 482001', 376, 'SSE/TELE/JBP'),
(15, 1, 'BEOHARI HOSPITAL', 'D.R.M Office, complex South Civil Lines, Jabalpur, Madhya Pradesh 482001', 380, 'SSE/TELE/JBP'),
(16, 1, 'PIPARIYA HOSPITAL', 'D.R.M Office, complex South Civil Lines, Jabalpur, Madhya Pradesh 482001', 356, 'SSE/TELE/JBP'),
(17, 1, 'JABALPUR DIVISIONAL HOSPITAL', 'D.R.M Office, complex South Civil Lines, Jabalpur, Madhya Pradesh 482001', 358, 'SSE/TELE/JBP'),
(19, 2, 'Prayagraj Section', 'D.R.M Office, Complex Civil Lines, Prayagraj, Uttar Pradesh 211001', 716, 'SSE/TELE/PRYJ'),
(20, 2, 'Aligarh Section', 'Shah, Kamal, Road, Aligarh, Railway Station , Aligarh - 202001', 657, 'SSE/TELE/ALJN'),
(21, 6, 'Darbhanga RCS Airport', 'Airport Authority of India Darbhanga Airport Bihar-846007', 98, 'Airport In Charge'),
(22, 7, 'RWB Bela', 'Dy.CEE, 2nd Floor, Admin Building, PO- Arvind Nagar Dist.-Saran, Bihar, PIN-841221.', 120, 'SSE/Elect.(Tele)'),
(24, 4, 'Ramanathapuram Station', 'Paramakudi Station, Ramanathapuram, Tamil Nadu -623707', 597, 'SSE/TELE/MNM'),
(25, 4, 'Karaikudi Station', 'Railway station road, Sivagangai district karaikudi, Tamil Nadu -630001', 600, 'SSE/TELE/KKDI'),
(26, 4, 'Sengottai Station', 'Southern Railway, Tenkasi Railway Junction, Tenkasi, Tamil Nadu -627811', 601, 'SSE/TELE/TSI'),
(27, 4, 'Tenkasi Station', 'Southern Railway, Tenkasi Railway Junction, Tenkasi, Tamil Nadu -627811', 601, 'SSE/TELE/TSI'),
(28, 4, 'Rajapalayam Station', ' Railway old colony, Near Virudhunagar Railway station, Virudhunagar -626001', 614, 'SSE/TELE/VPT'),
(30, 4, 'Sattur Station', 'Railway old colony, Near Virudhunagar Railway station, Virudhunagar -626001', 614, 'SSE/TELE/VPT'),
(31, 4, 'Paramakudi Station', 'Parmakudi Station, Ramanathapuram, Tamil Nadu -623707', 597, 'SSE/TELE/MNM'),
(34, 6, 'Dumka RCS Airport', 'Airport Authority of India, Dumka Airport, Jharkhand-844119', 269, 'Airport In Charge'),
(35, 6, 'Bokaro RCS Airport', 'Airport Authority of India, Bokaro Airport, Jharkhand-827001', 265, 'Airport In Charge'),
(36, 8, 'SVD Katra Railway Station', ' SVD KATRA, RAILWAY STATION NORTHERN RAILWAY JAMMU-182301 ', 251, 'SSE/Tele/JAT'),
(37, 3, 'Ariyalur Railway Station', 'Southern Railway, Near kallukuzhli ground opp. Police battalion, 620020', 577, 'SSE/T/SRM/TPJ'),
(38, 3, 'Nagapattinam Railway Station', 'Southern Railway, Near kallukuzhli ground opp. Police battalion, 620020', 592, 'SSE/T/SRM/TPJ'),
(39, 3, 'Puducherry Railway Station', 'Southern Railway, Near kallukuzhli ground opp. Police battalion, 620020', 767, 'SSE/T/SRM/TPJ'),
(40, 3, 'Vriddhachalam Railway Station', 'Southern Railway, Near kallukuzhli ground opp. Police battalion, 620020', 581, 'SSE/T/SRM/TPJ'),
(41, 1, 'Satna Hospital', 'D.R.M Office, complex South Civil Lines, Jabalpur, Madhya Pradesh 482001', 377, 'SSE/TELE/JBP');

-- --------------------------------------------------------

--
-- Table structure for table `siteorders`
--

CREATE TABLE `siteorders` (
  `OrderID` int NOT NULL,
  `DivisionOrderID` int DEFAULT NULL,
  `DivisionCode` int DEFAULT NULL,
  `SiteCode` int DEFAULT NULL,
  `Status` int DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `siteorders`
--

INSERT INTO `siteorders` (`OrderID`, `DivisionOrderID`, `DivisionCode`, `SiteCode`, `Status`) VALUES
(1, 1, 1, 15, 2),
(2, 1, 1, 10, 2),
(3, 1, 1, 16, 2),
(4, 1, 1, 11, 2),
(5, 1, 1, 12, 2),
(6, 1, 1, 13, 2),
(7, 1, 1, 14, 2),
(8, 1, 1, 17, 2),
(9, 7, 7, 22, 2),
(10, 4, 4, 25, 2),
(11, 4, 4, 31, 2),
(12, 4, 4, 28, 2),
(13, 4, 4, 24, 2),
(14, 4, 4, 30, 2),
(15, 4, 4, 26, 2),
(16, 4, 4, 27, 2),
(17, 2, 2, 20, 2),
(18, 3, 2, 19, 2),
(19, 6, 6, 21, 2),
(20, 8, 6, 34, 2),
(21, 9, 6, 35, 2),
(22, 10, 8, 36, 2),
(32, 5, 3, 37, 1),
(33, 5, 3, 38, 1),
(34, 5, 3, 39, 1),
(35, 5, 3, 40, 1),
(36, 1, 1, 41, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sitesurvey`
--

CREATE TABLE `sitesurvey` (
  `SurveyID` int NOT NULL,
  `OrderID` int NOT NULL,
  `SiteCode` int NOT NULL,
  `MaterialID` int NOT NULL,
  `Qty` decimal(9,3) NOT NULL,
  `SurveyDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Status` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sitesurvey`
--

INSERT INTO `sitesurvey` (`SurveyID`, `OrderID`, `SiteCode`, `MaterialID`, `Qty`, `SurveyDate`, `Status`) VALUES
(17, 1, 15, 7, '70.000', '2023-04-01 05:01:38', 1),
(18, 1, 15, 3, '4.000', '2023-04-01 05:02:38', 1),
(19, 1, 15, 14, '20.000', '2023-04-01 05:06:14', 1),
(20, 1, 15, 9, '2.000', '2023-04-01 05:08:29', 1),
(21, 1, 15, 21, '0.343', '2023-04-01 05:17:59', 1),
(23, 1, 10, 7, '196.000', '2023-04-01 05:24:08', 1),
(24, 1, 10, 1, '795.000', '2023-04-01 05:25:41', 1),
(25, 1, 10, 2, '1.000', '2023-04-01 05:26:22', 1),
(26, 1, 10, 3, '4.000', '2023-04-01 05:27:56', 1),
(27, 1, 10, 9, '2.000', '2023-04-01 05:28:49', 1),
(28, 1, 10, 14, '62.000', '2023-04-01 05:29:36', 1),
(29, 1, 10, 15, '2.000', '2023-04-01 05:30:10', 1),
(30, 1, 10, 21, '0.570', '2023-04-01 05:32:31', 1),
(31, 1, 10, 22, '1.115', '2023-04-01 05:37:28', 1),
(32, 1, 10, 17, '282.000', '2023-04-01 05:38:08', 1),
(33, 1, 15, 13, '470.000', '2023-04-01 05:54:48', 1),
(34, 1, 16, 14, '23.000', '2023-04-01 06:06:07', 1),
(35, 1, 16, 9, '2.000', '2023-04-01 06:06:37', 1),
(36, 1, 16, 15, '2.000', '2023-04-01 06:07:10', 1),
(37, 1, 16, 21, '0.276', '2023-04-01 06:08:17', 1),
(38, 1, 16, 13, '617.000', '2023-04-01 06:16:53', 1),
(40, 1, 11, 7, '146.000', '2023-04-01 06:20:39', 1),
(41, 1, 11, 3, '4.000', '2023-04-01 06:21:06', 1),
(42, 1, 11, 4, '6.000', '2023-04-01 06:22:06', 1),
(43, 1, 11, 14, '52.000', '2023-04-01 06:22:53', 1),
(44, 1, 11, 10, '2.000', '2023-04-01 06:23:54', 1),
(45, 1, 11, 12, '2.000', '2023-04-01 06:25:23', 1),
(46, 1, 11, 15, '2.000', '2023-04-01 06:26:36', 1),
(47, 1, 11, 21, '0.037', '2023-04-01 06:27:43', 1),
(48, 1, 11, 13, '642.000', '2023-04-01 06:29:11', 1),
(49, 1, 11, 17, '215.000', '2023-04-01 06:30:13', 1),
(50, 1, 12, 7, '1155.000', '2023-04-01 06:33:39', 1),
(51, 1, 12, 2, '4.000', '2023-04-01 06:34:31', 1),
(52, 1, 12, 3, '8.000', '2023-04-01 06:34:54', 1),
(53, 1, 12, 14, '239.000', '2023-04-01 06:35:43', 1),
(54, 1, 12, 9, '3.000', '2023-04-01 06:36:09', 1),
(55, 1, 12, 10, '1.000', '2023-04-01 06:37:17', 1),
(56, 1, 12, 12, '1.000', '2023-04-01 06:37:32', 1),
(57, 1, 12, 15, '2.000', '2023-04-01 06:38:04', 1),
(58, 1, 12, 13, '1295.000', '2023-04-01 06:39:17', 1),
(59, 1, 13, 7, '140.000', '2023-04-01 06:42:39', 1),
(60, 1, 13, 1, '185.000', '2023-04-01 06:44:23', 1),
(61, 1, 13, 2, '1.000', '2023-04-01 06:44:58', 1),
(62, 1, 13, 3, '4.000', '2023-04-01 06:45:10', 1),
(63, 1, 13, 4, '45.000', '2023-04-01 06:45:35', 1),
(64, 1, 13, 14, '44.000', '2023-04-01 06:46:01', 1),
(65, 1, 13, 9, '1.000', '2023-04-01 06:46:18', 1),
(66, 1, 13, 10, '1.000', '2023-04-01 06:47:07', 1),
(67, 1, 13, 12, '2.000', '2023-04-01 06:47:42', 1),
(68, 1, 13, 15, '2.000', '2023-04-01 06:48:18', 1),
(69, 1, 13, 13, '325.000', '2023-04-01 06:48:55', 1),
(70, 1, 13, 21, '0.098', '2023-04-01 06:49:46', 1),
(71, 1, 14, 7, '205.000', '2023-04-01 07:30:09', 1),
(72, 1, 14, 2, '1.000', '2023-04-01 07:30:23', 1),
(73, 1, 14, 3, '4.000', '2023-04-01 07:30:39', 1),
(74, 1, 14, 14, '88.000', '2023-04-01 07:31:06', 1),
(75, 1, 14, 9, '1.000', '2023-04-01 07:31:21', 1),
(76, 1, 14, 12, '1.000', '2023-04-01 07:36:01', 1),
(77, 1, 14, 15, '2.000', '2023-04-01 07:36:21', 1),
(78, 1, 14, 13, '205.000', '2023-04-01 07:41:03', 1),
(79, 1, 17, 8, '1.000', '2023-04-01 07:50:41', 1),
(80, 1, 17, 9, '17.000', '2023-04-01 07:51:57', 1),
(81, 1, 17, 10, '1.000', '2023-04-01 07:53:24', 1),
(82, 1, 17, 13, '5973.000', '2023-04-01 07:56:53', 1),
(83, 1, 17, 14, '1849.000', '2023-04-01 08:29:10', 1),
(84, 1, 17, 15, '12.000', '2023-04-01 08:29:47', 1),
(85, 1, 17, 21, '0.202', '2023-04-01 08:32:45', 1),
(86, 1, 17, 22, '0.202', '2023-04-01 08:33:10', 1),
(113, 1, 10, 13, '1310.000', '2023-04-04 07:29:44', 0),
(114, 7, 22, 284, '1.000', '2023-04-04 08:28:15', 1),
(115, 7, 22, 285, '6.000', '2023-04-04 08:28:41', 1),
(116, 7, 22, 286, '1.000', '2023-04-04 08:29:10', 1),
(117, 7, 22, 287, '3.000', '2023-04-04 08:29:35', 1),
(118, 7, 22, 288, '1.000', '2023-04-04 08:29:51', 1),
(119, 7, 22, 289, '1000.000', '2023-04-04 08:30:07', 1),
(120, 7, 22, 290, '800.000', '2023-04-04 08:30:22', 1),
(121, 7, 22, 291, '18.000', '2023-04-04 08:30:55', 1),
(122, 7, 22, 292, '1.000', '2023-04-04 08:31:27', 1),
(123, 7, 22, 293, '1.000', '2023-04-04 08:32:35', 1),
(124, 7, 22, 294, '1.000', '2023-04-04 08:33:14', 1),
(125, 7, 22, 295, '1.000', '2023-04-04 08:33:33', 1),
(126, 7, 22, 296, '1.000', '2023-04-04 08:33:46', 1),
(127, 7, 22, 297, '1.000', '2023-04-04 08:34:05', 1),
(128, 7, 22, 298, '3.000', '2023-04-04 08:34:46', 1),
(129, 7, 22, 299, '2.000', '2023-04-04 08:35:01', 1),
(130, 7, 22, 300, '3.000', '2023-04-04 08:35:17', 1),
(131, 7, 22, 301, '1.000', '2023-04-04 08:35:28', 1),
(132, 7, 22, 302, '1.000', '2023-04-04 08:35:41', 1),
(133, 4, 25, 48, '600.000', '2023-04-04 11:22:38', 1),
(134, 4, 25, 49, '35.000', '2023-04-04 11:26:04', 1),
(135, 4, 25, 50, '20.000', '2023-04-04 11:27:13', 1),
(136, 4, 25, 51, '45.000', '2023-04-04 11:35:53', 1),
(137, 4, 25, 52, '550.000', '2023-04-04 11:36:31', 1),
(138, 4, 25, 53, '30.000', '2023-04-04 11:38:33', 1),
(139, 4, 25, 54, '550.000', '2023-04-04 11:39:05', 1),
(140, 4, 25, 55, '55.000', '2023-04-04 11:42:26', 1),
(141, 4, 25, 56, '30.000', '2023-04-04 11:43:10', 1),
(142, 4, 25, 57, '45.000', '2023-04-04 11:44:34', 1),
(143, 4, 25, 59, '20.000', '2023-04-04 11:47:08', 1),
(144, 4, 25, 61, '8.000', '2023-04-04 11:47:55', 1),
(145, 4, 25, 63, '4.000', '2023-04-04 11:48:42', 1),
(146, 4, 25, 64, '4.000', '2023-04-04 11:51:56', 1),
(147, 4, 25, 66, '1.000', '2023-04-04 11:56:48', 1),
(148, 4, 25, 81, '1.000', '2023-04-04 11:58:53', 1),
(149, 4, 25, 82, '1.000', '2023-04-04 12:00:06', 1),
(150, 4, 25, 85, '17.000', '2023-04-04 12:02:26', 1),
(151, 4, 25, 91, '1.000', '2023-04-04 12:04:11', 1),
(152, 4, 25, 93, '1.000', '2023-04-04 12:04:48', 1),
(153, 4, 25, 94, '17.000', '2023-04-04 12:05:47', 1),
(154, 4, 25, 95, '950.000', '2023-04-04 12:07:52', 1),
(155, 4, 25, 97, '550.000', '2023-04-04 12:08:43', 1),
(156, 4, 25, 98, '575.000', '2023-04-04 12:10:33', 1),
(157, 4, 25, 104, '1.000', '2023-04-04 12:11:36', 1),
(158, 4, 25, 107, '1.000', '2023-04-04 12:15:14', 1),
(159, 4, 25, 118, '1.000', '2023-04-04 12:16:10', 1),
(160, 4, 25, 113, '5230.000', '2023-04-04 12:16:58', 1),
(161, 4, 31, 48, '450.000', '2023-04-05 05:09:31', 1),
(162, 4, 31, 52, '450.000', '2023-04-05 05:12:44', 1),
(163, 4, 31, 53, '15.000', '2023-04-05 05:14:47', 1),
(164, 4, 31, 54, '450.000', '2023-04-05 05:15:29', 1),
(165, 4, 31, 56, '15.000', '2023-04-05 05:17:26', 1),
(166, 4, 31, 59, '18.000', '2023-04-05 05:18:44', 1),
(167, 4, 31, 61, '6.000', '2023-04-05 05:20:22', 1),
(168, 4, 31, 66, '1.000', '2023-04-05 05:21:17', 1),
(169, 4, 31, 81, '1.000', '2023-04-05 05:22:36', 1),
(170, 4, 31, 82, '1.000', '2023-04-05 05:26:12', 1),
(172, 4, 31, 91, '1.000', '2023-04-05 05:28:11', 1),
(173, 4, 31, 93, '1.000', '2023-04-05 05:29:05', 1),
(177, 4, 31, 104, '1.000', '2023-04-05 05:34:21', 1),
(179, 4, 31, 118, '1.000', '2023-04-05 05:36:14', 1),
(180, 4, 31, 85, '12.000', '2023-04-05 05:43:40', 1),
(181, 4, 31, 95, '320.000', '2023-04-05 05:48:59', 1),
(182, 4, 31, 97, '486.000', '2023-04-05 05:50:52', 1),
(183, 4, 31, 98, '500.000', '2023-04-05 05:53:50', 1),
(184, 4, 31, 99, '2.000', '2023-04-05 05:55:21', 1),
(185, 4, 31, 100, '2.000', '2023-04-05 05:56:46', 1),
(186, 4, 31, 101, '36.000', '2023-04-05 05:57:39', 1),
(187, 4, 31, 102, '30.000', '2023-04-05 05:58:27', 1),
(188, 4, 31, 108, '1.000', '2023-04-05 06:03:19', 1),
(189, 4, 31, 109, '12.000', '2023-04-05 06:04:14', 1),
(190, 4, 31, 113, '4730.000', '2023-04-05 06:07:00', 1),
(191, 4, 28, 48, '300.000', '2023-04-05 06:26:02', 1),
(192, 4, 28, 52, '300.000', '2023-04-05 06:27:32', 1),
(193, 4, 28, 53, '10.000', '2023-04-05 06:29:37', 1),
(194, 4, 28, 54, '600.000', '2023-04-05 06:30:51', 1),
(195, 4, 28, 56, '10.000', '2023-04-05 06:32:24', 1),
(196, 4, 28, 59, '16.000', '2023-04-05 06:39:30', 1),
(197, 4, 28, 61, '6.000', '2023-04-05 06:40:01', 1),
(198, 4, 28, 63, '4.000', '2023-04-05 06:40:59', 1),
(199, 4, 28, 64, '2.000', '2023-04-05 06:43:09', 1),
(200, 4, 28, 66, '1.000', '2023-04-05 06:43:39', 1),
(201, 4, 28, 81, '1.000', '2023-04-05 06:44:29', 1),
(202, 4, 28, 82, '1.000', '2023-04-05 06:45:21', 1),
(203, 4, 28, 85, '12.000', '2023-04-05 06:48:32', 1),
(204, 4, 28, 91, '1.000', '2023-04-05 06:49:34', 1),
(205, 4, 28, 93, '1.000', '2023-04-05 06:50:14', 1),
(206, 4, 28, 94, '15.000', '2023-04-05 06:51:23', 1),
(207, 4, 28, 95, '600.000', '2023-04-05 06:51:59', 1),
(208, 4, 28, 97, '300.000', '2023-04-05 06:52:58', 1),
(209, 4, 28, 98, '325.000', '2023-04-05 06:53:49', 1),
(210, 4, 28, 102, '55.000', '2023-04-05 06:54:42', 1),
(211, 4, 28, 104, '2.000', '2023-04-05 06:56:09', 1),
(212, 4, 28, 107, '1.000', '2023-04-05 06:57:21', 1),
(213, 4, 28, 118, '1.000', '2023-04-05 06:58:06', 1),
(214, 4, 28, 113, '6000.000', '2023-04-05 06:59:05', 1),
(215, 4, 24, 48, '150.000', '2023-04-05 07:13:08', 1),
(216, 4, 24, 52, '150.000', '2023-04-05 07:13:59', 1),
(217, 4, 24, 53, '5.000', '2023-04-05 07:15:03', 1),
(218, 4, 24, 54, '150.000', '2023-04-05 07:15:40', 1),
(219, 4, 24, 56, '5.000', '2023-04-05 07:17:23', 1),
(220, 4, 24, 59, '15.000', '2023-04-05 07:18:40', 1),
(221, 4, 24, 61, '6.000', '2023-04-05 07:19:36', 1),
(222, 4, 24, 63, '3.000', '2023-04-05 07:21:25', 1),
(223, 4, 24, 64, '3.000', '2023-04-05 07:22:55', 1),
(224, 4, 24, 66, '1.000', '2023-04-05 07:23:19', 1),
(225, 4, 24, 81, '1.000', '2023-04-05 07:24:10', 1),
(226, 4, 24, 82, '1.000', '2023-04-05 07:24:37', 1),
(227, 4, 24, 85, '11.000', '2023-04-05 07:26:34', 1),
(228, 4, 24, 91, '1.000', '2023-04-05 07:26:59', 1),
(229, 4, 24, 93, '1.000', '2023-04-05 07:27:25', 1),
(230, 4, 24, 94, '8.000', '2023-04-05 07:28:07', 1),
(231, 4, 24, 95, '310.000', '2023-04-05 07:28:43', 1),
(232, 4, 24, 97, '150.000', '2023-04-05 07:29:16', 1),
(233, 4, 24, 98, '150.000', '2023-04-05 07:29:38', 1),
(234, 4, 24, 99, '2.000', '2023-04-05 07:30:18', 1),
(235, 4, 24, 101, '48.000', '2023-04-05 07:31:14', 1),
(236, 4, 24, 102, '20.000', '2023-04-05 07:31:49', 1),
(237, 4, 24, 104, '2.000', '2023-04-05 07:33:00', 1),
(238, 4, 24, 107, '1.000', '2023-04-05 07:33:56', 1),
(239, 4, 24, 118, '1.000', '2023-04-05 07:34:21', 1),
(240, 4, 24, 113, '3900.000', '2023-04-05 07:35:03', 1),
(241, 4, 30, 48, '300.000', '2023-04-05 07:40:24', 1),
(242, 4, 30, 51, '60.000', '2023-04-05 07:42:16', 1),
(243, 4, 30, 52, '300.000', '2023-04-05 07:43:03', 1),
(244, 4, 30, 53, '10.000', '2023-04-05 07:44:09', 1),
(245, 4, 30, 54, '300.000', '2023-04-05 07:44:47', 1),
(246, 4, 30, 56, '10.000', '2023-04-05 07:45:38', 1),
(247, 4, 30, 57, '60.000', '2023-04-05 07:46:42', 1),
(248, 4, 30, 59, '12.000', '2023-04-05 07:49:45', 1),
(249, 4, 30, 61, '4.000', '2023-04-05 07:51:03', 1),
(250, 4, 30, 81, '1.000', '2023-04-05 07:53:44', 1),
(251, 4, 30, 82, '1.000', '2023-04-05 07:54:45', 1),
(252, 4, 30, 85, '8.000', '2023-04-05 07:56:47', 1),
(253, 4, 30, 91, '1.000', '2023-04-05 07:57:14', 1),
(254, 4, 30, 93, '1.000', '2023-04-05 07:57:58', 1),
(255, 4, 30, 97, '250.000', '2023-04-05 07:58:40', 1),
(256, 4, 30, 98, '275.000', '2023-04-05 07:59:06', 1),
(257, 4, 30, 102, '30.000', '2023-04-05 07:59:37', 1),
(258, 4, 30, 104, '2.000', '2023-04-05 08:01:11', 1),
(259, 4, 30, 118, '1.000', '2023-04-05 08:01:46', 1),
(260, 4, 30, 109, '10.000', '2023-04-05 08:02:18', 1),
(261, 4, 30, 113, '3300.000', '2023-04-05 08:02:44', 1),
(262, 4, 26, 59, '16.000', '2023-04-05 08:05:15', 1),
(263, 4, 26, 61, '6.000', '2023-04-05 08:05:52', 1),
(264, 4, 26, 63, '2.000', '2023-04-05 08:06:36', 1),
(265, 4, 26, 64, '2.000', '2023-04-05 08:07:06', 1),
(266, 4, 26, 66, '1.000', '2023-04-05 08:07:33', 1),
(267, 4, 26, 81, '1.000', '2023-04-05 08:08:37', 1),
(268, 4, 26, 82, '1.000', '2023-04-05 08:09:39', 1),
(269, 4, 26, 85, '11.000', '2023-04-05 08:10:24', 1),
(270, 4, 26, 91, '1.000', '2023-04-05 08:10:47', 1),
(271, 4, 26, 93, '1.000', '2023-04-05 08:12:08', 1),
(272, 4, 26, 94, '10.000', '2023-04-05 08:12:43', 1),
(273, 4, 26, 95, '760.000', '2023-04-05 08:13:05', 1),
(274, 4, 26, 101, '60.000', '2023-04-05 08:13:35', 1),
(275, 4, 26, 102, '10.000', '2023-04-05 08:14:03', 1),
(276, 4, 26, 104, '1.000', '2023-04-05 08:15:31', 1),
(277, 4, 26, 107, '1.000', '2023-04-05 08:16:06', 1),
(278, 4, 26, 118, '1.000', '2023-04-05 08:16:26', 1),
(279, 4, 26, 113, '3485.000', '2023-04-05 08:17:06', 1),
(280, 4, 27, 59, '22.000', '2023-04-05 08:19:24', 1),
(281, 4, 27, 61, '8.000', '2023-04-05 08:19:52', 1),
(282, 4, 27, 63, '2.000', '2023-04-05 08:25:36', 1),
(283, 4, 27, 64, '2.000', '2023-04-05 08:26:03', 1),
(284, 4, 27, 81, '1.000', '2023-04-05 08:26:37', 1),
(285, 4, 27, 82, '1.000', '2023-04-05 08:27:07', 1),
(286, 4, 27, 85, '11.000', '2023-04-05 08:27:32', 1),
(287, 4, 27, 91, '1.000', '2023-04-05 08:28:00', 1),
(288, 4, 27, 93, '1.000', '2023-04-05 08:28:34', 1),
(289, 4, 27, 94, '10.000', '2023-04-05 08:29:28', 1),
(290, 4, 27, 95, '580.000', '2023-04-05 08:29:44', 1),
(291, 4, 27, 101, '50.000', '2023-04-05 08:30:12', 1),
(292, 4, 27, 102, '15.000', '2023-04-05 08:31:14', 1),
(293, 4, 27, 104, '1.000', '2023-04-05 08:31:50', 1),
(294, 4, 27, 107, '1.000', '2023-04-05 08:32:08', 1),
(295, 4, 27, 118, '1.000', '2023-04-05 08:32:27', 1),
(296, 4, 27, 113, '4030.000', '2023-04-05 08:32:47', 1),
(302, 2, 20, 23, '12.000', '2023-04-06 04:31:31', 1),
(303, 2, 20, 24, '1000.000', '2023-04-06 04:31:48', 1),
(304, 2, 20, 25, '500.000', '2023-04-06 04:32:16', 1),
(305, 2, 20, 26, '200.000', '2023-04-06 04:32:33', 1),
(306, 2, 20, 27, '4.000', '2023-04-06 04:32:56', 1),
(307, 2, 20, 28, '200.000', '2023-04-06 04:33:28', 1),
(308, 2, 20, 29, '85.000', '2023-04-06 04:33:42', 1),
(309, 2, 20, 30, '445.000', '2023-04-06 04:34:06', 1),
(310, 2, 20, 31, '1000.000', '2023-04-06 04:34:23', 1),
(311, 2, 20, 32, '1000.000', '2023-04-06 04:34:40', 1),
(312, 2, 20, 33, '8000.000', '2023-04-06 04:34:56', 1),
(313, 2, 20, 34, '8000.000', '2023-04-06 04:35:12', 1),
(314, 2, 20, 35, '50.000', '2023-04-06 04:35:50', 1),
(315, 2, 20, 36, '8.000', '2023-04-06 04:36:27', 1),
(316, 2, 20, 37, '8.000', '2023-04-06 04:36:37', 1),
(317, 2, 20, 38, '1.000', '2023-04-06 04:36:58', 1),
(318, 2, 20, 39, '35.000', '2023-04-06 04:37:13', 1),
(319, 2, 20, 40, '70.000', '2023-04-06 04:37:32', 1),
(320, 2, 20, 41, '8.000', '2023-04-06 04:38:03', 1),
(321, 2, 20, 42, '6.000', '2023-04-06 04:38:18', 1),
(322, 2, 20, 43, '1.000', '2023-04-06 04:38:49', 1),
(323, 2, 20, 44, '4.000', '2023-04-06 04:39:01', 1),
(324, 2, 20, 45, '80.000', '2023-04-06 04:39:24', 1),
(325, 2, 20, 46, '4.000', '2023-04-06 04:39:39', 1),
(326, 2, 20, 47, '8.000', '2023-04-06 04:40:21', 1),
(327, 3, 19, 248, '12.000', '2023-04-06 04:41:57', 1),
(328, 3, 19, 249, '1000.000', '2023-04-06 04:42:10', 1),
(329, 3, 19, 250, '500.000', '2023-04-06 04:42:30', 1),
(330, 3, 19, 251, '200.000', '2023-04-06 04:42:40', 1),
(331, 3, 19, 252, '4.000', '2023-04-06 04:43:18', 1),
(332, 3, 19, 253, '200.000', '2023-04-06 04:43:28', 1),
(333, 3, 19, 254, '85.000', '2023-04-06 04:43:46', 1),
(334, 3, 19, 255, '445.000', '2023-04-06 04:44:09', 1),
(335, 3, 19, 256, '1000.000', '2023-04-06 04:44:34', 1),
(336, 3, 19, 257, '1000.000', '2023-04-06 04:44:45', 1),
(337, 3, 19, 258, '8000.000', '2023-04-06 04:45:00', 1),
(338, 3, 19, 259, '8000.000', '2023-04-06 04:45:13', 1),
(339, 3, 19, 260, '50.000', '2023-04-06 04:45:31', 1),
(340, 3, 19, 261, '8.000', '2023-04-06 04:45:56', 1),
(341, 3, 19, 262, '8.000', '2023-04-06 04:46:04', 1),
(342, 3, 19, 263, '1.000', '2023-04-06 04:46:17', 1),
(343, 3, 19, 264, '35.000', '2023-04-06 04:46:30', 1),
(344, 3, 19, 265, '70.000', '2023-04-06 04:46:50', 1),
(345, 3, 19, 266, '8.000', '2023-04-06 04:47:04', 1),
(346, 3, 19, 267, '6.000', '2023-04-06 04:47:24', 1),
(347, 3, 19, 268, '1.000', '2023-04-06 04:47:58', 1),
(348, 3, 19, 269, '4.000', '2023-04-06 04:48:11', 1),
(349, 3, 19, 270, '80.000', '2023-04-06 04:48:25', 1),
(350, 3, 19, 271, '4.000', '2023-04-06 04:48:43', 1),
(351, 3, 19, 272, '8.000', '2023-04-06 04:49:03', 1),
(352, 6, 21, 273, '3.000', '2023-04-08 06:06:05', 1),
(353, 6, 21, 274, '3.000', '2023-04-08 06:06:23', 1),
(354, 6, 21, 276, '9.000', '2023-04-08 06:08:50', 1),
(355, 6, 21, 278, '1.000', '2023-04-08 06:08:59', 1),
(356, 6, 21, 277, '1.000', '2023-04-08 06:09:08', 1),
(357, 6, 21, 279, '1.000', '2023-04-08 06:09:16', 1),
(358, 6, 21, 280, '600.000', '2023-04-08 06:09:31', 1),
(359, 6, 21, 283, '600.000', '2023-04-08 06:09:44', 1),
(360, 6, 21, 281, '1.000', '2023-04-08 06:09:55', 1),
(361, 6, 21, 282, '1.000', '2023-04-08 06:10:13', 1),
(362, 6, 21, 325, '1.000', '2023-04-08 06:10:25', 1),
(363, 8, 34, 314, '3.000', '2023-04-08 06:13:50', 1),
(364, 8, 34, 315, '3.000', '2023-04-08 06:14:12', 1),
(365, 8, 34, 316, '1.000', '2023-04-08 06:14:24', 1),
(366, 8, 34, 317, '9.000', '2023-04-08 06:14:43', 1),
(367, 8, 34, 318, '1.000', '2023-04-08 06:14:52', 1),
(368, 8, 34, 319, '1.000', '2023-04-08 06:15:03', 1),
(369, 8, 34, 320, '1.000', '2023-04-08 06:15:11', 1),
(370, 8, 34, 321, '600.000', '2023-04-08 06:15:20', 1),
(371, 8, 34, 322, '600.000', '2023-04-08 06:15:30', 1),
(372, 8, 34, 323, '1.000', '2023-04-08 06:15:37', 1),
(373, 8, 34, 324, '1.000', '2023-04-08 06:15:52', 1),
(374, 8, 34, 326, '1.000', '2023-04-08 06:16:00', 1),
(385, 9, 35, 303, '3.000', '2023-04-08 06:20:54', 1),
(386, 9, 35, 304, '3.000', '2023-04-08 06:21:05', 1),
(387, 9, 35, 305, '1.000', '2023-04-08 06:21:16', 1),
(388, 9, 35, 306, '9.000', '2023-04-08 06:21:39', 1),
(389, 9, 35, 307, '1.000', '2023-04-08 06:21:45', 1),
(390, 9, 35, 308, '1.000', '2023-04-08 06:21:56', 1),
(391, 9, 35, 309, '1.000', '2023-04-08 06:22:04', 1),
(392, 9, 35, 312, '600.000', '2023-04-08 06:22:15', 1),
(393, 9, 35, 311, '600.000', '2023-04-08 06:22:26', 1),
(394, 9, 35, 310, '1.000', '2023-04-08 06:22:33', 1),
(395, 9, 35, 313, '1.000', '2023-04-08 06:22:40', 1),
(396, 9, 35, 327, '1.000', '2023-04-08 06:22:48', 1),
(397, 4, 25, 58, '20.000', '2023-04-11 09:10:03', 1),
(398, 4, 25, 60, '8.000', '2023-04-11 09:10:52', 1),
(399, 4, 25, 62, '4.000', '2023-04-11 09:11:20', 1),
(400, 4, 25, 65, '1.000', '2023-04-11 09:12:17', 1),
(401, 4, 25, 84, '17.000', '2023-04-11 09:13:36', 1),
(402, 4, 25, 106, '1.000', '2023-04-11 09:17:27', 1),
(403, 4, 24, 58, '15.000', '2023-04-11 09:19:38', 1),
(404, 4, 24, 60, '6.000', '2023-04-11 09:20:09', 1),
(405, 4, 24, 62, '3.000', '2023-04-11 09:20:37', 1),
(406, 4, 24, 65, '1.000', '2023-04-11 09:21:54', 1),
(407, 4, 24, 84, '11.000', '2023-04-11 09:23:00', 1),
(408, 4, 24, 106, '1.000', '2023-04-11 09:25:05', 1),
(409, 4, 24, 114, '3900.000', '2023-04-11 09:30:49', 1),
(410, 4, 25, 114, '5230.000', '2023-04-11 09:31:41', 0),
(411, 4, 27, 58, '22.000', '2023-04-11 09:32:51', 1),
(412, 4, 27, 60, '8.000', '2023-04-11 09:33:19', 1),
(413, 4, 27, 62, '2.000', '2023-04-11 09:34:05', 1),
(414, 4, 27, 84, '11.000', '2023-04-11 09:36:56', 1),
(415, 4, 27, 106, '1.000', '2023-04-11 09:39:31', 1),
(416, 4, 27, 114, '4030.000', '2023-04-11 09:40:18', 1),
(417, 4, 26, 58, '16.000', '2023-04-11 09:41:39', 1),
(418, 4, 26, 60, '6.000', '2023-04-11 09:41:58', 1),
(419, 4, 26, 62, '2.000', '2023-04-11 09:42:22', 1),
(420, 4, 26, 65, '1.000', '2023-04-11 09:43:35', 1),
(421, 4, 26, 84, '11.000', '2023-04-11 09:44:38', 1),
(422, 4, 26, 106, '1.000', '2023-04-11 09:47:01', 1),
(423, 4, 26, 114, '3485.000', '2023-04-11 09:47:46', 1),
(424, 4, 28, 58, '16.000', '2023-04-11 09:48:58', 1),
(425, 4, 28, 60, '6.000', '2023-04-11 09:49:21', 1),
(426, 4, 28, 62, '4.000', '2023-04-11 09:49:45', 1),
(427, 4, 28, 65, '1.000', '2023-04-11 09:50:34', 1),
(428, 4, 28, 84, '12.000', '2023-04-11 09:51:30', 1),
(429, 4, 28, 106, '1.000', '2023-04-11 09:52:54', 1),
(430, 4, 28, 114, '6000.000', '2023-04-11 09:53:40', 1),
(431, 4, 31, 58, '18.000', '2023-04-11 09:54:34', 1),
(432, 4, 31, 60, '6.000', '2023-04-11 09:54:54', 1),
(433, 4, 31, 65, '1.000', '2023-04-11 09:55:53', 1),
(434, 4, 31, 84, '12.000', '2023-04-11 09:56:34', 1),
(435, 4, 31, 114, '4730.000', '2023-04-11 10:01:04', 1),
(436, 4, 30, 58, '12.000', '2023-04-11 10:02:00', 1),
(437, 4, 30, 60, '4.000', '2023-04-11 10:02:17', 1),
(438, 4, 30, 84, '8.000', '2023-04-11 10:02:47', 1),
(439, 4, 30, 114, '3300.000', '2023-04-11 10:04:13', 1),
(440, 10, 36, 393, '54.000', '2023-04-15 09:59:11', 1),
(441, 10, 36, 365, '4.000', '2023-04-15 09:59:50', 1),
(442, 10, 36, 366, '1.000', '2023-04-15 10:00:24', 1),
(443, 10, 36, 368, '1.000', '2023-04-15 10:01:40', 1),
(444, 10, 36, 367, '1.000', '2023-04-15 10:02:30', 1),
(445, 10, 36, 369, '2.000', '2023-04-15 10:02:43', 1),
(446, 10, 36, 370, '2.000', '2023-04-15 10:03:05', 1),
(447, 10, 36, 389, '1.000', '2023-04-15 10:03:22', 1),
(448, 10, 36, 371, '18.000', '2023-04-15 10:03:36', 1),
(449, 10, 36, 372, '18.000', '2023-04-15 10:03:58', 1),
(450, 10, 36, 373, '1.000', '2023-04-15 10:04:20', 1),
(451, 10, 36, 375, '1.000', '2023-04-15 10:04:56', 1),
(452, 10, 36, 374, '1.000', '2023-04-15 10:05:10', 1),
(453, 10, 36, 376, '3000.000', '2023-04-15 10:05:30', 1),
(454, 10, 36, 377, '5000.000', '2023-04-15 10:05:46', 1),
(455, 10, 36, 378, '8000.000', '2023-04-15 10:06:15', 1),
(456, 10, 36, 379, '4500.000', '2023-04-15 10:06:33', 1),
(457, 10, 36, 380, '4500.000', '2023-04-15 10:06:52', 1),
(458, 10, 36, 381, '1.000', '2023-04-15 10:07:51', 1),
(459, 10, 36, 382, '19.000', '2023-04-15 10:08:07', 1),
(460, 10, 36, 383, '1.000', '2023-04-15 10:08:20', 1),
(461, 10, 36, 384, '60.000', '2023-04-15 10:08:34', 1),
(462, 10, 36, 385, '1.000', '2023-04-15 10:08:49', 1),
(463, 10, 36, 386, '1.000', '2023-04-15 10:09:11', 1),
(464, 10, 36, 390, '600.000', '2023-04-15 10:09:28', 1),
(465, 10, 36, 391, '500.000', '2023-04-15 10:09:36', 1),
(466, 10, 36, 392, '1100.000', '2023-04-15 10:10:00', 1),
(467, 10, 36, 387, '1.000', '2023-04-15 10:10:13', 1),
(468, 10, 36, 388, '2.000', '2023-04-15 10:10:47', 1),
(475, 5, 37, 408, '100.000', '2023-04-18 09:26:13', 1),
(476, 5, 37, 409, '100.000', '2023-04-18 09:27:49', 1),
(477, 5, 37, 410, '100.000', '2023-04-18 09:28:19', 1),
(478, 5, 37, 411, '2.000', '2023-04-18 09:28:38', 1),
(479, 5, 37, 186, '12.000', '2023-04-18 09:34:56', 1),
(480, 5, 37, 187, '6.000', '2023-04-18 09:35:48', 1),
(481, 5, 37, 188, '8.000', '2023-04-18 09:37:22', 1),
(482, 5, 37, 182, '2.000', '2023-04-18 09:39:29', 1),
(483, 5, 37, 175, '15.000', '2023-04-18 09:40:25', 1),
(484, 5, 37, 196, '2.000', '2023-04-18 09:41:01', 1),
(485, 5, 37, 197, '1.000', '2023-04-18 09:42:19', 1),
(486, 5, 37, 198, '1.000', '2023-04-18 09:43:28', 1),
(487, 5, 37, 199, '15.000', '2023-04-18 09:44:36', 1),
(488, 5, 37, 202, '6580.000', '2023-04-18 09:45:35', 1),
(489, 5, 37, 204, '5000.000', '2023-04-18 09:47:24', 1),
(490, 5, 37, 203, '1.000', '2023-04-18 09:48:28', 1),
(491, 5, 37, 205, '1125.000', '2023-04-18 09:49:00', 1),
(492, 5, 37, 183, '18.000', '2023-04-18 09:50:22', 1),
(493, 5, 37, 206, '400.000', '2023-04-18 09:51:13', 1),
(494, 5, 37, 207, '400.000', '2023-04-18 09:52:58', 1),
(495, 5, 37, 208, '5.000', '2023-04-18 09:53:53', 1),
(496, 5, 37, 209, '66.000', '2023-04-18 09:55:10', 1),
(497, 5, 37, 184, '8.000', '2023-04-18 09:56:07', 1),
(498, 5, 37, 210, '8.000', '2023-04-18 09:56:49', 1),
(499, 5, 37, 212, '2.000', '2023-04-18 09:57:23', 1),
(500, 5, 37, 214, '1.000', '2023-04-18 09:58:57', 1),
(501, 5, 37, 215, '2.000', '2023-04-18 09:59:42', 1),
(502, 5, 37, 217, '1.000', '2023-04-18 10:00:22', 1),
(503, 5, 37, 220, '1.000', '2023-04-18 10:01:33', 1),
(504, 5, 37, 222, '1.000', '2023-04-18 10:02:11', 1),
(505, 5, 37, 159, '12.000', '2023-04-18 10:04:55', 1),
(506, 5, 37, 160, '6.000', '2023-04-18 10:05:38', 1),
(507, 5, 37, 161, '8.000', '2023-04-18 10:06:23', 1),
(508, 5, 37, 216, '1.000', '2023-04-18 10:09:32', 1),
(509, 5, 38, 408, '100.000', '2023-04-18 10:25:53', 1),
(510, 5, 38, 409, '100.000', '2023-04-18 10:26:28', 1),
(511, 5, 38, 410, '100.000', '2023-04-18 10:26:54', 1),
(512, 5, 38, 411, '2.000', '2023-04-18 10:28:08', 1),
(513, 5, 38, 186, '14.000', '2023-04-18 10:29:33', 1),
(514, 5, 38, 187, '6.000', '2023-04-18 10:30:09', 1),
(515, 5, 38, 188, '8.000', '2023-04-18 10:30:56', 1),
(516, 5, 38, 182, '2.000', '2023-04-18 10:32:44', 1),
(517, 5, 38, 175, '15.000', '2023-04-18 10:34:08', 1),
(518, 5, 38, 196, '2.000', '2023-04-18 10:35:11', 1),
(519, 5, 38, 197, '1.000', '2023-04-18 10:37:10', 1),
(520, 5, 38, 198, '1.000', '2023-04-18 10:37:42', 1),
(521, 5, 38, 199, '15.000', '2023-04-18 10:45:01', 1),
(522, 5, 38, 202, '6740.000', '2023-04-18 10:45:33', 1),
(523, 5, 38, 204, '6000.000', '2023-04-18 10:47:01', 1),
(524, 5, 38, 203, '1.000', '2023-04-18 10:47:43', 1),
(525, 5, 38, 205, '1125.000', '2023-04-18 10:48:14', 1),
(526, 5, 38, 183, '18.000', '2023-04-18 10:48:46', 1),
(527, 5, 38, 206, '200.000', '2023-04-18 10:50:15', 1),
(528, 5, 38, 207, '200.000', '2023-04-18 10:53:23', 1),
(529, 5, 38, 208, '5.000', '2023-04-18 11:54:54', 1),
(536, 5, 38, 217, '1.000', '2023-04-18 12:00:17', 1),
(537, 5, 38, 220, '1.000', '2023-04-18 12:00:40', 1),
(538, 5, 38, 209, '48.000', '2023-04-18 12:09:05', 1),
(539, 5, 38, 184, '6.000', '2023-04-18 12:09:51', 1),
(540, 5, 38, 210, '6.000', '2023-04-18 12:10:37', 1),
(541, 5, 38, 212, '2.000', '2023-04-18 12:11:14', 1),
(542, 5, 38, 214, '1.000', '2023-04-18 12:11:52', 1),
(543, 5, 38, 215, '2.000', '2023-04-18 12:12:41', 1),
(544, 5, 38, 159, '14.000', '2023-04-19 06:14:05', 1),
(545, 5, 38, 160, '6.000', '2023-04-19 06:15:32', 1),
(546, 5, 38, 161, '8.000', '2023-04-19 06:16:38', 1),
(547, 5, 38, 216, '1.000', '2023-04-19 06:19:32', 1),
(548, 5, 39, 408, '100.000', '2023-04-19 06:20:57', 1),
(549, 5, 39, 409, '100.000', '2023-04-19 06:21:25', 1),
(550, 5, 39, 410, '100.000', '2023-04-19 06:21:44', 1),
(551, 5, 39, 411, '2.000', '2023-04-19 06:23:03', 1),
(552, 5, 39, 186, '18.000', '2023-04-19 06:23:56', 1),
(553, 5, 39, 187, '9.000', '2023-04-19 06:25:51', 1),
(554, 5, 39, 188, '8.000', '2023-04-19 06:26:35', 1),
(555, 5, 39, 182, '2.000', '2023-04-19 06:27:14', 1),
(556, 5, 39, 175, '24.000', '2023-04-19 06:28:35', 1),
(557, 5, 39, 196, '2.000', '2023-04-19 06:29:24', 1),
(558, 5, 39, 197, '1.000', '2023-04-19 06:31:48', 1),
(559, 5, 39, 198, '1.000', '2023-04-19 06:32:13', 1),
(560, 5, 39, 199, '24.000', '2023-04-19 06:33:12', 1),
(561, 5, 39, 202, '7300.000', '2023-04-19 06:33:34', 1),
(562, 5, 39, 204, '6500.000', '2023-04-19 06:34:51', 1),
(563, 5, 39, 203, '1.000', '2023-04-19 06:35:23', 1),
(564, 5, 39, 205, '1125.000', '2023-04-19 06:35:56', 1),
(565, 5, 39, 183, '27.000', '2023-04-19 06:36:50', 1),
(566, 5, 39, 206, '300.000', '2023-04-19 06:37:31', 1),
(567, 5, 39, 207, '300.000', '2023-04-19 06:37:53', 1),
(568, 5, 39, 208, '5.000', '2023-04-19 06:38:35', 1),
(569, 5, 39, 209, '48.000', '2023-04-19 06:39:23', 1),
(570, 5, 39, 184, '12.000', '2023-04-19 06:40:05', 1),
(571, 5, 39, 210, '12.000', '2023-04-19 06:40:52', 1),
(572, 5, 39, 212, '2.000', '2023-04-19 06:41:24', 1),
(573, 5, 39, 214, '1.000', '2023-04-19 06:42:12', 1),
(574, 5, 39, 215, '2.000', '2023-04-19 06:42:44', 1),
(575, 5, 39, 217, '1.000', '2023-04-19 06:43:41', 1),
(576, 5, 39, 220, '1.000', '2023-04-19 06:44:03', 1),
(577, 5, 39, 159, '18.000', '2023-04-19 06:44:51', 1),
(578, 5, 39, 160, '9.000', '2023-04-19 06:45:37', 1),
(579, 5, 39, 161, '8.000', '2023-04-19 06:46:06', 1),
(580, 5, 39, 216, '1.000', '2023-04-19 06:47:42', 1),
(581, 5, 40, 408, '100.000', '2023-04-19 06:48:56', 1),
(582, 5, 40, 409, '100.000', '2023-04-19 06:49:27', 1),
(583, 5, 40, 410, '100.000', '2023-04-19 06:49:40', 1),
(584, 5, 40, 411, '2.000', '2023-04-19 06:50:02', 1),
(585, 5, 40, 186, '18.000', '2023-04-19 06:52:09', 1),
(586, 5, 40, 187, '6.000', '2023-04-19 06:52:44', 1),
(587, 5, 40, 188, '8.000', '2023-04-19 06:53:15', 1),
(588, 5, 40, 182, '2.000', '2023-04-19 06:53:41', 1),
(589, 5, 40, 175, '17.000', '2023-04-19 06:54:41', 1),
(590, 5, 40, 196, '2.000', '2023-04-19 06:55:01', 1),
(591, 5, 40, 198, '1.000', '2023-04-19 06:56:06', 1),
(592, 5, 40, 197, '1.000', '2023-04-19 06:56:20', 1),
(593, 5, 40, 199, '17.000', '2023-04-19 06:57:01', 1),
(594, 5, 40, 202, '7060.000', '2023-04-19 06:57:20', 1),
(595, 5, 40, 204, '6000.000', '2023-04-19 06:57:50', 1),
(596, 5, 40, 203, '1.000', '2023-04-19 06:58:14', 1),
(597, 5, 40, 205, '1125.000', '2023-04-19 06:58:35', 1),
(598, 5, 40, 183, '20.000', '2023-04-19 06:59:01', 1),
(599, 5, 40, 206, '500.000', '2023-04-19 06:59:31', 1),
(600, 5, 40, 207, '500.000', '2023-04-19 06:59:48', 1),
(601, 5, 40, 208, '5.000', '2023-04-19 07:00:13', 1),
(602, 5, 40, 209, '48.000', '2023-04-19 07:00:44', 1),
(603, 5, 40, 210, '6.000', '2023-04-19 07:03:25', 1),
(604, 5, 40, 212, '3.000', '2023-04-19 07:03:50', 1),
(605, 5, 40, 214, '1.000', '2023-04-19 07:04:40', 1),
(606, 5, 40, 215, '2.000', '2023-04-19 07:05:04', 1),
(607, 5, 40, 217, '1.000', '2023-04-19 07:05:31', 1),
(608, 5, 40, 220, '1.000', '2023-04-19 07:05:48', 1),
(609, 5, 40, 222, '1.000', '2023-04-19 07:10:55', 1),
(610, 5, 40, 159, '18.000', '2023-04-19 07:11:55', 1),
(611, 5, 40, 160, '6.000', '2023-04-19 07:12:20', 1),
(612, 5, 40, 161, '8.000', '2023-04-19 07:12:42', 1),
(613, 5, 40, 216, '1.000', '2023-04-19 07:13:26', 1),
(614, 1, 41, 7, '179.000', '2023-04-28 06:48:24', 1),
(615, 1, 41, 3, '8.000', '2023-04-28 06:54:00', 1),
(616, 1, 41, 9, '2.000', '2023-04-28 06:54:47', 1),
(617, 1, 41, 12, '8.000', '2023-04-28 06:55:14', 1),
(618, 1, 41, 13, '500.000', '2023-04-28 06:55:46', 1),
(619, 1, 41, 14, '85.000', '2023-04-28 06:57:28', 1),
(620, 1, 41, 15, '2.000', '2023-04-28 06:57:44', 1),
(621, 1, 41, 21, '0.412', '2023-04-28 06:58:10', 1),
(622, 1, 41, 17, '18.000', '2023-04-28 06:58:27', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sitework`
--

CREATE TABLE `sitework` (
  `WorkID` int NOT NULL,
  `OrderID` int NOT NULL,
  `SiteCode` int NOT NULL,
  `MaterialID` int NOT NULL,
  `WorkTypeID` int NOT NULL,
  `Qty` decimal(9,3) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `EmployeeCode` int DEFAULT NULL,
  `AssignDate` date DEFAULT NULL,
  `Closed` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sitework`
--

INSERT INTO `sitework` (`WorkID`, `OrderID`, `SiteCode`, `MaterialID`, `WorkTypeID`, `Qty`, `StartDate`, `EndDate`, `EmployeeCode`, `AssignDate`, `Closed`) VALUES
(1, 1, 15, 21, 4, '0.343', '2023-01-01', '2023-02-01', 6, '2023-04-28', 0),
(2, 1, 15, 9, 16, '2.000', '2023-01-01', '2023-02-01', 6, '2023-04-28', 0),
(3, 1, 15, 13, 7, '470.000', '2023-01-01', '2023-02-01', 6, '2023-04-28', 0),
(4, 1, 15, 7, 8, '70.000', '2023-01-01', '2023-02-01', 6, '2023-04-28', 0),
(5, 1, 15, 14, 8, '20.000', '2023-01-01', '2023-02-01', 6, '2023-04-28', 0),
(6, 1, 15, 3, 17, '4.000', '2023-01-01', '2023-02-01', 6, '2023-04-28', 0),
(7, 1, 15, 21, 6, '0.343', '2023-01-01', '2023-02-01', 6, '2023-04-28', 0),
(8, 1, 10, 15, 18, '2.000', '2022-12-24', '2023-01-24', NULL, NULL, 0),
(9, 1, 10, 13, 7, '1310.000', '2022-12-24', '2023-01-24', NULL, NULL, 0),
(10, 1, 10, 22, 9, '1.115', '2022-12-24', '2023-01-24', NULL, NULL, 0),
(11, 1, 10, 14, 8, '62.000', '2022-12-24', '2023-01-24', NULL, NULL, 0),
(12, 1, 10, 2, 18, '1.000', '2022-12-24', '2023-01-24', NULL, NULL, 0),
(13, 1, 10, 1, 7, '795.000', '2022-12-24', '2023-01-24', NULL, NULL, 0),
(14, 1, 10, 3, 17, '4.000', '2022-12-24', '2023-01-24', NULL, NULL, 0),
(15, 1, 10, 7, 8, '196.000', '2022-12-24', '2023-01-24', NULL, NULL, 0),
(16, 1, 10, 9, 16, '1.000', '2022-12-24', '2023-01-24', NULL, NULL, 0),
(17, 1, 10, 9, 15, '1.000', '2022-12-24', '2023-01-24', NULL, NULL, 0),
(18, 1, 17, 21, 4, '0.202', '2022-11-03', '2023-04-08', NULL, NULL, 0),
(19, 1, 17, 15, 18, '12.000', '2022-11-03', '2022-12-03', NULL, NULL, 0),
(20, 1, 13, 21, 4, '0.098', '2023-10-20', '2022-11-20', 6, '2023-04-28', 0),
(21, 1, 13, 15, 18, '2.000', '2022-10-20', '2022-11-20', 6, '2023-04-28', 0),
(22, 1, 13, 13, 7, '325.000', '2022-10-20', '2022-11-20', 6, '2023-04-28', 0),
(23, 1, 13, 10, 15, '1.000', '2022-10-20', '2022-11-20', 6, '2023-04-28', 0),
(24, 1, 13, 14, 8, '44.000', '2022-10-20', '2022-11-20', 6, '2023-04-28', 0),
(25, 1, 13, 12, 15, '1.000', '2022-10-20', '2022-11-20', 6, '2023-04-28', 0),
(26, 1, 13, 12, 16, '1.000', '2022-10-20', '2022-11-20', 6, '2023-04-28', 0),
(27, 1, 13, 4, 7, '45.000', '2022-10-20', '2022-11-20', 6, '2023-04-28', 0),
(28, 1, 13, 2, 18, '1.000', '2022-10-20', '2022-11-20', 6, '2023-04-28', 0),
(29, 1, 13, 1, 7, '185.000', '2022-10-20', '2022-11-20', 6, '2023-04-28', 0),
(30, 1, 13, 3, 17, '4.000', '2022-10-20', '2022-11-20', 6, '2023-04-28', 0),
(31, 1, 13, 7, 8, '140.000', '2022-10-20', '2022-11-20', 6, '2023-04-28', 0),
(32, 1, 13, 9, 16, '1.000', '2022-10-20', '2022-11-20', 6, '2023-04-28', 0),
(33, 1, 13, 21, 6, '0.098', '2022-10-20', '2022-11-20', 6, '2023-04-28', 0),
(34, 1, 11, 21, 4, '0.037', '2022-11-27', '2022-12-27', 6, '2023-04-28', 0),
(35, 1, 11, 15, 18, '2.000', '2022-10-27', '2022-11-27', 6, '2023-04-28', 0),
(36, 1, 11, 13, 7, '642.000', '2022-10-27', '2022-11-27', 6, '2023-04-28', 0),
(37, 1, 11, 10, 15, '2.000', '2022-10-27', '2022-11-27', 6, '2023-04-28', 0),
(38, 1, 11, 14, 8, '52.000', '2022-10-27', '2022-11-27', 6, '2023-04-28', 0),
(39, 1, 11, 12, 15, '2.000', '2022-10-27', '2022-11-27', 6, '2023-04-28', 0),
(40, 1, 11, 4, 8, '6.000', '2022-10-27', '2023-11-27', 6, '2023-04-28', 0),
(41, 1, 11, 3, 17, '4.000', '2022-10-27', '2022-11-27', 6, '2023-04-28', 0),
(42, 1, 11, 7, 8, '146.000', '2022-10-27', '2022-11-27', 6, '2023-04-28', 0),
(43, 1, 11, 21, 6, '0.037', '2022-10-20', '2022-11-20', 6, '2023-04-28', 0),
(44, 1, 12, 15, 18, '2.000', '2022-10-23', '2022-11-23', 6, '2023-04-28', 0),
(45, 1, 12, 13, 8, '1295.000', '2022-10-23', '2022-11-23', 6, '2023-04-28', 0),
(46, 1, 12, 10, 15, '1.000', '2022-10-23', '2022-11-23', 6, '2023-04-28', 0),
(47, 1, 12, 14, 8, '239.000', '2022-10-23', '2022-11-23', 6, '2023-04-28', 0),
(48, 1, 12, 12, 15, '1.000', '2022-10-23', '2022-11-23', 6, '2023-04-28', 0),
(49, 1, 12, 2, 18, '4.000', '2022-10-23', '2022-11-23', 6, '2023-04-28', 0),
(50, 1, 12, 3, 17, '8.000', '2022-10-23', '2022-11-23', 6, '2023-04-28', 0),
(51, 1, 12, 7, 8, '1155.000', '2022-10-23', '2023-11-23', 6, '2023-04-28', 0),
(52, 1, 12, 9, 16, '1.000', '2022-10-23', '2022-11-23', 6, '2023-04-28', 0),
(53, 1, 12, 9, 15, '2.000', '2022-10-23', '2022-11-23', 6, '2023-04-28', 0),
(54, 1, 16, 21, 4, '0.276', '2022-12-20', '2023-01-20', 6, '2023-04-28', 0),
(55, 1, 16, 15, 18, '2.000', '2022-12-20', '2023-01-20', 6, '2023-04-28', 0),
(56, 1, 16, 13, 8, '617.000', '2022-12-20', '2023-01-20', 6, '2023-04-28', 0),
(57, 1, 16, 14, 8, '23.000', '2022-12-20', '2023-01-20', 6, '2023-04-28', 0),
(58, 1, 16, 9, 15, '1.000', '2022-12-20', '2023-01-20', 6, '2023-04-28', 0),
(59, 1, 16, 9, 16, '1.000', '2022-12-20', '2023-01-20', 6, '2023-04-28', 0),
(60, 1, 16, 21, 6, '0.276', '2022-12-20', '2023-01-20', 6, '2023-04-28', 0),
(61, 1, 14, 15, 18, '2.000', '2022-10-22', '2022-11-22', 6, '2023-04-28', 0),
(62, 1, 14, 13, 8, '205.000', '2022-10-22', '2022-11-22', 6, '2023-04-28', 0),
(63, 1, 14, 14, 8, '88.000', '2022-10-22', '2022-11-22', 6, '2023-04-28', 0),
(64, 1, 14, 12, 16, '1.000', '2022-10-22', '2022-11-22', 6, '2023-04-28', 0),
(65, 1, 14, 2, 18, '1.000', '2022-10-22', '2022-11-22', 6, '2023-04-28', 0),
(66, 1, 14, 3, 17, '4.000', '2022-10-22', '2022-11-22', 6, '2023-04-28', 0),
(67, 1, 14, 7, 8, '205.000', '2022-10-22', '2022-11-22', 6, '2023-04-28', 0),
(68, 1, 14, 9, 15, '1.000', '2022-10-22', '2022-11-22', 6, '2023-04-28', 0),
(69, 1, 41, 21, 4, '0.412', '2023-03-26', '2023-04-26', 6, '2023-04-28', 0),
(70, 1, 41, 15, 16, '1.000', '2023-03-26', '2023-04-26', 6, '2023-04-28', 0),
(71, 1, 41, 15, 15, '1.000', '2023-03-26', '2023-04-26', 6, '2023-04-28', 0),
(72, 1, 41, 14, 8, '85.000', '2023-03-26', '2023-04-26', 6, '2023-04-28', 0),
(73, 1, 41, 13, 7, '500.000', '2023-03-26', '2023-04-26', 6, '2023-04-28', 0),
(74, 1, 41, 12, 16, '4.000', '2023-03-26', '2023-04-26', 6, '2023-04-28', 0),
(75, 1, 41, 12, 15, '4.000', '2023-03-26', '2023-04-26', 6, '2023-04-28', 0),
(76, 1, 41, 9, 15, '1.000', '2023-03-26', '2023-04-26', 6, '2023-04-28', 0),
(77, 1, 41, 9, 16, '1.000', '2023-03-26', '2023-04-26', 6, '2023-04-28', 0),
(78, 1, 41, 3, 17, '8.000', '2023-03-26', '2023-04-26', 6, '2023-04-28', 0),
(79, 1, 41, 7, 8, '179.000', '2023-03-26', '2023-04-26', 6, '2023-04-28', 0),
(80, 1, 15, 13, 9, '470.000', '2023-01-01', '2023-02-01', 6, '2023-04-28', 0),
(81, 1, 16, 13, 9, '617.000', '2022-12-20', '2023-01-20', 6, '2023-04-28', 0),
(82, 1, 10, 13, 9, '1310.000', '2022-12-24', '2023-01-24', NULL, NULL, 0),
(83, 1, 11, 13, 9, '642.000', '2022-10-27', '2022-11-27', 6, '2023-04-28', 0),
(84, 1, 12, 13, 9, '1295.000', '2022-10-23', '2022-11-23', 6, '2023-04-28', 0),
(85, 1, 13, 13, 9, '325.000', '2022-10-20', '2022-11-20', 6, '2023-04-28', 0),
(86, 1, 41, 13, 9, '500.000', '2022-10-22', '2022-11-22', 6, '2023-04-28', 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `site_details`
-- (See below for the actual view)
--
CREATE TABLE `site_details` (
`Organization` varchar(200)
,`OrganizationCode` int
,`DivisionName` varchar(200)
,`DivisionCode` int
,`GSTIN` varchar(20)
,`SiteName` varchar(200)
,`SiteCode` int
,`Address` varchar(200)
,`Consignee` varchar(150)
);

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `StateName` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ShortCode` varchar(5) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `StateCode` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`StateName`, `ShortCode`, `StateCode`) VALUES
('Jammu and Kashmir', 'JK', 1),
('Himachal Pradesh', 'HP', 2),
('Punjab', 'PB', 3),
('Chandigarh', 'CH', 4),
('Uttarakhand', 'UT', 5),
('Haryana', 'HR', 6),
('Delhi', 'DL', 7),
('Rajasthan', 'RJ', 8),
('Uttar Pradesh', 'UP', 9),
('Bihar', 'BH', 10),
('Sikkim', 'SK', 11),
('Arunachal Pradesh', 'AR', 12),
('Nagaland', 'NL', 13),
('Manipur', 'MN', 14),
('Mizoram', 'MI', 15),
('Tripura', 'TR', 16),
('Meghalaya', 'ME', 17),
('Assam', 'AS', 18),
('West Bengal', 'WB', 19),
('Jharkhand', 'JH', 20),
('Odisha', 'OR', 21),
('Chattisgarh', 'CT', 22),
('Madhya Pradesh', 'MP', 23),
('Gujarat', 'GJ', 24),
('Daman and Diu', 'DD', 25),
('Dadra and Nagar Haveli', 'DN', 26),
('Maharashtra', 'MH', 27),
('Andhra Pradesh', 'AP', 28),
('Karnataka', 'KA', 29),
('Goa', 'GA', 30),
('Lakshadweep Islands', 'LD', 31),
('Kerala', 'KL', 32),
('Tamil Nadu', 'TN', 33),
('Pondicherry', 'PY', 34),
('Andaman and Nicobar Islands', 'AN', 35),
('Telangana', 'TS', 36),
('Andhra Pradesh (New)', 'AD', 37);

-- --------------------------------------------------------

--
-- Table structure for table `tempconsumed`
--

CREATE TABLE `tempconsumed` (
  `ID` int NOT NULL,
  `WorkID` int NOT NULL,
  `MaterialID` int NOT NULL,
  `CQty` decimal(12,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tempemployee`
--

CREATE TABLE `tempemployee` (
  `ID` int NOT NULL,
  `EmployeeCode` int NOT NULL,
  `EmployeeName` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `WorkID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tempexpense`
--

CREATE TABLE `tempexpense` (
  `ID` int NOT NULL,
  `WorkID` int NOT NULL,
  `MaterialName` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Rate` decimal(9,2) NOT NULL,
  `Qty` decimal(9,2) NOT NULL,
  `Unit` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tempoffer`
--

CREATE TABLE `tempoffer` (
  `ID` int NOT NULL,
  `MaterialID` int NOT NULL,
  `ItemName` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `Rate` decimal(12,2) NOT NULL,
  `Qty` decimal(9,3) NOT NULL,
  `Inspection` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `VendorID` int NOT NULL,
  `GST` decimal(9,2) NOT NULL,
  `ModalNo` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `temprequirement`
--

CREATE TABLE `temprequirement` (
  `TID` int NOT NULL,
  `OrderID` int DEFAULT NULL,
  `SrNo` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MaterialName` varchar(1200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Qty` decimal(9,3) DEFAULT NULL,
  `Unit` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Rate` decimal(9,2) DEFAULT '0.00',
  `InspectingAuth` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `BillingType` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `ID` int NOT NULL,
  `Unit` varchar(20) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`ID`, `Unit`) VALUES
(1, 'meter'),
(3, 'Number'),
(4, 'Kg'),
(5, 'Km'),
(6, 'Set'),
(7, 'Station'),
(8, 'Lumpsum'),
(10, 'Pair'),
(11, 'Job'),
(12, 'Lot');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `VendorID` int NOT NULL,
  `VendorName` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Address` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DistrictCode` int DEFAULT NULL,
  `GSTNo` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Contact` varchar(13) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Email` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vendor_details`
--

CREATE TABLE `vendor_details` (
  `ID` int NOT NULL,
  `MaterialID` int NOT NULL,
  `OrderID` int DEFAULT NULL,
  `VendorID` int NOT NULL,
  `Finalized` tinyint NOT NULL DEFAULT '0',
  `FinalizedDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `vmaterialstatus`
-- (See below for the actual view)
--
CREATE TABLE `vmaterialstatus` (
`Organization` varchar(200)
,`OrganizationCode` int
,`DivisionCode` int
,`DivisionName` varchar(200)
,`OrderID` int
,`MaterialID` int
,`MaterialName` varchar(1200)
,`SrNo` varchar(100)
,`Rate` decimal(9,2)
,`Qty` decimal(9,3)
,`Unit` varchar(20)
,`InspectingAuth` varchar(100)
,`DemandDate` date
,`Type` varchar(100)
,`Status` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vpendingwork`
-- (See below for the actual view)
--
CREATE TABLE `vpendingwork` (
`Organization` varchar(200)
,`DivisionName` varchar(200)
,`SiteName` varchar(200)
,`SiteCode` int
,`OrderID` int
,`Work` varchar(100)
,`Qty` decimal(9,3)
,`Unit` varchar(20)
,`WorkID` int
,`WorkTypeID` int
,`EmployeeCode` int
,`EmployeeName` varchar(150)
,`StartDate` date
,`EndDate` date
,`AssignDate` date
,`LeftDays` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vpending_verification`
-- (See below for the actual view)
--
CREATE TABLE `vpending_verification` (
`VerificationID` int
,`Organization` varchar(200)
,`OrganizationCode` int
,`DivisionName` varchar(200)
,`DivisionCode` int
,`SiteName` varchar(200)
,`SiteCode` int
,`WorkID` int
,`MaterialName` varchar(1200)
,`Work` varchar(100)
,`Unit` varchar(20)
,`OrderID` int
,`WorkDate` date
,`Qty` decimal(9,3)
,`AdditionalEmployee` tinyint
,`EmployeeCode` int
,`EmployeeName` varchar(150)
);

-- --------------------------------------------------------

--
-- Table structure for table `worktype`
--

CREATE TABLE `worktype` (
  `WorkTypeID` int NOT NULL,
  `Work` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Table structure for table `work_verification`
--

CREATE TABLE `work_verification` (
  `VerificationID` int NOT NULL,
  `EmployeeCode` int NOT NULL,
  `SiteCode` int NOT NULL,
  `OrderID` int NOT NULL,
  `WorkID` int NOT NULL,
  `WorkTypeID` int NOT NULL,
  `Qty` decimal(9,3) NOT NULL,
  `WorkDate` date DEFAULT NULL,
  `AdditionalEmployee` tinyint NOT NULL DEFAULT '0',
  `VerificationRemark` varchar(300) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `VerificationByID` int NOT NULL,
  `VerificationDate` date DEFAULT NULL,
  `Accepted` tinyint NOT NULL DEFAULT '0',
  `Closed` tinyint DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure for view `organization_details`
--
DROP TABLE IF EXISTS `organization_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `organization_details`  AS  select `organization`.`Organization` AS `Organization`,`organization`.`OrganizationCode` AS `OrganizationCode`,`division`.`DivisionName` AS `DivisionName`,`division`.`DivisionCode` AS `DivisionCode`,`division`.`GSTIN` AS `GSTIN` from (`organization` join `division` on((`organization`.`OrganizationCode` = `division`.`OrganizationCode`))) ;

-- --------------------------------------------------------

--
-- Structure for view `pending_po`
--
DROP TABLE IF EXISTS `pending_po`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pending_po`  AS  select `organization_details`.`Organization` AS `Organization`,`organization_details`.`DivisionName` AS `DivisionName`,`orders`.`OrderID` AS `OrderID`,`po`.`PODate` AS `PODate`,`po`.`PONo` AS `PONo`,`po`.`POID` AS `POID`,`vendors`.`VendorName` AS `VendorName` from (((((`po` join `orders` on((`po`.`OrderID` = `orders`.`OrderID`))) join `organization_details` on((`orders`.`DivisionCode` = `organization_details`.`DivisionCode`))) join `po_details` on((`po`.`POID` = `po_details`.`POID`))) join `offers` on((`po`.`OrderID` = `offers`.`OrderID`))) join `vendors` on((`offers`.`VendorID` = `vendors`.`VendorID`))) where ((`po_details`.`POQty` - `po_details`.`ReadyQty`) > 0) ;

-- --------------------------------------------------------

--
-- Structure for view `site_details`
--
DROP TABLE IF EXISTS `site_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `site_details`  AS  select `organization`.`Organization` AS `Organization`,`organization`.`OrganizationCode` AS `OrganizationCode`,`division`.`DivisionName` AS `DivisionName`,`division`.`DivisionCode` AS `DivisionCode`,`division`.`GSTIN` AS `GSTIN`,`site`.`SiteName` AS `SiteName`,`site`.`SiteCode` AS `SiteCode`,`site`.`Address` AS `Address`,`site`.`Consignee` AS `Consignee` from ((`organization` join `division` on((`organization`.`OrganizationCode` = `division`.`OrganizationCode`))) join `site` on((`division`.`DivisionCode` = `site`.`DivisionCode`))) ;

-- --------------------------------------------------------

--
-- Structure for view `vmaterialstatus`
--
DROP TABLE IF EXISTS `vmaterialstatus`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vmaterialstatus`  AS  select `organization_details`.`Organization` AS `Organization`,`organization_details`.`OrganizationCode` AS `OrganizationCode`,`orders`.`DivisionCode` AS `DivisionCode`,`organization_details`.`DivisionName` AS `DivisionName`,`orders`.`OrderID` AS `OrderID`,`demand_details`.`MaterialID` AS `MaterialID`,`demand_details`.`MaterialName` AS `MaterialName`,`demand_details`.`SrNo` AS `SrNo`,`demand_details`.`Rate` AS `Rate`,`demand_details`.`Qty` AS `Qty`,`demand_details`.`Unit` AS `Unit`,`demand_details`.`InspectingAuth` AS `InspectingAuth`,`demand_details`.`DemandDate` AS `DemandDate`,`billingtype`.`Type` AS `Type`,`material_status`.`Status` AS `Status` from ((((`demand_details` join `orders` on((`demand_details`.`OrderID` = `orders`.`OrderID`))) join `organization_details` on((`orders`.`DivisionCode` = `organization_details`.`DivisionCode`))) join `material_status` on((`demand_details`.`Status` = `material_status`.`StatusID`))) join `billingtype` on((`demand_details`.`BillingType` = `billingtype`.`ID`))) ;

-- --------------------------------------------------------

--
-- Structure for view `vpendingwork`
--
DROP TABLE IF EXISTS `vpendingwork`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vpendingwork`  AS  select `organization_details`.`Organization` AS `Organization`,`organization_details`.`DivisionName` AS `DivisionName`,`site`.`SiteName` AS `SiteName`,`sitework`.`SiteCode` AS `SiteCode`,`sitework`.`OrderID` AS `OrderID`,`worktype`.`Work` AS `Work`,`sitework`.`Qty` AS `Qty`,`demand_details`.`Unit` AS `Unit`,`sitework`.`WorkID` AS `WorkID`,`sitework`.`WorkTypeID` AS `WorkTypeID`,`sitework`.`EmployeeCode` AS `EmployeeCode`,`employees`.`EmployeeName` AS `EmployeeName`,`sitework`.`StartDate` AS `StartDate`,`sitework`.`EndDate` AS `EndDate`,`sitework`.`AssignDate` AS `AssignDate`,(to_days(`sitework`.`EndDate`) - to_days(curdate())) AS `LeftDays` from (((((`sitework` join `worktype` on((`sitework`.`WorkTypeID` = `worktype`.`WorkTypeID`))) join `site` on((`sitework`.`SiteCode` = `site`.`SiteCode`))) join `organization_details` on((`site`.`DivisionCode` = `organization_details`.`DivisionCode`))) join `employees` on((`sitework`.`EmployeeCode` = `employees`.`EmployeeCode`))) join `demand_details` on((`sitework`.`MaterialID` = `demand_details`.`MaterialID`))) where ((`sitework`.`EmployeeCode` is not null) and (`sitework`.`AssignDate` is not null) and (`sitework`.`Closed` = 0)) ;

-- --------------------------------------------------------

--
-- Structure for view `vpending_verification`
--
DROP TABLE IF EXISTS `vpending_verification`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vpending_verification`  AS  select `work_verification`.`VerificationID` AS `VerificationID`,`site_details`.`Organization` AS `Organization`,`site_details`.`OrganizationCode` AS `OrganizationCode`,`site_details`.`DivisionName` AS `DivisionName`,`site_details`.`DivisionCode` AS `DivisionCode`,`site_details`.`SiteName` AS `SiteName`,`work_verification`.`SiteCode` AS `SiteCode`,`work_verification`.`WorkID` AS `WorkID`,`demand_details`.`MaterialName` AS `MaterialName`,`worktype`.`Work` AS `Work`,`demand_details`.`Unit` AS `Unit`,`work_verification`.`OrderID` AS `OrderID`,`work_verification`.`WorkDate` AS `WorkDate`,`work_verification`.`Qty` AS `Qty`,`work_verification`.`AdditionalEmployee` AS `AdditionalEmployee`,`work_verification`.`EmployeeCode` AS `EmployeeCode`,`employees`.`EmployeeName` AS `EmployeeName` from (((((`work_verification` join `site_details` on((`work_verification`.`SiteCode` = `site_details`.`SiteCode`))) join `employees` on((`work_verification`.`EmployeeCode` = `employees`.`EmployeeCode`))) join `sitework` on((`work_verification`.`WorkID` = `sitework`.`WorkID`))) join `demand_details` on((`sitework`.`MaterialID` = `demand_details`.`MaterialID`))) join `worktype` on((`work_verification`.`WorkTypeID` = `worktype`.`WorkTypeID`))) where ((`work_verification`.`Closed` = 0) and (`work_verification`.`VerificationDate` is null) and (`work_verification`.`VerificationRemark` is null)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `amcs`
--
ALTER TABLE `amcs`
  ADD PRIMARY KEY (`AMCID`);

--
-- Indexes for table `amcs_posting`
--
ALTER TABLE `amcs_posting`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `assignlogs`
--
ALTER TABLE `assignlogs`
  ADD PRIMARY KEY (`logID`);

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
-- Indexes for table `billingtype`
--
ALTER TABLE `billingtype`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `challan detail`
--
ALTER TABLE `challan detail`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`ComplaintID`);

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
-- Indexes for table `district`
--
ALTER TABLE `district`
  ADD PRIMARY KEY (`DistrictCode`);

--
-- Indexes for table `division`
--
ALTER TABLE `division`
  ADD PRIMARY KEY (`DivisionCode`);

--
-- Indexes for table `dochistory`
--
ALTER TABLE `dochistory`
  ADD PRIMARY KEY (`ID`);

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
-- Indexes for table `gadget`
--
ALTER TABLE `gadget`
  ADD PRIMARY KEY (`GadgetID`);

--
-- Indexes for table `gst rates`
--
ALTER TABLE `gst rates`
  ADD PRIMARY KEY (`ItemID`),
  ADD KEY `FullHSNCode` (`FullHSNCode`),
  ADD KEY `HSNCode` (`HSNCode`);

--
-- Indexes for table `inspectingauth`
--
ALTER TABLE `inspectingauth`
  ADD PRIMARY KEY (`ID`);

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
-- Indexes for table `loginlogs`
--
ALTER TABLE `loginlogs`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `material consumed`
--
ALTER TABLE `material consumed`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `material_status`
--
ALTER TABLE `material_status`
  ADD PRIMARY KEY (`StatusID`);

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
-- Indexes for table `orderstatus`
--
ALTER TABLE `orderstatus`
  ADD PRIMARY KEY (`StatusID`);

--
-- Indexes for table `organization`
--
ALTER TABLE `organization`
  ADD PRIMARY KEY (`OrganizationCode`);

--
-- Indexes for table `pendingworklog`
--
ALTER TABLE `pendingworklog`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `pghistory`
--
ALTER TABLE `pghistory`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `pgtype`
--
ALTER TABLE `pgtype`
  ADD PRIMARY KEY (`PGTypeID`);

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
-- Indexes for table `siteorders`
--
ALTER TABLE `siteorders`
  ADD PRIMARY KEY (`OrderID`);

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
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`StateCode`),
  ADD KEY `ShortCode` (`ShortCode`),
  ADD KEY `StateCode` (`StateCode`);

--
-- Indexes for table `tempconsumed`
--
ALTER TABLE `tempconsumed`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tempemployee`
--
ALTER TABLE `tempemployee`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tempexpense`
--
ALTER TABLE `tempexpense`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tempoffer`
--
ALTER TABLE `tempoffer`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `temprequirement`
--
ALTER TABLE `temprequirement`
  ADD PRIMARY KEY (`TID`);

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
-- Indexes for table `work_verification`
--
ALTER TABLE `work_verification`
  ADD PRIMARY KEY (`VerificationID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `amcs`
--
ALTER TABLE `amcs`
  MODIFY `AMCID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amcs_posting`
--
ALTER TABLE `amcs_posting`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assignlogs`
--
ALTER TABLE `assignlogs`
  MODIFY `logID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `billbook`
--
ALTER TABLE `billbook`
  MODIFY `BillID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `billdetail`
--
ALTER TABLE `billdetail`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `billingtype`
--
ALTER TABLE `billingtype`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `challan detail`
--
ALTER TABLE `challan detail`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `ComplaintID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliverychallan`
--
ALTER TABLE `deliverychallan`
  MODIFY `ChallanID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `demands`
--
ALTER TABLE `demands`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `demand_details`
--
ALTER TABLE `demand_details`
  MODIFY `MaterialID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=412;

--
-- AUTO_INCREMENT for table `designation`
--
ALTER TABLE `designation`
  MODIFY `DesignationID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `district`
--
ALTER TABLE `district`
  MODIFY `DistrictCode` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=768;

--
-- AUTO_INCREMENT for table `division`
--
ALTER TABLE `division`
  MODIFY `DivisionCode` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `dochistory`
--
ALTER TABLE `dochistory`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `employee expense`
--
ALTER TABLE `employee expense`
  MODIFY `ExpenseID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `EmployeeCode` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `gadget`
--
ALTER TABLE `gadget`
  MODIFY `GadgetID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gst rates`
--
ALTER TABLE `gst rates`
  MODIFY `ItemID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `inspectingauth`
--
ALTER TABLE `inspectingauth`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `issuechallan`
--
ALTER TABLE `issuechallan`
  MODIFY `ChallanID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `issuechallan detail`
--
ALTER TABLE `issuechallan detail`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loginlogs`
--
ALTER TABLE `loginlogs`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT for table `material consumed`
--
ALTER TABLE `material consumed`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `material_status`
--
ALTER TABLE `material_status`
  MODIFY `StatusID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `movement`
--
ALTER TABLE `movement`
  MODIFY `MovementID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `OfferID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `offer terms`
--
ALTER TABLE `offer terms`
  MODIFY `TermID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `orderstatus`
--
ALTER TABLE `orderstatus`
  MODIFY `StatusID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `organization`
--
ALTER TABLE `organization`
  MODIFY `OrganizationCode` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `pendingworklog`
--
ALTER TABLE `pendingworklog`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pghistory`
--
ALTER TABLE `pghistory`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pgtype`
--
ALTER TABLE `pgtype`
  MODIFY `PGTypeID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `po`
--
ALTER TABLE `po`
  MODIFY `POID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `po_details`
--
ALTER TABLE `po_details`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `site`
--
ALTER TABLE `site`
  MODIFY `SiteCode` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `siteorders`
--
ALTER TABLE `siteorders`
  MODIFY `OrderID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `sitesurvey`
--
ALTER TABLE `sitesurvey`
  MODIFY `SurveyID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=623;

--
-- AUTO_INCREMENT for table `sitework`
--
ALTER TABLE `sitework`
  MODIFY `WorkID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `tempconsumed`
--
ALTER TABLE `tempconsumed`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tempemployee`
--
ALTER TABLE `tempemployee`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tempexpense`
--
ALTER TABLE `tempexpense`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tempoffer`
--
ALTER TABLE `tempoffer`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `temprequirement`
--
ALTER TABLE `temprequirement`
  MODIFY `TID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=538;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `VendorID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `vendor_details`
--
ALTER TABLE `vendor_details`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `worktype`
--
ALTER TABLE `worktype`
  MODIFY `WorkTypeID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `work_verification`
--
ALTER TABLE `work_verification`
  MODIFY `VerificationID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
