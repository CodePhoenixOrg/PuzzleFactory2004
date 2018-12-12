-- MySQL dump 10.2
--
-- Host: localhost    Database: magasin
-- ------------------------------------------------------
-- Server version	4.1.0-alpha-Max

/*!40101 SET NAMES latin1*/;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=NO_AUTO_VALUE_ON_ZERO */;

--
-- Dumping data for table `piece`
--


/*!40000 ALTER TABLE piece DISABLE KEYS */;
LOCK TABLES piece WRITE;
INSERT INTO piece (pi_index, pi_libelle, pi_image) VALUES (1,'Piece DEF','');
UNLOCK TABLES;
/*!40000 ALTER TABLE piece ENABLE KEYS */;

--
-- Dumping data for table `produit_fini`
--


/*!40000 ALTER TABLE produit_fini DISABLE KEYS */;
LOCK TABLES produit_fini WRITE;
INSERT INTO produit_fini (pf_index, pf_libelle, pf_image) VALUES (1,'Produit ABC','blank.gif');
UNLOCK TABLES;
/*!40000 ALTER TABLE produit_fini ENABLE KEYS */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;

