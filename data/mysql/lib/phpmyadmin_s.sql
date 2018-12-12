-- MySQL dump 10.2
--
-- Host: localhost    Database: phpmyadmin
-- ------------------------------------------------------
-- Server version	4.1.0-alpha-Max

/*!40101 SET NAMES latin1*/;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=NO_AUTO_VALUE_ON_ZERO */;

--
-- Table structure for table `PMA_bookmark`
--

DROP TABLE IF EXISTS PMA_bookmark;
CREATE TABLE PMA_bookmark (
  id int(11) NOT NULL auto_increment,
  dbase varchar(255) NOT NULL default '',
  user varchar(255) NOT NULL default '',
  label varchar(255) NOT NULL default '',
  query text NOT NULL,
  PRIMARY KEY  (id)
) TYPE=MyISAM CHARSET=latin1 COMMENT='Bookmarks';

--
-- Table structure for table `PMA_column_info`
--

DROP TABLE IF EXISTS PMA_column_info;
CREATE TABLE PMA_column_info (
  id int(5) unsigned NOT NULL auto_increment,
  db_name varchar(64) NOT NULL default '',
  table_name varchar(64) NOT NULL default '',
  column_name varchar(64) NOT NULL default '',
  comment varchar(255) NOT NULL default '',
  mimetype varchar(255) NOT NULL default '',
  transformation varchar(255) NOT NULL default '',
  transformation_options varchar(255) NOT NULL default '',
  PRIMARY KEY  (id),
  UNIQUE KEY db_name (db_name,table_name,column_name)
) TYPE=MyISAM CHARSET=latin1 COMMENT='Column Information for phpMyAdmin';

--
-- Table structure for table `PMA_history`
--

DROP TABLE IF EXISTS PMA_history;
CREATE TABLE PMA_history (
  id bigint(20) unsigned NOT NULL auto_increment,
  username varchar(64) NOT NULL default '',
  db varchar(64) NOT NULL default '',
  table varchar(64) NOT NULL default '',
  timevalue timestamp NOT NULL,
  sqlquery text NOT NULL,
  PRIMARY KEY  (id),
  KEY username (username,db,table,timevalue)
) TYPE=MyISAM CHARSET=latin1 COMMENT='SQL history';

--
-- Table structure for table `PMA_pdf_pages`
--

DROP TABLE IF EXISTS PMA_pdf_pages;
CREATE TABLE PMA_pdf_pages (
  db_name varchar(64) NOT NULL default '',
  page_nr int(10) unsigned NOT NULL auto_increment,
  page_descr varchar(50) NOT NULL default '',
  PRIMARY KEY  (page_nr),
  KEY db_name (db_name)
) TYPE=MyISAM CHARSET=latin1 COMMENT='PDF Relationpages for PMA';

--
-- Table structure for table `PMA_relation`
--

DROP TABLE IF EXISTS PMA_relation;
CREATE TABLE PMA_relation (
  master_db varchar(64) NOT NULL default '',
  master_table varchar(64) NOT NULL default '',
  master_field varchar(64) NOT NULL default '',
  foreign_db varchar(64) NOT NULL default '',
  foreign_table varchar(64) NOT NULL default '',
  foreign_field varchar(64) NOT NULL default '',
  PRIMARY KEY  (master_db,master_table,master_field),
  KEY foreign_field (foreign_db,foreign_table)
) TYPE=MyISAM CHARSET=latin1 COMMENT='Relation table';

--
-- Table structure for table `PMA_table_coords`
--

DROP TABLE IF EXISTS PMA_table_coords;
CREATE TABLE PMA_table_coords (
  db_name varchar(64) NOT NULL default '',
  table_name varchar(64) NOT NULL default '',
  pdf_page_number int(11) NOT NULL default '0',
  x float unsigned NOT NULL default '0',
  y float unsigned NOT NULL default '0',
  PRIMARY KEY  (db_name,table_name,pdf_page_number)
) TYPE=MyISAM CHARSET=latin1 COMMENT='Table coordinates for phpMyAdmin PDF output';

--
-- Table structure for table `PMA_table_info`
--

DROP TABLE IF EXISTS PMA_table_info;
CREATE TABLE PMA_table_info (
  db_name varchar(64) NOT NULL default '',
  table_name varchar(64) NOT NULL default '',
  display_field varchar(64) NOT NULL default '',
  PRIMARY KEY  (db_name,table_name)
) TYPE=MyISAM CHARSET=latin1 COMMENT='Table information for phpMyAdmin';

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;

