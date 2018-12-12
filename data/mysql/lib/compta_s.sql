-- MySQL dump 10.2
--
-- Host: localhost    Database: compta
-- ------------------------------------------------------
-- Server version	4.1.0-alpha-Max

/*!40101 SET NAMES latin1*/;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=NO_AUTO_VALUE_ON_ZERO */;

--
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS applications;
CREATE TABLE applications (
  app_index int(11) NOT NULL default '0',
  app_link varchar(255) NOT NULL default '',
  di_index varchar(8) NOT NULL default '',
  PRIMARY KEY  (app_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `blocks`
--

DROP TABLE IF EXISTS blocks;
CREATE TABLE blocks (
  bl_index int(11) NOT NULL default '1',
  bl_column char(1) NOT NULL default '1',
  bl_type varchar(25) NOT NULL default 'dynamic',
  di_index varchar(8) NOT NULL default 'nts',
  PRIMARY KEY  (bl_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `diary`
--

DROP TABLE IF EXISTS diary;
CREATE TABLE diary (
  dy_index int(11) NOT NULL auto_increment,
  dy_date date default NULL,
  dy_time time NOT NULL default '09:00:00',
  dy_length time NOT NULL default '01:00:00',
  dy_object varchar(100) default NULL,
  dy_description text,
  dy_place varchar(100) default NULL,
  dy_document varchar(250) NOT NULL default 'none',
  mbr_index int(11) NOT NULL default '1',
  PRIMARY KEY  (dy_index),
  KEY mbr_index (mbr_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `dictionary`
--

DROP TABLE IF EXISTS dictionary;
CREATE TABLE dictionary (
  di_index varchar(8) NOT NULL default '',
  di_fr_short varchar(255) NOT NULL default '',
  di_fr_long text NOT NULL,
  di_en_short varchar(255) NOT NULL default '',
  di_en_long text NOT NULL,
  PRIMARY KEY  (di_index),
  UNIQUE KEY di_index (di_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS groups;
CREATE TABLE groups (
  grp_group char(15) NOT NULL default '',
  grp_members_priv enum('N','Y') NOT NULL default 'N',
  grp_menu_priv enum('N','Y') NOT NULL default 'N',
  grp_page_priv enum('N','Y') NOT NULL default 'N',
  grp_news_priv enum('N','Y') NOT NULL default 'N',
  grp_items_priv enum('N','Y') NOT NULL default 'N',
  grp_customers_priv enum('N','Y') NOT NULL default 'N',
  grp_products_priv enum('N','Y') NOT NULL default 'N',
  grp_calendar_priv enum('N','Y') NOT NULL default 'N',
  grp_newsletter_priv enum('N','Y') NOT NULL default 'N',
  grp_forum_priv enum('N','Y') NOT NULL default 'N',
  KEY grp_index (grp_group)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `li_tie_cat`
--

DROP TABLE IF EXISTS li_tie_cat;
CREATE TABLE li_tie_cat (
  id int(11) NOT NULL auto_increment,
  tie_id int(11) NOT NULL default '0',
  cat_id int(11) NOT NULL default '0',
  PRIMARY KEY  (id)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS members;
CREATE TABLE members (
  mbr_index int(11) NOT NULL auto_increment,
  mbr_nom varchar(50) NOT NULL default 'Sans nom',
  mbr_prenom varchar(255) NOT NULL default '',
  mbr_adr1 varchar(50) NOT NULL default 'Pas d''adresse',
  mbr_adr2 varchar(50) NOT NULL default '',
  mbr_cp varchar(5) NOT NULL default '75001',
  mbr_ville varchar(255) NOT NULL default '',
  mbr_pays varchar(255) NOT NULL default '',
  mbr_email varchar(50) NOT NULL default '',
  mbr_ident varchar(50) NOT NULL default '',
  mbr_mpasse varchar(50) NOT NULL default '',
  grp_group enum('administrator','manager','operator','moderator','user') NOT NULL default 'user',
  PRIMARY KEY  (mbr_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS menus;
CREATE TABLE menus (
  me_index int(11) NOT NULL default '1',
  me_level char(1) NOT NULL default '1',
  me_target varchar(7) NOT NULL default 'page',
  pa_index int(11) NOT NULL default '1',
  bl_index int(11) NOT NULL default '10',
  di_index varchar(8) NOT NULL default 'nisc',
  grp_group enum('administrator','manager','operator','moderator','user') NOT NULL default 'user',
  PRIMARY KEY  (me_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `newsletter`
--

DROP TABLE IF EXISTS newsletter;
CREATE TABLE newsletter (
  nl_index int(11) NOT NULL default '1',
  nl_title varchar(255) NOT NULL default 'none',
  nl_author varchar(255) NOT NULL default 'none',
  nl_header text NOT NULL,
  nl_image varchar(255) NOT NULL default '',
  nl_comment varchar(255) NOT NULL default '',
  nl_body text NOT NULL,
  nl_links text NOT NULL,
  nl_footer text NOT NULL,
  nl_file varchar(255) NOT NULL default 'none',
  nl_date date NOT NULL default '2003-12-08',
  PRIMARY KEY  (nl_index)
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

--
-- Table structure for table `subscribers`
--

DROP TABLE IF EXISTS subscribers;
CREATE TABLE subscribers (
  sub_index int(11) NOT NULL auto_increment,
  sub_email varchar(255) default NULL,
  PRIMARY KEY  (sub_index),
  UNIQUE KEY nlr_email (sub_email)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `tb_cata`
--

DROP TABLE IF EXISTS tb_cata;
CREATE TABLE tb_cata (
  cat_id int(11) NOT NULL auto_increment,
  cat_abrege varchar(20) NOT NULL default '',
  cat_libelle varchar(50) NOT NULL default '',
  cat_type char(1) NOT NULL default '',
  PRIMARY KEY  (cat_id)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `tb_pays`
--

DROP TABLE IF EXISTS tb_pays;
CREATE TABLE tb_pays (
  pay_id int(11) NOT NULL auto_increment,
  pay_libelle01 varchar(50) NOT NULL default '',
  PRIMARY KEY  (pay_id)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `tb_pieces`
--

DROP TABLE IF EXISTS tb_pieces;
CREATE TABLE tb_pieces (
  pie_id int(11) NOT NULL auto_increment,
  tie_id int(11) NOT NULL default '0',
  pie_date date NOT NULL default '0000-00-00',
  pie_libelle01 varchar(50) NOT NULL default '',
  pie_numero varchar(20) NOT NULL default '',
  pie_ttc double(12,2) NOT NULL default '0.00',
  PRIMARY KEY  (pie_id)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `tb_tiers`
--

DROP TABLE IF EXISTS tb_tiers;
CREATE TABLE tb_tiers (
  tie_id int(11) NOT NULL auto_increment,
  tie_type char(1) NOT NULL default '',
  tie_code varchar(10) NOT NULL default '',
  tie_abrege varchar(20) NOT NULL default '',
  tie_libelle01 varchar(50) NOT NULL default '',
  tie_libelle02 varchar(50) NOT NULL default '',
  tie_libelle03 varchar(50) NOT NULL default '',
  tie_libelle04 varchar(50) NOT NULL default '',
  tie_cdpo varchar(10) NOT NULL default '',
  tie_ville varchar(40) NOT NULL default '',
  pay_id char(3) NOT NULL default '',
  PRIMARY KEY  (tie_id)
) TYPE=MyISAM CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;

