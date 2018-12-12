-- MySQL dump 10.2
--
-- Host: localhost    Database: comptoirs
-- ------------------------------------------------------
-- Server version	4.1.0-alpha-Max

/*!40101 SET NAMES latin1*/;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=NO_AUTO_VALUE_ON_ZERO */;

--
-- Table structure for table `blocks`
--

DROP TABLE IF EXISTS blocks;
CREATE TABLE blocks (
  bl_index int(11) NOT NULL default '1',
  bl_column char(1) NOT NULL default '1',
  bl_type varchar(25) NOT NULL default 'menu',
  di_index varchar(8) NOT NULL default 'nts',
  PRIMARY KEY  (bl_index)
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
-- Table structure for table `exp_categories`
--

DROP TABLE IF EXISTS exp_categories;
CREATE TABLE exp_categories (
  code_categorie int(11) default NULL,
  nom_categorie varchar(25) default NULL,
  description mediumtext,
  illustration mediumblob
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `exp_clients`
--

DROP TABLE IF EXISTS exp_clients;
CREATE TABLE exp_clients (
  code_client varchar(5) default NULL,
  societe varchar(40) default NULL,
  contact varchar(30) default NULL,
  fonction varchar(30) default NULL,
  adresse varchar(60) default NULL,
  ville varchar(15) default NULL,
  region varchar(15) default NULL,
  code_postal varchar(10) default NULL,
  pays varchar(15) default NULL,
  telephone varchar(24) default NULL,
  fax varchar(24) default NULL
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `exp_commandes`
--

DROP TABLE IF EXISTS exp_commandes;
CREATE TABLE exp_commandes (
  num_commande int(11) default NULL,
  code_client varchar(5) default NULL,
  num_employe int(11) default NULL,
  date_commande datetime default NULL,
  a_livrer_avant datetime default NULL,
  date_envoi datetime default NULL,
  num_messager int(11) default NULL,
  port double default NULL,
  destinataire varchar(40) default NULL,
  adresse_livraison varchar(60) default NULL,
  ville_livraison varchar(15) default NULL,
  region_livraison varchar(15) default NULL,
  code_postal_livraison varchar(10) default NULL,
  pays_livraison varchar(15) default NULL
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `exp_details_commandes`
--

DROP TABLE IF EXISTS exp_details_commandes;
CREATE TABLE exp_details_commandes (
  num_commande int(11) default NULL,
  ref_produit int(11) default NULL,
  prix_unitaire double default NULL,
  quantite smallint(6) default NULL,
  remise float default NULL
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `exp_employes`
--

DROP TABLE IF EXISTS exp_employes;
CREATE TABLE exp_employes (
  num_employe int(11) default NULL,
  nom varchar(20) default NULL,
  prenom varchar(10) default NULL,
  fonction varchar(30) default NULL,
  civilite varchar(25) default NULL,
  date_naissance datetime default NULL,
  date_embauche datetime default NULL,
  adresse varchar(60) default NULL,
  ville varchar(15) default NULL,
  region varchar(15) default NULL,
  code_postal varchar(10) default NULL,
  pays varchar(15) default NULL,
  tel_domicile varchar(24) default NULL,
  extension varchar(4) default NULL,
  photo varchar(255) default NULL,
  notes mediumtext,
  rend_compte_a int(11) default NULL
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `exp_fournisseurs`
--

DROP TABLE IF EXISTS exp_fournisseurs;
CREATE TABLE exp_fournisseurs (
  num_fournisseur int(11) default NULL,
  societe varchar(40) default NULL,
  contact varchar(30) default NULL,
  fonction varchar(40) default NULL,
  adresse varchar(60) default NULL,
  ville varchar(20) default NULL,
  region varchar(15) default NULL,
  code_postal varchar(10) default NULL,
  pays varchar(15) default NULL,
  telephone varchar(24) default NULL,
  fax varchar(24) default NULL,
  page_accueil mediumtext
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `exp_messagers`
--

DROP TABLE IF EXISTS exp_messagers;
CREATE TABLE exp_messagers (
  num_messager int(11) default NULL,
  nom_messager varchar(40) default NULL,
  telephone varchar(24) default NULL
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `exp_produits`
--

DROP TABLE IF EXISTS exp_produits;
CREATE TABLE exp_produits (
  ref_produit int(11) default NULL,
  nom_produit varchar(40) default NULL,
  num_fournisseur int(11) default NULL,
  code_categorie int(11) default NULL,
  quantite_par_unite varchar(30) default NULL,
  prix_unitaire double default NULL,
  unites_en_stock smallint(6) default NULL,
  unites_commandees smallint(6) default NULL,
  niveau_reapprovisionnement smallint(6) default NULL,
  indisponible tinyint(1) default NULL
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
  bl_index int(11) NOT NULL default '1',
  di_index varchar(8) NOT NULL default 'nisc',
  grp_group enum('administrator','manager','operator','moderator','user') NOT NULL default 'user',
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

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;

