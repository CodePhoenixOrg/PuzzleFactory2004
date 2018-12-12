-- MySQL dump 10.2
--
-- Host: localhost    Database: mairiepq
-- ------------------------------------------------------
-- Server version	4.1.0-alpha-Max

/*!40101 SET NAMES latin1*/;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=NO_AUTO_VALUE_ON_ZERO */;

--
-- Table structure for table `actualites`
--

DROP TABLE IF EXISTS actualites;
CREATE TABLE actualites (
  refnews int(11) NOT NULL default '0',
  dateparution date default NULL,
  dateexpiration date default NULL,
  titre varchar(60) default NULL,
  resumenews varchar(180) default NULL,
  textenews longtext,
  nomthumb varchar(50) default NULL,
  adressethumb varchar(150) default NULL,
  fichierthumb varchar(100) default NULL,
  nomphoto varchar(50) default NULL,
  adressephoto varchar(150) default NULL,
  fichierphoto varchar(100) default NULL,
  PRIMARY KEY  (refnews)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `associations`
--

DROP TABLE IF EXISTS associations;
CREATE TABLE associations (
  refassoc int(11) NOT NULL default '0',
  type varchar(50) default NULL,
  categorie varchar(50) default NULL,
  nomassoc varchar(150) default NULL,
  infoassoc varchar(150) default NULL,
  mailassoc varchar(100) default NULL,
  siteassoc varchar(150) default NULL,
  activites longtext,
  nomresp varchar(150) default NULL,
  addr1resp varchar(150) default NULL,
  addr2resp varchar(100) default NULL,
  cpresp varchar(10) default NULL,
  villeresp varchar(150) default NULL,
  telresp varchar(100) default NULL,
  mailresp varchar(100) default NULL,
  intervenant varchar(255) default NULL,
  lieu varchar(255) default NULL,
  publicvise longtext,
  quand longtext,
  inscription longtext,
  tarifs longtext,
  nomphoto varchar(100) default NULL,
  photo varchar(255) default NULL,
  PRIMARY KEY  (refassoc)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `deliberations`
--

DROP TABLE IF EXISTS deliberations;
CREATE TABLE deliberations (
  refdelib int(11) NOT NULL default '0',
  titre varchar(255) default NULL,
  resume varchar(255) default NULL,
  contenu longtext,
  cheminphoto varchar(255) default NULL,
  nomphoto varchar(255) default NULL,
  datedelib date default NULL,
  dateexpiration date default NULL,
  refpersonne int(11) NOT NULL default '0',
  PRIMARY KEY  (refdelib),
  KEY refpersonne (refpersonne)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `docsoffresemplois`
--

DROP TABLE IF EXISTS docsoffresemplois;
CREATE TABLE docsoffresemplois (
  refdocoe int(11) NOT NULL default '0',
  titredocoe char(150) default NULL,
  urlchemindocoe char(255) default NULL,
  urlfichierdocoe char(150) default NULL,
  refoe int(11) NOT NULL default '0',
  PRIMARY KEY  (refdocoe),
  KEY refoe (refoe)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `elus`
--

DROP TABLE IF EXISTS elus;
CREATE TABLE elus (
  refpersonne int(11) NOT NULL default '0',
  nom char(150) default NULL,
  prenom char(150) default NULL,
  fonction char(150) default NULL,
  chargede char(255) default NULL,
  cheminphoto char(150) default NULL,
  fichierphoto char(150) default NULL,
  reftypeelu int(11) NOT NULL default '0',
  classement int(11) NOT NULL default '0',
  PRIMARY KEY  (refpersonne),
  KEY reftypeelu (reftypeelu)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `etablissements`
--

DROP TABLE IF EXISTS etablissements;
CREATE TABLE etablissements (
  refetablissement int(11) NOT NULL default '0',
  nom varchar(255) default NULL,
  adresse1 varchar(255) default NULL,
  adresse2 varchar(255) default NULL,
  cpville varchar(255) NOT NULL default '76140 PETIT-QUEVILLY',
  cheminphoto varchar(255) default NULL,
  nomphoto varchar(255) default NULL,
  resume varchar(255) default NULL,
  description longtext,
  tel varchar(50) default NULL,
  fax varchar(50) default NULL,
  email varchar(50) default NULL,
  reftypeetab int(11) NOT NULL default '0',
  PRIMARY KEY  (refetablissement),
  KEY reftypeetab (reftypeetab)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `evenements`
--

DROP TABLE IF EXISTS evenements;
CREATE TABLE evenements (
  refevenement int(11) NOT NULL default '0',
  datedu date default NULL,
  dateau date default NULL,
  rubrique varchar(255) default NULL,
  titre varchar(255) default NULL,
  texte longtext,
  PRIMARY KEY  (refevenement)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `forum`
--

DROP TABLE IF EXISTS forum;
CREATE TABLE forum (
  id int(11) NOT NULL default '0',
  id_parent int(11) NOT NULL default '0',
  titre char(64) default NULL
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `journaux`
--

DROP TABLE IF EXISTS journaux;
CREATE TABLE journaux (
  refjournal int(11) NOT NULL default '0',
  nom char(255) default NULL,
  PRIMARY KEY  (refjournal)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `marches`
--

DROP TABLE IF EXISTS marches;
CREATE TABLE marches (
  refmarche int(11) NOT NULL default '0',
  nom varchar(255) default NULL,
  refservice int(11) NOT NULL default '0',
  datedebut date default NULL,
  datefin date default NULL,
  titre varchar(255) default NULL,
  resume varchar(255) default NULL,
  contenu longtext,
  PRIMARY KEY  (refmarche)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS menus;
CREATE TABLE menus (
  refmenu int(11) NOT NULL default '0',
  libellé char(255) default NULL,
  refpere int(11) NOT NULL default '0',
  niveau int(11) NOT NULL default '0',
  repertoire char(255) default NULL,
  PRIMARY KEY  (refmenu)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `motscles`
--

DROP TABLE IF EXISTS motscles;
CREATE TABLE motscles (
  refmotcle int(11) NOT NULL default '0',
  motcle char(255) default NULL,
  refpagesite int(11) NOT NULL default '0',
  PRIMARY KEY  (refmotcle),
  KEY refpagesite (refpagesite)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `offresemplois`
--

DROP TABLE IF EXISTS offresemplois;
CREATE TABLE offresemplois (
  refoe int(11) NOT NULL default '0',
  compose smallint(6) default NULL,
  urlchemin varchar(255) default NULL,
  urlfichier varchar(150) default NULL,
  emetteurs varchar(255) default NULL,
  titrecourt varchar(255) default NULL,
  titrelong longtext,
  texte longtext,
  diplomes varchar(255) default NULL,
  addrdestinataire longtext,
  dateaffichage date default NULL,
  dateperemption date default NULL,
  PRIMARY KEY  (refoe)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `organigramme`
--

DROP TABLE IF EXISTS organigramme;
CREATE TABLE organigramme (
  refpersonne int(11) NOT NULL default '0',
  nom char(255) default NULL,
  fonction char(255) default NULL,
  domaine char(255) default NULL,
  detail char(255) default NULL,
  superieur int(11) NOT NULL default '0',
  niveau int(11) NOT NULL default '0',
  PRIMARY KEY  (refpersonne)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `pagessite`
--

DROP TABLE IF EXISTS pagessite;
CREATE TABLE pagessite (
  refpagesite int(11) NOT NULL default '0',
  titrepage char(255) default NULL,
  cheminpage char(255) default NULL,
  datecreation date default NULL,
  refpersonne int(11) NOT NULL default '0',
  frequentation int(11) NOT NULL default '0',
  refmenu int(11) NOT NULL default '0',
  refrubrique int(11) NOT NULL default '0',
  PRIMARY KEY  (refpagesite),
  KEY refmenu (refmenu),
  KEY refpersonne (refpersonne)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `personnes2`
--

DROP TABLE IF EXISTS personnes2;
CREATE TABLE personnes2 (
  refpersonne int(11) NOT NULL default '0',
  nom varchar(255) default NULL,
  prenom varchar(255) default NULL,
  adresse1 varchar(255) default NULL,
  adresse2 varchar(255) default NULL,
  cpville varchar(255) NOT NULL default '76140 PETIT-QUEVILLY',
  tel varchar(50) default NULL,
  fax varchar(50) default NULL,
  email varchar(50) default NULL,
  resume varchar(255) default NULL,
  commentaire longtext,
  cheminphoto varchar(255) default NULL,
  nomphoto varchar(255) default NULL,
  reftypepersonne int(11) NOT NULL default '0',
  auteur smallint(6) default NULL,
  refservice int(11) NOT NULL default '0',
  PRIMARY KEY  (refpersonne),
  KEY refservice (refservice),
  KEY reftypepersonne (reftypepersonne)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `publications`
--

DROP TABLE IF EXISTS publications;
CREATE TABLE publications (
  refpub int(11) NOT NULL default '0',
  reftypepub int(11) NOT NULL default '0',
  nompub char(150) default NULL,
  cheminpub char(255) default NULL,
  fichierpub char(150) default NULL,
  PRIMARY KEY  (refpub),
  KEY reftypepub (reftypepub)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `revuesdepresse`
--

DROP TABLE IF EXISTS revuesdepresse;
CREATE TABLE revuesdepresse (
  refrevuedepresse int(11) NOT NULL default '0',
  refjournal int(11) NOT NULL default '0',
  titre varchar(255) default NULL,
  resume varchar(255) default NULL,
  contenu longtext,
  cheminphoto varchar(255) default NULL,
  nomphoto varchar(255) default NULL,
  daterevuedepresse date default NULL,
  dateexpiration date default NULL,
  refpersonne int(11) NOT NULL default '0',
  PRIMARY KEY  (refrevuedepresse),
  KEY refjournal (refjournal),
  KEY refpersonne (refpersonne)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS services;
CREATE TABLE services (
  refservice int(11) NOT NULL default '0',
  service char(255) default NULL,
  diminutif char(50) default NULL,
  PRIMARY KEY  (refservice)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `textes`
--

DROP TABLE IF EXISTS textes;
CREATE TABLE textes (
  reftexte int(11) NOT NULL default '0',
  reftypetexte int(11) NOT NULL default '0',
  titre varchar(255) default NULL,
  resume varchar(255) default NULL,
  contenu longtext,
  cheminphoto varchar(255) default NULL,
  nomphoto varchar(255) default NULL,
  datetexte date default NULL,
  dateexpiration date default NULL,
  refpersonne int(11) NOT NULL default '0',
  PRIMARY KEY  (reftexte),
  KEY refpersonne (refpersonne),
  KEY reftypetexte (reftypetexte)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `typesassociations`
--

DROP TABLE IF EXISTS typesassociations;
CREATE TABLE typesassociations (
  reftypeassoc int(11) NOT NULL default '0',
  typeassoc char(255) default NULL,
  PRIMARY KEY  (reftypeassoc)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `typeselus`
--

DROP TABLE IF EXISTS typeselus;
CREATE TABLE typeselus (
  reftypeelu int(11) NOT NULL default '0',
  niveau int(11) NOT NULL default '0',
  type char(100) default NULL,
  PRIMARY KEY  (reftypeelu)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `typesetablissements`
--

DROP TABLE IF EXISTS typesetablissements;
CREATE TABLE typesetablissements (
  reftypeetab int(11) NOT NULL default '0',
  typeetablissement char(255) default NULL,
  PRIMARY KEY  (reftypeetab)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `typespersonnes`
--

DROP TABLE IF EXISTS typespersonnes;
CREATE TABLE typespersonnes (
  reftypepersonne int(11) NOT NULL default '0',
  typepersonne char(255) default NULL,
  PRIMARY KEY  (reftypepersonne)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `typespublications`
--

DROP TABLE IF EXISTS typespublications;
CREATE TABLE typespublications (
  reftypepub int(11) NOT NULL default '0',
  typepub char(150) default NULL,
  PRIMARY KEY  (reftypepub)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `typestextes`
--

DROP TABLE IF EXISTS typestextes;
CREATE TABLE typestextes (
  reftypetexte int(11) NOT NULL default '0',
  typetexte char(255) default NULL,
  PRIMARY KEY  (reftypetexte)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `Élémentsdumenugénér`
--

DROP TABLE IF EXISTS Élémentsdumenugénér;
CREATE TABLE Élémentsdumenugénér (
  SwitchboardID int(11) NOT NULL default '0',
  ItemNumber smallint(6) NOT NULL default '0',
  ItemText char(255) default NULL,
  Command smallint(6) NOT NULL default '0',
  Argument char(50) default NULL,
  PRIMARY KEY  (SwitchboardID,ItemNumber)
) TYPE=MyISAM CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;

