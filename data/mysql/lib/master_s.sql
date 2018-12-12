-- MySQL dump 10.2
--
-- Host: localhost    Database: master
-- ------------------------------------------------------
-- Server version	4.1.0-alpha-Max

/*!40101 SET NAMES latin1*/;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=NO_AUTO_VALUE_ON_ZERO */;

--
-- Table structure for table `db`
--

DROP TABLE IF EXISTS db;
CREATE TABLE db (
  db_index int(11) NOT NULL auto_increment,
  db_name char(16) NOT NULL default 'no_name',
  db_server int(11) NOT NULL default '1',
  db_site int(11) NOT NULL default '1',
  PRIMARY KEY  (db_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `graph_texts`
--

DROP TABLE IF EXISTS graph_texts;
CREATE TABLE graph_texts (
  gt_index int(11) NOT NULL auto_increment,
  gt_name char(16) NOT NULL default 'no name',
  gt_text char(255) default NULL,
  gt_site int(11) NOT NULL default '1',
  PRIMARY KEY  (gt_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS images;
CREATE TABLE images (
  im_index int(11) NOT NULL auto_increment,
  im_name varchar(16) NOT NULL default 'no name',
  im_width int(11) NOT NULL default '0',
  im_height int(11) NOT NULL default '0',
  im_dir varchar(255) NOT NULL default '/',
  im_url varchar(255) NOT NULL default 'localhost',
  im_site int(11) NOT NULL default '1',
  PRIMARY KEY  (im_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `queries`
--

DROP TABLE IF EXISTS queries;
CREATE TABLE queries (
  qy_index int(11) NOT NULL auto_increment,
  qy_name varchar(16) NOT NULL default 'no name',
  qy_string text,
  qy_database int(11) NOT NULL default '1',
  PRIMARY KEY  (qy_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `servers`
--

DROP TABLE IF EXISTS servers;
CREATE TABLE servers (
  se_index int(11) NOT NULL auto_increment,
  se_type tinyint(4) NOT NULL default '5',
  se_host varchar(255) NOT NULL default 'localhost',
  se_site int(11) NOT NULL default '1',
  PRIMARY KEY  (se_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS sites;
CREATE TABLE sites (
  si_index int(11) NOT NULL auto_increment,
  si_name varchar(16) NOT NULL default 'no name',
  si_server_name varchar(255) NOT NULL default 'localhost',
  si_root_dir varchar(255) NOT NULL default '/',
  si_temp_dir varchar(255) NOT NULL default '/',
  si_http_url varchar(255) NOT NULL default 'http://localhost',
  si_ftp_url varchar(255) NOT NULL default 'ftp://localhost',
  si_perl_bin_dir varchar(255) NOT NULL default '/usr/bin',
  PRIMARY KEY  (si_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `texts`
--

DROP TABLE IF EXISTS texts;
CREATE TABLE texts (
  tx_index int(11) NOT NULL auto_increment,
  tx_name varchar(16) NOT NULL default 'no name',
  tx_title varchar(255) NOT NULL default 'none',
  tx_content text,
  tx_dir varchar(255) NOT NULL default '/',
  tx_url varchar(255) NOT NULL default 'localhost',
  tx_site int(11) NOT NULL default '1',
  PRIMARY KEY  (tx_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  us_name char(16) NOT NULL default '',
  us_passwd char(16) binary NOT NULL default '',
  us_web_pages enum('N','Y') NOT NULL default 'Y',
  us_databases enum('N','Y') NOT NULL default 'Y',
  us_texts enum('N','Y') NOT NULL default 'Y',
  us_images enum('N','Y') NOT NULL default 'Y',
  us_users enum('N','Y') NOT NULL default 'N',
  us_site int(11) NOT NULL default '1'
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `v_menus`
--

DROP TABLE IF EXISTS v_menus;
CREATE TABLE v_menus (
  me_index int(11) NOT NULL default '1',
  pa_index int(11) NOT NULL default '1',
  me_target varchar(7) NOT NULL default 'page',
  me_level char(1) NOT NULL default '1',
  di_index varchar(8) NOT NULL default '',
  pa_filename varchar(255) NOT NULL default '',
  di_fr_short varchar(50) NOT NULL default '',
  di_fr_long text NOT NULL,
  di_en_short varchar(50) NOT NULL default '',
  di_en_long text NOT NULL,
  PRIMARY KEY  (me_index),
  UNIQUE KEY me_index (me_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `web_pages`
--

DROP TABLE IF EXISTS web_pages;
CREATE TABLE web_pages (
  wb_index int(11) NOT NULL auto_increment,
  wb_name varchar(16) NOT NULL default 'no name',
  wb_type varchar(5) NOT NULL default 'html',
  wb_dir varchar(255) NOT NULL default '/',
  wb_url varchar(255) NOT NULL default 'localhost',
  wb_site int(11) NOT NULL default '1',
  PRIMARY KEY  (wb_index)
) TYPE=MyISAM CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;

