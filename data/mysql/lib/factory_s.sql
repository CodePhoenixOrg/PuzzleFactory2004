-- MySQL dump 10.2
--
-- Host: localhost    Database: factory
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
  bl_type enum('menu','form') NOT NULL default 'menu',
  di_index varchar(8) NOT NULL default 'nts',
  PRIMARY KEY  (bl_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `bugreport`
--

DROP TABLE IF EXISTS bugreport;
CREATE TABLE bugreport (
  br_index int(11) NOT NULL default '1',
  br_title varchar(255) NOT NULL default 'none',
  br_text text NOT NULL,
  br_importance int(11) NOT NULL default '1',
  br_status varchar(8) NOT NULL default '? fixer',
  br_date date NOT NULL default '2003-12-08',
  br_time time NOT NULL default '12:00:00',
  mbr_index int(11) NOT NULL default '1',
  PRIMARY KEY  (br_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `changelog`
--

DROP TABLE IF EXISTS changelog;
CREATE TABLE changelog (
  cl_index int(11) NOT NULL default '1',
  cl_title varchar(255) NOT NULL default 'none',
  cl_text text NOT NULL,
  cl_date date NOT NULL default '2003-12-08',
  cl_time time NOT NULL default '12:00:00',
  fr_index int(11) NOT NULL default '1',
  mbr_index int(11) NOT NULL default '1',
  PRIMARY KEY  (cl_index)
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
  di_ru_short varchar(255) NOT NULL default '',
  di_ru_long text NOT NULL,
  PRIMARY KEY  (di_index),
  UNIQUE KEY di_index (di_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `forums`
--

DROP TABLE IF EXISTS forums;
CREATE TABLE forums (
  fr_index int(11) NOT NULL default '1',
  fr_title varchar(255) NOT NULL default 'none',
  fr_description text NOT NULL,
  fr_date date NOT NULL default '2003-12-08',
  fr_table_name varchar(255) NOT NULL default 'none',
  me_index int(11) NOT NULL default '1',
  PRIMARY KEY  (fr_index)
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
-- Table structure for table `members`
--

DROP TABLE IF EXISTS members;
CREATE TABLE members (
  mbr_index int(11) NOT NULL auto_increment,
  mbr_nom varchar(50) NOT NULL default 'Sans nom',
  mbr_adr1 varchar(50) NOT NULL default 'Pas d''adresse',
  mbr_adr2 varchar(50) NOT NULL default '',
  mbr_cp varchar(5) NOT NULL default '75001',
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
-- Table structure for table `todo`
--

DROP TABLE IF EXISTS todo;
CREATE TABLE todo (
  td_index int(11) NOT NULL default '1',
  td_title varchar(255) NOT NULL default 'none',
  td_text text NOT NULL,
  td_priority int(11) NOT NULL default '1',
  td_expiry date NOT NULL default '2003-12-08',
  td_status varchar(8) NOT NULL default '? faire',
  td_date date NOT NULL default '2003-12-08',
  td_time time NOT NULL default '12:00:00',
  mbr_index int(11) NOT NULL default '1',
  PRIMARY KEY  (td_index)
) TYPE=MyISAM CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;

