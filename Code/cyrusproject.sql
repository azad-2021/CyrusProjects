-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 21, 2023 at 10:33 AM
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
-- Table structure for table `amcs`
--

CREATE TABLE `amcs` (
  `AMCID` int(11) NOT NULL,
  `SiteCode` int(11) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `GenDate` date NOT NULL DEFAULT current_timestamp(),
  `ExpectedCompletion` date DEFAULT NULL,
  `AssignDate` date DEFAULT NULL,
  `EmployeeCode` int(11) NOT NULL,
  `Attended` tinyint(4) NOT NULL DEFAULT 0,
  `AttendDate` date DEFAULT NULL,
  `ExecutiveRemark` varchar(200) DEFAULT NULL,
  `VerificationRemark` varchar(200) DEFAULT NULL,
  `EntryDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `amcs_posting`
--

CREATE TABLE `amcs_posting` (
  `ID` int(11) NOT NULL,
  `DivisionCode` int(11) NOT NULL,
  `GadgetID` int(11) NOT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `Amount` decimal(9,2) NOT NULL,
  `PostedDate` date NOT NULL DEFAULT current_timestamp(),
  `Gen` tinyint(4) NOT NULL DEFAULT 0,
  `GenDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `assignlogs`
--

CREATE TABLE `assignlogs` (
  `logID` int(11) NOT NULL,
  `WorkType` varchar(50) NOT NULL,
  `ID` int(11) NOT NULL,
  `AssignedBy` int(11) NOT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Table structure for table `billingtype`
--

CREATE TABLE `billingtype` (
  `ID` int(11) NOT NULL,
  `Type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `billingtype`
--

INSERT INTO `billingtype` (`ID`, `Type`) VALUES
(1, 'Supply only'),
(2, 'Installation only'),
(3, 'Supply and installation'),
(4, 'Labour Work');

-- --------------------------------------------------------

--
-- Table structure for table `challan detail`
--

CREATE TABLE `challan detail` (
  `ID` int(11) NOT NULL,
  `MaterialID` int(11) NOT NULL,
  `ChallanNo` varchar(50) DEFAULT NULL,
  `ReadyQty` int(11) NOT NULL,
  `Rate` decimal(9,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `challan detail`
--

INSERT INTO `challan detail` (`ID`, `MaterialID`, `ChallanNo`, `ReadyQty`, `Rate`) VALUES
(6, 5, '2223CEUP2', 30, '1200.00'),
(7, 5, '2223CEUP3', 30, '12.00');

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `ComplaintID` int(11) NOT NULL,
  `SiteCode` int(11) NOT NULL,
  `Description` varchar(500) NOT NULL,
  `DateofInformation` date DEFAULT NULL,
  `ExpectedCompletion` date DEFAULT NULL,
  `AssignDate` date DEFAULT NULL,
  `EmployeeCode` int(11) DEFAULT NULL,
  `ReceivedBy` varchar(100) DEFAULT NULL,
  `MadeBy` varchar(100) DEFAULT NULL,
  `Attended` tinyint(4) NOT NULL DEFAULT 0,
  `AttendDate` date DEFAULT NULL,
  `ExecutiveRemark` varchar(200) DEFAULT NULL,
  `VerificationRemark` varchar(200) DEFAULT NULL,
  `EntryDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `deliverychallan`
--

CREATE TABLE `deliverychallan` (
  `ChallanID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `PONo` varchar(500) DEFAULT NULL,
  `MovementID` int(11) DEFAULT NULL,
  `ShippingAddress` varchar(500) DEFAULT NULL,
  `StateCode` int(11) NOT NULL,
  `SiteCode` int(11) DEFAULT NULL,
  `EmployeeCode` int(11) DEFAULT NULL,
  `ChallanDate` date DEFAULT NULL,
  `Delivered` tinyint(4) NOT NULL DEFAULT 0,
  `DeliveryDate` date DEFAULT NULL,
  `ChallanNo` varchar(50) DEFAULT NULL,
  `Cancelled` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deliverychallan`
--

INSERT INTO `deliverychallan` (`ChallanID`, `OrderID`, `PONo`, `MovementID`, `ShippingAddress`, `StateCode`, `SiteCode`, `EmployeeCode`, `ChallanDate`, `Delivered`, `DeliveryDate`, `ChallanNo`, `Cancelled`) VALUES
(6, 10, '2223CE5', 3, '  ABC\n', 9, 1, NULL, '2022-11-02', 0, NULL, '2223CEUP2', 0);

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
(3, 10, '2022-10-28', '2022-11-08', 1, NULL, NULL, 2),
(4, 11, '2022-11-08', '2022-11-08', 1, NULL, NULL, 2),
(5, 12, '2022-11-09', NULL, NULL, NULL, NULL, 1),
(6, 13, '2022-11-09', '2022-11-09', 1, NULL, NULL, 2),
(7, 14, '2022-11-11', '2022-11-12', 1, NULL, NULL, 2),
(8, 15, '2022-11-12', '2022-11-12', 1, NULL, NULL, 2),
(9, 16, '2022-11-12', NULL, NULL, NULL, NULL, 1),
(10, 17, '2023-03-11', NULL, NULL, NULL, NULL, 1),
(11, 18, '2023-03-11', NULL, NULL, NULL, NULL, 1),
(12, 19, '2023-03-17', '2023-03-20', 1, NULL, NULL, 2);

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
  `BillingType` int(11) NOT NULL DEFAULT 0,
  `DemandDate` date NOT NULL,
  `Status` int(11) NOT NULL DEFAULT 1,
  `OnSite` tinyint(4) NOT NULL DEFAULT 0,
  `Issued` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `demand_details`
--

INSERT INTO `demand_details` (`MaterialID`, `OrderID`, `MaterialName`, `SrNo`, `Qty`, `Unit`, `Rate`, `InspectingAuth`, `BillingType`, `DemandDate`, `Status`, `OnSite`, `Issued`) VALUES
(4, 10, 'Supply of UTP indoor cable CAT 6 ,UTP cable CAT-6 to support 10-100-1000 Mbps .The category 6 cable should consists of 4 pair of solid insulated copper 23 AWG (0.57mm) pairs separated with a central slit film filler, insulation -polyethylene Make D-link, Molex, Dax, Schncider or similar. Inspection by Consignee.', 'Schedule 01-Schedule A Supply Portion Sr. No-1', 10000, 'meter', '21.67', 'Inspection by Consignee.', 0, '2022-10-28', 6, 0, 0),
(5, 10, 'Supply of optical fiber cable as per RDSO specification IRS:TC 55-2006 Rev.1 Amnd.1.1 with latest amnd. Inspection by Consignee.', 'Schedule 01-Schedule A Supply Portion Sr. No-2', 2000, 'meter', '59.25', 'Inspection by Consignee.', 0, '2022-10-28', 6, 1, 0),
(6, 10, 'Laying of signalling-Power-Telecom cable of various cores-sizes in trenches.', 'Schedule 02-Schedule B Execution Portion-Sr. No-11', 5, 'meter', '6820.57', 'Inspection by Authority', 1, '2022-10-28', 1, 0, 0),
(7, 10, 'Cutting of cable trench in mechanadised -concrete and stone paved road-track crossing-culvert-metal-road crossing to a depth of 1.0 mtr and width .30 mtr for laying of cable and restoring the surface with plaster-tiles etc', 'Schedule 02-Schedule B Execution Portion Sr. No-12', 1000, 'meter', '275.60', 'Inspection by Consinee', 1, '2022-10-28', 1, 0, 0),
(13, 13, 'Supply of UTP indoor cable CAT 6 ,UTP cable CAT-6 to support 10-100-1000 Mbps .The category 6 cable should consists of 4 pair of solid insulated copper 23 AWG (0.57mm) pairs separated with a central slit film filler, insulation -polyethylene Make D-link, Molex, Dax, Schncider or similar. Inspection by Consignee.', 'Schedule 01-Schedule A  Supply Portion-1', 10000, 'meter', '21.67', 'Inspection by Consignee.', 3, '2022-11-09', 1, 0, 0),
(14, 13, 'Supply of optical fiber cable as per RDSO specification IRS:TC 55-2006 Rev.1 Amnd.1.1 with latest amnd. Inspection by Consignee.', 'Schedule 01-Schedule -A  Supply Portion-2', 2000, 'meter', '59.25', 'Inspection by Consignee.', 3, '2022-11-09', 1, 0, 0),
(15, 13, 'Supply of 6U, 19\" covered Rack with (1) front side transparent door with lock arrangement (2) cable organizers (3) provision of one no. of power supply( each consists of 6 nos. x 15A-15A multipin sockets with ON-OFF switch and fuse arrangement) strip HCL or Rittel or APW or President or similar. Inspection by Consignee.', 'Schedule 01-Schedule -A Supply Portion-3', 20, 'Number', '2618.73', 'Inspection by Consignee.', 3, '2022-11-09', 1, 0, 0),
(16, 13, 'Supply of SC-LC-LC-PC-SC-SC-LC-LC fiber patch cord -10 meter length as required by optical interface and FMS used in this work Make TYCO- MOLEX- AMP-3M- PANDUIT- SYSTIMAX-KRONE or Similar. Inspection by Consignee.', 'Schedule 01-Schedule A Supply Portion-4', 220, 'Number', '1488.61', 'Inspection by Consignee.', 3, '2022-11-09', 1, 0, 0),
(17, 13, 'Supply of 1 inch PVC conduit pipe Make Anchour Krone-Srinath or similar. Inspection by Consignee.', 'Schedule 01-Schedule A Supply Portion-5', 500, 'meter', '8.98', 'Inspection by Consignee.', 3, '2022-11-09', 1, 0, 0),
(18, 13, 'Supply of 12 Fiber unarmoured single mode Optical Fiber Cable Make Finolex- KEC- sterlite- AMP- Molex or similar. Inspection by Consignee.', 'Schedule 01-Schedule A Supply Portion-9', 2000, 'Number', '12.40', 'Inspection by Consignee.', 3, '2022-11-09', 1, 0, 0),
(19, 13, 'Supply of PVC insulated flexible 3 core x 2.5 sq.mm multi strand power cable to meet specification of IS 694:1190 re-affirmed 1995 or latest Make Finolex -Polycab -Anchor -Havells or similar. Inspection by Consignee.', 'Schedule 01-Schedule A Supply Portion-10', 900, 'meter', '63.42', 'Inspection by Consignee.', 3, '2022-11-09', 1, 0, 0),
(20, 13, 'Supply, installation, testing & commissioning of Layer-3 manageable switch 24 ports of 10-100-1000 Mbps with minimum 4 numbers of 10G base X, SM SFP + port, MAC addresses 48K, Minimum 200 Gbps switching capacity, with redundant power supply, multiple VLAN registration Protocol (MVRP) Make - Alcatel Lucent-Cisco-HP-RUCKUS or equivalent.', 'Schedule 02-Schedule B Execution Portion-1', 1, 'Number', '128686.53', 'Inspection by Consignee', 3, '2022-11-09', 1, 0, 0),
(21, 13, 'Supply, Installation, Testing & commissioning of 24 port Ethernet PoE switch providing of 24- 10-100-1000 Base -T ethernet ports and 4 SFP slots for high access capacity.1-24 ports supports PoE+ (30W) power supply and PoE output full power upto 370 W. Providing DC power and data transmission for AP .IP phones and IP camera through category 5 twisted pair. Providing safer protection system. Excellent QoS strategy. Supply item Inspection by Consignee. Make - Alcatel Lucent-CISCO-HP-RUCKUS or Equiv', 'Schedule 02-Schedule B Execution Portion-2', 39, 'Number', '115380.79', 'Inspection by Consignee', 3, '2022-11-09', 1, 0, 0),
(22, 13, 'Supply , Installation, testing and commissioning of 10 ports Gigabit switch with PoE ports -08 Nos and SFP ports -02 Nos. of 10-100-1000 base T Ethernet port 1-8 supports PoE +(30 W) power supply and PoE output full power up to 115 W providing DC power and data transmission for AP,IP phone and IP cameras through category 5 twisted pair. Supply item Inspection by Consignee. Make - Alcatel lucent-Cisco-HP-RUCKUS or Equivalent.', 'Schedule 02-Schedule B Execution Portion-3', 8, 'Number', '8455.54', 'Inspection by Consignee', 3, '2022-11-09', 1, 0, 0),
(23, 13, 'Supply and installation of covered 19\" (42U) Racks of size 2200mm X 600mm X 600mm (HCU Vero President-Rittal-Puncom make or similar) complete with all fittings including DC Fans(4Bv)-2Nos.and AC power distribution panel ( horizontal fitting} with Power sockets and fuse protection (Minimum 6 Nos.of 230V15Ai5A combined} and other accessories. The body sho Id be of high quality cold rolled steel, with wheel and caster arrangement, vented front doo borders and rear doors for ventilation and reliabl', 'Schedule 02-Schedule B Execution Portion-4', 3, 'Number', '26070.90', 'Inspection by Consignee.', 3, '2022-11-09', 1, 0, 0),
(24, 13, 'Supply and installation of GLC-LH-SMD SFP transceiver for above 10 ports and 24 ports switches. Supply item Inspection by Consignee. Make - Alcatel lucent-CISCO-HP-RUCKUS or equivalent.', 'Schedule 02-Schedule B Execution Portion-5', 54, 'Number', '18806.23', 'Inspection by Consignee', 3, '2022-11-09', 1, 0, 0),
(25, 13, 'Laying of OFC-Power cable through HDPE pipe-casing capping-fall ceiling with laying-fixing of HDPE pipe-casing capping for networking system and for connecting-inferacing various component (cutting of masonry wall at the entry of room, repairing of masonary wall, cement plastering at site requirement are to be supplied by contractor) and system integration. All materials for jointing and termination of power cable-CAT-6 cable as per site requirement are to be supplied by contractor.', 'Schedule 02-Schedule B Execution Portion-6', 7500, 'meter', '18.42', 'Inspection by Consignee', 4, '2022-11-09', 1, 0, 0),
(26, 13, 'Supply and fixing of different size PVC casing and capping-Pipe in Grey or Cream colour slotted channel through confirming to IS standard as required by Railways at size 25@47&47(47@50mm . By fixing-clamping at a regular interval to the wall for indoor wiring Make Sudhaker -Modi -Sun -Finolex-AKG or similar. Supply item Inspection by Consignee.', 'Schedule 02-Schedule B Execution Portion-7', 7100, 'meter', '34.34', 'Inspection by Consignee.', 3, '2022-11-09', 1, 0, 0),
(27, 13, 'Installation, Supply of 19 1U size rack mountable 12 F OFC LIU loaded with SC-SC connectors complaints to meet industrial standard .This includes splicing and termination of 12F cable as per Railway requirements and fixing in rack-wall mounted as directed by Railway Engineer.(OTDR reading to be taken and submitted ) Make Molex-3M-AMP-KRONE or similar. Supply item inspection by Consignee.', 'Schedule 02-Schedule B Execution Portion-8', 32, 'Number', '4404.52', 'inspection by Consignee.', 3, '2022-11-09', 1, 0, 0),
(28, 13, 'Supply & installation of 3 mtrs length CAT6 UTP patch cord both end RJ 45 crimped . Supply item inspection by Consignee.', 'Schedule 02-Schedule B Execution Portion-9', 200, 'Number', '136.16', 'inspection by Consignee.', 3, '2022-11-09', 1, 0, 0),
(30, 13, 'Laying of signalling-Power-Telecom cable of various cores-sizes in trenches.', 'Schedule 02-Schedule B Execution Portion-11', 5450, 'meter', '6820.57', 'Inspection by Consignee', 4, '2022-11-09', 1, 0, 0),
(31, 13, 'Excavation of trench as per cable route plan, 1.2 mtr deep, 300mm wide at the bottom along main line in normal soil, This work includes covering of cable laid in trenches by loose soil for a layer of 50 mm thickness approximately before covering by stone-bricks , clearing of route, bushes etc and refilling of the trench by excavated soil and ramming after laying of the required quantity of cables as per instructions of Engineer at site. If it is not possible to reach the required depth at any lo', 'Schedule 02-Schedule B Execution Portion-10', 5450, 'meter', '62574.48', 'Inspection by Consignee', 4, '2022-11-09', 1, 0, 0),
(32, 13, 'Horizontal drilling at an approximately depth of formation level of the earth including insertion of HDPE-WDC pipe with its coupling and insertion of different size of cable etc. as per site requirement.', 'Schedule 02-Schedule B Execution Portion-12', 500, 'meter', '695.10', 'Inspection by consignee', 4, '2022-11-09', 1, 0, 0),
(33, 13, 'Installation and supply of 10 KVA on line UPS single phase Make APC -Numeric -emerson or similar ,19 rack mountable type with 1 hrs. backup along with suitable AH capacity battery.', 'Schedule 02-Schedule B Execution Portion-13', 2, 'Number', '147260.00', 'Inspection by Consignee', 3, '2022-11-09', 3, 0, 0),
(34, 13, 'Supply and installation of AIO PC for NMS support', 'Schedule 02-Schedule B Execution Portion-14', 1, 'Number', '40552.00', 'Inspection by Consignee', 3, '2022-11-09', 1, 0, 0),
(35, 13, 'Supply and installation ACX 2200 routers for central hospital Jabalpur', 'Schedule 02-Schedule B Execution Portion-15', 2, 'Number', '137122.00', 'Inspection by Consignee', 3, '2022-11-09', 1, 0, 0),
(36, 14, 'Supply and testing of  Unify Digital phone end  point for PABX system.  Make-Model- Unify  Openstage 15T or  similar. Inspection by -  Consignee ', 'Schedule A Sr-No.1', 12, 'Number', '8127.72', 'Inspection by -  Consignee ', 3, '2022-11-11', 1, 0, 0),
(37, 14, 'Excavation of cable trench as per cable route plan, 1.2 Meter deep and of 0.3 Meter to 0.6 Meter wide at bottom as per RDSO sketch No. SDO-CABLE LAYING-003, issued vide RDSO document no. RDSO-SI-G-2010 Version 1.1 dated 04.02.2014 or latest, alongside the track in normal soil-strata [including soft rock], conforming to distances as per cable route plan and refilling and ramming of loose soil. This work includes clearing of route from bushes etc, covering of cable laid in trench by loose soil for', 'Schedule A- Sr. No.-2', 1000, 'meter', '54.52', 'Inspection by - Consignee', 4, '2022-11-11', 1, 0, 0),
(38, 14, 'Cutting of all types of  platforms-road  crossing and trenching  and excavation to a  width and depth of 300  mm x 300 mm, laying  of DWC-HDPE-GI pipe  in the trench and  refilling and concreting  it afterwards as per  original condition. In  hard rocky ground  area , cables will be  laid normally on layer  of soft earth of 0.05  meter thickness  previously deposited at  bottom of the trench .  The cutting to be filled  and finished with  cement-concrete, as  per the RDSO drawing  no.SDO-Cable  ', 'Schedule A-Sr. No.-3', 500, 'meter', '134.09', 'Inspection by -  Consignee ', 4, '2022-11-11', 1, 0, 0),
(39, 14, '\"Horizontal direction drilling (HDD)-Trenchless digging-machine drilling with-out damage to surface road -track for laying-insertion of HDPE-GI-DWC pipe. The bore shall be done at the depth of minimum 1400 mm from the ground level. The ground level shall be considered ignoring the bank height of the bank of the road. Note:- DWC-HDPE-GI Pipe Supply is not covered under this item. Contactor shall provide all material required for work and adequate nos. of labours for proper laying of cables into t', ' Schedule A-Sr. No-4', 200, 'meter', '520.20', 'Inspection by - Consignee', 4, '2022-11-11', 1, 0, 0),
(40, 14, 'Supply and Installation of Fibre distribution management system as per RDSO spec. no. RDSO-SPN-TC-37-2020 Revision 4.0 or latest. It includes the supply of 19 inch 42U rack with mounting arrangement. It will also include all installation material, splicing, termination, testing of all 2 x 24 fibres. Inspection by - Consignee', ' Schedule A-Sr. No.-5', 4, 'Number', '65280.07', 'Inspection by - Consignee', 3, '2022-11-11', 1, 0, 0),
(41, 14, 'Supply of OFC patch cord- jumper cable, 10 meter long, with [1] FC-PC connectors on both sides or [2] One end FC-PC connector and other end compatible to work with STM-1. Inspection by - Consignee', ' Schedule A-Sr. No.-6', 200, 'Number', '1505.85', 'Inspection by - Consignee', 3, '2022-11-11', 1, 0, 0),
(42, 14, 'Supply of FC-PC type connectors of 5-10-20 dB and multiple of 5 dB up to 20 dB. Inspection by - Consignee', ' Schedule A-Sr. No.-7', 85, 'Number', '217.70', 'Inspection by - Consignee', 3, '2022-11-11', 1, 0, 0),
(43, 14, 'Supply and Installation of RJ-45 patch cord, seven feet long, of reputed make like Molex or similar, with 02 no. of RJ-45 connectors for every patch cord. Inspection by - Consignee', ' Schedule A-Sr. No-8', 445, 'Number', '146.84', 'Inspection by - Consignee', 3, '2022-11-11', 1, 0, 0),
(44, 14, 'Supply of UTP CAT-6 cable of reputed make Siemen- Systemax-  D-Link- Tyco- Krone- AMP or similar. Inspection by - Consignee', ' Schedule A-Sr. No.-9', 1000, 'meter', '18.87', 'Inspection by - Consignee', 3, '2022-11-11', 1, 0, 0),
(45, 14, 'Laying of UTP-STP CAT-6 cable-power cable in PVC casing capping of appropriate size. The work also includes supply and fixing of casing and capping, fixing and connection of patch panel, fixing of CAT-6 cable with RJ 45 connectors. Work to be done as per instructions of site incharge. Inspection by - Consignee', ' Schedule A-Sr. No-10', 1000, 'meter', '38.10', 'Inspection by - Consignee', 4, '2022-11-11', 1, 0, 0),
(46, 14, 'Supply of 06 Core  Optical Fiber Cable  Armoured Single Mode.  Make : D-Link or  similar of reputed  make. Inspection by -  Consignee ', 'Schedule A-Sr. No.-11', 8000, 'meter', '22.01', 'Inspection by -  Consignee ', 3, '2022-11-12', 1, 0, 0),
(47, 14, 'Laying of Data cableor  Communication cableor  Power cable etc. in PVC  conduit pipe with all  fiitings and accessories  [As per site  requirement].  Inspection by -  Consignee', 'Schedule A-Sr. No.-12', 8000, 'meter', '15.79', 'Inspection by -  Consignee', 4, '2022-11-12', 1, 0, 0),
(48, 14, 'Supply and installation  [splicing of fiber] of  Rack Mount LIU 12  Core Loaded with SC  Adaptors. Make :  D-Link or similar of  reputed make.  Inspection by -  Consignee ', 'Schedule A-Sr. No.-13', 50, 'Number', '5396.65', 'Inspection by -  Consignee ', 3, '2022-11-12', 1, 0, 0),
(49, 14, 'Supply of permanently  lubricated HDPE duct,  40 mm outer dia, as  per RDSO spec. No.  RDSOorSPNorTCor45or2013  Rev.2 Amndt.2 or  latest, along with all  accessories like end  caps, collars, bends,  couplers etc.  Inspection by - RITES ', 'Schedule A-Sr. No.-14', 8000, 'meter', '64828.84', 'Inspection by - RITES ', 3, '2022-11-12', 1, 0, 0),
(50, 14, 'Laying of HDPE duct as  per the approved cable  route plan in the  exavated trenchesor  other protected worksor  RCC channel etc.  including all  accessories like end  caps, collars, bends,  couplers etc. The ends  of the duct to be  sealed with end plugs  till OFC blowing is  done. Important: The  laying of OFC cable  independently or along  with Quad cableor PIJF  cable in the same  trench shall be  governed by the RDSO  drawings no.  RDSOorTCDOorCOP-6[a]  and  RDSOorTCDOorCOP-8 [a]  respectiv', 'Schedule A-Sr. No.-15', 8000, 'meter', '6829.86', 'Inspection by -  Consignee ', 4, '2022-11-12', 1, 0, 0),
(51, 14, 'Supply of Cable fault  locator for metallic S&T  cables of reputed make  Aplabor Stanleyor 3M etc.  Item to be supplied  after successful  demonstration and  approval of Railways.  Inspection by -  Consignee', 'Schedule A-Sr. No.-16', 1, 'Number', '254531.85', 'Inspection by -  Consignee', 3, '2022-11-12', 1, 0, 0),
(52, 14, 'Supply of 8 port  Gigabit Lite Managed  PoE Layer 2 Switch  supports 8 nos 10or  100or 1000 BASE-T  ports, along with 2  Gigabit SFP ports,  green-saving  technologies, make  model DG-GS1510HPL  DIGISOL or CISCOor  JUNIPER or superior.  Technical specification  attached. Inspection by  - RITES', 'Schedule A-Sr. No.-17', 35, 'Number', '15873.49', 'Inspection by  - RITES', 3, '2022-11-12', 1, 0, 0),
(53, 14, 'Supply, installation,  testing and  commissioning of SFP  1 G to suit and match  Gigabit switch.  Inspection by -  Consignee ', 'Schedule A-Sr. No.-18', 70, 'Number', '2294.58', 'Inspection by -  Consignee ', 3, '2022-11-12', 1, 0, 0),
(54, 14, 'Supply, Installation,  testing and  commissioning of 24  port Layer-2 Managed  Gigabit Ethernet Switch  with 02 Nos. 1 Gigabit  Ports with SFP module.  Make : Juniper or  CISCO or ARUBA or  similar of reputed  make. Technical  specification attached.  Inspection by - RITES ', 'Schedule A-Sr. No.-19', 8, 'Number', '58190.15', 'Inspection by - RITES ', 3, '2022-11-12', 1, 0, 0),
(55, 14, 'Supply of 2 Mbps  Router, 2 LANor 4 WAN  port, 230V AC  operated, as per RDSO  spec. no. RDSOor SPNor  TCor 84or 2008 Rev. 0 or  latest, along with  connecting cables,  connectors etc. for  connecting to the  ethernet devices, of  reputed make like  Ciscoor Dlink or better.  Inspection by - RITES', 'Schedule A-Sr. No.-20', 6, 'Number', '70529.43', 'Inspection by - RITES', 3, '2022-11-12', 1, 0, 0),
(56, 14, 'Supply, installation,  testing and  commissioning of  Router Cisco ISR  4451-X or latest or  similar 1-2 G system  throughput as per  technical specification.  Inspection by -  Consignee ', 'Schedule A-Sr. No.-21', 1, 'Number', '354020.88', 'Inspection by -  Consignee ', 3, '2022-11-12', 1, 0, 0),
(57, 14, 'Supply, Installation,  testing and  commissioning of Layer  -3 switch with 24 blank  SFP slots and 2 blank  SFP slots for uplink  with redudent power  supply. Make: Juniperor  CISCO or similar.  Technical specification  attached. Inspection by  - RITES ', 'Schedule A-Sr. No.-22', 4, 'Number', '144065.31', 'Inspection by  - RITES ', 3, '2022-11-12', 1, 0, 0),
(58, 14, 'Supply and testing of  1.25 G SFP with dual  Fiber for maximum  distance of 20 KM,  1310 nm, LC  connectors. Technical  specification attached.  Inspection by -  Consignee', 'Schedule A-Sr. No.-23', 80, 'Number', '1571.62', 'Inspection by -  Consignee', 3, '2022-11-12', 1, 0, 0),
(59, 14, 'Supply and testing of  10 G SFP with dual  Fiber for maximum  distance of 20 KM,  1310 nm, LC  connectors. Technical  specification attached.  Inspection by -  Consignee ', 'Schedule A-Sr. No.24', 4, 'Number', '6548.43', 'Inspection by -  Consignee ', 3, '2022-11-12', 1, 0, 0),
(60, 14, 'Supply and testing of 1  G 1000 base TX  [Copper]. Technical  specification attached.  Inspection by -  Consignee ', 'Schedule A-Sr. No.-25', 8, 'Number', '3710.77', 'Inspection by -  Consignee ', 3, '2022-11-12', 1, 0, 0),
(61, 15, 'Supply and testing of  Unify Digital phone end  point for PABX system.  Make orModel- Unify  Openstage 15T or  similar. Inspection by -  Consignee ', 'Schedule A-Sr. No.-1', 12, 'Number', '8705.52', 'Inspection by -  Consignee ', 3, '2022-11-12', 1, 0, 0),
(62, 15, 'Excavation of cable  trench as per cable  route plan, 1.2 Meter  deep and of 0.3 Meter  to 0.6 Meter wide at  bottom as per RDSO  sketch No. SDO orCABLE  LAYING or003, issued  vide RDSO document  no. RDSO orSI orG or2010  Version 1.1 dated  04.02.2014 or latest,  alongside the track in  normal soil orstrata  [including soft rock],  conforming to  distances as per cable  route plan and refilling  and ramming of loose  soil. This work includes  clearing of route from  bushes etc, covering of  cabl', 'Schedule A-Sr. No.-2', 1000, 'meter', '58.40', 'Inspection by -  Consignee', 4, '2022-11-12', 1, 0, 0),
(63, 15, 'Cutting of all types of  platforms orroad  crossing and trenching  and excavation to a  width and depth of 300  mm x 300 mm, laying  of DWC orHDPE orGI pipe  in the trench and  refilling and concreting  it afterwards as per  original condition. In  hard rocky ground  area , cables will be  laid normally on layer  of soft earth of 0.05  meter thickness  previously deposited at  bottom of the trench .  The cutting to be filled  and finished with  cement orconcrete, as  per the RDSO drawing  no.SDO', 'Schedule A-Sr. No.-3', 500, 'meter', '143.63', 'Inspection by -  Consignee ', 4, '2022-11-12', 1, 0, 0),
(64, 15, '\"Horizontal direction  drilling  (HDD) orTrenchless  digging ormachine  drilling with-out  damage to surface  road  ortrack for  laying orinsertion of  HDPE orGI orDWC pipe.  The bore shall be done  at the depth of  minimum 1400 mm  from the ground level.  The ground level shall  be considered ignoring  the bank height of the  bank of the road.  Note:- DWC orHDPE orGI  Pipe Supply is not  covered under this  item. Contactor shall  provide all material  required for work and  adequate nos. of  la', ' Schedule A-Sr. No.-4', 200, 'meter', '557.18', 'Inspection by -  Consignee\" ', 4, '2022-11-12', 1, 0, 0),
(65, 15, 'Supply and Installation  of Fibre distribution  management system  as per RDSO spec. no.  RDSO orSPN orTC or37 or2020  Revision 4.0 or latest.  It includes the supply  of 19 inch 42U rack  with mounting  arrangement. It will  also include all  installation material,  splicing, termination,  testing of all 2 x 24  fibres. Inspection by -  Consignee ', 'Schedule A-Sr. No.-5', 4, 'Number', '69920.84', 'Inspection by -  Consignee ', 3, '2022-11-12', 1, 0, 0),
(66, 15, 'Supply of OFC patch  cord or jumper cable, 10  meter long, with [1]  FC orPC connectors on  both sides or [2] One  end FC orPC connector  and other end  compatible to work  with STM-1. Inspection  by - Consignee', 'Schedule A-Sr. No.-6', 200, 'Number', '1612.90', 'Inspection  by - Consignee', 3, '2022-11-12', 1, 0, 0),
(67, 15, 'Supply of FC orPC type  connectors of 5 or10 or20  dB and multiple of 5 dB  up to 20 dB. Inspection  by - Consignee ', 'Schedule A-Sr. No.-7', 85, 'Number', '233.18', 'Inspection  by - Consignee ', 3, '2022-11-12', 1, 0, 0),
(68, 15, 'Supply and Installation  of RJ-45 patch cord,  seven feet long, of  reputed make like  Molex or similar, with  02 no. of RJ-45  connectors for every  patch cord. Inspection  by - Consignee ', ' Schedule A-Sr. No.-8', 445, 'Number', '157.28', 'Inspection  by - Consignee ', 3, '2022-11-12', 1, 0, 0),
(69, 15, 'Supply of UTP CAT-6  cable of reputed make  Siemen or Systemax  or  D-Link or Tyco or Krone or  AMP or similar.  Inspection by -  Consignee', 'Schedule A-Sr. No.-9', 1000, 'meter', '20.21', 'Inspection by -  Consignee', 3, '2022-11-12', 1, 0, 0),
(70, 15, 'Laying of UTP orSTP  CAT-6 cable orpower  cable in PVC casing  capping of appropriate  size. The work also  includes supply and  fixing of casing and  capping, fixing and  connection of patch  panel, fixing of CAT-6  cable with RJ 45  connectors. Work to be  done as per  instructions of site  incharge. Inspection by  - Consignee', 'Schedule A-Sr. No-10', 1000, 'meter', '40.81', 'Inspection by  - Consignee', 4, '2022-11-12', 1, 0, 0),
(71, 15, 'Supply of 06 Core  Optical Fiber Cable  Armoured Single Mode.  Make : D-Link or  similar of reputed  make. Inspection by -  Consignee', 'Schedule A-Sr. No.-11', 8000, 'meter', '23.58', 'Inspection by -  Consignee', 3, '2022-11-12', 1, 0, 0),
(72, 15, 'Laying of Data cable or  Communication cable or  Power cable etc. in PVC conduit pipe with all  fiitings and accessories  [As per site  requirement].  Inspection by -  Consignee', 'Schedule A-Sr. No.-12', 8000, 'meter', '16.91', 'Inspection by -  Consignee', 4, '2022-11-12', 1, 0, 0),
(73, 15, 'Supply and installation  [splicing of fiber] of  Rack Mount LIU 12  Core Loaded with SC  Adaptors. Make :  D-Link or similar of  reputed make.  Inspection by -  Consignee ', 'Schedule A-Sr. No.-13', 50, 'Number', '5780.29', 'Inspection by -  Consignee ', 3, '2022-11-12', 1, 0, 0),
(74, 15, 'Supply of permanently  lubricated HDPE duct,  40 mm outer dia, as  per RDSO spec. No.  RDSO orSPN orTC or45 or2013  Rev.2 Amndt.2 or  latest, along with all  accessories like end  caps, collars, bends,  couplers etc.  Inspection by - RITES', 'Schedule A-Sr. No.-14', 8000, 'meter', '69437.52', 'Inspection by - RITES', 3, '2022-11-12', 1, 0, 0),
(75, 15, 'Laying of HDPE duct as  per the approved cable  route plan in the  exavated trenches or  other protected works or  RCC channel etc.  including all  accessories like end  caps, collars, bends,  couplers etc. The ends  of the duct to be  sealed with end plugs  till OFC blowing is  done. Important: The  laying of OFC cable  independently or along  with Quad cable or PIJF  cable in the same  trench shall be  governed by the RDSO  drawings no.  RDSO orTCDO orCOP-6[a]  and  RDSO orTCDO orCOP-8 [a]  re', 'Schedule A-Sr. No-15', 8000, 'meter', '7315.39', 'Inspection by -  Consignee ', 4, '2022-11-12', 1, 0, 0),
(76, 15, 'Supply of Cable fault  locator for metallic S&T  cables of reputed make  Aplab or Stanley or 3M etc.  Item to be supplied  after successful  demonstration and  approval of Railways.  Inspection by -  Consignee', 'Schedule A-Sr. No.-16', 1, 'Number', '272626.53', 'Inspection by -  Consignee', 3, '2022-11-12', 1, 0, 0),
(77, 15, 'Supply of 8 port  Gigabit Lite Managed  PoE Layer 2 Switch  supports 8 nos 10 or  100 or 1000 BASE-T  ports, along with 2  Gigabit SFP ports,  green-saving  technologies, make  model DG-GS1510HPL DIGISOL  or CISCO or  JUNIPER or superior.  Technical specification  attached. Inspection by  - RITES ', ' Schedule A-Sr.No.-17', 35, 'Number', '17001.93', 'Inspection by  - RITES ', 3, '2022-11-12', 1, 0, 0),
(78, 15, 'Supply, installation,  testing and  commissioning of SFP  1 G to suit and match  Gigabit switch.  Inspection by -  Consignee ', ' Schedule A-Sr. No.-18', 70, 'Number', '2457.70', 'Inspection by -  Consignee ', 3, '2022-11-12', 1, 0, 0),
(79, 15, 'Supply, Installation,  testing and  commissioning of 24  port Layer-2 Managed  Gigabit Ethernet Switch  with 02 Nos. 1 Gigabit  Ports with SFP module.  Make : Juniper or  CISCO or ARUBA or  similar of reputed  make. Technical  specification attached.  Inspection by - RITES', 'Schedule A-Sr. No.-19', 8, 'Number', '62326.90', 'Inspection by - RITES', 3, '2022-11-12', 1, 0, 0),
(80, 15, 'Supply of 2 Mbps  Router, 2 LAN or 4 WAN  port, 230V AC  operated, as per RDSO  spec. no. RDSO or SPN or  TC or 84 or 2008 Rev. 0 or  latest, along with  connecting cables,  connectors etc. for  connecting to the  ethernet devices, of  reputed make like  Cisco or Dlink or better.  Inspection by - RITES', 'Schedule A-Sr. No.-20', 6, 'Number', '75543.37', 'Inspection by - RITES', 3, '2022-11-12', 1, 0, 0),
(81, 15, 'Supply, installation,  testing and  commissioning of  Router Cisco ISR  4451-X or latest or  similar 1-2 G system  throughput as per  technical specification.  Inspection by -  Consignee ', 'Schedule A-Sr. No.-21', 1, 'Number', '379188.24', 'Inspection by -  Consignee ', 3, '2022-11-12', 1, 0, 0),
(82, 15, 'Supply, Installation,  testing and  commissioning of Layer  -3 switch with 24 blank  SFP slots and 2 blank  SFP slots for uplink  with redudent power  supply. Make: Juniper or  CISCO or similar.  Technical specification  attached. Inspection by  - RITES ', 'Schedule A-Sr. No.-22', 4, 'Number', '154306.92', 'Inspection by  - RITES ', 3, '2022-11-12', 1, 0, 0),
(83, 15, 'Supply and testing of  1.25 G SFP with dual  Fiber for maximum  distance of 20 KM,  1310 nm, LC  connectors. Technical  specification attached.  Inspection by -  Consignee', 'Schedule A-Sr. No.-23', 80, 'Number', '1683.35', 'Inspection by -  Consignee', 3, '2022-11-12', 1, 0, 0),
(84, 15, 'Supply and testing of  10 G SFP with dual  Fiber for maximum  distance of 20 KM,  1310 nm, LC  connectors. Technical  specification attached.  Inspection by -  Consignee ', 'Schedule A-Sr. No.-24', 4, 'Number', '7013.96', 'Inspection by -  Consignee ', 3, '2022-11-12', 1, 0, 0),
(85, 15, 'Supply and testing of 1  G 1000 base TX  [Copper]. Technical  specification attached.  Inspection by -  Consignee ', 'Schedule A-Sr. No.25', 8, 'Number', '3974.57', 'Inspection by -  Consignee ', 3, '2022-11-12', 1, 0, 0),
(86, 19, 'Material 1', '1', 10, 'meter', '100.00', 'Aadsaf', 3, '2023-03-20', 1, 0, 0),
(87, 19, '  Lorem ipsum dolor sit amet. Ab rerum neque aut dolores molestiae hic consequatur alias id omnis nihil aut repellendus repellat et saepe libero qui enim animi. Non nobis minima qui expedita rerum sit minus voluptatem aut tempora maiores', '2', 12, 'meter', '1000.00', 'dhh', 4, '2023-03-20', 1, 0, 0),
(88, 19, 'Material 3', '3', 1200, 'Number', '1000.00', 'dfd', 1, '2023-03-20', 1, 0, 0),
(89, 19, 'Material 4', '4', 100, 'Number', '1200.00', 'fsm', 2, '2023-03-20', 1, 0, 0),
(90, 19, 'Material 5', '5', 100, 'meter', '1200.00', 'sfs', 3, '2023-03-20', 1, 0, 0);

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
  `DivisionName` varchar(200) NOT NULL,
  `GSTIN` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `division`
--

INSERT INTO `division` (`DivisionCode`, `OrganizationCode`, `DivisionName`, `GSTIN`) VALUES
(2, 5, 'East Central Railway (Dhanbad)', NULL),
(3, 5, 'WCR-Jabalpur', NULL),
(4, 5, 'NCR Prayagraj', NULL),
(8, 5, 'NCR Aligarh JN', NULL),
(9, 5, 'Southern Railway Madurai Division', NULL),
(10, 5, 'Division 1 ', NULL),
(11, 8, 'Division 1 ', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee expense`
--

CREATE TABLE `employee expense` (
  `ExpenseID` int(11) NOT NULL,
  `VerificationID` int(11) NOT NULL,
  `MaterialName` varchar(200) NOT NULL,
  `Rate` decimal(9,2) NOT NULL,
  `Qty` decimal(9,2) NOT NULL,
  `Unit` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee expense`
--

INSERT INTO `employee expense` (`ExpenseID`, `VerificationID`, `MaterialName`, `Rate`, `Qty`, `Unit`) VALUES
(6, 10, 'Expense 3', '120.00', '12.00', 'm');

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
  `Password` varchar(30) NOT NULL DEFAULT 'cyrus@123',
  `Address` varchar(200) DEFAULT NULL,
  `Active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`EmployeeCode`, `EmployeeName`, `DesignationID`, `Contact`, `Email`, `Password`, `Address`, `Active`) VALUES
(3, 'Anant', 1, '+918418826770', 'suryavanshianantsingh@gmail.com', 'cyrus@123', 'ANANT SINGH SURYAVANSHI\nVILLAGE POST DHIRAULI BABU\nCHHAWANI,\nBasti,\nUttar Pradesh,\npincode: 272127', 1),
(4, 'Anant Singh', 2, '+918418826770', 'suryavanshianantsingh@gmail.com', 'cyrus@123', 'ANANT SINGH SURYAVANSHI\nVILLAGE POST DHIRAULI BABU\nCHHAWANI,\nBasti,\nUttar Pradesh,\npincode: 272127', 1);

-- --------------------------------------------------------

--
-- Table structure for table `gadget`
--

CREATE TABLE `gadget` (
  `GadgetID` int(11) NOT NULL,
  `Gadget` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Table structure for table `loginlogs`
--

CREATE TABLE `loginlogs` (
  `ID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `loginlogs`
--

INSERT INTO `loginlogs` (`ID`, `UserID`, `TimeStamp`) VALUES
(1, 3, '2022-11-03 11:14:37'),
(2, 3, '2022-11-03 11:15:41'),
(3, 3, '2022-11-03 11:16:50'),
(4, 3, '2022-11-05 08:23:18'),
(5, 3, '2022-11-06 11:04:41'),
(6, 3, '2022-11-09 10:43:37'),
(7, 3, '2022-11-11 09:23:56'),
(8, 3, '2022-11-12 04:54:49'),
(9, 3, '2023-01-25 10:10:41'),
(10, 4, '2023-01-25 10:11:17'),
(11, 3, '2023-01-25 10:15:02'),
(12, 3, '2023-03-11 09:21:15'),
(13, 3, '2023-03-11 09:24:15'),
(14, 3, '2023-03-17 10:17:44'),
(15, 3, '2023-03-17 10:18:40'),
(16, 3, '2023-03-17 10:18:54'),
(17, 3, '2023-03-17 10:19:02'),
(18, 3, '2023-03-17 10:21:36'),
(19, 3, '2023-03-20 06:42:26'),
(20, 3, '2023-03-20 09:30:31'),
(21, 3, '2023-03-21 07:32:40');

-- --------------------------------------------------------

--
-- Table structure for table `material consumed`
--

CREATE TABLE `material consumed` (
  `ID` int(11) NOT NULL,
  `VerificationID` int(11) NOT NULL,
  `MaterialID` int(11) NOT NULL,
  `Qty` decimal(9,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `material consumed`
--

INSERT INTO `material consumed` (`ID`, `VerificationID`, `MaterialID`, `Qty`) VALUES
(6, 10, 6, '1.00');

-- --------------------------------------------------------

--
-- Table structure for table `material_status`
--

CREATE TABLE `material_status` (
  `StatusID` int(11) NOT NULL,
  `Status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(7, 9, 13, 33, 24, 'UPS Item', 'UPS', '1200.00', '18.00', 2, 'Inspection at OEM', '2022-11-10', 1, '2022-11-11');

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
(9, 'Payment Terms Vendor13A', 'Warranty Terms Vendor13A', 'Warranty Terms Vendor13A', NULL, '0.00', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `DivisionCode` int(11) DEFAULT NULL,
  `Description` varchar(1050) NOT NULL,
  `LOANo` varchar(200) DEFAULT NULL,
  `LOADate` date DEFAULT NULL,
  `CompletionDate` date DEFAULT NULL,
  `BGAmount` decimal(9,2) NOT NULL,
  `BGDate` date DEFAULT NULL,
  `Warranty` int(11) NOT NULL,
  `OrderingAuth` varchar(200) DEFAULT NULL,
  `BillingAuth` varchar(200) DEFAULT NULL,
  `OrderStatusID` int(11) NOT NULL DEFAULT 1,
  `Requirement` tinyint(4) NOT NULL DEFAULT 0,
  `RequirementDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `DivisionCode`, `Description`, `LOANo`, `LOADate`, `CompletionDate`, `BGAmount`, `BGDate`, `Warranty`, `OrderingAuth`, `BillingAuth`, `OrderStatusID`, `Requirement`, `RequirementDate`) VALUES
(10, 1, 'for upgradation of LAN environment and provisioning of Hardware for HMIS implementation of  Health establishment', 'JABALPUR DIVISION-S AND T / JBP-N-TELE-TENDER-2022-5/01342370054602		', '2022-05-18', '2022-11-13', '254297.18', '2022-05-30', 12, 'WCR Jabalpur', 'Jabalpur', 1, 0, NULL),
(11, 1, 'Desc 1', 'ASSSSDDD', '2022-11-08', '2022-12-31', '12000.00', '2022-11-30', 12, 'Odering Authority A', 'Billing Authority A', 1, 0, NULL),
(12, 2, 'Allotted Work', 'SG-664-30-Tele-2018-19	', '2019-03-25', '2022-10-31', '799760.00', '2019-04-06', 12, 'Sr. DSTE', 'Sr. DFM Dhanbad', 1, 0, NULL),
(13, 3, 'for upgradation of LAN environment and provisioning of Hardware for HMIS implementation of Health establishment', 'JABALPUR DIVISION-S AND T / JBP-N-TELE-TENDER-2022-5/01342370054602		', '2022-05-18', '2022-11-13', '254297.18', '2022-05-30', 12, 'Sr. DSTE', 'Sr. DFM Jabalpur', 1, 0, NULL),
(14, 4, 'for OFC based networking for centralised monitoring \nof vital safety assets as EI system, Data Logger, MSDAC etc \nfor improving and upgrading in PCOI-MRE.', 'etter No: PRAYAGRAJ DIVISION-S AND T / PRYJSig-41-2021-22 / 01342370054449 ', '2022-05-14', '2022-11-13', '154292.65', '2022-05-27', 12, 'SR. DSTE', 'SR. DFM Prayagraj', 1, 0, NULL),
(15, 8, ' OFC based networking for centralised monitoring \nof vital safety assets as EI system, Data Logger, MSDAC \netc for improving and upgrading in KAA-GZB.', ' PRAYAGRAJ DIVISION-S AND T / PRYJ-Sig-40-2021-22 / 01342370054450', '2022-05-14', '2022-11-13', '165261.32', '2022-05-27', 12, 'Sr. DSTE', 'Sr.DFM/NCR/PRYJ', 1, 0, NULL),
(16, 9, 'Provision of Integrated Emergency Response Management System (Videco \nSurveillance System) at Stations Virudunagar, Kovilpatti, \nRameswaram,Tenkasi Jn., Sengottai, Karaikkudi and Ramanathapuram in \nMadurai Division. Provision of Intcgratcd Emergcncy Rcsponsc \nManagcmcnt Systcm (Video Surveillance Systcm) at Stations Kollam Jn., \nNagcrcoil Jn., Kochuveli in Tiruvananthapuram Division and Tuticorin and \nRajapalaiyam in Madurai Division. Provision of Integrated Emergency \nResponse Management System (Video Surveillance System) at Stations \nParamakudi, Sattur, Tirunelveli Jn and Dindigul Jn., in Madurai Division \nand Mayiladuturai, Thanjavur Jn., Puducherry, Nagappattinam in \nTiuchchirappalli Division. [At seven stations of Madurai Division: \nKaraikudi, Ramanathapuram, Sengottai, Tenkasi, Rajapalayam, Sattur and \nParamakudi).', 'MADURAI DIVISION- S AND T/ U-SG- 02-2021-22-1/01342370040015', '2021-08-12', '2023-02-11', '942102.66', '2021-08-18', 12, 'Divisional Railway manager, S&T/S.RLY./MDU-625016', 'Sr. DFM, Madurai, Southern Railway', 1, 0, NULL),
(17, 10, 'Lorem ipsum dolor sit amet. Ab rerum neque aut dolores molestiae hic consequatur alias id omnis nihil aut repellendus repellat et saepe libero qui enim animi. Non nobis minima qui expedita rerum sit minus voluptatem aut tempora maiores.', 'ADSASA', '2023-03-11', '2023-04-30', '2000000.00', '2023-03-26', 12, 'ABC', 'CDE', 1, 0, NULL),
(18, 10, 'Lorem ipsum dolor sit amet. Vel quia sapiente ut error expedita est nemo eius est officiis repudiandae. Et beatae dignissimos sit dignissimos omnis est consectetur consectetur. Ut consequuntur accusamus eum consequatur tenetur id nisi earum aut maxime molestiae qui expedita alias sed consequuntur dolorum et maiores incidunt. Et voluptatem ullam et rerum sunt qui libero consequatur eum asperiores excepturi.', 'sdsdasd', '2023-03-11', '2023-03-31', '2000000.00', '2023-03-30', 12, 'ABC', 'ABC', 1, 0, NULL),
(19, 11, '  Lorem ipsum dolor sit amet. Ab rerum neque aut dolores molestiae hic consequatur alias id omnis nihil aut repellendus repellat et saepe libero qui enim animi. Non nobis minima qui expedita rerum sit minus voluptatem aut tempora maiores.', '123/ABC', '2023-03-17', '2023-03-31', '100000.00', '2023-03-28', 12, 'ABC', 'CDE', 2, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orderstatus`
--

CREATE TABLE `orderstatus` (
  `StatusID` int(11) NOT NULL,
  `Status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderstatus`
--

INSERT INTO `orderstatus` (`StatusID`, `Status`) VALUES
(1, 'Pending for requirement'),
(2, 'Pending for site survey'),
(3, 'Pending for site work entry'),
(4, 'Work in progress');

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
(5, 'Railways'),
(8, 'Org 2');

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
,`GSTIN` varchar(20)
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
(7, 7, 2, 100, 100),
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
(10, 3, 'Jabalpur Hospital', 'Jabalpur', 'SSE/TELE/M/Jabalpur'),
(11, 3, 'Katni Hospital', 'Katni', 'SSE/TELE/M/Jabalpur'),
(12, 3, 'New Katni', 'Katni', 'SSE/TELE/M/Jabalpur'),
(13, 3, 'Saugor (Hospital)', 'Saugor', 'SSE/TELE/M/Jabalpur'),
(14, 3, 'Satna (Hospital)', 'Satna', 'SSE/TELE/M/Jabalpur'),
(15, 3, 'Narshinghpur (Hospital)', 'Narshinghpur', 'SSE/TELE/M/Jabalpur'),
(16, 3, 'Piariya (Hospital)', 'Pipariya', 'SSE/TELE/M/Jabalpur'),
(19, 10, 'Site 1', 'ABC', 'SSE/TELE'),
(21, 11, 'Site 1', 'sgg', 'sgsg'),
(22, 11, 'Site 2', 'sdfsg', 'fggf');

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
(5, 10, 1, 5, 200, '2022-10-31', 2),
(6, 10, 1, 4, 2000, '2022-10-31', 1),
(7, 13, 17, 31, 600, '2022-11-10', 0),
(8, 13, 18, 31, 600, '2022-11-10', 0),
(10, 13, 11, 31, 600, '2022-11-10', 0),
(11, 13, 15, 31, 600, '2022-11-10', 0),
(12, 13, 12, 31, 600, '2022-11-10', 0),
(13, 13, 16, 31, 600, '2022-11-10', 0),
(14, 13, 14, 31, 600, '2022-11-10', 0),
(15, 13, 13, 31, 650, '2022-11-10', 0),
(16, 13, 10, 31, 200, '2022-11-12', 0),
(17, 13, 10, 25, 800, '2022-11-12', 0),
(18, 13, 12, 25, 700, '2022-11-12', 0),
(20, 19, 21, 87, 8, '2023-03-20', 1),
(21, 19, 21, 86, 6, '2023-03-20', 1),
(27, 19, 22, 87, 12, '2023-03-20', 1),
(28, 19, 22, 86, 4, '2023-03-20', 1),
(30, 19, 21, 88, 400, '2023-03-20', 1),
(31, 19, 21, 90, 50, '2023-03-20', 1);

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
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `EmployeeCode` int(11) DEFAULT NULL,
  `AssignDate` date DEFAULT NULL,
  `Closed` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sitework`
--

INSERT INTO `sitework` (`WorkID`, `OrderID`, `SiteCode`, `MaterialID`, `WorkTypeID`, `Qty`, `StartDate`, `EndDate`, `EmployeeCode`, `AssignDate`, `Closed`) VALUES
(2, 10, 1, 7, 9, 100, '2022-11-01', '2022-11-10', NULL, NULL, 0),
(3, 10, 1, 6, 3, 5, '2022-11-05', '2022-11-10', 3, '2022-11-03', 0),
(4, 10, 1, 4, 1, 200, '2022-11-13', '2022-11-17', 3, '2022-11-03', 0),
(5, 10, 1, 5, 2, 120, '2022-11-05', '2022-11-12', NULL, NULL, 0),
(6, 13, 17, 31, 3, 100, '2022-11-13', '2022-11-19', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `site_details`
-- (See below for the actual view)
--
CREATE TABLE `site_details` (
`Organization` varchar(200)
,`OrganizationCode` int(11)
,`DivisionName` varchar(200)
,`DivisionCode` int(11)
,`GSTIN` varchar(20)
,`SiteName` varchar(200)
,`SiteCode` int(11)
,`Address` varchar(200)
,`Consignee` varchar(150)
);

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `StateName` varchar(255) DEFAULT NULL,
  `ShortCode` varchar(5) DEFAULT NULL,
  `StateCode` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `ID` int(11) NOT NULL,
  `WorkID` int(11) NOT NULL,
  `MaterialID` int(11) NOT NULL,
  `CQty` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tempemployee`
--

CREATE TABLE `tempemployee` (
  `ID` int(11) NOT NULL,
  `EmployeeCode` int(11) NOT NULL,
  `EmployeeName` varchar(200) NOT NULL,
  `WorkID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tempexpense`
--

CREATE TABLE `tempexpense` (
  `ID` int(11) NOT NULL,
  `WorkID` int(11) NOT NULL,
  `MaterialName` varchar(200) DEFAULT NULL,
  `Rate` decimal(9,2) NOT NULL,
  `Qty` decimal(9,2) NOT NULL,
  `Unit` varchar(20) DEFAULT NULL
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
  `TID` int(11) NOT NULL,
  `OrderID` int(11) DEFAULT NULL,
  `SrNo` varchar(50) DEFAULT NULL,
  `MaterialName` varchar(500) DEFAULT NULL,
  `Qty` int(11) DEFAULT NULL,
  `Unit` varchar(50) DEFAULT NULL,
  `Rate` decimal(9,2) DEFAULT 0.00,
  `InspectingAuth` varchar(200) DEFAULT NULL,
  `BillingType` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `temprequirement`
--

INSERT INTO `temprequirement` (`TID`, `OrderID`, `SrNo`, `MaterialName`, `Qty`, `Unit`, `Rate`, `InspectingAuth`, `BillingType`) VALUES
(24, 12, '1', 'fixed Box type IP camera', 106, 'Number', '20676.83', 'RDSO', 3),
(25, 12, '2', 'PTZ IP camera', 18, 'Number', '76933.95', 'RDSO', 3),
(26, 12, '3', 'Software VA & VMS', 5, 'Number', '755766.12', 'RDSO', 3);

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
(1, 'meter'),
(3, 'Number'),
(4, 'Kg');

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
(21, 10, 'Vendor 2', 'Lucknow', '09AABFD990P1Z2', '+918418826770', 'suryavanshianantsingh@gmail.com'),
(23, 11, 'Vendor 2', 'Lucknow', '123456789b', '+910841882677', 'suryavanshianantsingh@gmail.com'),
(24, 13, 'Vendor 13A', 'Lucknow', '123478999A', '+918418826770', 'suryavanshianantsingh@gmail.com'),
(25, 13, 'Vendor 13B', 'Lucknow', '13456666A', '+918418826770', 'suryavanshianantsingh@gmail.com'),
(26, 13, 'Vendor 13C', 'Lucknow', '84555555A', '+918418826770', 'suryavanshianantsingh@gmail.com');

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
(15, 4, 21, 0, NULL),
(18, 11, 23, 0, NULL),
(19, 12, 23, 0, NULL),
(20, 33, 24, 0, NULL),
(21, 33, 25, 0, NULL),
(22, 27, 26, 0, NULL),
(24, 86, 20, 0, NULL),
(25, 86, 20, 0, NULL),
(26, 86, 24, 0, NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vmaterialstatus`
-- (See below for the actual view)
--
CREATE TABLE `vmaterialstatus` (
`Organization` varchar(200)
,`OrganizationCode` int(11)
,`DivisionCode` int(11)
,`DivisionName` varchar(200)
,`OrderID` int(11)
,`MaterialID` int(11)
,`MaterialName` varchar(500)
,`SrNo` varchar(100)
,`Rate` decimal(9,2)
,`Qty` int(11)
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
,`SiteCode` int(11)
,`OrderID` int(11)
,`Work` varchar(100)
,`Qty` int(11)
,`Unit` varchar(20)
,`WorkID` int(11)
,`WorkTypeID` int(11)
,`EmployeeCode` int(11)
,`EmployeeName` varchar(150)
,`StartDate` date
,`EndDate` date
,`AssignDate` date
,`LeftDays` int(7)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vpending_verification`
-- (See below for the actual view)
--
CREATE TABLE `vpending_verification` (
`VerificationID` int(11)
,`Organization` varchar(200)
,`OrganizationCode` int(11)
,`DivisionName` varchar(200)
,`DivisionCode` int(11)
,`SiteName` varchar(200)
,`SiteCode` int(11)
,`WorkID` int(11)
,`MaterialName` varchar(500)
,`Work` varchar(100)
,`Unit` varchar(20)
,`OrderID` int(11)
,`WorkDate` date
,`Qty` decimal(9,2)
,`AdditionalEmployee` tinyint(4)
,`EmployeeCode` int(11)
,`EmployeeName` varchar(150)
);

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
-- Table structure for table `work_verification`
--

CREATE TABLE `work_verification` (
  `VerificationID` int(11) NOT NULL,
  `EmployeeCode` int(11) NOT NULL,
  `SiteCode` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `WorkID` int(11) NOT NULL,
  `WorkTypeID` int(11) NOT NULL,
  `Qty` decimal(9,2) NOT NULL,
  `WorkDate` date DEFAULT NULL,
  `AdditionalEmployee` tinyint(4) NOT NULL DEFAULT 0,
  `VerificationRemark` varchar(300) DEFAULT NULL,
  `VerificationByID` int(11) NOT NULL,
  `VerificationDate` date DEFAULT NULL,
  `Accepted` tinyint(4) NOT NULL DEFAULT 0,
  `Closed` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `work_verification`
--

INSERT INTO `work_verification` (`VerificationID`, `EmployeeCode`, `SiteCode`, `OrderID`, `WorkID`, `WorkTypeID`, `Qty`, `WorkDate`, `AdditionalEmployee`, `VerificationRemark`, `VerificationByID`, `VerificationDate`, `Accepted`, `Closed`) VALUES
(10, 3, 1, 10, 3, 3, '1.10', '2022-11-06', 0, 'Accepted', 3, '2022-11-07', 1, 1),
(11, 4, 1, 10, 3, 3, '1.10', '2022-11-06', 1, 'Accepted', 3, '2022-11-07', 1, 1);

-- --------------------------------------------------------

--
-- Structure for view `organization_details`
--
DROP TABLE IF EXISTS `organization_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `organization_details`  AS SELECT `organization`.`Organization` AS `Organization`, `organization`.`OrganizationCode` AS `OrganizationCode`, `division`.`DivisionName` AS `DivisionName`, `division`.`DivisionCode` AS `DivisionCode`, `division`.`GSTIN` AS `GSTIN` FROM (`organization` join `division` on(`organization`.`OrganizationCode` = `division`.`OrganizationCode`))  ;

-- --------------------------------------------------------

--
-- Structure for view `pending_po`
--
DROP TABLE IF EXISTS `pending_po`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pending_po`  AS SELECT `organization_details`.`Organization` AS `Organization`, `organization_details`.`DivisionName` AS `DivisionName`, `orders`.`OrderID` AS `OrderID`, `po`.`PODate` AS `PODate`, `po`.`PONo` AS `PONo`, `po`.`POID` AS `POID` FROM (((`po` join `orders` on(`po`.`OrderID` = `orders`.`OrderID`)) join `organization_details` on(`orders`.`DivisionCode` = `organization_details`.`DivisionCode`)) join `po_details` on(`po`.`POID` = `po_details`.`POID`)) WHERE `po_details`.`POQty` - `po_details`.`ReadyQty` > 00  ;

-- --------------------------------------------------------

--
-- Structure for view `site_details`
--
DROP TABLE IF EXISTS `site_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `site_details`  AS SELECT `organization`.`Organization` AS `Organization`, `organization`.`OrganizationCode` AS `OrganizationCode`, `division`.`DivisionName` AS `DivisionName`, `division`.`DivisionCode` AS `DivisionCode`, `division`.`GSTIN` AS `GSTIN`, `site`.`SiteName` AS `SiteName`, `site`.`SiteCode` AS `SiteCode`, `site`.`Address` AS `Address`, `site`.`Consignee` AS `Consignee` FROM ((`organization` join `division` on(`organization`.`OrganizationCode` = `division`.`OrganizationCode`)) join `site` on(`division`.`DivisionCode` = `site`.`DivisionCode`))  ;

-- --------------------------------------------------------

--
-- Structure for view `vmaterialstatus`
--
DROP TABLE IF EXISTS `vmaterialstatus`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vmaterialstatus`  AS SELECT `organization_details`.`Organization` AS `Organization`, `organization_details`.`OrganizationCode` AS `OrganizationCode`, `orders`.`DivisionCode` AS `DivisionCode`, `organization_details`.`DivisionName` AS `DivisionName`, `orders`.`OrderID` AS `OrderID`, `demand_details`.`MaterialID` AS `MaterialID`, `demand_details`.`MaterialName` AS `MaterialName`, `demand_details`.`SrNo` AS `SrNo`, `demand_details`.`Rate` AS `Rate`, `demand_details`.`Qty` AS `Qty`, `demand_details`.`Unit` AS `Unit`, `demand_details`.`InspectingAuth` AS `InspectingAuth`, `demand_details`.`DemandDate` AS `DemandDate`, `billingtype`.`Type` AS `Type`, `material_status`.`Status` AS `Status` FROM ((((`demand_details` join `orders` on(`demand_details`.`OrderID` = `orders`.`OrderID`)) join `organization_details` on(`orders`.`DivisionCode` = `organization_details`.`DivisionCode`)) join `material_status` on(`demand_details`.`Status` = `material_status`.`StatusID`)) join `billingtype` on(`demand_details`.`BillingType` = `billingtype`.`ID`))  ;

-- --------------------------------------------------------

--
-- Structure for view `vpendingwork`
--
DROP TABLE IF EXISTS `vpendingwork`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vpendingwork`  AS SELECT `organization_details`.`Organization` AS `Organization`, `organization_details`.`DivisionName` AS `DivisionName`, `site`.`SiteName` AS `SiteName`, `sitework`.`SiteCode` AS `SiteCode`, `sitework`.`OrderID` AS `OrderID`, `worktype`.`Work` AS `Work`, `sitework`.`Qty` AS `Qty`, `demand_details`.`Unit` AS `Unit`, `sitework`.`WorkID` AS `WorkID`, `sitework`.`WorkTypeID` AS `WorkTypeID`, `sitework`.`EmployeeCode` AS `EmployeeCode`, `employees`.`EmployeeName` AS `EmployeeName`, `sitework`.`StartDate` AS `StartDate`, `sitework`.`EndDate` AS `EndDate`, `sitework`.`AssignDate` AS `AssignDate`, to_days(`sitework`.`EndDate`) - to_days(curdate()) AS `LeftDays` FROM (((((`sitework` join `worktype` on(`sitework`.`WorkTypeID` = `worktype`.`WorkTypeID`)) join `site` on(`sitework`.`SiteCode` = `site`.`SiteCode`)) join `organization_details` on(`site`.`DivisionCode` = `organization_details`.`DivisionCode`)) join `employees` on(`sitework`.`EmployeeCode` = `employees`.`EmployeeCode`)) join `demand_details` on(`sitework`.`MaterialID` = `demand_details`.`MaterialID`)) WHERE `sitework`.`EmployeeCode` is not null AND `sitework`.`AssignDate` is not null AND `sitework`.`Closed` = 00  ;

-- --------------------------------------------------------

--
-- Structure for view `vpending_verification`
--
DROP TABLE IF EXISTS `vpending_verification`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vpending_verification`  AS SELECT `work_verification`.`VerificationID` AS `VerificationID`, `site_details`.`Organization` AS `Organization`, `site_details`.`OrganizationCode` AS `OrganizationCode`, `site_details`.`DivisionName` AS `DivisionName`, `site_details`.`DivisionCode` AS `DivisionCode`, `site_details`.`SiteName` AS `SiteName`, `work_verification`.`SiteCode` AS `SiteCode`, `work_verification`.`WorkID` AS `WorkID`, `demand_details`.`MaterialName` AS `MaterialName`, `worktype`.`Work` AS `Work`, `demand_details`.`Unit` AS `Unit`, `work_verification`.`OrderID` AS `OrderID`, `work_verification`.`WorkDate` AS `WorkDate`, `work_verification`.`Qty` AS `Qty`, `work_verification`.`AdditionalEmployee` AS `AdditionalEmployee`, `work_verification`.`EmployeeCode` AS `EmployeeCode`, `employees`.`EmployeeName` AS `EmployeeName` FROM (((((`work_verification` join `site_details` on(`work_verification`.`SiteCode` = `site_details`.`SiteCode`)) join `employees` on(`work_verification`.`EmployeeCode` = `employees`.`EmployeeCode`)) join `sitework` on(`work_verification`.`WorkID` = `sitework`.`WorkID`)) join `demand_details` on(`sitework`.`MaterialID` = `demand_details`.`MaterialID`)) join `worktype` on(`work_verification`.`WorkTypeID` = `worktype`.`WorkTypeID`)) WHERE `work_verification`.`Closed` = 0 AND `work_verification`.`VerificationDate` is null AND `work_verification`.`VerificationRemark` is null  ;

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
  MODIFY `AMCID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amcs_posting`
--
ALTER TABLE `amcs_posting`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assignlogs`
--
ALTER TABLE `assignlogs`
  MODIFY `logID` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `billingtype`
--
ALTER TABLE `billingtype`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `challan detail`
--
ALTER TABLE `challan detail`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `ComplaintID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliverychallan`
--
ALTER TABLE `deliverychallan`
  MODIFY `ChallanID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `demands`
--
ALTER TABLE `demands`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `demand_details`
--
ALTER TABLE `demand_details`
  MODIFY `MaterialID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `designation`
--
ALTER TABLE `designation`
  MODIFY `DesignationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `division`
--
ALTER TABLE `division`
  MODIFY `DivisionCode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `employee expense`
--
ALTER TABLE `employee expense`
  MODIFY `ExpenseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `EmployeeCode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `gadget`
--
ALTER TABLE `gadget`
  MODIFY `GadgetID` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `loginlogs`
--
ALTER TABLE `loginlogs`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `material consumed`
--
ALTER TABLE `material consumed`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `material_status`
--
ALTER TABLE `material_status`
  MODIFY `StatusID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `movement`
--
ALTER TABLE `movement`
  MODIFY `MovementID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `OfferID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `offer terms`
--
ALTER TABLE `offer terms`
  MODIFY `TermID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `orderstatus`
--
ALTER TABLE `orderstatus`
  MODIFY `StatusID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `organization`
--
ALTER TABLE `organization`
  MODIFY `OrganizationCode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  MODIFY `SiteCode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `sitesurvey`
--
ALTER TABLE `sitesurvey`
  MODIFY `SurveyID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `sitework`
--
ALTER TABLE `sitework`
  MODIFY `WorkID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tempconsumed`
--
ALTER TABLE `tempconsumed`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tempemployee`
--
ALTER TABLE `tempemployee`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tempexpense`
--
ALTER TABLE `tempexpense`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tempoffer`
--
ALTER TABLE `tempoffer`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `temprequirement`
--
ALTER TABLE `temprequirement`
  MODIFY `TID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `VendorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `vendor_details`
--
ALTER TABLE `vendor_details`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `worktype`
--
ALTER TABLE `worktype`
  MODIFY `WorkTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `work_verification`
--
ALTER TABLE `work_verification`
  MODIFY `VerificationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
