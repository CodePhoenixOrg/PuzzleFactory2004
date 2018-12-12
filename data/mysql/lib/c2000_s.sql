-- MySQL dump 10.2
--
-- Host: localhost    Database: c2000
-- ------------------------------------------------------
-- Server version	4.1.0-alpha-Max

/*!40101 SET NAMES latin1*/;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=NO_AUTO_VALUE_ON_ZERO */;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS clients;
CREATE TABLE clients (
  cli_index int(11) NOT NULL auto_increment,
  cli_nom varchar(50) NOT NULL default 'Sans nom',
  cli_adr1 varchar(50) NOT NULL default 'Pas d''adresse',
  cli_adr2 varchar(50) NOT NULL default '',
  cp_index int(11) NOT NULL default '1',
  cli_email varchar(50) NOT NULL default '',
  cli_num varchar(50) NOT NULL default '00000000',
  cli_mpasse varchar(50) NOT NULL default '',
  PRIMARY KEY  (cli_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `code_postal`
--

DROP TABLE IF EXISTS code_postal;
CREATE TABLE code_postal (
  cp_index int(11) NOT NULL auto_increment,
  cp_code varchar(5) NOT NULL default '',
  cp_ville varchar(50) NOT NULL default '',
  PRIMARY KEY  (cp_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `dictionary`
--

DROP TABLE IF EXISTS dictionary;
CREATE TABLE dictionary (
  di_index varchar(8) NOT NULL default '',
  di_fr_short varchar(50) NOT NULL default '',
  di_fr_long text NOT NULL,
  di_en_short varchar(50) NOT NULL default '',
  di_en_long text NOT NULL,
  PRIMARY KEY  (di_index),
  UNIQUE KEY di_index (di_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS menus;
CREATE TABLE menus (
  me_index int(11) NOT NULL default '1',
  di_index varchar(8) NOT NULL default 'nts',
  me_level char(1) NOT NULL default '1',
  me_target varchar(7) NOT NULL default 'page',
  pa_index int(11) NOT NULL default '1',
  PRIMARY KEY  (me_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS pages;
CREATE TABLE pages (
  pa_index int(11) NOT NULL default '0',
  di_index varchar(8) NOT NULL default '0',
  pa_filename varchar(255) NOT NULL default '',
  PRIMARY KEY  (pa_index,di_index),
  KEY pa_index (pa_index,di_index)
) TYPE=MyISAM CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;

