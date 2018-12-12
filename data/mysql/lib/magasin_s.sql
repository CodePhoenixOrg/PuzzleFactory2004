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
-- Table structure for table `piece`
--

DROP TABLE IF EXISTS piece;
CREATE TABLE piece (
  pi_index tinyint(4) NOT NULL auto_increment,
  pi_libelle varchar(50) NOT NULL default 'Piece DEF',
  pi_image varchar(255) NOT NULL default '',
  PRIMARY KEY  (pi_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `produit_fini`
--

DROP TABLE IF EXISTS produit_fini;
CREATE TABLE produit_fini (
  pf_index tinyint(4) NOT NULL auto_increment,
  pf_libelle varchar(50) NOT NULL default 'Produit ABC',
  pf_image varchar(255) NOT NULL default '',
  PRIMARY KEY  (pf_index)
) TYPE=MyISAM CHARSET=latin1 COMMENT='Produits finis stockés en magasin';

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;

