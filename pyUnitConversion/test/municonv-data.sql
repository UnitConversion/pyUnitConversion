-- MySQL dump 10.13  Distrib 5.1.66, for apple-darwin10.8.0 (i386)
--
-- Host: 130.199.222.174    Database: municonv
-- ------------------------------------------------------
-- Server version	5.1.58-1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alias`
--

DROP TABLE IF EXISTS `alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alias` (
  `alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `pv_id` int(11) NOT NULL DEFAULT '0',
  `alias` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`alias_id`),
  KEY `Ref_185` (`pv_id`),
  CONSTRAINT `Ref_185` FOREIGN KEY (`pv_id`) REFERENCES `pv` (`pv_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alias`
--

LOCK TABLES `alias` WRITE;
/*!40000 ALTER TABLE `alias` DISABLE KEYS */;
/*!40000 ALTER TABLE `alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beam_parameter`
--

DROP TABLE IF EXISTS `beam_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beam_parameter` (
  `twiss_id` int(11) NOT NULL AUTO_INCREMENT,
  `element_id` int(11) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `pos` double DEFAULT NULL,
  `alpha_x` double DEFAULT NULL,
  `beta_x` double DEFAULT NULL,
  `nu_x` double DEFAULT NULL,
  `eta_x` double DEFAULT NULL,
  `etap_x` double DEFAULT NULL,
  `alpha_y` double DEFAULT NULL,
  `beta_y` double DEFAULT NULL,
  `nu_y` double DEFAULT NULL,
  `eta_y` double DEFAULT NULL,
  `etap_y` double DEFAULT NULL,
  `transfer_matrix` varchar(2047) CHARACTER SET utf8 DEFAULT NULL,
  `co_x` double DEFAULT NULL,
  `co_y` double DEFAULT NULL,
  `index_slice_chk` int(11) DEFAULT NULL,
  `s` double DEFAULT NULL,
  `energy` double DEFAULT NULL,
  `particel_species` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `particle mass` double DEFAULT NULL,
  `particle charge` int(11) DEFAULT NULL,
  `beam_charge_density` double DEFAULT NULL,
  `beam_current` double DEFAULT NULL,
  `x` double DEFAULT NULL,
  `xp` double DEFAULT NULL,
  `y` double DEFAULT NULL,
  `yp` double DEFAULT NULL,
  `z` double DEFAULT NULL,
  `zp` double DEFAULT NULL,
  `emit_x` double DEFAULT NULL,
  `emit_y` double DEFAULT NULL,
  `emit_z` double DEFAULT NULL,
  PRIMARY KEY (`twiss_id`),
  KEY `FK_element` (`element_id`),
  KEY `Ref_212` (`model_id`),
  CONSTRAINT `FK_element` FOREIGN KEY (`element_id`) REFERENCES `element` (`element_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_212` FOREIGN KEY (`model_id`) REFERENCES `model` (`model_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beam_parameter`
--

LOCK TABLES `beam_parameter` WRITE;
/*!40000 ALTER TABLE `beam_parameter` DISABLE KEYS */;
/*!40000 ALTER TABLE `beam_parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beamline_sequence`
--

DROP TABLE IF EXISTS `beamline_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beamline_sequence` (
  `beamline_sequence_id` int(11) NOT NULL AUTO_INCREMENT,
  `sequence_name` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `first_element_name` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `last_element_name` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `previous_section` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `sequence_length` double DEFAULT NULL,
  `sequence_description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`beamline_sequence_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beamline_sequence`
--

LOCK TABLES `beamline_sequence` WRITE;
/*!40000 ALTER TABLE `beamline_sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `beamline_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blsequence__lattice`
--

DROP TABLE IF EXISTS `blsequence__lattice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blsequence__lattice` (
  `blsequence__lattice_id` int(11) NOT NULL AUTO_INCREMENT,
  `beamline_sequence_id` int(11) DEFAULT NULL,
  `lattice_id` int(11) DEFAULT NULL,
  `beamline_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`blsequence__lattice_id`),
  KEY `Ref_18` (`beamline_sequence_id`),
  KEY `Ref_16` (`lattice_id`),
  CONSTRAINT `Ref_18` FOREIGN KEY (`beamline_sequence_id`) REFERENCES `beamline_sequence` (`beamline_sequence_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_16` FOREIGN KEY (`lattice_id`) REFERENCES `lattice` (`lattice_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blsequence__lattice`
--

LOCK TABLES `blsequence__lattice` WRITE;
/*!40000 ALTER TABLE `blsequence__lattice` DISABLE KEYS */;
/*!40000 ALTER TABLE `blsequence__lattice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bundle_pull`
--

DROP TABLE IF EXISTS `bundle_pull`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bundle_pull` (
  `bundle_pull_id` int(11) NOT NULL AUTO_INCREMENT,
  `bundle_label` varchar(255) DEFAULT NULL,
  `bundle_identifier` varchar(50) DEFAULT NULL,
  `cable_count` int(11) DEFAULT '1',
  `owner` varchar(50) DEFAULT 'unknown',
  `install_check` int(11) DEFAULT NULL,
  PRIMARY KEY (`bundle_pull_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bundle_pull`
--

LOCK TABLES `bundle_pull` WRITE;
/*!40000 ALTER TABLE `bundle_pull` DISABLE KEYS */;
/*!40000 ALTER TABLE `bundle_pull` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bundlepull__install`
--

DROP TABLE IF EXISTS `bundlepull__install`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bundlepull__install` (
  `bundlepull__install_id` int(11) NOT NULL AUTO_INCREMENT,
  `bundle_pull_id` int(11) NOT NULL,
  `install_id` int(11) NOT NULL DEFAULT '0',
  `path_order` int(11) DEFAULT NULL,
  `validated` int(11) DEFAULT NULL,
  PRIMARY KEY (`bundlepull__install_id`),
  KEY `idx_cable_pull_id` (`bundle_pull_id`),
  KEY `Ref_76` (`install_id`),
  CONSTRAINT `Ref_57` FOREIGN KEY (`bundle_pull_id`) REFERENCES `bundle_pull` (`bundle_pull_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_76` FOREIGN KEY (`install_id`) REFERENCES `install` (`install_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bundlepull__install`
--

LOCK TABLES `bundlepull__install` WRITE;
/*!40000 ALTER TABLE `bundlepull__install` DISABLE KEYS */;
/*!40000 ALTER TABLE `bundlepull__install` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cable`
--

DROP TABLE IF EXISTS `cable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cable` (
  `cable_id` int(11) NOT NULL AUTO_INCREMENT,
  `port_a_id` int(11) DEFAULT NULL,
  `port_b_id` int(11) DEFAULT NULL,
  `bundle_pull_id` int(11) DEFAULT NULL,
  `cable_type_id` int(11) NOT NULL DEFAULT '0',
  `color` varchar(60) DEFAULT NULL,
  `cable_identifier` varchar(50) DEFAULT NULL,
  `port_a_label` varchar(50) DEFAULT NULL,
  `port_b_label` varchar(50) DEFAULT NULL,
  `length_m` float DEFAULT NULL,
  `continuity_check` int(11) DEFAULT NULL,
  `panel_to_device_check` int(11) DEFAULT NULL,
  PRIMARY KEY (`cable_id`),
  KEY `idx_port_a_id` (`port_a_id`),
  KEY `idx_port_b_id` (`port_b_id`),
  KEY `idx_cable_pull_id` (`bundle_pull_id`),
  KEY `idx_cable_type_id` (`cable_type_id`),
  CONSTRAINT `Ref_74` FOREIGN KEY (`port_a_id`) REFERENCES `port` (`port_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_75` FOREIGN KEY (`port_b_id`) REFERENCES `port` (`port_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_68` FOREIGN KEY (`bundle_pull_id`) REFERENCES `bundle_pull` (`bundle_pull_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_121` FOREIGN KEY (`cable_type_id`) REFERENCES `cable_type` (`cable_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cable`
--

LOCK TABLES `cable` WRITE;
/*!40000 ALTER TABLE `cable` DISABLE KEYS */;
/*!40000 ALTER TABLE `cable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cable_type`
--

DROP TABLE IF EXISTS `cable_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cable_type` (
  `cable_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `cable_type` varchar(50) DEFAULT NULL,
  `cable_type_description` varchar(255) DEFAULT NULL,
  `cable_diameter` float DEFAULT NULL,
  `ampacity` double DEFAULT NULL,
  PRIMARY KEY (`cable_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cable_type`
--

LOCK TABLES `cable_type` WRITE;
/*!40000 ALTER TABLE `cable_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `cable_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cabletype__partitiontype`
--

DROP TABLE IF EXISTS `cabletype__partitiontype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cabletype__partitiontype` (
  `cabletype__partitiontype` int(11) NOT NULL AUTO_INCREMENT,
  `cable_type_id` int(11) DEFAULT NULL,
  `partition_type_id` int(11) NOT NULL DEFAULT '0',
  `partition_preference` int(11) DEFAULT NULL,
  PRIMARY KEY (`cabletype__partitiontype`),
  KEY `idx_tray_partition_type_id` (`partition_type_id`),
  KEY `Ref_134` (`cable_type_id`),
  CONSTRAINT `Ref_133` FOREIGN KEY (`partition_type_id`) REFERENCES `partition_type` (`partition_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_134` FOREIGN KEY (`cable_type_id`) REFERENCES `cable_type` (`cable_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cabletype__partitiontype`
--

LOCK TABLES `cabletype__partitiontype` WRITE;
/*!40000 ALTER TABLE `cabletype__partitiontype` DISABLE KEYS */;
/*!40000 ALTER TABLE `cabletype__partitiontype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmpnt_type`
--

DROP TABLE IF EXISTS `cmpnt_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmpnt_type` (
  `cmpnt_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `cmpnt_type_name` varchar(100) NOT NULL,
  `description` text,
  PRIMARY KEY (`cmpnt_type_id`),
  UNIQUE KEY `idx_cmpnt_type_name_unique` (`cmpnt_type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmpnt_type`
--

LOCK TABLES `cmpnt_type` WRITE;
/*!40000 ALTER TABLE `cmpnt_type` DISABLE KEYS */;
INSERT INTO `cmpnt_type` VALUES (1,'LN Solenoid','solenoid accelerator for linac'),(2,'LN Quadrupole','quadrupole magnet for linac'),(3,'LBT Dipole','dipole magnet for linac to booster transport line'),(4,'LBT Quadrupole 1340','quadrupole magnet with 134mm aperture.'),(5,'LBT Quadrupole 5200','quadrupole magnet with 52mm aperture'),(6,'BS Dipole BD1','Dipole type BD1 for booster ring'),(7,'BS Dipole BD2','Dipole type BD2 for booster ring'),(8,'BS Dipole BF','Dipole type BF for booster ring'),(9,'BS Quadrupole QF','Quadrupole type QF for booster ring'),(10,'BS Quadrupole QD','Quadrupole type QD for booster ring'),(11,'BS Quadrupole QG','Quadrupole type QG for booster ring'),(12,'BS Sextupole SF','Sextupole type SF for booster ring'),(13,'BS Sextupole SD','Sextupole type SF for booster ring'),(14,'BST Dipole','dipole magnet for linac to booster transport line'),(15,'BST Quadrupole 5200','quadrupole magnet with 52mm aperture'),(16,'Dipole','35mm dipole magnet'),(17,'Dipole G','90mm dipole magnet'),(18,'Quad A','66mm, SNGL COIL, SHORT QUAD'),(19,'Quad B','66mm, SNGL COIL, SHORT QUAD'),(20,'Quad C','66mm, DBL COIL, LONG QUAD'),(21,'Quad Cp','66mm, LONG, DBL COIL KINKED QUAD'),(22,'Quad D','66mm, DBL COIL, SHORT QUAD'),(23,'Quad D2','66mm, DBL COIL, SHORT QUAD'),(24,'Quad E','66mm, DBL COIL, WIDE QUAD'),(25,'Quad E2','66mm, DBL COIL, WIDE QUAD'),(26,'Quad F','90mm, DBL COIL, SHORT QUAD'),(27,'Sext A','68mm, SHORT SEXTUPOLE'),(28,'Sext B','68mm, SHORT, WIDE SEXTUPOLE'),(29,'Sext C','76mm, LONG SEXTUPOLE'),(30,'Corr A','156mm CORRECTOR'),(31,'Corr C','100mm CORRECTOR'),(32,'Corr D','100mm SKEWED CORRECTOR'),(33,'Corr Fast','FAST AIR CORE CORRECTOR'),(34,'Corr A horizontal','156mm horizontal corrector magnet sub-device'),(35,'Corr C horizontal','100mm horizontal corrector magnet sub-device'),(36,'Corr D horizontal','100mm horizontal skewed corrector magnet sub-device'),(37,'Corr Fast horizontal','horizontal fast air core corrector magnet sub-device'),(38,'Corr A vertical','156mm vertical corrector magnet sub-device'),(39,'Corr C vertical','100mm vertical corrector magnet sub-device'),(40,'Corr D vertical','100mm vertical skewed corrector magnet sub-device'),(41,'Corr Fast vertical','vertical  fast air core corrector magnet sub-device');
/*!40000 ALTER TABLE `cmpnt_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmpnt_type_prop`
--

DROP TABLE IF EXISTS `cmpnt_type_prop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmpnt_type_prop` (
  `cmpnt_type_prop_id` int(11) NOT NULL AUTO_INCREMENT,
  `cmpnt_type_id` int(11) NOT NULL DEFAULT '0',
  `cmpnt_type_prop_type_id` int(11) DEFAULT NULL,
  `cmpnt_type_prop_value` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`cmpnt_type_prop_id`),
  KEY `Ref_188` (`cmpnt_type_prop_type_id`),
  KEY `Ref_189` (`cmpnt_type_id`),
  CONSTRAINT `Ref_188` FOREIGN KEY (`cmpnt_type_prop_type_id`) REFERENCES `cmpnt_type_prop_type` (`cmpnt_type_prop_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_189` FOREIGN KEY (`cmpnt_type_id`) REFERENCES `cmpnt_type` (`cmpnt_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmpnt_type_prop`
--

LOCK TABLES `cmpnt_type_prop` WRITE;
/*!40000 ALTER TABLE `cmpnt_type_prop` DISABLE KEYS */;
INSERT INTO `cmpnt_type_prop` VALUES (1,3,1,'{\"standard\": {\"direction\": [\"na\", \"na\", \"na\", \"na\", \"na\", \"na\", \"na\", \"na\", \"na\", \"na\", \"na\", \"na\", \"na\", \"na\", \"na\", \"na\", \"na\", \"na\", \"na\", \"na\", \"na\", \"na\", \"na\"], \"run_number\": [2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0], \"current_unit\": \"A\", \"sig_current\": [0.0002, 0.0001, 0.0, 0.0001, 0.0003, 0.0001, 0.0002, 0.0004, 0.0004, 0.0006, 0.0004, 0.0001, 0.0003, 0.0007, 0.0003, 0.0005, 0.0004, 0.0002, 0.0001, 0.0001, 0.0001, 0.0002, 0.0001], \"sig_field\": [0.0, 0.0, 1e-05, 0.0, 0.0, 1e-05, 0.0, 1e-05, 0.0, 1e-05, 1e-05, 0.0, 1e-05, 1e-05, 1e-05, 1e-05, 0.0, 1e-05, 1e-05, 0.0, 0.0, 0.0, 0.0], \"ref_draw\": \"LBT-MG-DPL-4800\", \"field_unit\": \"T-m\", \"magnetic_len_design\": 0.35, \"device_name\": \"LB-B1\", \"current\": [24.9502, 39.9774, 55.0182, 67.0419, 80.0492, 93.0512, 106.0302, 120.0292, 130.0967, 141.0654, 150.0796, 155.0641, 150.0801, 141.0662, 130.0978, 120.0297, 106.0306, 93.0519, 80.0498, 67.0417, 55.0177, 39.9775, 24.9499], \"field\": [-0.04454, -0.07115, -0.09795, -0.11948, -0.14267, -0.16584, -0.18889, -0.21358, -0.2312, -0.25018, -0.26555, -0.27384, -0.26661, -0.25222, -0.23357, -0.21598, -0.19124, -0.16813, -0.14492, -0.12165, -0.10011, -0.07325, -0.04637], \"magnetic_len\": [\"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\"], \"brho_unit\": \"T-m\", \"brho\": 0.6671400000000001, \"energy_default\": 0.2, \"elem_name\": \"LB-B1\", \"serial\": 3, \"i2b\": [0, \"0.00176598175172*input + 0.00176598175172\"]}}'),(2,4,1,'{\"standard\": {\"direction\": [\"na\", \"na\", \"na\", \"na\", \"na\"], \"current_unit\": \"A\", \"sig_current\": [0.00048, 0.00049, 0.00059, 0.00205, 0.00101], \"sig_field\": [4e-06, 6e-06, 1.4e-05, 7e-06, 1.1e-05], \"ref_draw\": \"LBT-MG-QDP-1340\", \"field_unit\": \"T\", \"magnetic_len_design\": 0.25, \"device_name\": \"LB-Q6\", \"current\": [46.89635, 95.02085, 119.92201, 150.00661, 175.09815], \"field\": [0.31967, 0.647159, 0.816403, 1.019623, 1.187596], \"magnetic_len\": [\"\", \"\", \"\", \"\", \"\"], \"b2k\": [0, \"input/(3.335646*energy)\", 2], \"energy_default\": 0.2, \"elem_name\": \"LB-Q6\", \"serial\": 1, \"i2b\": [0, \"0.00678131127601*input + 0.00200218264515\"]}}'),(3,6,1,'{\"complex\": {\"1\": {\"i2b\": [1, \"2.717329e-13*input**4 -4.50853e-10*input**3 + 2.156812e-07*input**2 + 0.001495718*input + 0.0014639\"], \"field_unit\": \"T\", \"current_unit\": \"A\", \"description\": \"Dipole field component for a combined funbction magnet\"}, \"3\": {\"i2b\": [1, \"-7.736754e-11*input**4 + 1.078356e-07*input**3 -4.27955e-05*input**2 + 0.061426*input + 0.031784\"], \"field_unit\": \"T/m^2\", \"current_unit\": \"A\", \"description\": \"Sextupole field component for a combined funbction magnet\"}, \"2\": {\"i2b\": [1, \"1.239146e-12*input**4 -2.242334e-09*input**3 + 1.117486e-06*input**2 + 0.007377142*input + 0.007218819\"], \"field_unit\": \"T/m\", \"current_unit\": \"A\", \"description\": \"Quadrupole field component for a combined funbction magnet\"}}, \"standard\": {\"field_unit\": \"T\", \"current_unit\": \"A\", \"b2i\": [1, \"-33.289411*input**4 + 84.116293*input**3 -61.320653*input**2 + 668.452373*input -0.969042\"]}}'),(4,7,1,'{\"complex\": {\"1\": {\"i2b\": [1, \"2.407631e-13*input**4 -4.006765e-10*input**3 + 1.924432e-07*input**2 + 0.001497716*input + 0.001682902\"], \"field_unit\": \"T\", \"current_unit\": \"A\", \"description\": \"Dipole field component for a combined funbction magnet\"}, \"3\": {\"i2b\": [1, \"-6.877786e-11*input**4 + 9.583012e-08*input**3 -3.743725e-05*input**2 + 0.060833*input + 0.073836\"], \"field_unit\": \"T/m^2\", \"current_unit\": \"A\", \"description\": \"Sextupole field component for a combined funbction magnet\"}, \"2\": {\"i2b\": [1, \"1.37413e-12*input**4 -2.357779e-09*input**3 + 1.134637e-06*input**2 + 0.00736757*input + 0.008791449\"], \"field_unit\": \"T/m\", \"current_unit\": \"A\", \"description\": \"Quadrupole field component for a combined funbction magnet\"}}, \"standard\": {\"field_unit\": \"T\", \"current_unit\": \"A\", \"b2i\": [1, \"-29.580511*input**4 + 74.960874*input**3 -54.87453*input**2 + 667.626806*input -1.115913\"]}}'),(5,8,1,'{\"complex\": {\"1\": {\"i2b\": [1, \"1.133858e-14*input**4 -3.226502e-11*input**3 + 2.837643e-08*input**2 + 0.0005236598*input + 0.0009995262\"], \"field_unit\": \"T\", \"current_unit\": \"A\", \"description\": \"Dipole field component for a combined funbction magnet\"}, \"3\": {\"i2b\": [1, \"4.297231e-11*input**4 -6.886472e-08*input**3 + 3.374462e-05*input**2 + 0.034619*input + 0.30835\"], \"field_unit\": \"T/m^2\", \"current_unit\": \"A\", \"description\": \"Sextupole field component for a combined funbction magnet\"}, \"2\": {\"i2b\": [1, \"4.116128e-13*input**4 -9.158697e-10*input**3 + 6.821702e-07*input**2 + 0.009293128*input + 0.021007\"], \"field_unit\": \"T/m\", \"current_unit\": \"A\", \"description\": \"Quadrupole field component for a combined funbction magnet\"}}, \"standard\": {\"field_unit\": \"T\", \"current_unit\": \"A\", \"b2i\": [1, \"-294.399726*input**4 + 427.035922*input**3 -195.057031*input**2 + 1909.882*input -1.906891\"]}}'),(6,9,1,'{\"standard\": {\"i2b\": [1, \"-4.980045e-09*input**4 + 1.158642e-06*input**3 -7.272479e-05*input**2 + 0.126664*input + 0.038426\"], \"field_unit\": \"T/m\", \"current_unit\": \"A\", \"b2i\": [1, \"0.000221587*input**4 -0.006875003*input**3 + 0.061032*input**2 + 7.809981*input -0.256296\"]}}'),(7,10,1,'{\"standard\": {\"i2b\": [1, \"-4.722752e-09*input**4 + 1.074093e-06*input**3 -6.383258e-05*input**2 + 0.126074*input + 0.04242\"], \"field_unit\": \"T/m\", \"current_unit\": \"A\", \"b2i\": [1, \"0.0002132786*input**4 -0.006507694*input**3 + 0.055993*input**2 + 7.850111*input -0.29104\"]}}'),(8,11,1,'{\"standard\": {\"i2b\": [1, \"-4.896012e-09*input**4 + 1.126162e-06*input**3 -6.877026e-05*input**2 + 0.126352*input + 0.040868\"], \"field_unit\": \"T/m\", \"current_unit\": \"A\", \"b2i\": [1, \"0.0002203189*input**4 -0.006781118*input**3 + 0.059295*input**2 + 7.829313*input -0.276279\"]}}'),(9,12,1,'{\"standard\": {\"i2b\": [1, \"0.003588652*input**4 -0.053174*input**3 + 0.260755*input**2 + 77.374153*input -11.641088\"], \"field_unit\": \"T/m^2\", \"current_unit\": \"A\", \"b2i\": [1, \"-1.254857e-12*input**4 + 1.387766e-09*input**3 -5.019888e-07*input**2 + 0.012911*input + 0.150391\"]}}'),(10,13,1,'{\"standard\": {\"i2b\": [1, \"0.004355193*input**4 -0.075572*input**3 + 0.44161*input**2 + 76.776102*input -10.94581\"], \"field_unit\": \"T/m^2\", \"current_unit\": \"A\", \"b2i\": [1, \"-1.532404e-12*input**4 + 1.996622e-09*input**3 -8.688711e-07*input**2 + 0.013002*input + 0.142524\"]}}'),(11,14,1,'{\"standard\": {\"current_unit\": \"A\", \"ref_draw\": \"BST-MG-DPL-9035\", \"field_unit\": \"T-m\", \"magnetic_len_design\": 1.4, \"device_name\": \"BS-B2\", \"current\": [50.0, 100.0, 150.0, 200.0, 250.0, 300.0, 315.0, 320.0, 325.0, 330.0, 350.0, \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", 0.0, 1.0, 2.0, 3.0, 4.0], \"field\": [1868.0, 3712.0, 5553.0, 7381.2, 9195.4, 10949.9, 11464.7, 11633.4, 11797.6, 11946.3, 12563.0, \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", 0.0, 28.0, 51.5, 76.433333, 106.466667], \"brho_unit\": \"T-m\", \"brho\": 10.007100000000001, \"energy_default\": 3.0, \"elem_name\": \"BS-B2\", \"serial\": 1, \"i2b\": [0, \"0.00501981411291*input + 0.0205207863268\"]}}'),(12,16,2,'DPL-3500'),(13,17,2,'DPL-9000'),(14,18,2,'QDP-9801'),(15,19,2,'QDW-9802'),(16,20,2,'QDP-9804'),(17,21,2,'QDP-9807'),(18,22,2,'QDP-9809'),(19,23,2,'QDP-9810'),(20,24,2,'QDW-9812'),(21,25,2,'QDW-9813'),(22,26,2,'QDP-9815'),(23,27,2,'STP-9801'),(24,28,2,'STP-9802'),(25,29,2,'STP-9816'),(26,30,2,'CRR-1560'),(27,31,2,'CRR-1000'),(28,32,2,'CRR-1001'),(29,33,2,'CRR-2000'),(30,34,2,'CRR-1560'),(31,35,2,'CRR-1000'),(32,36,2,'CRR-1001'),(33,37,2,'CRR-2000'),(34,38,2,'CRR-1560'),(35,39,2,'CRR-1000'),(36,40,2,'CRR-1001'),(37,41,2,'CRR-2000'),(38,20,3,'0.448'),(39,19,3,'0.25'),(40,18,3,'0.25'),(41,26,3,'0.283'),(42,24,3,'0.275'),(43,22,3,'0.275'),(44,17,3,'2.62'),(45,16,3,'2.62'),(46,5,3,'0.15'),(47,14,3,'1.4'),(48,28,3,'0.2'),(49,29,3,'0.25'),(50,27,3,'0.2'),(51,2,3,'0.1'),(52,9,3,'0.3'),(53,7,3,'1.3'),(54,6,3,'1.3'),(55,30,3,'0.3'),(56,32,3,'0.2'),(57,4,3,'0.25'),(58,11,3,'0.3'),(59,10,3,'0.3'),(60,21,3,'0.448'),(61,31,3,'0.2'),(62,13,3,'0.12'),(63,15,3,'0.35'),(64,12,3,'0.12'),(65,33,3,'0.044'),(66,3,3,'0.35'),(67,25,3,'0.275'),(68,23,3,'0.275'),(69,8,3,'1.24');
/*!40000 ALTER TABLE `cmpnt_type_prop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmpnt_type_prop_type`
--

DROP TABLE IF EXISTS `cmpnt_type_prop_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmpnt_type_prop_type` (
  `cmpnt_type_prop_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `cmpnt_type_prop_type_name` varchar(255) DEFAULT NULL,
  `cmpnt_type_prop_type_desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cmpnt_type_prop_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmpnt_type_prop_type`
--

LOCK TABLES `cmpnt_type_prop_type` WRITE;
/*!40000 ALTER TABLE `cmpnt_type_prop_type` DISABLE KEYS */;
INSERT INTO `cmpnt_type_prop_type` VALUES (1,'municonv','unit conversion parameters for NSLS II magnets'),(2,'Reference Drawing','Reference Drawing'),(3,'design length','design magnetic length');
/*!40000 ALTER TABLE `cmpnt_type_prop_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmpnt_type_prop_type_enum`
--

DROP TABLE IF EXISTS `cmpnt_type_prop_type_enum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmpnt_type_prop_type_enum` (
  `cmpnt_type_prop_type_enum_id` int(11) NOT NULL AUTO_INCREMENT,
  `cmpnt_type_prop_type_id` int(11) DEFAULT NULL,
  `cmpnt_type_prop_type_enum` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cmpnt_type_prop_type_enum_id`),
  KEY `Ref_193` (`cmpnt_type_prop_type_id`),
  CONSTRAINT `Ref_193` FOREIGN KEY (`cmpnt_type_prop_type_id`) REFERENCES `cmpnt_type_prop_type` (`cmpnt_type_prop_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmpnt_type_prop_type_enum`
--

LOCK TABLES `cmpnt_type_prop_type_enum` WRITE;
/*!40000 ALTER TABLE `cmpnt_type_prop_type_enum` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmpnt_type_prop_type_enum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmpnttype__cognizant`
--

DROP TABLE IF EXISTS `cmpnttype__cognizant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmpnttype__cognizant` (
  `cmpnttype__cognizant_id` int(11) NOT NULL AUTO_INCREMENT,
  `cmpnt_type_id` int(11) DEFAULT '0',
  `person_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cmpnttype__cognizant_id`),
  KEY `Ref_190` (`cmpnt_type_id`),
  KEY `Ref_191` (`person_id`),
  KEY `Ref_182` (`role_id`),
  CONSTRAINT `Ref_190` FOREIGN KEY (`cmpnt_type_id`) REFERENCES `cmpnt_type` (`cmpnt_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_191` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_182` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmpnttype__cognizant`
--

LOCK TABLES `cmpnttype__cognizant` WRITE;
/*!40000 ALTER TABLE `cmpnttype__cognizant` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmpnttype__cognizant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmpnttype__doc`
--

DROP TABLE IF EXISTS `cmpnttype__doc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmpnttype__doc` (
  `cmpnttype__doc_id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_id` int(11) DEFAULT NULL,
  `cmpnt_type_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cmpnttype__doc_id`),
  KEY `Ref_148` (`doc_id`),
  KEY `Ref_159` (`cmpnt_type_id`),
  CONSTRAINT `Ref_148` FOREIGN KEY (`doc_id`) REFERENCES `doc` (`doc_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_159` FOREIGN KEY (`cmpnt_type_id`) REFERENCES `cmpnt_type` (`cmpnt_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmpnttype__doc`
--

LOCK TABLES `cmpnttype__doc` WRITE;
/*!40000 ALTER TABLE `cmpnttype__doc` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmpnttype__doc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmpnttype__interface`
--

DROP TABLE IF EXISTS `cmpnttype__interface`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmpnttype__interface` (
  `cmpnttype__interface_id` int(11) NOT NULL AUTO_INCREMENT,
  `cmpnt_type_id` int(11) NOT NULL,
  `interface_id` int(11) NOT NULL,
  `required` tinyint(1) DEFAULT NULL,
  `max_children` int(11) DEFAULT '0',
  PRIMARY KEY (`cmpnttype__interface_id`),
  UNIQUE KEY `idx_cmpnt_type_interface_unique` (`cmpnt_type_id`,`interface_id`,`required`),
  KEY `idx_cmpnt_type_id` (`cmpnt_type_id`),
  KEY `idx_cmpnt_type_if_type_id` (`interface_id`,`cmpnt_type_id`),
  CONSTRAINT `cmpnt_type_if_ibfk_1` FOREIGN KEY (`cmpnt_type_id`) REFERENCES `cmpnt_type` (`cmpnt_type_id`),
  CONSTRAINT `cmpnt_type_if_ibfk_3` FOREIGN KEY (`interface_id`) REFERENCES `interface` (`interface_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmpnttype__interface`
--

LOCK TABLES `cmpnttype__interface` WRITE;
/*!40000 ALTER TABLE `cmpnttype__interface` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmpnttype__interface` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmpnttype__porttype`
--

DROP TABLE IF EXISTS `cmpnttype__porttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmpnttype__porttype` (
  `cmpnttype__porttype_id` int(11) NOT NULL AUTO_INCREMENT,
  `cmpnt_type_id` int(11) NOT NULL,
  `port_type_id` int(11) NOT NULL,
  `port_name` varchar(40) NOT NULL,
  `port_order` int(11) NOT NULL,
  PRIMARY KEY (`cmpnttype__porttype_id`),
  UNIQUE KEY `idx_cmpnt_type_port_name_unique` (`cmpnt_type_id`,`port_name`),
  UNIQUE KEY `idx_cmpnt_type_order_unique` (`cmpnt_type_id`,`port_order`),
  KEY `idx_cmpnt_type_id_cpt` (`cmpnt_type_id`),
  KEY `idx_port_type_id_cpt` (`port_type_id`),
  CONSTRAINT `cmpnttype__porttype_ibfk_1` FOREIGN KEY (`cmpnt_type_id`) REFERENCES `cmpnt_type` (`cmpnt_type_id`),
  CONSTRAINT `cmpnttype__porttype_ibfk_2` FOREIGN KEY (`port_type_id`) REFERENCES `port_type` (`port_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmpnttype__porttype`
--

LOCK TABLES `cmpnttype__porttype` WRITE;
/*!40000 ALTER TABLE `cmpnttype__porttype` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmpnttype__porttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmpnttype__vendor`
--

DROP TABLE IF EXISTS `cmpnttype__vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmpnttype__vendor` (
  `cmpnttype__vendor_id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) DEFAULT NULL,
  `cmpnt_type_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cmpnttype__vendor_id`),
  KEY `Ref_236` (`vendor_id`),
  KEY `Ref_242` (`cmpnt_type_id`),
  CONSTRAINT `Ref_236` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_242` FOREIGN KEY (`cmpnt_type_id`) REFERENCES `cmpnt_type` (`cmpnt_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmpnttype__vendor`
--

LOCK TABLES `cmpnttype__vendor` WRITE;
/*!40000 ALTER TABLE `cmpnttype__vendor` DISABLE KEYS */;
INSERT INTO `cmpnttype__vendor` VALUES (1,1,1),(2,1,2),(3,2,3),(4,2,4),(5,2,5),(6,3,6),(7,3,7),(8,3,8),(9,3,9),(10,3,10),(11,3,11),(12,3,12),(13,3,13),(14,2,14),(15,2,15),(16,4,31),(17,4,32),(18,4,30),(19,3,18),(20,3,20),(21,3,21),(22,5,22),(23,3,23),(24,6,26),(25,7,26),(26,3,19),(27,5,24),(28,3,25),(29,8,27),(30,7,28),(31,6,29),(32,7,29);
/*!40000 ALTER TABLE `cmpnttype__vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conductor`
--

DROP TABLE IF EXISTS `conductor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conductor` (
  `conductor_id` int(11) NOT NULL AUTO_INCREMENT,
  `cable_id` int(11) NOT NULL,
  `pin_a_id` int(11) DEFAULT NULL,
  `pin_b_id` int(11) DEFAULT NULL,
  `signal_desc_id` int(11) DEFAULT NULL,
  `signal_name` int(11) DEFAULT NULL,
  PRIMARY KEY (`conductor_id`),
  KEY `idx_cable_id` (`cable_id`),
  KEY `idx_pin_a_id` (`pin_a_id`),
  KEY `idx_pin_b_id` (`pin_b_id`),
  KEY `Ref_245` (`signal_desc_id`),
  CONSTRAINT `conductor_ibfk_1` FOREIGN KEY (`cable_id`) REFERENCES `cable` (`cable_id`),
  CONSTRAINT `Ref_245` FOREIGN KEY (`signal_desc_id`) REFERENCES `signal_desc` (`signal_desc_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_246` FOREIGN KEY (`pin_b_id`) REFERENCES `pin` (`pin_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_247` FOREIGN KEY (`pin_a_id`) REFERENCES `pin` (`pin_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conductor`
--

LOCK TABLES `conductor` WRITE;
/*!40000 ALTER TABLE `conductor` DISABLE KEYS */;
/*!40000 ALTER TABLE `conductor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doc`
--

DROP TABLE IF EXISTS `doc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doc` (
  `doc_id` int(11) NOT NULL AUTO_INCREMENT,
  `doc type` varchar(50) DEFAULT NULL,
  `doc_url` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`doc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doc`
--

LOCK TABLES `doc` WRITE;
/*!40000 ALTER TABLE `doc` DISABLE KEYS */;
/*!40000 ALTER TABLE `doc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document` (
  `document_id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL DEFAULT '0',
  `document_title` varchar(255) DEFAULT NULL,
  `document_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document`
--

LOCK TABLES `document` WRITE;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
/*!40000 ALTER TABLE `document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `element`
--

DROP TABLE IF EXISTS `element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `element` (
  `element_id` int(11) NOT NULL AUTO_INCREMENT,
  `lattice_id` int(11) DEFAULT NULL,
  `element_type_id` int(11) DEFAULT NULL,
  `element_name` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `element_order` int(11) DEFAULT NULL,
  `insert_date` datetime DEFAULT NULL,
  `created_by` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `s` double DEFAULT NULL,
  `length` double DEFAULT NULL,
  `dx` double DEFAULT NULL,
  `dy` double DEFAULT NULL,
  `dz` double DEFAULT NULL,
  `pitch` double DEFAULT NULL,
  `yaw` double DEFAULT NULL,
  `roll` double DEFAULT NULL,
  PRIMARY KEY (`element_id`),
  KEY `FK_lattice_element` (`lattice_id`),
  KEY `FK_element_type` (`element_type_id`),
  CONSTRAINT `FK_lattice_element` FOREIGN KEY (`lattice_id`) REFERENCES `lattice` (`lattice_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_element_type` FOREIGN KEY (`element_type_id`) REFERENCES `element_type` (`element_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `element`
--

LOCK TABLES `element` WRITE;
/*!40000 ALTER TABLE `element` DISABLE KEYS */;
/*!40000 ALTER TABLE `element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `element__install`
--

DROP TABLE IF EXISTS `element__install`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `element__install` (
  `element__install_id` int(11) NOT NULL,
  `element_id` int(11) DEFAULT NULL,
  `install_id` int(11) DEFAULT NULL,
  `slice` int(11) DEFAULT NULL,
  `index` int(11) DEFAULT NULL,
  PRIMARY KEY (`element__install_id`),
  KEY `FK_element_install` (`element_id`),
  KEY `Ref_216` (`install_id`),
  CONSTRAINT `FK_element_install` FOREIGN KEY (`element_id`) REFERENCES `element` (`element_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_216` FOREIGN KEY (`install_id`) REFERENCES `install` (`install_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `element__install`
--

LOCK TABLES `element__install` WRITE;
/*!40000 ALTER TABLE `element__install` DISABLE KEYS */;
/*!40000 ALTER TABLE `element__install` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `element_prop`
--

DROP TABLE IF EXISTS `element_prop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `element_prop` (
  `element_prop_id` int(11) NOT NULL AUTO_INCREMENT,
  `element_id` int(11) DEFAULT NULL,
  `element_type_prop_id` int(11) DEFAULT NULL,
  `element_prop_string` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `element_prop_int` int(11) DEFAULT NULL,
  `element_prop_double` double DEFAULT NULL,
  `element_prop_index` int(11) DEFAULT NULL,
  PRIMARY KEY (`element_prop_id`),
  KEY `Ref_17` (`element_type_prop_id`),
  KEY `FK_element_id` (`element_id`),
  CONSTRAINT `Ref_17` FOREIGN KEY (`element_type_prop_id`) REFERENCES `element_type_prop` (`element_type_prop_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_element_id` FOREIGN KEY (`element_id`) REFERENCES `element` (`element_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `element_prop`
--

LOCK TABLES `element_prop` WRITE;
/*!40000 ALTER TABLE `element_prop` DISABLE KEYS */;
/*!40000 ALTER TABLE `element_prop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `element_type`
--

DROP TABLE IF EXISTS `element_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `element_type` (
  `element_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `element_type` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `element_type_description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`element_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `element_type`
--

LOCK TABLES `element_type` WRITE;
/*!40000 ALTER TABLE `element_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `element_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `element_type_prop`
--

DROP TABLE IF EXISTS `element_type_prop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `element_type_prop` (
  `element_type_prop_id` int(11) NOT NULL AUTO_INCREMENT,
  `element_type_id` int(11) DEFAULT NULL,
  `element_type_prop_name` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `element_type_prop_description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `element_type_prop_default` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `element_type_prop_unit` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `element_type_prop_datatype` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`element_type_prop_id`),
  KEY `Ref_230` (`element_type_id`),
  CONSTRAINT `Ref_230` FOREIGN KEY (`element_type_id`) REFERENCES `element_type` (`element_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `element_type_prop`
--

LOCK TABLES `element_type_prop` WRITE;
/*!40000 ALTER TABLE `element_type_prop` DISABLE KEYS */;
/*!40000 ALTER TABLE `element_type_prop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elog_attachment`
--

DROP TABLE IF EXISTS `elog_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elog_attachment` (
  `elog_attachment_id` int(11) NOT NULL AUTO_INCREMENT,
  `elog_entry_id` int(11) NOT NULL DEFAULT '0',
  `mime_type` varchar(50) DEFAULT NULL,
  `data` text,
  `url` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`elog_attachment_id`),
  KEY `Ref_175` (`elog_entry_id`),
  CONSTRAINT `Ref_175` FOREIGN KEY (`elog_entry_id`) REFERENCES `elog_entry` (`elog_entry_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elog_attachment`
--

LOCK TABLES `elog_attachment` WRITE;
/*!40000 ALTER TABLE `elog_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `elog_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elog_book`
--

DROP TABLE IF EXISTS `elog_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elog_book` (
  `elog_book_id` int(11) NOT NULL,
  `elog_book_name` varchar(50) DEFAULT NULL,
  `elog_book_type` varchar(50) DEFAULT NULL,
  `elog_book_group` varchar(50) DEFAULT NULL,
  `elog_book_start_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`elog_book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elog_book`
--

LOCK TABLES `elog_book` WRITE;
/*!40000 ALTER TABLE `elog_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `elog_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elog_entry`
--

DROP TABLE IF EXISTS `elog_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elog_entry` (
  `elog_entry_id` int(11) NOT NULL AUTO_INCREMENT,
  `elog_book_id` int(11) DEFAULT NULL,
  `author` varchar(50) NOT NULL DEFAULT 'anon',
  `elog_entry` text,
  `elog_thread` int(11) NOT NULL DEFAULT '0',
  `elog_entry_create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`elog_entry_id`),
  KEY `Ref_166` (`elog_book_id`),
  CONSTRAINT `Ref_166` FOREIGN KEY (`elog_book_id`) REFERENCES `elog_book` (`elog_book_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elog_entry`
--

LOCK TABLES `elog_entry` WRITE;
/*!40000 ALTER TABLE `elog_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `elog_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elog_tag`
--

DROP TABLE IF EXISTS `elog_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elog_tag` (
  `elog_tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `elog_tag` char(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`elog_tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elog_tag`
--

LOCK TABLES `elog_tag` WRITE;
/*!40000 ALTER TABLE `elog_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `elog_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elogentry__document`
--

DROP TABLE IF EXISTS `elogentry__document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elogentry__document` (
  `elogentry__document_id` int(11) NOT NULL AUTO_INCREMENT,
  `elog_entry_id` int(11) NOT NULL DEFAULT '0',
  `document_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`elogentry__document_id`),
  KEY `Ref_237` (`document_id`),
  KEY `Ref_238` (`elog_entry_id`),
  CONSTRAINT `Ref_237` FOREIGN KEY (`document_id`) REFERENCES `document` (`document_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_238` FOREIGN KEY (`elog_entry_id`) REFERENCES `elog_entry` (`elog_entry_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elogentry__document`
--

LOCK TABLES `elogentry__document` WRITE;
/*!40000 ALTER TABLE `elogentry__document` DISABLE KEYS */;
/*!40000 ALTER TABLE `elogentry__document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elogentry__elogtag`
--

DROP TABLE IF EXISTS `elogentry__elogtag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elogentry__elogtag` (
  `elogentry__elogtag_id` int(11) NOT NULL AUTO_INCREMENT,
  `elog_tag_id` int(11) NOT NULL DEFAULT '0',
  `elog_entry_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`elogentry__elogtag_id`),
  KEY `Ref_128` (`elog_tag_id`),
  KEY `Ref_127` (`elog_entry_id`),
  CONSTRAINT `Ref_128` FOREIGN KEY (`elog_tag_id`) REFERENCES `elog_tag` (`elog_tag_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_127` FOREIGN KEY (`elog_entry_id`) REFERENCES `elog_entry` (`elog_entry_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elogentry__elogtag`
--

LOCK TABLES `elogentry__elogtag` WRITE;
/*!40000 ALTER TABLE `elogentry__elogtag` DISABLE KEYS */;
/*!40000 ALTER TABLE `elogentry__elogtag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elogentry__install`
--

DROP TABLE IF EXISTS `elogentry__install`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elogentry__install` (
  `elogentry__install_id` int(11) NOT NULL AUTO_INCREMENT,
  `install_id` int(11) NOT NULL DEFAULT '0',
  `elog_entry_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`elogentry__install_id`),
  KEY `Ref_130` (`install_id`),
  KEY `Ref_131` (`elog_entry_id`),
  CONSTRAINT `Ref_130` FOREIGN KEY (`install_id`) REFERENCES `install` (`install_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_131` FOREIGN KEY (`elog_entry_id`) REFERENCES `elog_entry` (`elog_entry_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elogentry__install`
--

LOCK TABLES `elogentry__install` WRITE;
/*!40000 ALTER TABLE `elogentry__install` DISABLE KEYS */;
/*!40000 ALTER TABLE `elogentry__install` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fld`
--

DROP TABLE IF EXISTS `fld`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fld` (
  `fld_id` int(11) NOT NULL AUTO_INCREMENT,
  `rec_id` int(11) DEFAULT NULL,
  `fld_type_id` int(11) DEFAULT NULL,
  `fld_val` varchar(128) DEFAULT NULL,
  `ioc_resource_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`fld_id`),
  KEY `idx_fld_val` (`fld_val`),
  KEY `idx_rec_id` (`rec_id`),
  KEY `idx_fld_type_id` (`fld_type_id`),
  KEY `idx_ioc_resource_id` (`ioc_resource_id`),
  CONSTRAINT `fld_ibfk_1` FOREIGN KEY (`rec_id`) REFERENCES `rec` (`rec_id`),
  CONSTRAINT `fld_ibfk_2` FOREIGN KEY (`fld_type_id`) REFERENCES `fld_type` (`fld_type_id`),
  CONSTRAINT `fld_ibfk_3` FOREIGN KEY (`ioc_resource_id`) REFERENCES `ioc_resource` (`ioc_resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fld`
--

LOCK TABLES `fld` WRITE;
/*!40000 ALTER TABLE `fld` DISABLE KEYS */;
/*!40000 ALTER TABLE `fld` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fld_type`
--

DROP TABLE IF EXISTS `fld_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fld_type` (
  `fld_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `rec_type_id` int(11) DEFAULT NULL,
  `fld_type` varchar(24) DEFAULT NULL,
  `dbd_type` varchar(24) DEFAULT NULL,
  `def_fld_val` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`fld_type_id`),
  KEY `idx_dbd_type` (`dbd_type`),
  KEY `idx_rec_type_id` (`rec_type_id`),
  CONSTRAINT `fld_type_ibfk_1` FOREIGN KEY (`rec_type_id`) REFERENCES `rec_type` (`rec_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fld_type`
--

LOCK TABLES `fld_type` WRITE;
/*!40000 ALTER TABLE `fld_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `fld_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gold_lattice`
--

DROP TABLE IF EXISTS `gold_lattice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gold_lattice` (
  `gold_lattice_id` int(11) NOT NULL AUTO_INCREMENT,
  `lattice_id` int(11) DEFAULT NULL,
  `created_by` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `updated_by` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `gold_status_ind` int(11) DEFAULT NULL,
  PRIMARY KEY (`gold_lattice_id`),
  KEY `FK_gold_lattice_id` (`lattice_id`),
  CONSTRAINT `FK_gold_lattice_id` FOREIGN KEY (`lattice_id`) REFERENCES `lattice` (`lattice_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gold_lattice`
--

LOCK TABLES `gold_lattice` WRITE;
/*!40000 ALTER TABLE `gold_lattice` DISABLE KEYS */;
/*!40000 ALTER TABLE `gold_lattice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gold_model`
--

DROP TABLE IF EXISTS `gold_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gold_model` (
  `gold_model_id` int(11) NOT NULL AUTO_INCREMENT,
  `model_id` int(11) DEFAULT NULL,
  `created_by` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `updated_by` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `gold_status_ind` int(11) DEFAULT NULL,
  PRIMARY KEY (`gold_model_id`),
  KEY `Ref_215` (`model_id`),
  CONSTRAINT `Ref_215` FOREIGN KEY (`model_id`) REFERENCES `model` (`model_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gold_model`
--

LOCK TABLES `gold_model` WRITE;
/*!40000 ALTER TABLE `gold_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `gold_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hall_probe_data`
--

DROP TABLE IF EXISTS `hall_probe_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hall_probe_data` (
  `hall_probe_id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_id` int(11) DEFAULT NULL,
  `alias` varchar(50) DEFAULT NULL,
  `meas_date` datetime DEFAULT NULL,
  `measured_at_location` varchar(50) DEFAULT NULL,
  `sub_device` varchar(50) NOT NULL DEFAULT '0',
  `run_identifier` varchar(50) DEFAULT NULL,
  `login_name` varchar(50) DEFAULT NULL,
  `conditioning_current` double DEFAULT NULL,
  `current_1` double DEFAULT NULL,
  `current_2` double DEFAULT NULL,
  `current_3` double DEFAULT NULL,
  `up_dn1` varchar(50) DEFAULT NULL,
  `up_dn2` varchar(50) DEFAULT NULL,
  `up_dn3` varchar(50) DEFAULT NULL,
  `mag_volt_1` double DEFAULT NULL,
  `mag_volt_2` double DEFAULT NULL,
  `mag_volt_3` double DEFAULT NULL,
  `x` double DEFAULT NULL,
  `y` double DEFAULT NULL,
  `z` double DEFAULT NULL,
  `bx_t` double DEFAULT NULL,
  `by_t` double DEFAULT NULL,
  `bz_t` double DEFAULT NULL,
  `meas_notes` varchar(255) DEFAULT NULL,
  `data_issues` varchar(255) DEFAULT NULL,
  `data_usage` int(11) DEFAULT NULL,
  PRIMARY KEY (`hall_probe_id`),
  KEY `Ref_165` (`inventory_id`),
  CONSTRAINT `Ref_165` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`inventory_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hall_probe_data`
--

LOCK TABLES `hall_probe_data` WRITE;
/*!40000 ALTER TABLE `hall_probe_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `hall_probe_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `install`
--

DROP TABLE IF EXISTS `install`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `install` (
  `install_id` int(11) NOT NULL AUTO_INCREMENT,
  `cmpnt_type_id` int(11) NOT NULL DEFAULT '0',
  `field_name` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`install_id`),
  KEY `Ref_99` (`cmpnt_type_id`),
  CONSTRAINT `Ref_99` FOREIGN KEY (`cmpnt_type_id`) REFERENCES `cmpnt_type` (`cmpnt_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1070 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `install`
--

LOCK TABLES `install` WRITE;
/*!40000 ALTER TABLE `install` DISABLE KEYS */;
INSERT INTO `install` VALUES (1,1,'LN-SO2','Linac'),(2,1,'LN-SO3','Linac'),(3,1,'LN-SO4','Linac'),(4,1,'LN-SO5','Linac'),(5,1,'LN-SO6','Linac'),(6,1,'LN-SO7','Linac'),(7,1,'LN-SO8','Linac'),(8,1,'LN-SO9','Linac'),(9,1,'LN-SO10','Linac'),(10,1,'LN-SO11','Linac'),(11,1,'LN-SO12','Linac'),(12,1,'LN-SO13','Linac'),(13,1,'LN-SO14','Linac'),(14,1,'LN-SO15','Linac'),(15,1,'LN-SO16','Linac'),(16,1,'LN-SO17','Linac'),(17,1,'LN-SO18','Linac'),(18,1,'LN-SO19','Linac'),(19,1,'LN-SO20','Linac'),(20,2,'LN-Q1','Linac'),(21,2,'LN-Q2','Linac'),(22,2,'LN-Q3','Linac'),(23,2,'LN-Q4','Linac'),(24,2,'LN-Q5','Linac'),(25,2,'LN-Q6','Linac'),(26,2,'LN-Q7','Linac'),(27,2,'LN-Q8','Linac'),(28,2,'LN-Q9','Linac'),(29,3,'LB-B1','LBT'),(30,3,'LB-B2','LBT'),(31,3,'LB-B3','LBT'),(32,3,'LB-B4','LBT'),(33,4,'LB-Q5','LBT'),(34,4,'LB-Q6','LBT'),(35,5,'LB-Q1','LBT'),(36,5,'LB-Q2','LBT'),(37,5,'LB-Q3','LBT'),(38,5,'LB-Q4','LBT'),(39,5,'LB-Q7','LBT'),(40,5,'LB-Q8','LBT'),(41,5,'LB-Q9','LBT'),(42,5,'LB-Q10','LBT'),(43,5,'LB-Q11','LBT'),(44,5,'LB-Q12','LBT'),(45,5,'LB-Q13','LBT'),(46,5,'LB-Q14','LBT'),(47,5,'LB-Q15','LBT'),(48,5,'LB-Q1BD1','LBT'),(49,5,'LB-Q2BD1','LBT'),(50,6,'A1BD1','Booster'),(51,6,'A1BD2','Booster'),(52,6,'A1BD3','Booster'),(53,6,'A1BD4','Booster'),(54,6,'A1BD5','Booster'),(55,6,'A1BD6','Booster'),(56,6,'A1BD7','Booster'),(57,6,'A1BD8','Booster'),(58,6,'A2BD1','Booster'),(59,6,'A2BD2','Booster'),(60,6,'A2BD3','Booster'),(61,6,'A2BD4','Booster'),(62,6,'A2BD5','Booster'),(63,6,'A2BD6','Booster'),(64,6,'A2BD7','Booster'),(65,6,'A2BD8','Booster'),(66,7,'A3BD1','Booster'),(67,7,'A3BD2','Booster'),(68,7,'A3BD3','Booster'),(69,7,'A3BD4','Booster'),(70,7,'A3BD5','Booster'),(71,7,'A3BD6','Booster'),(72,7,'A3BD7','Booster'),(73,7,'A3BD8','Booster'),(74,7,'A4BD1','Booster'),(75,7,'A4BD2','Booster'),(76,7,'A4BD3','Booster'),(77,7,'A4BD4','Booster'),(78,7,'A4BD5','Booster'),(79,7,'A4BD6','Booster'),(80,7,'A4BD7','Booster'),(81,7,'A4BD8','Booster'),(82,8,'A1BF1','Booster'),(83,8,'A1BF2','Booster'),(84,8,'A1BF3','Booster'),(85,8,'A1BF4','Booster'),(86,8,'A1BF5','Booster'),(87,8,'A1BF6','Booster'),(88,8,'A1BF7','Booster'),(89,8,'A2BF1','Booster'),(90,8,'A2BF2','Booster'),(91,8,'A2BF3','Booster'),(92,8,'A2BF4','Booster'),(93,8,'A2BF5','Booster'),(94,8,'A2BF6','Booster'),(95,8,'A2BF7','Booster'),(96,8,'A3BF1','Booster'),(97,8,'A3BF2','Booster'),(98,8,'A3BF3','Booster'),(99,8,'A3BF4','Booster'),(100,8,'A3BF5','Booster'),(101,8,'A3BF6','Booster'),(102,8,'A3BF7','Booster'),(103,8,'A4BF1','Booster'),(104,8,'A4BF2','Booster'),(105,8,'A4BF3','Booster'),(106,8,'A4BF4','Booster'),(107,8,'A4BF5','Booster'),(108,8,'A4BF6','Booster'),(109,8,'A4BF7','Booster'),(110,9,'A1QF1','Booster'),(111,9,'A1QF2','Booster'),(112,9,'A2QF1','Booster'),(113,9,'A2QF2','Booster'),(114,9,'A3QF1','Booster'),(115,9,'A3QF2','Booster'),(116,9,'A4QF1','Booster'),(117,9,'A4QF2','Booster'),(118,10,'A1QD1','Booster'),(119,10,'A1QD2','Booster'),(120,10,'A2QD1','Booster'),(121,10,'A2QD2','Booster'),(122,10,'A3QD1','Booster'),(123,10,'A3QD2','Booster'),(124,10,'A4QD1','Booster'),(125,10,'A4QD2','Booster'),(126,11,'A1QG1','Booster'),(127,11,'A1QG2','Booster'),(128,11,'A2QG1','Booster'),(129,11,'A2QG2','Booster'),(130,11,'A3QG1','Booster'),(131,11,'A3QG2','Booster'),(132,11,'A4QG1','Booster'),(133,11,'A4QG2','Booster'),(134,12,'A1SF1','Booster'),(135,12,'A1SF2','Booster'),(136,12,'A2SF1','Booster'),(137,12,'A2SF2','Booster'),(138,12,'A3SF1','Booster'),(139,12,'A3SF2','Booster'),(140,12,'A4SF1','Booster'),(141,12,'A4SF2','Booster'),(142,13,'A1SD1','Booster'),(143,13,'A1SD2','Booster'),(144,13,'A2SD1','Booster'),(145,13,'A2SD2','Booster'),(146,13,'A3SD1','Booster'),(147,13,'A3SD2','Booster'),(148,13,'A4SD1','Booster'),(149,13,'A4SD2','Booster'),(150,14,'BS-B1','BST'),(151,14,'BS-B2','BST'),(152,14,'BS-B3','BST'),(153,14,'BS-B4','BST'),(154,15,'BS-Q1','BST'),(155,15,'BS-Q2','BST'),(156,15,'BS-Q3','BST'),(157,15,'BS-Q4','BST'),(158,15,'BS-Q5','BST'),(159,15,'BS-Q6','BST'),(160,15,'BS-Q7','BST'),(161,15,'BS-Q8','BST'),(162,15,'BS-Q9','BST'),(163,15,'BS-Q10','BST'),(164,15,'BS-Q11','BST'),(165,15,'BS-Q12','BST'),(166,15,'BS-Q13','BST'),(167,15,'BS-Q14','BST'),(168,15,'BS-Q1BD1','BST'),(169,15,'BS-Q2BD1','BST'),(170,33,'FH1G1C30A','Storage Ring'),(171,33,'FH2G1C30A','Storage Ring'),(172,27,'SH1G2C30A','Storage Ring'),(173,22,'QH1G2C30A','Storage Ring'),(174,32,'SQHG2C30A','Storage Ring'),(175,20,'QH2G2C30A','Storage Ring'),(176,27,'SH3G2C30A','Storage Ring'),(177,22,'QH3G2C30A','Storage Ring'),(178,27,'SH4G2C30A','Storage Ring'),(179,30,'CH2G2C30A','Storage Ring'),(180,16,'B1G3C30A','Storage Ring'),(181,31,'CM1G4C30A','Storage Ring'),(182,19,'QM1G4C30A','Storage Ring'),(183,28,'SM1G4C30A','Storage Ring'),(184,33,'FM1G4C30A','Storage Ring'),(185,26,'QM2G4C30A','Storage Ring'),(186,29,'SM2G4C30B','Storage Ring'),(187,26,'QM2G4C30B','Storage Ring'),(188,27,'SM1G4C30B','Storage Ring'),(189,18,'QM1G4C30B','Storage Ring'),(190,30,'CM1G4C30B','Storage Ring'),(191,16,'B1G5C30B','Storage Ring'),(192,24,'QL3G6C30B','Storage Ring'),(193,28,'SL3G6C30B','Storage Ring'),(194,31,'CL2G6C30B','Storage Ring'),(195,21,'QL2G6C30B','Storage Ring'),(196,27,'SL2G6C30B','Storage Ring'),(197,31,'CL1G6C30B','Storage Ring'),(198,22,'QL1G6C30B','Storage Ring'),(199,27,'SL1G6C30B','Storage Ring'),(200,33,'FL1G1C01A','Storage Ring'),(201,33,'FL2G1C01A','Storage Ring'),(202,27,'SL1G2C01A','Storage Ring'),(203,22,'QL1G2C01A','Storage Ring'),(204,31,'CL1G2C01A','Storage Ring'),(205,27,'SL2G2C01A','Storage Ring'),(206,20,'QL2G2C01A','Storage Ring'),(207,31,'CL2G2C01A','Storage Ring'),(208,27,'SL3G2C01A','Storage Ring'),(209,22,'QL3G2C01A','Storage Ring'),(210,16,'B1G3C01A','Storage Ring'),(211,32,'SQMG4C01A','Storage Ring'),(212,19,'QM1G4C01A','Storage Ring'),(213,27,'SM1G4C01A','Storage Ring'),(214,33,'FM1G4C01A','Storage Ring'),(215,26,'QM2G4C01A','Storage Ring'),(216,29,'SM2G4C01B','Storage Ring'),(217,26,'QM2G4C01B','Storage Ring'),(218,27,'SM1G4C01B','Storage Ring'),(219,18,'QM1G4C01B','Storage Ring'),(220,30,'CM1G4C01B','Storage Ring'),(221,16,'B1G5C01B','Storage Ring'),(222,30,'CH2G6C01B','Storage Ring'),(223,28,'SH4G6C01B','Storage Ring'),(224,24,'QH3G6C01B','Storage Ring'),(225,28,'SH3G6C01B','Storage Ring'),(226,21,'QH2G6C01B','Storage Ring'),(227,31,'CH1G6C01B','Storage Ring'),(228,22,'QH1G6C01B','Storage Ring'),(229,27,'SH1G6C01B','Storage Ring'),(230,33,'FH1G1C02A','Storage Ring'),(231,33,'FH2G1C02A','Storage Ring'),(232,27,'SH1G2C02A','Storage Ring'),(233,22,'QH1G2C02A','Storage Ring'),(234,32,'SQHG2C02A','Storage Ring'),(235,20,'QH2G2C02A','Storage Ring'),(236,27,'SH3G2C02A','Storage Ring'),(237,22,'QH3G2C02A','Storage Ring'),(238,27,'SH4G2C02A','Storage Ring'),(239,30,'CH2G2C02A','Storage Ring'),(240,16,'B1G3C02A','Storage Ring'),(241,31,'CM1G4C02A','Storage Ring'),(242,19,'QM1G4C02A','Storage Ring'),(243,28,'SM1G4C02A','Storage Ring'),(244,33,'FM1G4C02A','Storage Ring'),(245,26,'QM2G4C02A','Storage Ring'),(246,29,'SM2G4C02B','Storage Ring'),(247,26,'QM2G4C02B','Storage Ring'),(248,27,'SM1G4C02B','Storage Ring'),(249,18,'QM1G4C02B','Storage Ring'),(250,30,'CM1G4C02B','Storage Ring'),(251,16,'B1G5C02B','Storage Ring'),(252,24,'QL3G6C02B','Storage Ring'),(253,28,'SL3G6C02B','Storage Ring'),(254,31,'CL2G6C02B','Storage Ring'),(255,21,'QL2G6C02B','Storage Ring'),(256,27,'SL2G6C02B','Storage Ring'),(257,31,'CL1G6C02B','Storage Ring'),(258,22,'QL1G6C02B','Storage Ring'),(259,27,'SL1G6C02B','Storage Ring'),(260,33,'FL1G1C03A','Storage Ring'),(261,33,'FL2G1C03A','Storage Ring'),(262,27,'SL1G2C03A','Storage Ring'),(263,22,'QL1G2C03A','Storage Ring'),(264,31,'CL1G2C03A','Storage Ring'),(265,27,'SL2G2C03A','Storage Ring'),(266,20,'QL2G2C03A','Storage Ring'),(267,31,'CL2G2C03A','Storage Ring'),(268,27,'SL3G2C03A','Storage Ring'),(269,22,'QL3G2C03A','Storage Ring'),(270,17,'B1G3C03A','Storage Ring'),(271,32,'SQMG4C03A','Storage Ring'),(272,19,'QM1G4C03A','Storage Ring'),(273,28,'SM1G4C03A','Storage Ring'),(274,33,'FM1G4C03A','Storage Ring'),(275,26,'QM2G4C03A','Storage Ring'),(276,29,'SM2G4C03B','Storage Ring'),(277,26,'QM2G4C03B','Storage Ring'),(278,27,'SM1G4C03B','Storage Ring'),(279,18,'QM1G4C03B','Storage Ring'),(280,30,'CM1G4C03B','Storage Ring'),(281,17,'B1G5C03B','Storage Ring'),(282,30,'CH2G6C03B','Storage Ring'),(283,28,'SH4G6C03B','Storage Ring'),(284,24,'QH3G6C03B','Storage Ring'),(285,28,'SH3G6C03B','Storage Ring'),(286,21,'QH2G6C03B','Storage Ring'),(287,31,'CH1G6C03B','Storage Ring'),(288,22,'QH1G6C03B','Storage Ring'),(289,27,'SH1G6C03B','Storage Ring'),(290,33,'FH1G1C04A','Storage Ring'),(291,33,'FH2G1C04A','Storage Ring'),(292,27,'SH1G2C04A','Storage Ring'),(293,22,'QH1G2C04A','Storage Ring'),(294,32,'SQHG2C04A','Storage Ring'),(295,20,'QH2G2C04A','Storage Ring'),(296,27,'SH3G2C04A','Storage Ring'),(297,22,'QH3G2C04A','Storage Ring'),(298,27,'SH4G2C04A','Storage Ring'),(299,30,'CH2G2C04A','Storage Ring'),(300,16,'B1G3C04A','Storage Ring'),(301,31,'CM1G4C04A','Storage Ring'),(302,19,'QM1G4C04A','Storage Ring'),(303,28,'SM1G4C04A','Storage Ring'),(304,33,'FM1G4C04A','Storage Ring'),(305,26,'QM2G4C04A','Storage Ring'),(306,29,'SM2G4C04B','Storage Ring'),(307,26,'QM2G4C04B','Storage Ring'),(308,27,'SM1G4C04B','Storage Ring'),(309,18,'QM1G4C04B','Storage Ring'),(310,30,'CM1G4C04B','Storage Ring'),(311,16,'B1G5C04B','Storage Ring'),(312,24,'QL3G6C04B','Storage Ring'),(313,28,'SL3G6C04B','Storage Ring'),(314,31,'CL2G6C04B','Storage Ring'),(315,21,'QL2G6C04B','Storage Ring'),(316,27,'SL2G6C04B','Storage Ring'),(317,31,'CL1G6C04B','Storage Ring'),(318,22,'QL1G6C04B','Storage Ring'),(319,27,'SL1G6C04B','Storage Ring'),(320,33,'FL1G1C05A','Storage Ring'),(321,33,'FL2G1C05A','Storage Ring'),(322,27,'SL1G2C05A','Storage Ring'),(323,22,'QL1G2C05A','Storage Ring'),(324,31,'CL1G2C05A','Storage Ring'),(325,27,'SL2G2C05A','Storage Ring'),(326,20,'QL2G2C05A','Storage Ring'),(327,31,'CL2G2C05A','Storage Ring'),(328,27,'SL3G2C05A','Storage Ring'),(329,22,'QL3G2C05A','Storage Ring'),(330,16,'B1G3C05A','Storage Ring'),(331,32,'SQMG4C05A','Storage Ring'),(332,19,'QM1G4C05A','Storage Ring'),(333,28,'SM1G4C05A','Storage Ring'),(334,33,'FM1G4C05A','Storage Ring'),(335,26,'QM2G4C05A','Storage Ring'),(336,29,'SM2G4C05B','Storage Ring'),(337,26,'QM2G4C05B','Storage Ring'),(338,27,'SM1G4C05B','Storage Ring'),(339,18,'QM1G4C05B','Storage Ring'),(340,30,'CM1G4C05B','Storage Ring'),(341,16,'B1G5C05B','Storage Ring'),(342,30,'CH2G6C05B','Storage Ring'),(343,28,'SH4G6C05B','Storage Ring'),(344,24,'QH3G6C05B','Storage Ring'),(345,28,'SH3G6C05B','Storage Ring'),(346,21,'QH2G6C05B','Storage Ring'),(347,31,'CH1G6C05B','Storage Ring'),(348,22,'QH1G6C05B','Storage Ring'),(349,27,'SH1G6C05B','Storage Ring'),(350,33,'FH1G1C06A','Storage Ring'),(351,33,'FH2G1C06A','Storage Ring'),(352,27,'SH1G2C06A','Storage Ring'),(353,22,'QH1G2C06A','Storage Ring'),(354,32,'SQHG2C06A','Storage Ring'),(355,20,'QH2G2C06A','Storage Ring'),(356,27,'SH3G2C06A','Storage Ring'),(357,22,'QH3G2C06A','Storage Ring'),(358,27,'SH4G2C06A','Storage Ring'),(359,30,'CH2G2C06A','Storage Ring'),(360,16,'B1G3C06A','Storage Ring'),(361,31,'CM1G4C06A','Storage Ring'),(362,19,'QM1G4C06A','Storage Ring'),(363,28,'SM1G4C06A','Storage Ring'),(364,33,'FM1G4C06A','Storage Ring'),(365,26,'QM2G4C06A','Storage Ring'),(366,29,'SM2G4C06B','Storage Ring'),(367,26,'QM2G4C06B','Storage Ring'),(368,27,'SM1G4C06B','Storage Ring'),(369,18,'QM1G4C06B','Storage Ring'),(370,30,'CM1G4C06B','Storage Ring'),(371,16,'B1G5C06B','Storage Ring'),(372,24,'QL3G6C06B','Storage Ring'),(373,28,'SL3G6C06B','Storage Ring'),(374,31,'CL2G6C06B','Storage Ring'),(375,21,'QL2G6C06B','Storage Ring'),(376,27,'SL2G6C06B','Storage Ring'),(377,31,'CL1G6C06B','Storage Ring'),(378,22,'QL1G6C06B','Storage Ring'),(379,27,'SL1G6C06B','Storage Ring'),(380,33,'FL1G1C07A','Storage Ring'),(381,33,'FL2G1C07A','Storage Ring'),(382,27,'SL1G2C07A','Storage Ring'),(383,22,'QL1G2C07A','Storage Ring'),(384,31,'CL1G2C07A','Storage Ring'),(385,27,'SL2G2C07A','Storage Ring'),(386,20,'QL2G2C07A','Storage Ring'),(387,31,'CL2G2C07A','Storage Ring'),(388,27,'SL3G2C07A','Storage Ring'),(389,22,'QL3G2C07A','Storage Ring'),(390,16,'B1G3C07A','Storage Ring'),(391,32,'SQMG4C07A','Storage Ring'),(392,19,'QM1G4C07A','Storage Ring'),(393,28,'SM1G4C07A','Storage Ring'),(394,33,'FM1G4C07A','Storage Ring'),(395,26,'QM2G4C07A','Storage Ring'),(396,29,'SM2G4C07B','Storage Ring'),(397,26,'QM2G4C07B','Storage Ring'),(398,27,'SM1G4C07B','Storage Ring'),(399,18,'QM1G4C07B','Storage Ring'),(400,30,'CM1G4C07B','Storage Ring'),(401,16,'B1G5C07B','Storage Ring'),(402,30,'CH2G6C07B','Storage Ring'),(403,28,'SH4G6C07B','Storage Ring'),(404,25,'QH3G6C07B','Storage Ring'),(405,28,'SH3G6C07B','Storage Ring'),(406,21,'QH2G6C07B','Storage Ring'),(407,31,'CH1G6C07B','Storage Ring'),(408,22,'QH1G6C07B','Storage Ring'),(409,27,'SH1G6C07B','Storage Ring'),(410,33,'FH1G1C08A','Storage Ring'),(411,33,'FH2G1C08A','Storage Ring'),(412,27,'SH1G2C08A','Storage Ring'),(413,22,'QH1G2C08A','Storage Ring'),(414,32,'SQHG2C08A','Storage Ring'),(415,20,'QH2G2C08A','Storage Ring'),(416,27,'SH3G2C08A','Storage Ring'),(417,23,'QH3G2C08A','Storage Ring'),(418,27,'SH4G2C08A','Storage Ring'),(419,30,'CH2G2C08A','Storage Ring'),(420,16,'B1G3C08A','Storage Ring'),(421,31,'CM1G4C08A','Storage Ring'),(422,19,'QM1G4C08A','Storage Ring'),(423,28,'SM1G4C08A','Storage Ring'),(424,33,'FM1G4C08A','Storage Ring'),(425,26,'QM2G4C08A','Storage Ring'),(426,29,'SM2G4C08B','Storage Ring'),(427,26,'QM2G4C08B','Storage Ring'),(428,27,'SM1G4C08B','Storage Ring'),(429,18,'QM1G4C08B','Storage Ring'),(430,30,'CM1G4C08B','Storage Ring'),(431,16,'B1G5C08B','Storage Ring'),(432,24,'QL3G6C08B','Storage Ring'),(433,28,'SL3G6C08B','Storage Ring'),(434,31,'CL2G6C08B','Storage Ring'),(435,21,'QL2G6C08B','Storage Ring'),(436,27,'SL2G6C08B','Storage Ring'),(437,31,'CL1G6C08B','Storage Ring'),(438,22,'QL1G6C08B','Storage Ring'),(439,27,'SL1G6C08B','Storage Ring'),(440,33,'FL1G1C09A','Storage Ring'),(441,33,'FL2G1C09A','Storage Ring'),(442,27,'SL1G2C09A','Storage Ring'),(443,22,'QL1G2C09A','Storage Ring'),(444,31,'CL1G2C09A','Storage Ring'),(445,27,'SL2G2C09A','Storage Ring'),(446,20,'QL2G2C09A','Storage Ring'),(447,31,'CL2G2C09A','Storage Ring'),(448,27,'SL3G2C09A','Storage Ring'),(449,22,'QL3G2C09A','Storage Ring'),(450,16,'B1G3C09A','Storage Ring'),(451,32,'SQMG4C09A','Storage Ring'),(452,19,'QM1G4C09A','Storage Ring'),(453,28,'SM1G4C09A','Storage Ring'),(454,33,'FM1G4C09A','Storage Ring'),(455,26,'QM2G4C09A','Storage Ring'),(456,29,'SM2G4C09B','Storage Ring'),(457,26,'QM2G4C09B','Storage Ring'),(458,27,'SM1G4C09B','Storage Ring'),(459,18,'QM1G4C09B','Storage Ring'),(460,30,'CM1G4C09B','Storage Ring'),(461,16,'B1G5C09B','Storage Ring'),(462,30,'CH2G6C09B','Storage Ring'),(463,28,'SH4G6C09B','Storage Ring'),(464,24,'QH3G6C09B','Storage Ring'),(465,28,'SH3G6C09B','Storage Ring'),(466,21,'QH2G6C09B','Storage Ring'),(467,31,'CH1G6C09B','Storage Ring'),(468,22,'QH1G6C09B','Storage Ring'),(469,27,'SH1G6C09B','Storage Ring'),(470,33,'FH1G1C10A','Storage Ring'),(471,33,'FH2G1C10A','Storage Ring'),(472,27,'SH1G2C10A','Storage Ring'),(473,22,'QH1G2C10A','Storage Ring'),(474,32,'SQHG2C10A','Storage Ring'),(475,20,'QH2G2C10A','Storage Ring'),(476,27,'SH3G2C10A','Storage Ring'),(477,22,'QH3G2C10A','Storage Ring'),(478,27,'SH4G2C10A','Storage Ring'),(479,30,'CH2G2C10A','Storage Ring'),(480,16,'B1G3C10A','Storage Ring'),(481,31,'CM1G4C10A','Storage Ring'),(482,19,'QM1G4C10A','Storage Ring'),(483,28,'SM1G4C10A','Storage Ring'),(484,33,'FM1G4C10A','Storage Ring'),(485,26,'QM2G4C10A','Storage Ring'),(486,29,'SM2G4C10B','Storage Ring'),(487,26,'QM2G4C10B','Storage Ring'),(488,27,'SM1G4C10B','Storage Ring'),(489,18,'QM1G4C10B','Storage Ring'),(490,30,'CM1G4C10B','Storage Ring'),(491,16,'B1G5C10B','Storage Ring'),(492,24,'QL3G6C10B','Storage Ring'),(493,28,'SL3G6C10B','Storage Ring'),(494,31,'CL2G6C10B','Storage Ring'),(495,21,'QL2G6C10B','Storage Ring'),(496,27,'SL2G6C10B','Storage Ring'),(497,31,'CL1G6C10B','Storage Ring'),(498,22,'QL1G6C10B','Storage Ring'),(499,27,'SL1G6C10B','Storage Ring'),(500,33,'FL1G1C11A','Storage Ring'),(501,33,'FL2G1C11A','Storage Ring'),(502,27,'SL1G2C11A','Storage Ring'),(503,22,'QL1G2C11A','Storage Ring'),(504,31,'CL1G2C11A','Storage Ring'),(505,27,'SL2G2C11A','Storage Ring'),(506,20,'QL2G2C11A','Storage Ring'),(507,31,'CL2G2C11A','Storage Ring'),(508,27,'SL3G2C11A','Storage Ring'),(509,22,'QL3G2C11A','Storage Ring'),(510,16,'B1G3C11A','Storage Ring'),(511,32,'SQMG4C11A','Storage Ring'),(512,19,'QM1G4C11A','Storage Ring'),(513,28,'SM1G4C11A','Storage Ring'),(514,33,'FM1G4C11A','Storage Ring'),(515,26,'QM2G4C11A','Storage Ring'),(516,29,'SM2G4C11B','Storage Ring'),(517,26,'QM2G4C11B','Storage Ring'),(518,27,'SM1G4C11B','Storage Ring'),(519,18,'QM1G4C11B','Storage Ring'),(520,30,'CM1G4C11B','Storage Ring'),(521,16,'B1G5C11B','Storage Ring'),(522,30,'CH2G6C11B','Storage Ring'),(523,28,'SH4G6C11B','Storage Ring'),(524,24,'QH3G6C11B','Storage Ring'),(525,28,'SH3G6C11B','Storage Ring'),(526,21,'QH2G6C11B','Storage Ring'),(527,31,'CH1G6C11B','Storage Ring'),(528,22,'QH1G6C11B','Storage Ring'),(529,27,'SH1G6C11B','Storage Ring'),(530,33,'FH1G1C12A','Storage Ring'),(531,33,'FH2G1C12A','Storage Ring'),(532,27,'SH1G2C12A','Storage Ring'),(533,22,'QH1G2C12A','Storage Ring'),(534,32,'SQHG2C12A','Storage Ring'),(535,20,'QH2G2C12A','Storage Ring'),(536,27,'SH3G2C12A','Storage Ring'),(537,22,'QH3G2C12A','Storage Ring'),(538,27,'SH4G2C12A','Storage Ring'),(539,30,'CH2G2C12A','Storage Ring'),(540,16,'B1G3C12A','Storage Ring'),(541,31,'CM1G4C12A','Storage Ring'),(542,19,'QM1G4C12A','Storage Ring'),(543,28,'SM1G4C12A','Storage Ring'),(544,33,'FM1G4C12A','Storage Ring'),(545,26,'QM2G4C12A','Storage Ring'),(546,29,'SM2G4C12B','Storage Ring'),(547,26,'QM2G4C12B','Storage Ring'),(548,27,'SM1G4C12B','Storage Ring'),(549,18,'QM1G4C12B','Storage Ring'),(550,30,'CM1G4C12B','Storage Ring'),(551,16,'B1G5C12B','Storage Ring'),(552,24,'QL3G6C12B','Storage Ring'),(553,28,'SL3G6C12B','Storage Ring'),(554,31,'CL2G6C12B','Storage Ring'),(555,21,'QL2G6C12B','Storage Ring'),(556,27,'SL2G6C12B','Storage Ring'),(557,31,'CL1G6C12B','Storage Ring'),(558,22,'QL1G6C12B','Storage Ring'),(559,27,'SL1G6C12B','Storage Ring'),(560,33,'FL1G1C13A','Storage Ring'),(561,33,'FL2G1C13A','Storage Ring'),(562,27,'SL1G2C13A','Storage Ring'),(563,22,'QL1G2C13A','Storage Ring'),(564,31,'CL1G2C13A','Storage Ring'),(565,27,'SL2G2C13A','Storage Ring'),(566,20,'QL2G2C13A','Storage Ring'),(567,31,'CL2G2C13A','Storage Ring'),(568,27,'SL3G2C13A','Storage Ring'),(569,22,'QL3G2C13A','Storage Ring'),(570,17,'B1G3C13A','Storage Ring'),(571,32,'SQMG4C13A','Storage Ring'),(572,19,'QM1G4C13A','Storage Ring'),(573,28,'SM1G4C13A','Storage Ring'),(574,33,'FM1G4C13A','Storage Ring'),(575,26,'QM2G4C13A','Storage Ring'),(576,29,'SM2G4C13B','Storage Ring'),(577,26,'QM2G4C13B','Storage Ring'),(578,27,'SM1G4C13B','Storage Ring'),(579,18,'QM1G4C13B','Storage Ring'),(580,30,'CM1G4C13B','Storage Ring'),(581,17,'B1G5C13B','Storage Ring'),(582,30,'CH2G6C13B','Storage Ring'),(583,28,'SH4G6C13B','Storage Ring'),(584,24,'QH3G6C13B','Storage Ring'),(585,28,'SH3G6C13B','Storage Ring'),(586,21,'QH2G6C13B','Storage Ring'),(587,31,'CH1G6C13B','Storage Ring'),(588,22,'QH1G6C13B','Storage Ring'),(589,27,'SH1G6C13B','Storage Ring'),(590,33,'FH1G1C14A','Storage Ring'),(591,33,'FH2G1C14A','Storage Ring'),(592,27,'SH1G2C14A','Storage Ring'),(593,22,'QH1G2C14A','Storage Ring'),(594,32,'SQHG2C14A','Storage Ring'),(595,20,'QH2G2C14A','Storage Ring'),(596,27,'SH3G2C14A','Storage Ring'),(597,22,'QH3G2C14A','Storage Ring'),(598,27,'SH4G2C14A','Storage Ring'),(599,30,'CH2G2C14A','Storage Ring'),(600,16,'B1G3C14A','Storage Ring'),(601,31,'CM1G4C14A','Storage Ring'),(602,19,'QM1G4C14A','Storage Ring'),(603,28,'SM1G4C14A','Storage Ring'),(604,33,'FM1G4C14A','Storage Ring'),(605,26,'QM2G4C14A','Storage Ring'),(606,29,'SM2G4C14B','Storage Ring'),(607,26,'QM2G4C14B','Storage Ring'),(608,27,'SM1G4C14B','Storage Ring'),(609,18,'QM1G4C14B','Storage Ring'),(610,30,'CM1G4C14B','Storage Ring'),(611,16,'B1G5C14B','Storage Ring'),(612,24,'QL3G6C14B','Storage Ring'),(613,28,'SL3G6C14B','Storage Ring'),(614,31,'CL2G6C14B','Storage Ring'),(615,21,'QL2G6C14B','Storage Ring'),(616,27,'SL2G6C14B','Storage Ring'),(617,31,'CL1G6C14B','Storage Ring'),(618,22,'QL1G6C14B','Storage Ring'),(619,27,'SL1G6C14B','Storage Ring'),(620,33,'FL1G1C15A','Storage Ring'),(621,33,'FL2G1C15A','Storage Ring'),(622,27,'SL1G2C15A','Storage Ring'),(623,22,'QL1G2C15A','Storage Ring'),(624,31,'CL1G2C15A','Storage Ring'),(625,27,'SL2G2C15A','Storage Ring'),(626,20,'QL2G2C15A','Storage Ring'),(627,31,'CL2G2C15A','Storage Ring'),(628,27,'SL3G2C15A','Storage Ring'),(629,22,'QL3G2C15A','Storage Ring'),(630,16,'B1G3C15A','Storage Ring'),(631,32,'SQMG4C15A','Storage Ring'),(632,19,'QM1G4C15A','Storage Ring'),(633,28,'SM1G4C15A','Storage Ring'),(634,33,'FM1G4C15A','Storage Ring'),(635,26,'QM2G4C15A','Storage Ring'),(636,29,'SM2G4C15B','Storage Ring'),(637,26,'QM2G4C15B','Storage Ring'),(638,27,'SM1G4C15B','Storage Ring'),(639,18,'QM1G4C15B','Storage Ring'),(640,30,'CM1G4C15B','Storage Ring'),(641,16,'B1G5C15B','Storage Ring'),(642,30,'CH2G6C15B','Storage Ring'),(643,28,'SH4G6C15B','Storage Ring'),(644,24,'QH3G6C15B','Storage Ring'),(645,28,'SH3G6C15B','Storage Ring'),(646,21,'QH2G6C15B','Storage Ring'),(647,31,'CH1G6C15B','Storage Ring'),(648,22,'QH1G6C15B','Storage Ring'),(649,27,'SH1G6C15B','Storage Ring'),(650,33,'FH1G1C16A','Storage Ring'),(651,33,'FH2G1C16A','Storage Ring'),(652,27,'SH1G2C16A','Storage Ring'),(653,22,'QH1G2C16A','Storage Ring'),(654,32,'SQHG2C16A','Storage Ring'),(655,20,'QH2G2C16A','Storage Ring'),(656,27,'SH3G2C16A','Storage Ring'),(657,22,'QH3G2C16A','Storage Ring'),(658,27,'SH4G2C16A','Storage Ring'),(659,30,'CH2G2C16A','Storage Ring'),(660,16,'B1G3C16A','Storage Ring'),(661,31,'CM1G4C16A','Storage Ring'),(662,19,'QM1G4C16A','Storage Ring'),(663,28,'SM1G4C16A','Storage Ring'),(664,33,'FM1G4C16A','Storage Ring'),(665,26,'QM2G4C16A','Storage Ring'),(666,29,'SM2G4C16B','Storage Ring'),(667,26,'QM2G4C16B','Storage Ring'),(668,27,'SM1G4C16B','Storage Ring'),(669,18,'QM1G4C16B','Storage Ring'),(670,30,'CM1G4C16B','Storage Ring'),(671,16,'B1G5C16B','Storage Ring'),(672,24,'QL3G6C16B','Storage Ring'),(673,28,'SL3G6C16B','Storage Ring'),(674,31,'CL2G6C16B','Storage Ring'),(675,21,'QL2G6C16B','Storage Ring'),(676,27,'SL2G6C16B','Storage Ring'),(677,31,'CL1G6C16B','Storage Ring'),(678,22,'QL1G6C16B','Storage Ring'),(679,27,'SL1G6C16B','Storage Ring'),(680,33,'FL1G1C17A','Storage Ring'),(681,33,'FL2G1C17A','Storage Ring'),(682,27,'SL1G2C17A','Storage Ring'),(683,22,'QL1G2C17A','Storage Ring'),(684,31,'CL1G2C17A','Storage Ring'),(685,27,'SL2G2C17A','Storage Ring'),(686,20,'QL2G2C17A','Storage Ring'),(687,31,'CL2G2C17A','Storage Ring'),(688,27,'SL3G2C17A','Storage Ring'),(689,22,'QL3G2C17A','Storage Ring'),(690,16,'B1G3C17A','Storage Ring'),(691,32,'SQMG4C17A','Storage Ring'),(692,19,'QM1G4C17A','Storage Ring'),(693,28,'SM1G4C17A','Storage Ring'),(694,33,'FM1G4C17A','Storage Ring'),(695,26,'QM2G4C17A','Storage Ring'),(696,29,'SM2G4C17B','Storage Ring'),(697,26,'QM2G4C17B','Storage Ring'),(698,27,'SM1G4C17B','Storage Ring'),(699,18,'QM1G4C17B','Storage Ring'),(700,30,'CM1G4C17B','Storage Ring'),(701,16,'B1G5C17B','Storage Ring'),(702,30,'CH2G6C17B','Storage Ring'),(703,28,'SH4G6C17B','Storage Ring'),(704,25,'QH3G6C17B','Storage Ring'),(705,28,'SH3G6C17B','Storage Ring'),(706,21,'QH2G6C17B','Storage Ring'),(707,31,'CH1G6C17B','Storage Ring'),(708,22,'QH1G6C17B','Storage Ring'),(709,27,'SH1G6C17B','Storage Ring'),(710,33,'FH1G1C18A','Storage Ring'),(711,33,'FH2G1C18A','Storage Ring'),(712,27,'SH1G2C18A','Storage Ring'),(713,22,'QH1G2C18A','Storage Ring'),(714,32,'SQHG2C18A','Storage Ring'),(715,20,'QH2G2C18A','Storage Ring'),(716,27,'SH3G2C18A','Storage Ring'),(717,23,'QH3G2C18A','Storage Ring'),(718,27,'SH4G2C18A','Storage Ring'),(719,30,'CH2G2C18A','Storage Ring'),(720,16,'B1G3C18A','Storage Ring'),(721,31,'CM1G4C18A','Storage Ring'),(722,19,'QM1G4C18A','Storage Ring'),(723,28,'SM1G4C18A','Storage Ring'),(724,33,'FM1G4C18A','Storage Ring'),(725,26,'QM2G4C18A','Storage Ring'),(726,29,'SM2G4C18B','Storage Ring'),(727,26,'QM2G4C18B','Storage Ring'),(728,27,'SM1G4C18B','Storage Ring'),(729,18,'QM1G4C18B','Storage Ring'),(730,30,'CM1G4C18B','Storage Ring'),(731,16,'B1G5C18B','Storage Ring'),(732,24,'QL3G6C18B','Storage Ring'),(733,28,'SL3G6C18B','Storage Ring'),(734,31,'CL2G6C18B','Storage Ring'),(735,21,'QL2G6C18B','Storage Ring'),(736,27,'SL2G6C18B','Storage Ring'),(737,31,'CL1G6C18B','Storage Ring'),(738,22,'QL1G6C18B','Storage Ring'),(739,27,'SL1G6C18B','Storage Ring'),(740,33,'FL1G1C19A','Storage Ring'),(741,33,'FL2G1C19A','Storage Ring'),(742,27,'SL1G2C19A','Storage Ring'),(743,22,'QL1G2C19A','Storage Ring'),(744,31,'CL1G2C19A','Storage Ring'),(745,27,'SL2G2C19A','Storage Ring'),(746,20,'QL2G2C19A','Storage Ring'),(747,31,'CL2G2C19A','Storage Ring'),(748,27,'SL3G2C19A','Storage Ring'),(749,22,'QL3G2C19A','Storage Ring'),(750,16,'B1G3C19A','Storage Ring'),(751,32,'SQMG4C19A','Storage Ring'),(752,19,'QM1G4C19A','Storage Ring'),(753,28,'SM1G4C19A','Storage Ring'),(754,33,'FM1G4C19A','Storage Ring'),(755,26,'QM2G4C19A','Storage Ring'),(756,29,'SM2G4C19B','Storage Ring'),(757,26,'QM2G4C19B','Storage Ring'),(758,27,'SM1G4C19B','Storage Ring'),(759,18,'QM1G4C19B','Storage Ring'),(760,30,'CM1G4C19B','Storage Ring'),(761,16,'B1G5C19B','Storage Ring'),(762,30,'CH2G6C19B','Storage Ring'),(763,28,'SH4G6C19B','Storage Ring'),(764,24,'QH3G6C19B','Storage Ring'),(765,28,'SH3G6C19B','Storage Ring'),(766,21,'QH2G6C19B','Storage Ring'),(767,31,'CH1G6C19B','Storage Ring'),(768,22,'QH1G6C19B','Storage Ring'),(769,27,'SH1G6C19B','Storage Ring'),(770,33,'FH1G1C20A','Storage Ring'),(771,33,'FH2G1C20A','Storage Ring'),(772,27,'SH1G2C20A','Storage Ring'),(773,22,'QH1G2C20A','Storage Ring'),(774,32,'SQHG2C20A','Storage Ring'),(775,20,'QH2G2C20A','Storage Ring'),(776,27,'SH3G2C20A','Storage Ring'),(777,22,'QH3G2C20A','Storage Ring'),(778,27,'SH4G2C20A','Storage Ring'),(779,30,'CH2G2C20A','Storage Ring'),(780,16,'B1G3C20A','Storage Ring'),(781,31,'CM1G4C20A','Storage Ring'),(782,19,'QM1G4C20A','Storage Ring'),(783,28,'SM1G4C20A','Storage Ring'),(784,33,'FM1G4C20A','Storage Ring'),(785,26,'QM2G4C20A','Storage Ring'),(786,29,'SM2G4C20B','Storage Ring'),(787,26,'QM2G4C20B','Storage Ring'),(788,27,'SM1G4C20B','Storage Ring'),(789,18,'QM1G4C20B','Storage Ring'),(790,30,'CM1G4C20B','Storage Ring'),(791,16,'B1G5C20B','Storage Ring'),(792,24,'QL3G6C20B','Storage Ring'),(793,28,'SL3G6C20B','Storage Ring'),(794,31,'CL2G6C20B','Storage Ring'),(795,21,'QL2G6C20B','Storage Ring'),(796,27,'SL2G6C20B','Storage Ring'),(797,31,'CL1G6C20B','Storage Ring'),(798,22,'QL1G6C20B','Storage Ring'),(799,27,'SL1G6C20B','Storage Ring'),(800,33,'FL1G1C21A','Storage Ring'),(801,33,'FL2G1C21A','Storage Ring'),(802,27,'SL1G2C21A','Storage Ring'),(803,22,'QL1G2C21A','Storage Ring'),(804,31,'CL1G2C21A','Storage Ring'),(805,27,'SL2G2C21A','Storage Ring'),(806,20,'QL2G2C21A','Storage Ring'),(807,31,'CL2G2C21A','Storage Ring'),(808,27,'SL3G2C21A','Storage Ring'),(809,22,'QL3G2C21A','Storage Ring'),(810,16,'B1G3C21A','Storage Ring'),(811,32,'SQMG4C21A','Storage Ring'),(812,19,'QM1G4C21A','Storage Ring'),(813,28,'SM1G4C21A','Storage Ring'),(814,33,'FM1G4C21A','Storage Ring'),(815,26,'QM2G4C21A','Storage Ring'),(816,29,'SM2G4C21B','Storage Ring'),(817,26,'QM2G4C21B','Storage Ring'),(818,27,'SM1G4C21B','Storage Ring'),(819,18,'QM1G4C21B','Storage Ring'),(820,30,'CM1G4C21B','Storage Ring'),(821,16,'B1G5C21B','Storage Ring'),(822,30,'CH2G6C21B','Storage Ring'),(823,28,'SH4G6C21B','Storage Ring'),(824,24,'QH3G6C21B','Storage Ring'),(825,28,'SH3G6C21B','Storage Ring'),(826,21,'QH2G6C21B','Storage Ring'),(827,31,'CH1G6C21B','Storage Ring'),(828,22,'QH1G6C21B','Storage Ring'),(829,27,'SH1G6C21B','Storage Ring'),(830,33,'FH1G1C22A','Storage Ring'),(831,33,'FH2G1C22A','Storage Ring'),(832,27,'SH1G2C22A','Storage Ring'),(833,22,'QH1G2C22A','Storage Ring'),(834,32,'SQHG2C22A','Storage Ring'),(835,20,'QH2G2C22A','Storage Ring'),(836,27,'SH3G2C22A','Storage Ring'),(837,22,'QH3G2C22A','Storage Ring'),(838,27,'SH4G2C22A','Storage Ring'),(839,30,'CH2G2C22A','Storage Ring'),(840,16,'B1G3C22A','Storage Ring'),(841,31,'CM1G4C22A','Storage Ring'),(842,19,'QM1G4C22A','Storage Ring'),(843,28,'SM1G4C22A','Storage Ring'),(844,33,'FM1G4C22A','Storage Ring'),(845,26,'QM2G4C22A','Storage Ring'),(846,29,'SM2G4C22B','Storage Ring'),(847,26,'QM2G4C22B','Storage Ring'),(848,27,'SM1G4C22B','Storage Ring'),(849,18,'QM1G4C22B','Storage Ring'),(850,30,'CM1G4C22B','Storage Ring'),(851,16,'B1G5C22B','Storage Ring'),(852,24,'QL3G6C22B','Storage Ring'),(853,28,'SL3G6C22B','Storage Ring'),(854,31,'CL2G6C22B','Storage Ring'),(855,21,'QL2G6C22B','Storage Ring'),(856,27,'SL2G6C22B','Storage Ring'),(857,31,'CL1G6C22B','Storage Ring'),(858,22,'QL1G6C22B','Storage Ring'),(859,27,'SL1G6C22B','Storage Ring'),(860,33,'FL1G1C23A','Storage Ring'),(861,33,'FL2G1C23A','Storage Ring'),(862,27,'SL1G2C23A','Storage Ring'),(863,22,'QL1G2C23A','Storage Ring'),(864,31,'CL1G2C23A','Storage Ring'),(865,27,'SL2G2C23A','Storage Ring'),(866,20,'QL2G2C23A','Storage Ring'),(867,31,'CL2G2C23A','Storage Ring'),(868,27,'SL3G2C23A','Storage Ring'),(869,22,'QL3G2C23A','Storage Ring'),(870,17,'B1G3C23A','Storage Ring'),(871,32,'SQMG4C23A','Storage Ring'),(872,19,'QM1G4C23A','Storage Ring'),(873,28,'SM1G4C23A','Storage Ring'),(874,33,'FM1G4C23A','Storage Ring'),(875,26,'QM2G4C23A','Storage Ring'),(876,29,'SM2G4C23B','Storage Ring'),(877,26,'QM2G4C23B','Storage Ring'),(878,27,'SM1G4C23B','Storage Ring'),(879,18,'QM1G4C23B','Storage Ring'),(880,30,'CM1G4C23B','Storage Ring'),(881,17,'B1G5C23B','Storage Ring'),(882,30,'CH2G6C23B','Storage Ring'),(883,28,'SH4G6C23B','Storage Ring'),(884,24,'QH3G6C23B','Storage Ring'),(885,28,'SH3G6C23B','Storage Ring'),(886,21,'QH2G6C23B','Storage Ring'),(887,31,'CH1G6C23B','Storage Ring'),(888,22,'QH1G6C23B','Storage Ring'),(889,27,'SH1G6C23B','Storage Ring'),(890,33,'FH1G1C24A','Storage Ring'),(891,33,'FH2G1C24A','Storage Ring'),(892,27,'SH1G2C24A','Storage Ring'),(893,22,'QH1G2C24A','Storage Ring'),(894,32,'SQHG2C24A','Storage Ring'),(895,20,'QH2G2C24A','Storage Ring'),(896,27,'SH3G2C24A','Storage Ring'),(897,22,'QH3G2C24A','Storage Ring'),(898,27,'SH4G2C24A','Storage Ring'),(899,30,'CH2G2C24A','Storage Ring'),(900,16,'B1G3C24A','Storage Ring'),(901,31,'CM1G4C24A','Storage Ring'),(902,19,'QM1G4C24A','Storage Ring'),(903,28,'SM1G4C24A','Storage Ring'),(904,33,'FM1G4C24A','Storage Ring'),(905,26,'QM2G4C24A','Storage Ring'),(906,29,'SM2G4C24B','Storage Ring'),(907,26,'QM2G4C24B','Storage Ring'),(908,27,'SM1G4C24B','Storage Ring'),(909,18,'QM1G4C24B','Storage Ring'),(910,30,'CM1G4C24B','Storage Ring'),(911,16,'B1G5C24B','Storage Ring'),(912,24,'QL3G6C24B','Storage Ring'),(913,28,'SL3G6C24B','Storage Ring'),(914,31,'CL2G6C24B','Storage Ring'),(915,21,'QL2G6C24B','Storage Ring'),(916,27,'SL2G6C24B','Storage Ring'),(917,31,'CL1G6C24B','Storage Ring'),(918,22,'QL1G6C24B','Storage Ring'),(919,27,'SL1G6C24B','Storage Ring'),(920,33,'FL1G1C25A','Storage Ring'),(921,33,'FL2G1C25A','Storage Ring'),(922,27,'SL1G2C25A','Storage Ring'),(923,22,'QL1G2C25A','Storage Ring'),(924,31,'CL1G2C25A','Storage Ring'),(925,27,'SL2G2C25A','Storage Ring'),(926,20,'QL2G2C25A','Storage Ring'),(927,31,'CL2G2C25A','Storage Ring'),(928,27,'SL3G2C25A','Storage Ring'),(929,22,'QL3G2C25A','Storage Ring'),(930,16,'B1G3C25A','Storage Ring'),(931,32,'SQMG4C25A','Storage Ring'),(932,19,'QM1G4C25A','Storage Ring'),(933,28,'SM1G4C25A','Storage Ring'),(934,33,'FM1G4C25A','Storage Ring'),(935,26,'QM2G4C25A','Storage Ring'),(936,29,'SM2G4C25B','Storage Ring'),(937,26,'QM2G4C25B','Storage Ring'),(938,27,'SM1G4C25B','Storage Ring'),(939,18,'QM1G4C25B','Storage Ring'),(940,30,'CM1G4C25B','Storage Ring'),(941,16,'B1G5C25B','Storage Ring'),(942,30,'CH2G6C25B','Storage Ring'),(943,28,'SH4G6C25B','Storage Ring'),(944,24,'QH3G6C25B','Storage Ring'),(945,28,'SH3G6C25B','Storage Ring'),(946,21,'QH2G6C25B','Storage Ring'),(947,31,'CH1G6C25B','Storage Ring'),(948,22,'QH1G6C25B','Storage Ring'),(949,27,'SH1G6C25B','Storage Ring'),(950,33,'FH1G1C26A','Storage Ring'),(951,33,'FH2G1C26A','Storage Ring'),(952,27,'SH1G2C26A','Storage Ring'),(953,22,'QH1G2C26A','Storage Ring'),(954,32,'SQHG2C26A','Storage Ring'),(955,20,'QH2G2C26A','Storage Ring'),(956,27,'SH3G2C26A','Storage Ring'),(957,22,'QH3G2C26A','Storage Ring'),(958,27,'SH4G2C26A','Storage Ring'),(959,30,'CH2G2C26A','Storage Ring'),(960,16,'B1G3C26A','Storage Ring'),(961,31,'CM1G4C26A','Storage Ring'),(962,19,'QM1G4C26A','Storage Ring'),(963,28,'SM1G4C26A','Storage Ring'),(964,33,'FM1G4C26A','Storage Ring'),(965,26,'QM2G4C26A','Storage Ring'),(966,29,'SM2G4C26B','Storage Ring'),(967,26,'QM2G4C26B','Storage Ring'),(968,27,'SM1G4C26B','Storage Ring'),(969,18,'QM1G4C26B','Storage Ring'),(970,30,'CM1G4C26B','Storage Ring'),(971,16,'B1G5C26B','Storage Ring'),(972,24,'QL3G6C26B','Storage Ring'),(973,28,'SL3G6C26B','Storage Ring'),(974,31,'CL2G6C26B','Storage Ring'),(975,21,'QL2G6C26B','Storage Ring'),(976,27,'SL2G6C26B','Storage Ring'),(977,31,'CL1G6C26B','Storage Ring'),(978,22,'QL1G6C26B','Storage Ring'),(979,27,'SL1G6C26B','Storage Ring'),(980,33,'FL1G1C27A','Storage Ring'),(981,33,'FL2G1C27A','Storage Ring'),(982,27,'SL1G2C27A','Storage Ring'),(983,22,'QL1G2C27A','Storage Ring'),(984,31,'CL1G2C27A','Storage Ring'),(985,27,'SL2G2C27A','Storage Ring'),(986,20,'QL2G2C27A','Storage Ring'),(987,31,'CL2G2C27A','Storage Ring'),(988,27,'SL3G2C27A','Storage Ring'),(989,22,'QL3G2C27A','Storage Ring'),(990,16,'B1G3C27A','Storage Ring'),(991,32,'SQMG4C27A','Storage Ring'),(992,19,'QM1G4C27A','Storage Ring'),(993,28,'SM1G4C27A','Storage Ring'),(994,33,'FM1G4C27A','Storage Ring'),(995,26,'QM2G4C27A','Storage Ring'),(996,29,'SM2G4C27B','Storage Ring'),(997,26,'QM2G4C27B','Storage Ring'),(998,27,'SM1G4C27B','Storage Ring'),(999,18,'QM1G4C27B','Storage Ring'),(1000,30,'CM1G4C27B','Storage Ring'),(1001,16,'B1G5C27B','Storage Ring'),(1002,30,'CH2G6C27B','Storage Ring'),(1003,28,'SH4G6C27B','Storage Ring'),(1004,25,'QH3G6C27B','Storage Ring'),(1005,28,'SH3G6C27B','Storage Ring'),(1006,21,'QH2G6C27B','Storage Ring'),(1007,31,'CH1G6C27B','Storage Ring'),(1008,22,'QH1G6C27B','Storage Ring'),(1009,27,'SH1G6C27B','Storage Ring'),(1010,33,'FH1G1C28A','Storage Ring'),(1011,33,'FH2G1C28A','Storage Ring'),(1012,27,'SH1G2C28A','Storage Ring'),(1013,22,'QH1G2C28A','Storage Ring'),(1014,32,'SQHG2C28A','Storage Ring'),(1015,20,'QH2G2C28A','Storage Ring'),(1016,27,'SH3G2C28A','Storage Ring'),(1017,23,'QH3G2C28A','Storage Ring'),(1018,27,'SH4G2C28A','Storage Ring'),(1019,30,'CH2G2C28A','Storage Ring'),(1020,16,'B1G3C28A','Storage Ring'),(1021,31,'CM1G4C28A','Storage Ring'),(1022,19,'QM1G4C28A','Storage Ring'),(1023,28,'SM1G4C28A','Storage Ring'),(1024,33,'FM1G4C28A','Storage Ring'),(1025,26,'QM2G4C28A','Storage Ring'),(1026,29,'SM2G4C28B','Storage Ring'),(1027,26,'QM2G4C28B','Storage Ring'),(1028,27,'SM1G4C28B','Storage Ring'),(1029,18,'QM1G4C28B','Storage Ring'),(1030,30,'CM1G4C28B','Storage Ring'),(1031,16,'B1G5C28B','Storage Ring'),(1032,24,'QL3G6C28B','Storage Ring'),(1033,28,'SL3G6C28B','Storage Ring'),(1034,31,'CL2G6C28B','Storage Ring'),(1035,21,'QL2G6C28B','Storage Ring'),(1036,27,'SL2G6C28B','Storage Ring'),(1037,31,'CL1G6C28B','Storage Ring'),(1038,22,'QL1G6C28B','Storage Ring'),(1039,27,'SL1G6C28B','Storage Ring'),(1040,33,'FL1G1C29A','Storage Ring'),(1041,33,'FL2G1C29A','Storage Ring'),(1042,27,'SL1G2C29A','Storage Ring'),(1043,22,'QL1G2C29A','Storage Ring'),(1044,31,'CL1G2C29A','Storage Ring'),(1045,27,'SL2G2C29A','Storage Ring'),(1046,20,'QL2G2C29A','Storage Ring'),(1047,31,'CL2G2C29A','Storage Ring'),(1048,27,'SL3G2C29A','Storage Ring'),(1049,22,'QL3G2C29A','Storage Ring'),(1050,16,'B1G3C29A','Storage Ring'),(1051,32,'SQMG4C29A','Storage Ring'),(1052,19,'QM1G4C29A','Storage Ring'),(1053,28,'SM1G4C29A','Storage Ring'),(1054,33,'FM1G4C29A','Storage Ring'),(1055,26,'QM2G4C29A','Storage Ring'),(1056,29,'SM2G4C29B','Storage Ring'),(1057,26,'QM2G4C29B','Storage Ring'),(1058,27,'SM1G4C29B','Storage Ring'),(1059,18,'QM1G4C29B','Storage Ring'),(1060,30,'CM1G4C29B','Storage Ring'),(1061,16,'B1G5C29B','Storage Ring'),(1062,30,'CH2G6C29B','Storage Ring'),(1063,28,'SH4G6C29B','Storage Ring'),(1064,24,'QH3G6C29B','Storage Ring'),(1065,28,'SH3G6C29B','Storage Ring'),(1066,21,'QH2G6C29B','Storage Ring'),(1067,31,'CH1G6C29B','Storage Ring'),(1068,22,'QH1G6C29B','Storage Ring'),(1069,27,'SH1G6C29B','Storage Ring');
/*!40000 ALTER TABLE `install` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `install_partition_type`
--

DROP TABLE IF EXISTS `install_partition_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `install_partition_type` (
  `install_partition_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `install_id` int(11) DEFAULT NULL,
  `partition_type_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`install_partition_type_id`),
  KEY `Ref_150` (`install_id`),
  KEY `Ref_152` (`partition_type_id`),
  CONSTRAINT `Ref_150` FOREIGN KEY (`install_id`) REFERENCES `install` (`install_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_152` FOREIGN KEY (`partition_type_id`) REFERENCES `partition_type` (`partition_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `install_partition_type`
--

LOCK TABLES `install_partition_type` WRITE;
/*!40000 ALTER TABLE `install_partition_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `install_partition_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `install_rel`
--

DROP TABLE IF EXISTS `install_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `install_rel` (
  `install_rel_id` int(11) NOT NULL AUTO_INCREMENT,
  `install_rel_type_id` int(11) DEFAULT NULL,
  `parent_install_id` int(11) NOT NULL DEFAULT '0',
  `child_install_id` int(11) NOT NULL DEFAULT '0',
  `logical_desc` varchar(60) DEFAULT NULL,
  `logical_order` int(11) DEFAULT NULL,
  `install_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`install_rel_id`),
  KEY `idx_cmpnt_rel_type_id` (`install_rel_type_id`),
  KEY `Ref_100` (`parent_install_id`),
  KEY `Ref_101` (`child_install_id`),
  CONSTRAINT `cmpnt_rel_ibfk_3` FOREIGN KEY (`install_rel_type_id`) REFERENCES `install_rel_type` (`install_rel_type_id`),
  CONSTRAINT `Ref_100` FOREIGN KEY (`parent_install_id`) REFERENCES `install` (`install_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_101` FOREIGN KEY (`child_install_id`) REFERENCES `install` (`install_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `install_rel`
--

LOCK TABLES `install_rel` WRITE;
/*!40000 ALTER TABLE `install_rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `install_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `install_rel_prop`
--

DROP TABLE IF EXISTS `install_rel_prop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `install_rel_prop` (
  `install_rel__prop_id` int(11) NOT NULL AUTO_INCREMENT,
  `install_rel_id` int(11) DEFAULT NULL,
  `install_rel_prop_type_id` int(11) DEFAULT NULL,
  `install_rel_prop_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`install_rel__prop_id`),
  KEY `Ref_184` (`install_rel_id`),
  KEY `Ref_208` (`install_rel_prop_type_id`),
  CONSTRAINT `Ref_184` FOREIGN KEY (`install_rel_id`) REFERENCES `install_rel` (`install_rel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_208` FOREIGN KEY (`install_rel_prop_type_id`) REFERENCES `install_rel_prop_type` (`install_rel_prop_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `install_rel_prop`
--

LOCK TABLES `install_rel_prop` WRITE;
/*!40000 ALTER TABLE `install_rel_prop` DISABLE KEYS */;
/*!40000 ALTER TABLE `install_rel_prop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `install_rel_prop_type`
--

DROP TABLE IF EXISTS `install_rel_prop_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `install_rel_prop_type` (
  `install_rel_prop_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `install_rel_prop_type_name` varchar(50) DEFAULT NULL,
  `install_rel_prop_type_desc` varchar(50) DEFAULT NULL,
  `install_rel_prop_type_units` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`install_rel_prop_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 PACK_KEYS=1 CHECKSUM=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `install_rel_prop_type`
--

LOCK TABLES `install_rel_prop_type` WRITE;
/*!40000 ALTER TABLE `install_rel_prop_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `install_rel_prop_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `install_rel_type`
--

DROP TABLE IF EXISTS `install_rel_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `install_rel_type` (
  `install_rel_type_id` int(11) NOT NULL,
  `rel_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`install_rel_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `install_rel_type`
--

LOCK TABLES `install_rel_type` WRITE;
/*!40000 ALTER TABLE `install_rel_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `install_rel_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interface`
--

DROP TABLE IF EXISTS `interface`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interface` (
  `interface_id` int(11) NOT NULL AUTO_INCREMENT,
  `install_rel_type_id` int(11) NOT NULL,
  `interface` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`interface_id`),
  UNIQUE KEY `idx_interface_cmpnt_rel_type` (`install_rel_type_id`,`interface`),
  KEY `idx_cmpnt_rel_type_id` (`install_rel_type_id`),
  CONSTRAINT `cmpntreltype__interface_ibfk_1` FOREIGN KEY (`install_rel_type_id`) REFERENCES `install_rel_type` (`install_rel_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interface`
--

LOCK TABLES `interface` WRITE;
/*!40000 ALTER TABLE `interface` DISABLE KEYS */;
/*!40000 ALTER TABLE `interface` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory` (
  `inventory_id` int(11) NOT NULL AUTO_INCREMENT,
  `cmpnt_type_id` int(11) NOT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`inventory_id`),
  KEY `idx_cmpnt_type_id_c` (`cmpnt_type_id`),
  KEY `Ref_244` (`vendor_id`),
  CONSTRAINT `cmpnt_ibfk_1` FOREIGN KEY (`cmpnt_type_id`) REFERENCES `cmpnt_type` (`cmpnt_type_id`),
  CONSTRAINT `Ref_244` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=801 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,1,1,'44'),(2,1,1,'43'),(3,1,1,'45'),(4,1,1,'53'),(5,1,1,'55'),(6,1,1,'60'),(7,1,1,'62'),(8,1,1,'50'),(9,1,1,'51'),(10,1,1,'59'),(11,1,1,'46'),(12,1,1,'48'),(13,1,1,'49'),(14,1,1,'4'),(15,1,1,'5'),(16,1,1,'47'),(17,1,1,'58'),(18,1,1,'57'),(19,1,1,'56'),(20,2,1,'1'),(21,2,1,'2'),(22,2,1,'3'),(23,2,1,'4'),(24,2,1,'5'),(25,2,1,'6'),(26,2,1,'7'),(27,2,1,'8'),(28,2,1,'9'),(29,3,2,'3'),(30,3,2,'2'),(31,3,2,'1'),(32,3,2,'4'),(33,4,2,'2'),(34,4,2,'1'),(35,5,2,'1'),(36,5,2,'2'),(37,5,2,'6'),(38,5,2,'5'),(39,5,2,'4'),(40,5,2,'9'),(41,5,2,'13'),(42,5,2,'8'),(43,5,2,'10'),(44,5,2,'11'),(45,5,2,'12'),(46,5,2,'14'),(47,5,2,'15'),(48,5,2,'7'),(49,5,2,'3'),(50,6,3,'24'),(51,6,3,'4'),(52,6,3,'5'),(53,6,3,'6'),(54,6,3,'25'),(55,6,3,'11'),(56,6,3,'12'),(57,6,3,'22'),(58,6,3,'2'),(59,6,3,'16'),(60,6,3,'10'),(61,6,3,'18'),(62,6,3,'15'),(63,6,3,'23'),(64,6,3,'33'),(65,6,3,'28'),(66,7,3,'32'),(67,7,3,'26'),(68,7,3,'17'),(69,7,3,'8'),(70,7,3,'29'),(71,7,3,'34'),(72,7,3,'3'),(73,7,3,'21'),(74,7,3,'31'),(75,7,3,'7'),(76,7,3,'14'),(77,7,3,'13'),(78,7,3,'19'),(79,7,3,'9'),(80,7,3,'30'),(81,7,3,'20'),(82,8,3,'26'),(83,8,3,'6'),(84,8,3,'9'),(85,8,3,'12'),(86,8,3,'25'),(87,8,3,'8'),(88,8,3,'13'),(89,8,3,'16'),(90,8,3,'18'),(91,8,3,'7'),(92,8,3,'24'),(93,8,3,'10'),(94,8,3,'4'),(95,8,3,'2'),(96,8,3,'29'),(97,8,3,'15'),(98,8,3,'14'),(99,8,3,'20'),(100,8,3,'21'),(101,8,3,'11'),(102,8,3,'3'),(103,8,3,'22'),(104,8,3,'5'),(105,8,3,'19'),(106,8,3,'17'),(107,8,3,'27'),(108,8,3,'30'),(109,8,3,'23'),(110,9,3,'1'),(111,9,3,'2'),(112,9,3,'3'),(113,9,3,'4'),(114,9,3,'5'),(115,9,3,'6'),(116,9,3,'7'),(117,9,3,'8'),(118,10,3,'1'),(119,10,3,'2'),(120,10,3,'3'),(121,10,3,'4'),(122,10,3,'5'),(123,10,3,'6'),(124,10,3,'7'),(125,10,3,'8'),(126,11,3,'1'),(127,11,3,'2'),(128,11,3,'3'),(129,11,3,'4'),(130,11,3,'5'),(131,11,3,'6'),(132,11,3,'7'),(133,11,3,'8'),(134,12,3,'1'),(135,12,3,'2'),(136,12,3,'3'),(137,12,3,'4'),(138,12,3,'5'),(139,12,3,'6'),(140,12,3,'7'),(141,12,3,'8'),(142,13,3,'1'),(143,13,3,'2'),(144,13,3,'3'),(145,13,3,'4'),(146,13,3,'5'),(147,13,3,'6'),(148,13,3,'7'),(149,13,3,'8'),(150,14,2,'2'),(151,14,2,'1'),(152,14,2,'3'),(153,14,2,'4'),(154,15,2,'1'),(155,15,2,'2'),(156,15,2,'3'),(157,15,2,'4'),(158,15,2,'5'),(159,15,2,'6'),(160,15,2,'7'),(161,15,2,'10'),(162,15,2,'11'),(163,15,2,'12'),(164,15,2,'13'),(165,15,2,'14'),(166,15,2,'15'),(167,15,2,'16'),(168,15,2,'8'),(169,15,2,'9'),(170,31,4,'1'),(171,31,4,'2'),(172,31,4,'3'),(173,31,4,'4'),(174,31,4,'6'),(175,31,4,'9'),(176,31,4,'12'),(177,31,4,'13'),(178,31,4,'31'),(179,32,4,'1'),(180,32,4,'2'),(181,32,4,'3'),(182,32,4,'4'),(183,32,4,'5'),(184,32,4,'6'),(185,32,4,'7'),(186,32,4,'8'),(187,32,4,'9'),(188,32,4,'10'),(189,32,4,'11'),(190,32,4,'12'),(191,32,4,'13'),(192,32,4,'14'),(193,32,4,'15'),(194,32,4,'16'),(195,32,4,'17'),(196,32,4,'18'),(197,32,4,'19'),(198,32,4,'20'),(199,32,4,'21'),(200,32,4,'22'),(201,32,4,'23'),(202,32,4,'24'),(203,32,4,'25'),(204,32,4,'26'),(205,32,4,'27'),(206,32,4,'28'),(207,32,4,'29'),(208,32,4,'30'),(209,30,4,'3'),(210,18,3,'1'),(211,18,3,'2'),(212,18,3,'3'),(213,18,3,'4'),(214,18,3,'5'),(215,18,3,'6'),(216,18,3,'7'),(217,18,3,'8'),(218,18,3,'9'),(219,18,3,'10'),(220,18,3,'11'),(221,18,3,'12'),(222,18,3,'13'),(223,18,3,'14'),(224,18,3,'15'),(225,18,3,'16'),(226,18,3,'17'),(227,18,3,'18'),(228,18,3,'19'),(229,18,3,'20'),(230,18,3,'21'),(231,18,3,'22'),(232,18,3,'23'),(233,18,3,'24'),(234,18,3,'25'),(235,18,3,'26'),(236,18,3,'27'),(237,18,3,'28'),(238,18,3,'29'),(239,18,3,'30'),(240,20,3,'1'),(241,20,3,'2'),(242,20,3,'3'),(243,20,3,'4'),(244,20,3,'5'),(245,20,3,'6'),(246,20,3,'7'),(247,20,3,'8'),(248,20,3,'9'),(249,20,3,'10'),(250,20,3,'11'),(251,20,3,'12'),(252,20,3,'13'),(253,20,3,'14'),(254,20,3,'15'),(255,20,3,'16'),(256,20,3,'17'),(257,20,3,'18'),(258,20,3,'19'),(259,20,3,'20'),(260,20,3,'21'),(261,20,3,'22'),(262,20,3,'23'),(263,20,3,'24'),(264,20,3,'25'),(265,20,3,'26'),(266,20,3,'27'),(267,20,3,'28'),(268,20,3,'29'),(269,20,3,'30'),(270,21,3,'2'),(271,21,3,'3'),(272,21,3,'4'),(273,21,3,'5'),(274,21,3,'6'),(275,21,3,'7'),(276,21,3,'8'),(277,21,3,'9'),(278,21,3,'10'),(279,21,3,'11'),(280,21,3,'12'),(281,21,3,'13'),(282,21,3,'14'),(283,21,3,'15'),(284,21,3,'16'),(285,21,3,'17'),(286,21,3,'18'),(287,21,3,'19'),(288,21,3,'20'),(289,21,3,'21'),(290,21,3,'22'),(291,21,3,'23'),(292,21,3,'24'),(293,21,3,'25'),(294,21,3,'26'),(295,21,3,'27'),(296,21,3,'28'),(297,21,3,'29'),(298,21,3,'30'),(299,21,3,'31'),(300,22,5,'1'),(301,22,5,'3'),(302,22,5,'4'),(303,22,5,'5'),(304,22,5,'6'),(305,22,5,'7'),(306,22,5,'8'),(307,22,5,'9'),(308,22,5,'10'),(309,22,5,'11'),(310,22,5,'12'),(311,22,5,'13'),(312,22,5,'14'),(313,22,5,'15'),(314,22,5,'16'),(315,22,5,'17'),(316,22,5,'18'),(317,22,5,'19'),(318,22,5,'20'),(319,22,5,'21'),(320,22,5,'22'),(321,22,5,'23'),(322,22,5,'24'),(323,22,5,'25'),(324,22,5,'26'),(325,22,5,'27'),(326,22,5,'28'),(327,22,5,'29'),(328,22,5,'30'),(329,22,5,'31'),(330,22,5,'32'),(331,22,5,'33'),(332,22,5,'34'),(333,22,5,'35'),(334,22,5,'36'),(335,22,5,'37'),(336,22,5,'38'),(337,22,5,'39'),(338,22,5,'40'),(339,22,5,'41'),(340,22,5,'42'),(341,22,5,'43'),(342,22,5,'44'),(343,22,5,'45'),(344,22,5,'46'),(345,22,5,'47'),(346,22,5,'48'),(347,22,5,'49'),(348,22,5,'50'),(349,22,5,'51'),(350,22,5,'52'),(351,22,5,'53'),(352,22,5,'54'),(353,22,5,'55'),(354,22,5,'56'),(355,22,5,'57'),(356,22,5,'58'),(357,22,5,'59'),(358,22,5,'60'),(359,22,5,'61'),(360,22,5,'62'),(361,22,5,'63'),(362,22,5,'64'),(363,22,5,'65'),(364,22,5,'66'),(365,22,5,'67'),(366,22,5,'68'),(367,22,5,'69'),(368,22,5,'70'),(369,22,5,'71'),(370,22,5,'72'),(371,22,5,'73'),(372,22,5,'74'),(373,22,5,'75'),(374,22,5,'76'),(375,22,5,'77'),(376,22,5,'78'),(377,22,5,'79'),(378,22,5,'80'),(379,22,5,'81'),(380,22,5,'82'),(381,22,5,'83'),(382,22,5,'84'),(383,22,5,'85'),(384,22,5,'86'),(385,22,5,'87'),(386,22,5,'88'),(387,22,5,'89'),(388,22,5,'90'),(389,22,5,'91'),(390,23,3,'1'),(391,23,3,'1002'),(392,23,3,'1003'),(393,26,6,'1'),(394,26,6,'2'),(395,26,6,'3'),(396,26,6,'4'),(397,26,6,'5'),(398,26,6,'6'),(399,26,6,'7'),(400,26,6,'8'),(401,26,6,'9'),(402,26,6,'10'),(403,26,6,'11'),(404,26,6,'12'),(405,26,6,'13'),(406,26,6,'14'),(407,26,6,'15'),(408,26,6,'16'),(409,26,6,'17'),(410,26,6,'18'),(411,26,6,'19'),(412,26,6,'20'),(413,26,6,'21'),(414,26,6,'22'),(415,26,6,'23'),(416,26,6,'24'),(417,26,6,'25'),(418,26,6,'26'),(419,26,6,'27'),(420,26,6,'28'),(421,26,6,'29'),(422,26,6,'30'),(423,26,6,'31'),(424,26,6,'32'),(425,26,6,'33'),(426,26,6,'34'),(427,26,6,'35'),(428,26,6,'36'),(429,26,6,'37'),(430,26,6,'38'),(431,26,6,'39'),(432,26,6,'40'),(433,26,6,'41'),(434,26,6,'42'),(435,26,6,'43'),(436,26,6,'44'),(437,26,6,'45'),(438,26,6,'46'),(439,26,6,'47'),(440,26,6,'48'),(441,26,6,'49'),(442,26,6,'50'),(443,26,6,'51'),(444,26,6,'52'),(445,26,6,'53'),(446,26,6,'54'),(447,26,6,'55'),(448,26,6,'56'),(449,26,6,'57'),(450,26,6,'58'),(451,26,6,'59'),(452,26,6,'60'),(453,26,7,'1001'),(454,26,7,'1002'),(455,26,7,'1003'),(456,26,7,'1004'),(457,19,3,'1'),(458,19,3,'2'),(459,19,3,'3'),(460,19,3,'4'),(461,19,3,'5'),(462,19,3,'6'),(463,19,3,'7'),(464,19,3,'8'),(465,19,3,'9'),(466,19,3,'10'),(467,19,3,'11'),(468,19,3,'12'),(469,19,3,'13'),(470,19,3,'14'),(471,19,3,'15'),(472,19,3,'16'),(473,19,3,'17'),(474,19,3,'18'),(475,19,3,'19'),(476,19,3,'20'),(477,19,3,'21'),(478,19,3,'22'),(479,19,3,'23'),(480,19,3,'24'),(481,19,3,'25'),(482,19,3,'26'),(483,19,3,'27'),(484,19,3,'28'),(485,19,3,'29'),(486,19,3,'30'),(487,24,5,'2'),(488,24,5,'4'),(489,24,5,'5'),(490,24,5,'6'),(491,24,5,'7'),(492,24,5,'8'),(493,24,5,'9'),(494,24,5,'10'),(495,24,5,'11'),(496,24,5,'12'),(497,24,5,'13'),(498,24,5,'14'),(499,24,5,'15'),(500,24,5,'16'),(501,24,5,'17'),(502,24,5,'18'),(503,24,5,'19'),(504,24,5,'20'),(505,24,5,'21'),(506,24,5,'22'),(507,24,5,'23'),(508,24,5,'24'),(509,24,5,'25'),(510,24,5,'26'),(511,24,5,'27'),(512,24,5,'28'),(513,24,5,'29'),(514,24,5,'30'),(515,24,5,'31'),(516,24,5,'32'),(517,25,3,'1'),(518,25,3,'1002'),(519,25,3,'1003'),(520,25,3,'1004'),(521,27,8,'1'),(522,27,8,'2'),(523,27,8,'3'),(524,27,8,'4'),(525,27,8,'5'),(526,27,8,'6'),(527,27,8,'7'),(528,27,8,'8'),(529,27,8,'9'),(530,27,8,'10'),(531,27,8,'11'),(532,27,8,'12'),(533,27,8,'13'),(534,27,8,'14'),(535,27,8,'15'),(536,27,8,'16'),(537,27,8,'17'),(538,27,8,'18'),(539,27,8,'19'),(540,27,8,'20'),(541,27,8,'21'),(542,27,8,'22'),(543,27,8,'23'),(544,27,8,'24'),(545,27,8,'25'),(546,27,8,'26'),(547,27,8,'27'),(548,27,8,'28'),(549,27,8,'29'),(550,27,8,'30'),(551,27,8,'31'),(552,27,8,'32'),(553,27,8,'33'),(554,27,8,'34'),(555,27,8,'35'),(556,27,8,'36'),(557,27,8,'37'),(558,27,8,'38'),(559,27,8,'39'),(560,27,8,'40'),(561,27,8,'41'),(562,27,8,'42'),(563,27,8,'43'),(564,27,8,'44'),(565,27,8,'45'),(566,27,8,'46'),(567,27,8,'47'),(568,27,8,'48'),(569,27,8,'49'),(570,27,8,'50'),(571,27,8,'51'),(572,27,8,'52'),(573,27,8,'53'),(574,27,8,'54'),(575,27,8,'55'),(576,27,8,'56'),(577,27,8,'57'),(578,27,8,'58'),(579,27,8,'59'),(580,27,8,'60'),(581,27,8,'61'),(582,27,8,'62'),(583,27,8,'63'),(584,27,8,'64'),(585,27,8,'65'),(586,27,8,'66'),(587,27,8,'67'),(588,27,8,'68'),(589,27,8,'69'),(590,27,8,'70'),(591,27,8,'71'),(592,27,8,'72'),(593,27,8,'73'),(594,27,8,'74'),(595,27,8,'75'),(596,27,8,'76'),(597,27,8,'77'),(598,27,8,'78'),(599,27,8,'79'),(600,27,8,'80'),(601,27,8,'81'),(602,27,8,'82'),(603,27,8,'83'),(604,27,8,'84'),(605,27,8,'85'),(606,27,8,'86'),(607,27,8,'87'),(608,27,8,'88'),(609,27,8,'89'),(610,27,8,'90'),(611,27,8,'91'),(612,27,8,'92'),(613,27,8,'93'),(614,27,8,'94'),(615,27,8,'95'),(616,27,8,'96'),(617,27,8,'97'),(618,27,8,'98'),(619,27,8,'99'),(620,27,8,'100'),(621,27,8,'101'),(622,27,8,'102'),(623,27,8,'103'),(624,27,8,'104'),(625,27,8,'105'),(626,27,8,'106'),(627,27,8,'107'),(628,27,8,'108'),(629,27,8,'109'),(630,27,8,'110'),(631,27,8,'111'),(632,27,8,'112'),(633,27,8,'113'),(634,27,8,'114'),(635,27,8,'115'),(636,27,8,'116'),(637,27,8,'117'),(638,27,8,'118'),(639,27,8,'119'),(640,27,8,'120'),(641,27,8,'121'),(642,27,8,'122'),(643,27,8,'123'),(644,27,8,'124'),(645,27,8,'125'),(646,27,8,'126'),(647,27,8,'127'),(648,27,8,'128'),(649,27,8,'129'),(650,27,8,'130'),(651,27,8,'131'),(652,27,8,'132'),(653,27,8,'133'),(654,27,8,'134'),(655,27,8,'135'),(656,27,8,'136'),(657,27,8,'137'),(658,27,8,'138'),(659,27,8,'139'),(660,27,8,'140'),(661,27,8,'141'),(662,27,8,'142'),(663,27,8,'143'),(664,27,8,'144'),(665,27,8,'145'),(666,27,8,'146'),(667,27,8,'147'),(668,27,8,'148'),(669,27,8,'149'),(670,27,8,'150'),(671,27,8,'151'),(672,27,8,'152'),(673,27,8,'153'),(674,27,8,'154'),(675,27,8,'155'),(676,27,8,'156'),(677,27,8,'157'),(678,27,8,'158'),(679,27,8,'159'),(680,27,8,'160'),(681,27,8,'161'),(682,27,8,'162'),(683,27,8,'163'),(684,27,8,'164'),(685,27,8,'165'),(686,27,8,'166'),(687,27,8,'167'),(688,27,8,'168'),(689,27,8,'169'),(690,28,7,'9'),(691,28,7,'10'),(692,28,7,'11'),(693,28,7,'12'),(694,28,7,'13'),(695,28,7,'14'),(696,28,7,'15'),(697,28,7,'16'),(698,28,7,'17'),(699,28,7,'18'),(700,28,7,'19'),(701,28,7,'20'),(702,28,7,'21'),(703,28,7,'22'),(704,28,7,'23'),(705,28,7,'24'),(706,28,7,'25'),(707,28,7,'26'),(708,28,7,'27'),(709,28,7,'28'),(710,28,7,'29'),(711,28,7,'30'),(712,28,7,'31'),(713,28,7,'32'),(714,28,7,'33'),(715,28,7,'34'),(716,28,7,'35'),(717,28,7,'36'),(718,28,7,'37'),(719,28,7,'38'),(720,28,7,'39'),(721,28,7,'40'),(722,28,7,'41'),(723,28,7,'42'),(724,28,7,'43'),(725,28,7,'44'),(726,28,7,'45'),(727,28,7,'46'),(728,28,7,'47'),(729,28,7,'48'),(730,28,7,'49'),(731,28,7,'50'),(732,28,7,'51'),(733,28,7,'52'),(734,28,7,'53'),(735,28,7,'54'),(736,28,7,'55'),(737,28,7,'56'),(738,28,7,'57'),(739,28,7,'58'),(740,28,7,'59'),(741,28,7,'60'),(742,28,7,'61'),(743,28,7,'62'),(744,28,7,'63'),(745,28,7,'64'),(746,28,7,'65'),(747,28,7,'66'),(748,28,7,'67'),(749,28,7,'68'),(750,28,7,'69'),(751,28,7,'70'),(752,28,7,'71'),(753,28,7,'72'),(754,28,7,'73'),(755,28,7,'74'),(756,28,7,'75'),(757,28,7,'76'),(758,28,7,'77'),(759,28,7,'78'),(760,28,7,'79'),(761,28,7,'80'),(762,28,7,'81'),(763,28,7,'82'),(764,28,7,'83'),(765,29,6,'1'),(766,29,6,'2'),(767,29,6,'3'),(768,29,6,'4'),(769,29,6,'5'),(770,29,6,'6'),(771,29,6,'7'),(772,29,6,'8'),(773,29,6,'9'),(774,29,6,'10'),(775,29,6,'11'),(776,29,6,'12'),(777,29,6,'13'),(778,29,6,'14'),(779,29,6,'15'),(780,29,6,'16'),(781,29,6,'17'),(782,29,6,'18'),(783,29,6,'19'),(784,29,6,'20'),(785,29,6,'21'),(786,29,6,'22'),(787,29,6,'23'),(788,29,6,'24'),(789,29,6,'25'),(790,29,6,'26'),(791,29,6,'27'),(792,29,6,'28'),(793,29,6,'29'),(794,29,6,'30'),(795,29,7,'1001'),(796,29,7,'1002'),(797,29,7,'1003'),(798,29,7,'1004'),(799,29,7,'1005'),(800,29,7,'1006');
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory__document`
--

DROP TABLE IF EXISTS `inventory__document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory__document` (
  `inventory__document_id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_id` int(11) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`inventory__document_id`),
  KEY `Ref_240` (`document_id`),
  KEY `Ref_241` (`inventory_id`),
  CONSTRAINT `Ref_240` FOREIGN KEY (`document_id`) REFERENCES `document` (`document_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_241` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`inventory_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory__document`
--

LOCK TABLES `inventory__document` WRITE;
/*!40000 ALTER TABLE `inventory__document` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory__document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory__elogentry`
--

DROP TABLE IF EXISTS `inventory__elogentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory__elogentry` (
  `inventory__elogentry_id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_id` int(11) NOT NULL DEFAULT '0',
  `elog_entry_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`inventory__elogentry_id`),
  KEY `Ref_144` (`inventory_id`),
  KEY `Ref_145` (`elog_entry_id`),
  CONSTRAINT `Ref_144` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`inventory_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_145` FOREIGN KEY (`elog_entry_id`) REFERENCES `elog_entry` (`elog_entry_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory__elogentry`
--

LOCK TABLES `inventory__elogentry` WRITE;
/*!40000 ALTER TABLE `inventory__elogentry` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory__elogentry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory__install`
--

DROP TABLE IF EXISTS `inventory__install`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory__install` (
  `inventory__install_id` int(11) NOT NULL AUTO_INCREMENT,
  `install_id` int(11) NOT NULL DEFAULT '0',
  `inventory_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`inventory__install_id`),
  KEY `Ref_104` (`install_id`),
  KEY `Ref_102` (`inventory_id`),
  CONSTRAINT `Ref_104` FOREIGN KEY (`install_id`) REFERENCES `install` (`install_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_102` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`inventory_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=740 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory__install`
--

LOCK TABLES `inventory__install` WRITE;
/*!40000 ALTER TABLE `inventory__install` DISABLE KEYS */;
INSERT INTO `inventory__install` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10),(11,11,11),(12,12,12),(13,13,13),(14,14,14),(15,15,15),(16,16,16),(17,17,17),(18,18,18),(19,19,19),(20,20,20),(21,21,21),(22,22,22),(23,23,23),(24,24,24),(25,25,25),(26,26,26),(27,27,27),(28,28,28),(29,29,29),(30,30,30),(31,31,31),(32,32,32),(33,33,33),(34,34,34),(35,35,35),(36,36,36),(37,37,37),(38,38,38),(39,39,39),(40,40,40),(41,41,41),(42,42,42),(43,43,43),(44,44,44),(45,45,45),(46,46,46),(47,47,47),(48,48,48),(49,49,49),(50,50,50),(51,51,51),(52,52,52),(53,53,53),(54,54,54),(55,55,55),(56,56,56),(57,57,57),(58,58,58),(59,59,59),(60,60,60),(61,61,61),(62,62,62),(63,63,63),(64,64,64),(65,65,65),(66,66,66),(67,67,67),(68,68,68),(69,69,69),(70,70,70),(71,71,71),(72,72,72),(73,73,73),(74,74,74),(75,75,75),(76,76,76),(77,77,77),(78,78,78),(79,79,79),(80,80,80),(81,81,81),(82,82,82),(83,83,83),(84,84,84),(85,85,85),(86,86,86),(87,87,87),(88,88,88),(89,89,89),(90,90,90),(91,91,91),(92,92,92),(93,93,93),(94,94,94),(95,95,95),(96,96,96),(97,97,97),(98,98,98),(99,99,99),(100,100,100),(101,101,101),(102,102,102),(103,103,103),(104,104,104),(105,105,105),(106,106,106),(107,107,107),(108,108,108),(109,109,109),(110,110,110),(111,111,111),(112,112,112),(113,113,113),(114,114,114),(115,115,115),(116,116,116),(117,117,117),(118,118,118),(119,119,119),(120,120,120),(121,121,121),(122,122,122),(123,123,123),(124,124,124),(125,125,125),(126,126,126),(127,127,127),(128,128,128),(129,129,129),(130,130,130),(131,131,131),(132,132,132),(133,133,133),(134,134,134),(135,135,135),(136,136,136),(137,137,137),(138,138,138),(139,139,139),(140,140,140),(141,141,141),(142,142,142),(143,143,143),(144,144,144),(145,145,145),(146,146,146),(147,147,147),(148,148,148),(149,149,149),(150,150,150),(151,151,151),(152,152,152),(153,153,153),(154,154,154),(155,155,155),(156,156,156),(157,157,157),(158,158,158),(159,159,159),(160,160,160),(161,161,161),(162,162,162),(163,163,163),(164,164,164),(165,165,165),(166,166,166),(167,167,167),(168,168,168),(169,169,169),(170,172,599),(171,173,333),(172,175,260),(173,176,603),(174,177,334),(175,178,605),(176,182,479),(177,183,751),(178,185,444),(179,186,792),(180,187,445),(181,188,667),(182,189,232),(183,192,495),(184,193,730),(185,195,286),(186,196,533),(187,198,319),(188,199,534),(189,202,594),(190,203,315),(191,205,601),(192,206,247),(193,208,604),(194,209,316),(195,212,484),(196,213,653),(197,215,411),(198,216,793),(199,217,434),(200,218,654),(201,219,225),(202,223,711),(203,224,496),(204,225,726),(205,226,285),(206,228,321),(207,229,538),(208,232,587),(209,233,327),(210,235,246),(211,236,588),(212,237,324),(213,238,589),(214,242,460),(215,243,690),(216,245,396),(217,246,768),(218,247,398),(219,248,546),(220,249,218),(221,252,499),(222,253,717),(223,255,283),(224,256,558),(225,258,322),(226,259,584),(227,262,616),(228,263,336),(229,265,615),(230,266,261),(231,268,614),(232,269,339),(233,272,461),(234,273,696),(235,275,406),(236,276,771),(237,277,407),(238,278,547),(239,279,214),(240,283,744),(241,284,502),(242,285,745),(243,286,289),(244,288,344),(245,289,656),(246,292,655),(247,293,353),(248,295,268),(249,296,657),(250,297,354),(251,298,658),(252,302,465),(253,303,706),(254,305,412),(255,306,772),(256,307,410),(257,308,550),(258,309,219),(259,312,497),(260,313,733),(261,315,278),(262,316,606),(263,318,326),(264,319,607),(265,322,595),(266,323,355),(267,325,596),(268,326,266),(269,328,624),(270,329,356),(271,332,464),(272,333,695),(273,335,408),(274,336,773),(275,337,409),(276,338,549),(277,339,217),(278,343,740),(279,344,500),(280,345,741),(281,346,287),(282,348,332),(283,349,620),(284,352,566),(285,353,317),(286,355,245),(287,356,577),(288,357,318),(289,358,578),(290,362,467),(291,363,699),(292,365,420),(293,366,774),(294,367,421),(295,368,551),(296,369,220),(297,372,492),(298,373,710),(299,375,277),(300,376,580),(301,378,309),(302,379,531),(303,382,618),(304,383,347),(305,385,619),(306,386,265),(307,388,623),(308,389,349),(309,392,475),(310,393,732),(311,395,435),(312,396,778),(313,397,436),(314,398,585),(315,399,230),(316,403,739),(317,404,519),(318,405,743),(319,406,290),(320,408,341),(321,409,612),(322,412,536),(323,413,340),(324,415,262),(325,416,610),(326,417,391),(327,418,617),(328,422,466),(329,423,731),(330,425,413),(331,426,783),(332,427,430),(333,428,586),(334,429,216),(335,432,501),(336,433,737),(337,435,288),(338,436,597),(339,438,337),(340,439,598),(341,442,583),(342,443,323),(343,445,563),(344,446,240),(345,448,564),(346,449,320),(347,452,463),(348,453,694),(349,455,400),(350,456,775),(351,457,403),(352,458,552),(353,459,223),(354,463,721),(355,464,494),(356,465,723),(357,466,276),(358,468,310),(359,469,568),(360,472,662),(361,473,345),(362,475,259),(363,476,663),(364,477,346),(365,478,664),(366,482,476),(367,483,708),(368,485,428),(369,486,777),(370,487,414),(371,488,576),(372,489,221),(373,492,493),(374,493,729),(375,495,279),(376,496,561),(377,498,311),(378,499,562),(379,502,630),(380,503,352),(381,505,631),(382,506,248),(383,508,632),(384,509,369),(385,512,468),(386,513,715),(387,515,422),(388,516,781),(389,517,423),(390,518,565),(391,519,224),(392,523,742),(393,524,507),(394,525,738),(395,526,292),(396,528,350),(397,529,640),(398,532,644),(399,533,357),(400,535,267),(401,536,628),(402,537,360),(403,538,629),(404,542,472),(405,543,712),(406,545,397),(407,546,779),(408,547,415),(409,548,526),(410,549,233),(411,552,503),(412,553,718),(413,555,291),(414,556,600),(415,558,348),(416,559,602),(417,562,634),(418,563,359),(419,565,635),(420,566,250),(421,568,666),(422,569,363),(423,572,477),(424,573,719),(425,575,416),(426,576,776),(427,577,417),(428,578,537),(429,579,231),(430,583,752),(431,584,504),(432,585,753),(433,586,295),(434,588,361),(435,589,674),(436,592,646),(437,593,365),(438,595,253),(439,596,648),(440,597,366),(441,598,651),(442,602,473),(443,603,713),(444,605,424),(445,606,784),(446,607,425),(447,608,567),(448,609,222),(449,612,505),(450,613,754),(451,615,293),(452,616,672),(453,618,358),(454,619,673),(455,622,609),(456,623,364),(457,625,669),(458,626,256),(459,628,671),(460,629,367),(461,632,470),(462,633,728),(463,635,426),(464,636,780),(465,637,427),(466,638,539),(467,639,215),(468,643,749),(469,644,506),(470,645,750),(471,646,294),(472,648,368),(473,649,652),(474,652,633),(475,653,372),(476,655,257),(477,656,642),(478,657,373),(479,658,680),(480,662,478),(481,663,716),(482,665,431),(483,666,782),(484,667,432),(485,668,569),(486,669,226),(487,672,510),(488,673,762),(489,675,296),(490,676,675),(491,678,370),(492,679,676),(493,682,638),(494,683,377),(495,685,641),(496,686,251),(497,688,682),(498,689,362),(499,692,483),(500,693,757),(501,695,446),(502,696,797),(503,697,447),(504,698,637),(505,699,238),(506,703,759),(507,704,518),(508,705,760),(509,706,270),(510,708,371),(511,709,679),(512,712,649),(513,713,375),(514,715,252),(515,716,681),(516,717,392),(517,718,684),(518,722,481),(519,723,755),(520,725,442),(521,726,799),(522,727,443),(523,728,665),(524,729,228),(525,732,509),(526,733,764),(527,735,299),(528,736,636),(529,738,379),(530,739,647),(531,742,521),(532,743,338),(533,745,525),(534,746,263),(535,748,683),(536,749,389),(537,752,486),(538,753,736),(539,755,448),(540,756,800),(541,757,449),(542,758,668),(543,759,236),(544,763,722),(545,764,516),(546,765,763),(547,766,284),(548,768,388),(549,769,678),(550,772,687),(551,773,374),(552,775,258),(553,776,688),(554,777,381),(555,778,689),(556,782,485),(557,783,747),(558,785,439),(559,786,795),(560,787,452),(561,788,611),(562,789,234),(563,792,508),(564,793,698),(565,795,298),(566,796,650),(567,798,383),(568,799,686),(569,802,593),(570,803,385),(571,805,639),(572,806,254),(573,808,645),(574,809,351),(575,812,482),(576,813,756),(577,815,450),(578,816,796),(579,817,451),(580,818,643),(581,819,239),(582,823,707),(583,824,512),(584,825,761),(585,826,297),(586,828,380),(587,829,613),(588,832,535),(589,833,378),(590,835,269),(591,836,608),(592,837,382),(593,838,670),(594,842,469),(595,843,746),(596,845,440),(597,846,798),(598,847,441),(599,848,626),(600,849,237),(601,852,513),(602,853,758),(603,855,281),(604,856,677),(605,858,376),(606,859,685),(607,862,622),(608,863,330),(609,865,625),(610,866,255),(611,868,627),(612,869,335),(613,872,471),(614,873,727),(615,875,418),(616,876,785),(617,877,419),(618,878,573),(619,879,227),(620,883,734),(621,884,498),(622,885,735),(623,886,280),(624,888,329),(625,889,621),(626,892,659),(627,893,342),(628,895,264),(629,896,660),(630,897,343),(631,898,661),(632,902,457),(633,903,691),(634,905,393),(635,906,765),(636,907,394),(637,908,530),(638,909,210),(639,912,488),(640,913,692),(641,915,271),(642,916,541),(643,918,300),(644,919,542),(645,922,532),(646,923,301),(647,925,540),(648,926,241),(649,928,545),(650,929,302),(651,932,458),(652,933,693),(653,935,395),(654,936,766),(655,937,404),(656,938,543),(657,939,211),(658,943,704),(659,944,487),(660,945,700),(661,946,273),(662,948,305),(663,949,570),(664,952,553),(665,953,307),(666,955,243),(667,956,554),(668,957,308),(669,958,555),(670,962,459),(671,963,703),(672,965,402),(673,966,767),(674,967,405),(675,968,544),(676,969,212),(677,972,489),(678,973,702),(679,975,272),(680,976,571),(681,978,303),(682,979,572),(683,982,528),(684,983,325),(685,985,529),(686,986,242),(687,988,579),(688,989,328),(689,992,480),(690,993,709),(691,995,429),(692,996,787),(693,997,433),(694,998,581),(695,999,229),(696,1003,724),(697,1004,517),(698,1005,725),(699,1006,282),(700,1008,314),(701,1009,527),(702,1012,590),(703,1013,331),(704,1015,249),(705,1016,591),(706,1017,390),(707,1018,592),(708,1022,474),(709,1023,720),(710,1025,437),(711,1026,788),(712,1027,438),(713,1028,582),(714,1029,235),(715,1032,490),(716,1033,697),(717,1035,274),(718,1036,574),(719,1038,306),(720,1039,575),(721,1042,557),(722,1043,312),(723,1045,559),(724,1046,244),(725,1048,560),(726,1049,313),(727,1052,462),(728,1053,705),(729,1055,399),(730,1056,769),(731,1057,401),(732,1058,548),(733,1059,213),(734,1063,714),(735,1064,491),(736,1065,701),(737,1066,275),(738,1068,304),(739,1069,556);
/*!40000 ALTER TABLE `inventory__install` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_prop`
--

DROP TABLE IF EXISTS `inventory_prop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_prop` (
  `inventory_prop_id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_id` int(11) NOT NULL,
  `inventory_prop_tmplt_id` int(11) NOT NULL DEFAULT '0',
  `inventory_prop_value` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`inventory_prop_id`),
  KEY `idx_cmpnt_id` (`inventory_id`),
  KEY `Ref_172` (`inventory_prop_tmplt_id`),
  CONSTRAINT `Ref_71` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`inventory_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_172` FOREIGN KEY (`inventory_prop_tmplt_id`) REFERENCES `inventory_prop_tmplt` (`inventory_prop_tmplt_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=709 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_prop`
--

LOCK TABLES `inventory_prop` WRITE;
/*!40000 ALTER TABLE `inventory_prop` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_prop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_prop_tmplt`
--

DROP TABLE IF EXISTS `inventory_prop_tmplt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_prop_tmplt` (
  `inventory_prop_tmplt_id` int(11) NOT NULL AUTO_INCREMENT,
  `cmpnt_type_id` int(11) NOT NULL DEFAULT '0',
  `inventory_prop_tmplt_name` varchar(50) DEFAULT NULL,
  `inventory_prop_tmplt_desc` varchar(255) DEFAULT NULL,
  `inventory_prop_tmplt_default` varchar(255) DEFAULT NULL,
  `inventory_prop_tmplt_units` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`inventory_prop_tmplt_id`),
  KEY `Ref_169` (`cmpnt_type_id`),
  CONSTRAINT `Ref_169` FOREIGN KEY (`cmpnt_type_id`) REFERENCES `cmpnt_type` (`cmpnt_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_prop_tmplt`
--

LOCK TABLES `inventory_prop_tmplt` WRITE;
/*!40000 ALTER TABLE `inventory_prop_tmplt` DISABLE KEYS */;
INSERT INTO `inventory_prop_tmplt` VALUES (1,1,'municonv','unit conversion parameters for NSLS II magnets',NULL,NULL),(2,1,'municonv_chain','unit conversion parameters for NSLS II magnets, which is a chain powered by a common power supply.',NULL,NULL),(3,2,'municonv','unit conversion parameters for NSLS II magnets',NULL,NULL),(4,5,'municonv','unit conversion parameters for NSLS II magnets',NULL,NULL),(5,15,'municonv','unit conversion parameters for NSLS II magnets',NULL,NULL),(6,31,'municonv','unit conversion parameters for NSLS II magnets',NULL,NULL),(7,32,'municonv','unit conversion parameters for NSLS II magnets',NULL,NULL),(8,30,'municonv','unit conversion parameters for NSLS II magnets',NULL,NULL),(9,18,'municonv','unit conversion parameters for NSLS II magnets',NULL,NULL),(10,20,'municonv','unit conversion parameters for NSLS II magnets',NULL,NULL),(11,21,'municonv','unit conversion parameters for NSLS II magnets',NULL,NULL),(12,22,'municonv','unit conversion parameters for NSLS II magnets',NULL,NULL),(13,23,'municonv','unit conversion parameters for NSLS II magnets',NULL,NULL),(14,26,'municonv','unit conversion parameters for NSLS II magnets',NULL,NULL),(15,19,'municonv','unit conversion parameters for NSLS II magnets',NULL,NULL),(16,24,'municonv','unit conversion parameters for NSLS II magnets',NULL,NULL),(17,25,'municonv','unit conversion parameters for NSLS II magnets',NULL,NULL),(18,27,'municonv','unit conversion parameters for NSLS II magnets',NULL,NULL),(19,28,'municonv','unit conversion parameters for NSLS II magnets',NULL,NULL),(20,29,'municonv','unit conversion parameters for NSLS II magnets',NULL,NULL);
/*!40000 ALTER TABLE `inventory_prop_tmplt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ioc`
--

DROP TABLE IF EXISTS `ioc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ioc` (
  `ioc_id` int(11) NOT NULL AUTO_INCREMENT,
  `ioc_status_id` int(11) DEFAULT NULL,
  `ioc_nm` varchar(255) DEFAULT NULL,
  `system` varchar(255) DEFAULT NULL,
  `ioc_boot_instructions` text,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ioc_id`),
  UNIQUE KEY `ioc_nm` (`ioc_nm`),
  KEY `Ref_202` (`ioc_status_id`),
  CONSTRAINT `Ref_202` FOREIGN KEY (`ioc_status_id`) REFERENCES `ioc_status` (`ioc_status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ioc`
--

LOCK TABLES `ioc` WRITE;
/*!40000 ALTER TABLE `ioc` DISABLE KEYS */;
/*!40000 ALTER TABLE `ioc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ioc_boot`
--

DROP TABLE IF EXISTS `ioc_boot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ioc_boot` (
  `ioc_boot_id` int(11) NOT NULL AUTO_INCREMENT,
  `ioc_id` int(11) DEFAULT NULL,
  `sys_boot_line` varchar(127) DEFAULT NULL,
  `ioc_boot_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `current_load` tinyint(1) DEFAULT NULL,
  `current_boot` tinyint(1) DEFAULT NULL,
  `modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` varchar(10) DEFAULT NULL,
  `boot_device` varchar(50) DEFAULT NULL,
  `boot_params_version` float DEFAULT NULL,
  `console_connection` varchar(127) DEFAULT NULL,
  `host_inet_address` varchar(127) DEFAULT NULL,
  `host_name` varchar(127) DEFAULT NULL,
  `ioc_inet_address` varchar(127) DEFAULT NULL,
  `ioc_pid` int(11) DEFAULT NULL,
  `launch_script` varchar(127) DEFAULT NULL,
  `launch_script_pid` int(11) DEFAULT NULL,
  `os_file_name` varchar(127) DEFAULT NULL,
  `processor_number` int(11) DEFAULT NULL,
  `target_architecture` varchar(127) DEFAULT NULL,
  `ioc_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ioc_boot_id`),
  KEY `idx_current_load` (`current_load`),
  KEY `idx_ioc_id` (`ioc_id`),
  CONSTRAINT `Ref_54` FOREIGN KEY (`ioc_id`) REFERENCES `ioc` (`ioc_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ioc_boot`
--

LOCK TABLES `ioc_boot` WRITE;
/*!40000 ALTER TABLE `ioc_boot` DISABLE KEYS */;
/*!40000 ALTER TABLE `ioc_boot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ioc_error`
--

DROP TABLE IF EXISTS `ioc_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ioc_error` (
  `ioc_error_id` int(11) NOT NULL AUTO_INCREMENT,
  `ioc_boot_id` int(11) DEFAULT NULL,
  `ioc_error_message_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ioc_error_id`),
  KEY `idx_ioc_boot_id` (`ioc_boot_id`),
  KEY `idx_ioc_error_num` (`ioc_error_message_id`),
  CONSTRAINT `ioc_error_ibfk_1` FOREIGN KEY (`ioc_boot_id`) REFERENCES `ioc_boot` (`ioc_boot_id`),
  CONSTRAINT `Ref_77` FOREIGN KEY (`ioc_error_message_id`) REFERENCES `ioc_error_message` (`ioc_error_message_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ioc_error`
--

LOCK TABLES `ioc_error` WRITE;
/*!40000 ALTER TABLE `ioc_error` DISABLE KEYS */;
/*!40000 ALTER TABLE `ioc_error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ioc_error_message`
--

DROP TABLE IF EXISTS `ioc_error_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ioc_error_message` (
  `ioc_error_message_id` int(11) NOT NULL AUTO_INCREMENT,
  `ioc_error_message` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ioc_error_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ioc_error_message`
--

LOCK TABLES `ioc_error_message` WRITE;
/*!40000 ALTER TABLE `ioc_error_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `ioc_error_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ioc_prop`
--

DROP TABLE IF EXISTS `ioc_prop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ioc_prop` (
  `ioc_prop_id` int(11) NOT NULL AUTO_INCREMENT,
  `ioc_id` int(11) DEFAULT NULL,
  `ioc_proptype_id` int(11) NOT NULL DEFAULT '0',
  `ioc_prop_value` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ioc_prop_id`),
  KEY `Ref_222` (`ioc_id`),
  KEY `Ref_223` (`ioc_proptype_id`),
  CONSTRAINT `Ref_222` FOREIGN KEY (`ioc_id`) REFERENCES `ioc` (`ioc_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_223` FOREIGN KEY (`ioc_proptype_id`) REFERENCES `ioc_proptype` (`ioc_proptype_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ioc_prop`
--

LOCK TABLES `ioc_prop` WRITE;
/*!40000 ALTER TABLE `ioc_prop` DISABLE KEYS */;
/*!40000 ALTER TABLE `ioc_prop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ioc_proptype`
--

DROP TABLE IF EXISTS `ioc_proptype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ioc_proptype` (
  `ioc_proptype_id` int(11) NOT NULL AUTO_INCREMENT,
  `ioc_proptype_name` varchar(50) DEFAULT NULL,
  `ioc_proptype_desc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ioc_proptype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ioc_proptype`
--

LOCK TABLES `ioc_proptype` WRITE;
/*!40000 ALTER TABLE `ioc_proptype` DISABLE KEYS */;
/*!40000 ALTER TABLE `ioc_proptype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ioc_resource`
--

DROP TABLE IF EXISTS `ioc_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ioc_resource` (
  `ioc_resource_id` int(11) NOT NULL AUTO_INCREMENT,
  `ioc_boot_id` int(11) DEFAULT NULL,
  `text_line` varchar(255) DEFAULT NULL,
  `load_order` int(11) DEFAULT NULL,
  `uri_id` int(11) DEFAULT NULL,
  `unreachable` tinyint(1) DEFAULT NULL,
  `subst_str` varchar(255) DEFAULT NULL,
  `ioc_resource_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ioc_resource_id`),
  KEY `idx_ioc_boot_id` (`ioc_boot_id`),
  KEY `idx_uri_id` (`uri_id`),
  KEY `idx_ioc_resource_type_id` (`ioc_resource_type_id`),
  CONSTRAINT `ioc_resource_ibfk_1` FOREIGN KEY (`ioc_boot_id`) REFERENCES `ioc_boot` (`ioc_boot_id`),
  CONSTRAINT `ioc_resource_ibfk_2` FOREIGN KEY (`uri_id`) REFERENCES `uri` (`uri_id`),
  CONSTRAINT `Ref_78` FOREIGN KEY (`ioc_resource_type_id`) REFERENCES `ioc_resource_type` (`ioc_resource_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ioc_resource`
--

LOCK TABLES `ioc_resource` WRITE;
/*!40000 ALTER TABLE `ioc_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `ioc_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ioc_resource_type`
--

DROP TABLE IF EXISTS `ioc_resource_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ioc_resource_type` (
  `ioc_resource_type_id` int(11) NOT NULL,
  `ioc_resource_type` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ioc_resource_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ioc_resource_type`
--

LOCK TABLES `ioc_resource_type` WRITE;
/*!40000 ALTER TABLE `ioc_resource_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `ioc_resource_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ioc_status`
--

DROP TABLE IF EXISTS `ioc_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ioc_status` (
  `ioc_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `ioc_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ioc_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ioc_status`
--

LOCK TABLES `ioc_status` WRITE;
/*!40000 ALTER TABLE `ioc_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `ioc_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iocboot__install`
--

DROP TABLE IF EXISTS `iocboot__install`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iocboot__install` (
  `iocboot__install_id` int(11) NOT NULL AUTO_INCREMENT,
  `install_id` int(11) DEFAULT NULL,
  `ioc_boot_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`iocboot__install_id`),
  KEY `Ref_125` (`install_id`),
  KEY `Ref_203` (`ioc_boot_id`),
  CONSTRAINT `Ref_125` FOREIGN KEY (`install_id`) REFERENCES `install` (`install_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_203` FOREIGN KEY (`ioc_boot_id`) REFERENCES `ioc_boot` (`ioc_boot_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iocboot__install`
--

LOCK TABLES `iocboot__install` WRITE;
/*!40000 ALTER TABLE `iocboot__install` DISABLE KEYS */;
/*!40000 ALTER TABLE `iocboot__install` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iocboot_prop`
--

DROP TABLE IF EXISTS `iocboot_prop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iocboot_prop` (
  `iocboot_prop_id` int(11) NOT NULL AUTO_INCREMENT,
  `ioc_boot_id` int(11) DEFAULT NULL,
  `ioc_proptype_id` int(11) DEFAULT NULL,
  `ioc_prop` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`iocboot_prop_id`),
  KEY `Ref_196` (`ioc_proptype_id`),
  KEY `Ref_199` (`ioc_boot_id`),
  CONSTRAINT `Ref_196` FOREIGN KEY (`ioc_proptype_id`) REFERENCES `iocboot_proptype` (`iocboot_proptype_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_199` FOREIGN KEY (`ioc_boot_id`) REFERENCES `ioc_boot` (`ioc_boot_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iocboot_prop`
--

LOCK TABLES `iocboot_prop` WRITE;
/*!40000 ALTER TABLE `iocboot_prop` DISABLE KEYS */;
/*!40000 ALTER TABLE `iocboot_prop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iocboot_proptype`
--

DROP TABLE IF EXISTS `iocboot_proptype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iocboot_proptype` (
  `iocboot_proptype_id` int(11) NOT NULL AUTO_INCREMENT,
  `iocboot_proptype_name` varchar(50) DEFAULT NULL,
  `iocboot_proptype_desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`iocboot_proptype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iocboot_proptype`
--

LOCK TABLES `iocboot_proptype` WRITE;
/*!40000 ALTER TABLE `iocboot_proptype` DISABLE KEYS */;
/*!40000 ALTER TABLE `iocboot_proptype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `irmis_version`
--

DROP TABLE IF EXISTS `irmis_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `irmis_version` (
  `irmis_version_id` int(11) NOT NULL AUTO_INCREMENT,
  `irmis_version` varchar(50) DEFAULT NULL,
  `description` text,
  `irmis_version_date` datetime DEFAULT NULL,
  PRIMARY KEY (`irmis_version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `irmis_version`
--

LOCK TABLES `irmis_version` WRITE;
/*!40000 ALTER TABLE `irmis_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `irmis_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lattice`
--

DROP TABLE IF EXISTS `lattice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lattice` (
  `lattice_id` int(11) NOT NULL AUTO_INCREMENT,
  `model_line_id` int(11) DEFAULT NULL,
  `machine_mode_id` int(11) DEFAULT NULL,
  `model_geometry_id` int(11) DEFAULT NULL,
  `lattice_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `lattice_description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `created_by` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `updated_by` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`lattice_id`),
  KEY `FK_model_line` (`model_line_id`),
  KEY `FK_model_geometry` (`model_geometry_id`),
  KEY `FK_machine_mode` (`machine_mode_id`),
  CONSTRAINT `FK_model_line` FOREIGN KEY (`model_line_id`) REFERENCES `model_line` (`model_line_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_model_geometry` FOREIGN KEY (`model_geometry_id`) REFERENCES `model_geometry` (`model_geometry_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_machine_mode` FOREIGN KEY (`machine_mode_id`) REFERENCES `machine_mode` (`machine_mode_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lattice`
--

LOCK TABLES `lattice` WRITE;
/*!40000 ALTER TABLE `lattice` DISABLE KEYS */;
/*!40000 ALTER TABLE `lattice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link_detail`
--

DROP TABLE IF EXISTS `link_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link_detail` (
  `link_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `install_rel_id` int(11) NOT NULL DEFAULT '0',
  `link_type` int(11) DEFAULT NULL,
  `port_port_connection_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`link_detail_id`),
  KEY `Ref_226` (`install_rel_id`),
  CONSTRAINT `Ref_226` FOREIGN KEY (`install_rel_id`) REFERENCES `install_rel` (`install_rel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_detail`
--

LOCK TABLES `link_detail` WRITE;
/*!40000 ALTER TABLE `link_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `machine_mode`
--

DROP TABLE IF EXISTS `machine_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `machine_mode` (
  `machine_mode_id` int(11) NOT NULL AUTO_INCREMENT,
  `machine_mode_name` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `machine_mode_description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`machine_mode_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `machine_mode`
--

LOCK TABLES `machine_mode` WRITE;
/*!40000 ALTER TABLE `machine_mode` DISABLE KEYS */;
/*!40000 ALTER TABLE `machine_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `masar_data`
--

DROP TABLE IF EXISTS `masar_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `masar_data` (
  `masar_data_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_event_id` int(11) NOT NULL DEFAULT '0',
  `pv_name` varchar(50) DEFAULT NULL,
  `value` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `severity` int(11) DEFAULT NULL,
  `ioc_timestamp` int(11) unsigned NOT NULL,
  `ioc_timestamp_nano` int(11) unsigned NOT NULL,
  PRIMARY KEY (`masar_data_id`),
  KEY `Ref_10` (`service_event_id`),
  CONSTRAINT `Ref_10` FOREIGN KEY (`service_event_id`) REFERENCES `service_event` (`service_event_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `masar_data`
--

LOCK TABLES `masar_data` WRITE;
/*!40000 ALTER TABLE `masar_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `masar_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model`
--

DROP TABLE IF EXISTS `model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model` (
  `model_id` int(11) NOT NULL AUTO_INCREMENT,
  `lattice_id` int(11) DEFAULT NULL,
  `model_code_id` int(11) DEFAULT NULL,
  `model_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `model_desc` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `created_by` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `updated_by` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `tune_x` double DEFAULT NULL,
  `tune_y` double DEFAULT NULL,
  `chrome_x_0` double DEFAULT NULL,
  `chrome_x_1` double DEFAULT NULL,
  `chrome_x_2` double DEFAULT NULL,
  `chrome_y_0` double DEFAULT NULL,
  `chrome_y_1` double DEFAULT NULL,
  `chrome_y_2` double DEFAULT NULL,
  `final_beam_energy` double DEFAULT NULL,
  PRIMARY KEY (`model_id`),
  KEY `FK_model_code` (`model_code_id`),
  KEY `FK_lattice` (`lattice_id`),
  CONSTRAINT `FK_model_code` FOREIGN KEY (`model_code_id`) REFERENCES `model_code` (`model_code_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_lattice` FOREIGN KEY (`lattice_id`) REFERENCES `lattice` (`lattice_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model`
--

LOCK TABLES `model` WRITE;
/*!40000 ALTER TABLE `model` DISABLE KEYS */;
/*!40000 ALTER TABLE `model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_code`
--

DROP TABLE IF EXISTS `model_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_code` (
  `model_code_id` int(11) NOT NULL AUTO_INCREMENT,
  `code_name` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `algorithm` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`model_code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_code`
--

LOCK TABLES `model_code` WRITE;
/*!40000 ALTER TABLE `model_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_geometry`
--

DROP TABLE IF EXISTS `model_geometry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_geometry` (
  `model_geometry_id` int(11) NOT NULL AUTO_INCREMENT,
  `model_geometry_name` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `model_geometry_description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`model_geometry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_geometry`
--

LOCK TABLES `model_geometry` WRITE;
/*!40000 ALTER TABLE `model_geometry` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_geometry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_line`
--

DROP TABLE IF EXISTS `model_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_line` (
  `model_line_id` int(11) NOT NULL AUTO_INCREMENT,
  `model_line_name` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `model_line_description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `start_position` double DEFAULT NULL,
  `end_position` double DEFAULT NULL,
  `start_marker` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `end_marker` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`model_line_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_line`
--

LOCK TABLES `model_line` WRITE;
/*!40000 ALTER TABLE `model_line` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partition_type`
--

DROP TABLE IF EXISTS `partition_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partition_type` (
  `partition_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `partition_type` varchar(50) DEFAULT NULL,
  `partition_type_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`partition_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partition_type`
--

LOCK TABLES `partition_type` WRITE;
/*!40000 ALTER TABLE `partition_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `partition_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `person_id` int(11) NOT NULL AUTO_INCREMENT,
  `last_name` varchar(50) NOT NULL DEFAULT '0',
  `first_name` varchar(50) DEFAULT NULL,
  `telephone` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `bldg` varchar(50) DEFAULT NULL,
  `room` varchar(50) DEFAULT NULL,
  `life_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person__pgroup`
--

DROP TABLE IF EXISTS `person__pgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person__pgroup` (
  `person__pgroup_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `pgroup_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`person__pgroup_id`),
  KEY `Ref_161` (`person_id`),
  KEY `Ref_162` (`pgroup_id`),
  CONSTRAINT `Ref_161` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_162` FOREIGN KEY (`pgroup_id`) REFERENCES `pgroup` (`pgroup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person__pgroup`
--

LOCK TABLES `person__pgroup` WRITE;
/*!40000 ALTER TABLE `person__pgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `person__pgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person__role`
--

DROP TABLE IF EXISTS `person__role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person__role` (
  `person__role_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`person__role_id`),
  KEY `Ref_157` (`role_id`),
  KEY `Ref_160` (`person_id`),
  CONSTRAINT `Ref_157` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_160` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person__role`
--

LOCK TABLES `person__role` WRITE;
/*!40000 ALTER TABLE `person__role` DISABLE KEYS */;
/*!40000 ALTER TABLE `person__role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pgroup`
--

DROP TABLE IF EXISTS `pgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pgroup` (
  `pgroup_id` int(11) NOT NULL AUTO_INCREMENT,
  `pgroup_name` int(11) DEFAULT NULL,
  PRIMARY KEY (`pgroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pgroup`
--

LOCK TABLES `pgroup` WRITE;
/*!40000 ALTER TABLE `pgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `pgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pgroup__role`
--

DROP TABLE IF EXISTS `pgroup__role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pgroup__role` (
  `pgroup__role_id` int(11) NOT NULL AUTO_INCREMENT,
  `pgroup_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`pgroup__role_id`),
  KEY `Ref_163` (`role_id`),
  KEY `Ref_167` (`pgroup_id`),
  CONSTRAINT `Ref_163` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_167` FOREIGN KEY (`pgroup_id`) REFERENCES `pgroup` (`pgroup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pgroup__role`
--

LOCK TABLES `pgroup__role` WRITE;
/*!40000 ALTER TABLE `pgroup__role` DISABLE KEYS */;
/*!40000 ALTER TABLE `pgroup__role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pin`
--

DROP TABLE IF EXISTS `pin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pin` (
  `pin_id` int(11) NOT NULL AUTO_INCREMENT,
  `port_id` int(11) DEFAULT NULL,
  `signal_source_id` int(11) DEFAULT NULL,
  `pin_designator` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pin_id`),
  KEY `idx_port_id_pp` (`port_id`),
  KEY `Ref_250` (`signal_source_id`),
  CONSTRAINT `pin_ibfk_2` FOREIGN KEY (`port_id`) REFERENCES `port` (`port_id`),
  CONSTRAINT `Ref_250` FOREIGN KEY (`signal_source_id`) REFERENCES `signal_source` (`signal_source_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pin`
--

LOCK TABLES `pin` WRITE;
/*!40000 ALTER TABLE `pin` DISABLE KEYS */;
/*!40000 ALTER TABLE `pin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `port`
--

DROP TABLE IF EXISTS `port`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `port` (
  `port_id` int(11) NOT NULL AUTO_INCREMENT,
  `cmpnttype__porttype_id` int(11) DEFAULT NULL,
  `install_id` int(11) NOT NULL DEFAULT '0',
  `port_field_label` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`port_id`),
  KEY `idx_port_type_id` (`cmpnttype__porttype_id`),
  KEY `Ref_81` (`install_id`),
  CONSTRAINT `Ref_81` FOREIGN KEY (`install_id`) REFERENCES `install` (`install_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_229` FOREIGN KEY (`cmpnttype__porttype_id`) REFERENCES `cmpnttype__porttype` (`cmpnttype__porttype_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `port`
--

LOCK TABLES `port` WRITE;
/*!40000 ALTER TABLE `port` DISABLE KEYS */;
/*!40000 ALTER TABLE `port` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `port_type`
--

DROP TABLE IF EXISTS `port_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `port_type` (
  `port_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `connector_type` varchar(60) NOT NULL,
  `connector_group` varchar(60) NOT NULL,
  `pin_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`port_type_id`),
  UNIQUE KEY `idx_port_type_group_unique` (`connector_type`,`connector_group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `port_type`
--

LOCK TABLES `port_type` WRITE;
/*!40000 ALTER TABLE `port_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `port_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pv`
--

DROP TABLE IF EXISTS `pv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pv` (
  `pv_id` int(11) NOT NULL AUTO_INCREMENT,
  `pv_name` varchar(128) NOT NULL,
  `description` text,
  PRIMARY KEY (`pv_id`),
  KEY `idx_pv_name` (`pv_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pv`
--

LOCK TABLES `pv` WRITE;
/*!40000 ALTER TABLE `pv` DISABLE KEYS */;
/*!40000 ALTER TABLE `pv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pv__install`
--

DROP TABLE IF EXISTS `pv__install`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pv__install` (
  `pv__install_id` int(11) NOT NULL AUTO_INCREMENT,
  `pv_id` int(11) NOT NULL DEFAULT '0',
  `install_id` int(11) NOT NULL DEFAULT '0',
  `handle` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pv__install_id`),
  KEY `idx_pv_id` (`pv_id`),
  KEY `idx_install_id` (`install_id`),
  CONSTRAINT `Ref_111` FOREIGN KEY (`pv_id`) REFERENCES `pv` (`pv_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_116` FOREIGN KEY (`install_id`) REFERENCES `install` (`install_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pv__install`
--

LOCK TABLES `pv__install` WRITE;
/*!40000 ALTER TABLE `pv__install` DISABLE KEYS */;
/*!40000 ALTER TABLE `pv__install` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pv__pvgroup`
--

DROP TABLE IF EXISTS `pv__pvgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pv__pvgroup` (
  `pv__pvgroup_id` int(11) NOT NULL AUTO_INCREMENT,
  `pv_id` int(11) NOT NULL DEFAULT '0',
  `pv_group_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pv__pvgroup_id`),
  KEY `idx_pv_id` (`pv_id`),
  KEY `idx_pvgroup_id` (`pv_group_id`),
  CONSTRAINT `Ref_92` FOREIGN KEY (`pv_id`) REFERENCES `pv` (`pv_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_95` FOREIGN KEY (`pv_group_id`) REFERENCES `pv_group` (`pv_group_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pv__pvgroup`
--

LOCK TABLES `pv__pvgroup` WRITE;
/*!40000 ALTER TABLE `pv__pvgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `pv__pvgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pv_attr`
--

DROP TABLE IF EXISTS `pv_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pv_attr` (
  `pv_attr_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pv_id` int(11) NOT NULL DEFAULT '0',
  `pv_attrtype_id` int(11) DEFAULT NULL,
  `pv_attr` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pv_attr_id`),
  KEY `Ref_151` (`pv_id`),
  KEY `Ref_118` (`pv_attrtype_id`),
  CONSTRAINT `Ref_151` FOREIGN KEY (`pv_id`) REFERENCES `pv` (`pv_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_118` FOREIGN KEY (`pv_attrtype_id`) REFERENCES `pv_attrtype` (`pv_attrtype_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pv_attr`
--

LOCK TABLES `pv_attr` WRITE;
/*!40000 ALTER TABLE `pv_attr` DISABLE KEYS */;
/*!40000 ALTER TABLE `pv_attr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pv_attrtype`
--

DROP TABLE IF EXISTS `pv_attrtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pv_attrtype` (
  `pv_attrtype_id` int(11) NOT NULL AUTO_INCREMENT,
  `pv_attrtype_name` varchar(50) DEFAULT NULL,
  `pv_attrtype_desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pv_attrtype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pv_attrtype`
--

LOCK TABLES `pv_attrtype` WRITE;
/*!40000 ALTER TABLE `pv_attrtype` DISABLE KEYS */;
/*!40000 ALTER TABLE `pv_attrtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pv_group`
--

DROP TABLE IF EXISTS `pv_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pv_group` (
  `pv_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `pv_group_name` varchar(50) DEFAULT NULL,
  `pv_group_func` varchar(50) DEFAULT NULL,
  `pvg_creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `version` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pv_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pv_group`
--

LOCK TABLES `pv_group` WRITE;
/*!40000 ALTER TABLE `pv_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `pv_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pv_rel`
--

DROP TABLE IF EXISTS `pv_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pv_rel` (
  `pv_rel_id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_type` varchar(50) DEFAULT NULL,
  `parent_pv_id` int(11) NOT NULL DEFAULT '0',
  `child_pv_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pv_rel_id`),
  KEY `Ref_154` (`parent_pv_id`),
  KEY `Ref_155` (`child_pv_id`),
  CONSTRAINT `Ref_154` FOREIGN KEY (`parent_pv_id`) REFERENCES `pv` (`pv_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_155` FOREIGN KEY (`child_pv_id`) REFERENCES `pv` (`pv_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pv_rel`
--

LOCK TABLES `pv_rel` WRITE;
/*!40000 ALTER TABLE `pv_rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `pv_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pvgroup__serviceconfig`
--

DROP TABLE IF EXISTS `pvgroup__serviceconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pvgroup__serviceconfig` (
  `pvgroup__serviceconfig_id` int(11) NOT NULL AUTO_INCREMENT,
  `pv_group_id` int(11) NOT NULL DEFAULT '0',
  `service_config_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pvgroup__serviceconfig_id`),
  KEY `Ref_09` (`service_config_id`),
  KEY `Ref_137` (`pv_group_id`),
  CONSTRAINT `Ref_09` FOREIGN KEY (`service_config_id`) REFERENCES `service_config` (`service_config_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_137` FOREIGN KEY (`pv_group_id`) REFERENCES `pv_group` (`pv_group_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pvgroup__serviceconfig`
--

LOCK TABLES `pvgroup__serviceconfig` WRITE;
/*!40000 ALTER TABLE `pvgroup__serviceconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `pvgroup__serviceconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rec`
--

DROP TABLE IF EXISTS `rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rec` (
  `rec_id` int(11) NOT NULL AUTO_INCREMENT,
  `ioc_boot_id` int(11) DEFAULT NULL,
  `rec_nm` varchar(128) DEFAULT NULL,
  `rec_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `idx_rec_nm` (`rec_nm`),
  KEY `idx_ioc_boot_id` (`ioc_boot_id`),
  KEY `idx_rec_type_id` (`rec_type_id`),
  CONSTRAINT `rec_ibfk_1` FOREIGN KEY (`ioc_boot_id`) REFERENCES `ioc_boot` (`ioc_boot_id`),
  CONSTRAINT `rec_ibfk_2` FOREIGN KEY (`rec_type_id`) REFERENCES `rec_type` (`rec_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rec`
--

LOCK TABLES `rec` WRITE;
/*!40000 ALTER TABLE `rec` DISABLE KEYS */;
/*!40000 ALTER TABLE `rec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rec_alias`
--

DROP TABLE IF EXISTS `rec_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rec_alias` (
  `rec_alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `rec_id` int(11) DEFAULT NULL,
  `alias_nm` varchar(50) DEFAULT NULL,
  `ioc_resource_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`rec_alias_id`),
  KEY `Ref_205` (`rec_id`),
  KEY `Ref_206` (`ioc_resource_id`),
  CONSTRAINT `Ref_205` FOREIGN KEY (`rec_id`) REFERENCES `rec` (`rec_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_206` FOREIGN KEY (`ioc_resource_id`) REFERENCES `ioc_resource` (`ioc_resource_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rec_alias`
--

LOCK TABLES `rec_alias` WRITE;
/*!40000 ALTER TABLE `rec_alias` DISABLE KEYS */;
/*!40000 ALTER TABLE `rec_alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rec_client`
--

DROP TABLE IF EXISTS `rec_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rec_client` (
  `rec_client_id` int(11) NOT NULL AUTO_INCREMENT,
  `rec_client_type_id` int(11) DEFAULT NULL,
  `rec_nm` varchar(128) DEFAULT NULL,
  `fld_type` varchar(24) DEFAULT NULL,
  `vuri_id` int(11) DEFAULT NULL,
  `current_load` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`rec_client_id`),
  KEY `idx_rec_nm` (`rec_nm`),
  KEY `FKIndex1` (`rec_client_type_id`),
  KEY `idx_vuri_id` (`vuri_id`),
  CONSTRAINT `Ref_84` FOREIGN KEY (`rec_client_type_id`) REFERENCES `rec_client_type` (`rec_client_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_86` FOREIGN KEY (`vuri_id`) REFERENCES `vuri` (`vuri_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rec_client`
--

LOCK TABLES `rec_client` WRITE;
/*!40000 ALTER TABLE `rec_client` DISABLE KEYS */;
/*!40000 ALTER TABLE `rec_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rec_client_type`
--

DROP TABLE IF EXISTS `rec_client_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rec_client_type` (
  `rec_client_type_id` int(11) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`rec_client_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rec_client_type`
--

LOCK TABLES `rec_client_type` WRITE;
/*!40000 ALTER TABLE `rec_client_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `rec_client_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rec_type`
--

DROP TABLE IF EXISTS `rec_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rec_type` (
  `rec_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `ioc_boot_id` int(11) DEFAULT NULL,
  `rec_type` varchar(24) DEFAULT NULL,
  `ioc_resource_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`rec_type_id`),
  KEY `idx_ioc_boot_id` (`ioc_boot_id`),
  KEY `idx_ioc_resource_id` (`ioc_resource_id`),
  CONSTRAINT `rec_type_ibfk_1` FOREIGN KEY (`ioc_boot_id`) REFERENCES `ioc_boot` (`ioc_boot_id`),
  CONSTRAINT `rec_type_ibfk_2` FOREIGN KEY (`ioc_resource_id`) REFERENCES `ioc_resource` (`ioc_resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rec_type`
--

LOCK TABLES `rec_type` WRITE;
/*!40000 ALTER TABLE `rec_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `rec_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rec_type_dev_sup`
--

DROP TABLE IF EXISTS `rec_type_dev_sup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rec_type_dev_sup` (
  `rec_type_dev_sup_id` int(11) NOT NULL AUTO_INCREMENT,
  `rec_type_id` int(11) DEFAULT NULL,
  `dtyp_str` varchar(24) DEFAULT NULL,
  `dev_sup_dset` varchar(50) DEFAULT NULL,
  `dev_sup_io_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`rec_type_dev_sup_id`),
  KEY `Ref_228` (`rec_type_id`),
  CONSTRAINT `Ref_228` FOREIGN KEY (`rec_type_id`) REFERENCES `rec_type` (`rec_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rec_type_dev_sup`
--

LOCK TABLES `rec_type_dev_sup` WRITE;
/*!40000 ALTER TABLE `rec_type_dev_sup` DISABLE KEYS */;
/*!40000 ALTER TABLE `rec_type_dev_sup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `renamed_pv`
--

DROP TABLE IF EXISTS `renamed_pv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `renamed_pv` (
  `renamed_pv_id` int(11) NOT NULL AUTO_INCREMENT,
  `pv_id` int(11) DEFAULT '0',
  `new_pv_name` varchar(50) DEFAULT NULL,
  `old_pv_name` varchar(50) DEFAULT NULL,
  `old_pv_desc` varchar(255) DEFAULT NULL,
  `old_pv_end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`renamed_pv_id`),
  KEY `Ref_195` (`pv_id`),
  CONSTRAINT `Ref_195` FOREIGN KEY (`pv_id`) REFERENCES `pv` (`pv_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `renamed_pv`
--

LOCK TABLES `renamed_pv` WRITE;
/*!40000 ALTER TABLE `renamed_pv` DISABLE KEYS */;
/*!40000 ALTER TABLE `renamed_pv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role` int(11) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rot_coil_data`
--

DROP TABLE IF EXISTS `rot_coil_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rot_coil_data` (
  `rot_coil_data_id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_id` int(11) NOT NULL DEFAULT '0',
  `alias` varchar(50) DEFAULT NULL,
  `meas_coil_id` varchar(50) DEFAULT NULL,
  `ref_radius` double DEFAULT NULL,
  `magnet_notes` varchar(50) DEFAULT NULL,
  `login_name` varchar(2000) DEFAULT NULL,
  `cond_curr` double DEFAULT NULL,
  `meas_loc` varchar(50) DEFAULT NULL,
  `run_number` varchar(50) DEFAULT NULL,
  `sub_device` varchar(50) DEFAULT NULL,
  `current_1` double DEFAULT NULL,
  `current_2` double DEFAULT NULL,
  `current_3` double DEFAULT NULL,
  `up_dn_1` varchar(50) DEFAULT NULL,
  `up_dn_2` varchar(50) DEFAULT NULL,
  `up_dn_3` varchar(50) DEFAULT NULL,
  `analysis_number` varchar(50) DEFAULT NULL,
  `integral_xfer_function` double DEFAULT NULL,
  `orig_offset_x` double DEFAULT NULL,
  `orig_offset_y` double DEFAULT NULL,
  `B_ref_int` double DEFAULT NULL,
  `Roll_angle` double DEFAULT NULL,
  `meas_notes` varchar(2000) DEFAULT NULL,
  `meas_date` datetime DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `a1` double DEFAULT NULL,
  `a2` double DEFAULT NULL,
  `a3` double DEFAULT NULL,
  `b1` double DEFAULT NULL,
  `b2` double DEFAULT NULL,
  `b3` double DEFAULT NULL,
  `a4_21` varchar(255) DEFAULT NULL,
  `b4_21` varchar(255) DEFAULT NULL,
  `data_issues` varchar(50) DEFAULT NULL,
  `data_usage` int(11) DEFAULT NULL,
  PRIMARY KEY (`rot_coil_data_id`),
  KEY `Ref_192` (`inventory_id`),
  CONSTRAINT `Ref_192` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`inventory_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rot_coil_data`
--

LOCK TABLES `rot_coil_data` WRITE;
/*!40000 ALTER TABLE `rot_coil_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `rot_coil_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_name` varchar(50) DEFAULT NULL,
  `service_desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service__role`
--

DROP TABLE IF EXISTS `service__role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service__role` (
  `service__role_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`service__role_id`),
  KEY `Ref_173` (`role_id`),
  KEY `Ref_171` (`service_id`),
  CONSTRAINT `Ref_173` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_171` FOREIGN KEY (`service_id`) REFERENCES `service` (`service_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service__role`
--

LOCK TABLES `service__role` WRITE;
/*!40000 ALTER TABLE `service__role` DISABLE KEYS */;
/*!40000 ALTER TABLE `service__role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_config`
--

DROP TABLE IF EXISTS `service_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_config` (
  `service_config_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL DEFAULT '0',
  `service_config_name` varchar(50) DEFAULT NULL,
  `service_config_desc` varchar(255) DEFAULT NULL,
  `service_config_version` int(11) DEFAULT NULL,
  `service_config_create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`service_config_id`),
  KEY `Ref_197` (`service_id`),
  CONSTRAINT `Ref_197` FOREIGN KEY (`service_id`) REFERENCES `service` (`service_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_config`
--

LOCK TABLES `service_config` WRITE;
/*!40000 ALTER TABLE `service_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_config_prop`
--

DROP TABLE IF EXISTS `service_config_prop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_config_prop` (
  `service_config_prop_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_config_id` int(11) NOT NULL DEFAULT '0',
  `service_config_prop_name` varchar(2555) DEFAULT NULL,
  `service_config_prop_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`service_config_prop_id`),
  KEY `Ref_12` (`service_config_id`),
  CONSTRAINT `Ref_12` FOREIGN KEY (`service_config_id`) REFERENCES `service_config` (`service_config_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_config_prop`
--

LOCK TABLES `service_config_prop` WRITE;
/*!40000 ALTER TABLE `service_config_prop` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_config_prop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_event`
--

DROP TABLE IF EXISTS `service_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_event` (
  `service_event_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_config_id` int(11) NOT NULL DEFAULT '0',
  `service_event_user_tag` varchar(255) DEFAULT NULL,
  `service_event_UTC_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `service_event_serial_tag` int(11) DEFAULT '0',
  PRIMARY KEY (`service_event_id`),
  KEY `Ref_08` (`service_config_id`),
  CONSTRAINT `Ref_08` FOREIGN KEY (`service_config_id`) REFERENCES `service_config` (`service_config_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_event`
--

LOCK TABLES `service_event` WRITE;
/*!40000 ALTER TABLE `service_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_event_prop`
--

DROP TABLE IF EXISTS `service_event_prop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_event_prop` (
  `service_event_prop_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_event_id` int(11) NOT NULL DEFAULT '0',
  `service_event_prop_name` varchar(255) DEFAULT NULL,
  `service_event_prop_value` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`service_event_prop_id`),
  KEY `Ref_11` (`service_event_id`),
  CONSTRAINT `Ref_11` FOREIGN KEY (`service_event_id`) REFERENCES `service_event` (`service_event_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_event_prop`
--

LOCK TABLES `service_event_prop` WRITE;
/*!40000 ALTER TABLE `service_event_prop` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_event_prop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signal_desc`
--

DROP TABLE IF EXISTS `signal_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `signal_desc` (
  `signal_desc_id` int(11) NOT NULL AUTO_INCREMENT,
  `signal_type_id` int(11) DEFAULT NULL,
  `signal_quality_id` int(11) NOT NULL,
  PRIMARY KEY (`signal_desc_id`),
  KEY `Ref_248` (`signal_type_id`),
  KEY `Ref_249` (`signal_quality_id`),
  CONSTRAINT `Ref_248` FOREIGN KEY (`signal_type_id`) REFERENCES `signal_type` (`signal_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_249` FOREIGN KEY (`signal_quality_id`) REFERENCES `signal_quality` (`signal_quality_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signal_desc`
--

LOCK TABLES `signal_desc` WRITE;
/*!40000 ALTER TABLE `signal_desc` DISABLE KEYS */;
/*!40000 ALTER TABLE `signal_desc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signal_quality`
--

DROP TABLE IF EXISTS `signal_quality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `signal_quality` (
  `signal_quality_id` int(11) NOT NULL AUTO_INCREMENT,
  `signal_quality` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`signal_quality_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signal_quality`
--

LOCK TABLES `signal_quality` WRITE;
/*!40000 ALTER TABLE `signal_quality` DISABLE KEYS */;
/*!40000 ALTER TABLE `signal_quality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signal_source`
--

DROP TABLE IF EXISTS `signal_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `signal_source` (
  `signal_source_id` int(11) NOT NULL AUTO_INCREMENT,
  `signal_source` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`signal_source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signal_source`
--

LOCK TABLES `signal_source` WRITE;
/*!40000 ALTER TABLE `signal_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `signal_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signal_type`
--

DROP TABLE IF EXISTS `signal_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `signal_type` (
  `signal_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `signal_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`signal_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signal_type`
--

LOCK TABLES `signal_type` WRITE;
/*!40000 ALTER TABLE `signal_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `signal_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_id` int(11) NOT NULL DEFAULT '0',
  `task_tmplt_id` int(11) NOT NULL DEFAULT '0',
  `task_start_date` datetime DEFAULT NULL,
  `task_completion_date` datetime DEFAULT NULL,
  `task_status` int(11) DEFAULT NULL,
  `task_done_by` varchar(50) NOT NULL DEFAULT '0',
  `dr` int(11) DEFAULT NULL,
  PRIMARY KEY (`task_id`),
  KEY `Ref_168` (`workflow_id`),
  KEY `Ref_239` (`task_tmplt_id`),
  CONSTRAINT `Ref_168` FOREIGN KEY (`workflow_id`) REFERENCES `workflow` (`workflow_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_239` FOREIGN KEY (`task_tmplt_id`) REFERENCES `task_tmplt` (`task_tmplt_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task__document`
--

DROP TABLE IF EXISTS `task__document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task__document` (
  `task__document_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL DEFAULT '0',
  `document_id` int(11) DEFAULT NULL,
  `dr` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`task__document_id`),
  KEY `Ref_235` (`document_id`),
  KEY `Ref_234` (`task_id`),
  CONSTRAINT `Ref_235` FOREIGN KEY (`document_id`) REFERENCES `document` (`document_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_234` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task__document`
--

LOCK TABLES `task__document` WRITE;
/*!40000 ALTER TABLE `task__document` DISABLE KEYS */;
/*!40000 ALTER TABLE `task__document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task__elogentry`
--

DROP TABLE IF EXISTS `task__elogentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task__elogentry` (
  `task__elogentry_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL DEFAULT '0',
  `elog_entry_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`task__elogentry_id`),
  KEY `Ref_183` (`task_id`),
  KEY `Ref_194` (`elog_entry_id`),
  CONSTRAINT `Ref_183` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_194` FOREIGN KEY (`elog_entry_id`) REFERENCES `elog_entry` (`elog_entry_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task__elogentry`
--

LOCK TABLES `task__elogentry` WRITE;
/*!40000 ALTER TABLE `task__elogentry` DISABLE KEYS */;
/*!40000 ALTER TABLE `task__elogentry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_tmplt`
--

DROP TABLE IF EXISTS `task_tmplt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_tmplt` (
  `task_tmplt_id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_tmplt_id` int(11) NOT NULL DEFAULT '0',
  `task_op` varchar(50) NOT NULL DEFAULT '0',
  `task_description` text,
  `task_order` int(11) DEFAULT NULL,
  `task_lock` int(11) DEFAULT NULL,
  PRIMARY KEY (`task_tmplt_id`),
  KEY `Ref_232` (`workflow_tmplt_id`),
  CONSTRAINT `Ref_232` FOREIGN KEY (`workflow_tmplt_id`) REFERENCES `workflow_tmplt` (`workflow_tmplt_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_tmplt`
--

LOCK TABLES `task_tmplt` WRITE;
/*!40000 ALTER TABLE `task_tmplt` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_tmplt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uri`
--

DROP TABLE IF EXISTS `uri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uri` (
  `uri_id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) DEFAULT NULL,
  `uri_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`uri_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uri`
--

LOCK TABLES `uri` WRITE;
/*!40000 ALTER TABLE `uri` DISABLE KEYS */;
/*!40000 ALTER TABLE `uri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor` (
  `vendor_id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_name` varchar(100) NOT NULL,
  PRIMARY KEY (`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor`
--

LOCK TABLES `vendor` WRITE;
/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;
INSERT INTO `vendor` VALUES (1,'RI'),(2,'Stangenes, USA'),(3,'BINP, Russia'),(4,'Everson-Tesla, USA'),(5,'Tesla, England'),(6,'Buckley, New Zealand'),(7,'IHEP, China'),(8,'Danfysik, Denmark');
/*!40000 ALTER TABLE `vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vuri`
--

DROP TABLE IF EXISTS `vuri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vuri` (
  `vuri_id` int(11) NOT NULL AUTO_INCREMENT,
  `uri_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`vuri_id`),
  KEY `idx_uri_id` (`uri_id`),
  CONSTRAINT `Ref_50` FOREIGN KEY (`uri_id`) REFERENCES `uri` (`uri_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vuri`
--

LOCK TABLES `vuri` WRITE;
/*!40000 ALTER TABLE `vuri` DISABLE KEYS */;
/*!40000 ALTER TABLE `vuri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vuri_rel`
--

DROP TABLE IF EXISTS `vuri_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vuri_rel` (
  `vuri_rel_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_vuri_id` int(11) DEFAULT NULL,
  `child_vuri_id` int(11) DEFAULT NULL,
  `rel_info` text,
  PRIMARY KEY (`vuri_rel_id`),
  KEY `idx_parent_vuri_id` (`parent_vuri_id`),
  KEY `idx_child_vuri_id` (`child_vuri_id`),
  CONSTRAINT `Ref_51` FOREIGN KEY (`parent_vuri_id`) REFERENCES `vuri` (`vuri_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_64` FOREIGN KEY (`child_vuri_id`) REFERENCES `vuri` (`vuri_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vuri_rel`
--

LOCK TABLES `vuri_rel` WRITE;
/*!40000 ALTER TABLE `vuri_rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `vuri_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow`
--

DROP TABLE IF EXISTS `workflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow` (
  `workflow_id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_tmplt_id` int(11) DEFAULT NULL,
  `workflow_no` varchar(50) NOT NULL DEFAULT '0',
  `workflow_start_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `workflow_completion_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `workflow_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`workflow_id`),
  KEY `Ref_233` (`workflow_tmplt_id`),
  CONSTRAINT `Ref_233` FOREIGN KEY (`workflow_tmplt_id`) REFERENCES `workflow_tmplt` (`workflow_tmplt_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow`
--

LOCK TABLES `workflow` WRITE;
/*!40000 ALTER TABLE `workflow` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow__inventory`
--

DROP TABLE IF EXISTS `workflow__inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow__inventory` (
  `workflow__inventory` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_id` int(11) DEFAULT NULL,
  `inventory_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`workflow__inventory`),
  KEY `Ref_153` (`inventory_id`),
  KEY `Ref_156` (`workflow_id`),
  CONSTRAINT `Ref_153` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`inventory_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_156` FOREIGN KEY (`workflow_id`) REFERENCES `workflow` (`workflow_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow__inventory`
--

LOCK TABLES `workflow__inventory` WRITE;
/*!40000 ALTER TABLE `workflow__inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow__inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow__person`
--

DROP TABLE IF EXISTS `workflow__person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow__person` (
  `workflow__person_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT '0',
  `workflow_id` int(11) DEFAULT '0',
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`workflow__person_id`),
  KEY `Ref_04` (`workflow_id`),
  KEY `Ref_170` (`person_id`),
  KEY `Ref_176` (`role_id`),
  CONSTRAINT `Ref_04` FOREIGN KEY (`workflow_id`) REFERENCES `workflow` (`workflow_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_170` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ref_176` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow__person`
--

LOCK TABLES `workflow__person` WRITE;
/*!40000 ALTER TABLE `workflow__person` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow__person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_tmplt`
--

DROP TABLE IF EXISTS `workflow_tmplt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_tmplt` (
  `workflow_tmplt_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `workflow_description` varchar(255) DEFAULT NULL,
  `revision` varchar(50) DEFAULT NULL,
  `revision_date` datetime DEFAULT NULL,
  `requires_inventory` enum('none','one','one or more','zero or more','zero or one') DEFAULT NULL,
  `recurring_period_number` int(11) DEFAULT NULL,
  `recurring_period_unit` varchar(50) DEFAULT NULL,
  `workflow_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`workflow_tmplt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_tmplt`
--

LOCK TABLES `workflow_tmplt` WRITE;
/*!40000 ALTER TABLE `workflow_tmplt` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_tmplt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_tmplt_hdr`
--

DROP TABLE IF EXISTS `workflow_tmplt_hdr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_tmplt_hdr` (
  `workflow_tmplt_hdr_id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_tmplt_id` int(11) NOT NULL DEFAULT '0',
  `workflow_tmplt_hdr_text` varchar(50) DEFAULT NULL,
  `workflow_tmplt_hdr_content` text NOT NULL,
  `workflow_tmplt_hdr_order` int(11) DEFAULT NULL,
  `workflow_tmplt_hdr_description` text,
  `sign_off_required` int(11) DEFAULT NULL,
  PRIMARY KEY (`workflow_tmplt_hdr_id`),
  KEY `Ref_231` (`workflow_tmplt_id`),
  CONSTRAINT `Ref_231` FOREIGN KEY (`workflow_tmplt_id`) REFERENCES `workflow_tmplt` (`workflow_tmplt_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_tmplt_hdr`
--

LOCK TABLES `workflow_tmplt_hdr` WRITE;
/*!40000 ALTER TABLE `workflow_tmplt_hdr` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_tmplt_hdr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'municonv'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-02-26 15:41:05