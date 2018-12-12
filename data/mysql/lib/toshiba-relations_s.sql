-- MySQL dump 10.2
--
-- Host: localhost    Database: toshiba_relations
-- ------------------------------------------------------
-- Server version	4.1.0-alpha-Max

/*!40101 SET NAMES latin1*/;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=NO_AUTO_VALUE_ON_ZERO */;

--
-- Table structure for table `besoins`
--

DROP TABLE IF EXISTS besoins;
CREATE TABLE besoins (
  ORGANISATION varchar(50) default NULL,
  REFERENCE varchar(50) default NULL,
  DESCRIPTION varchar(50) default NULL,
  QTE_STOCK varchar(10) default NULL,
  S0 varchar(10) default NULL,
  S1 varchar(10) default NULL,
  S2 varchar(10) default NULL,
  S3 varchar(10) default NULL,
  S4 varchar(10) default NULL,
  M0 varchar(10) default NULL,
  M1 varchar(10) default NULL,
  M2 varchar(10) default NULL,
  M3 varchar(10) default NULL,
  M4 varchar(10) default NULL,
  M5 varchar(10) default NULL,
  TOTAL varchar(10) default NULL,
  FORECAST_02A varchar(10) default NULL,
  FORECAST_02B varchar(10) default NULL,
  STO_MINI varchar(10) default NULL,
  STO_MAXI varchar(10) default NULL,
  CONSIGNATION varchar(10) default NULL,
  NUM_FOURNISSEUR int(11) default '0',
  FOURNISSEUR varchar(50) default NULL,
  KEY ORGANISATION (ORGANISATION),
  KEY REFERENCE (REFERENCE),
  KEY DESCRIPTION (DESCRIPTION),
  KEY NUM_FOURNISSEUR (NUM_FOURNISSEUR)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `besoins_balance`
--

DROP TABLE IF EXISTS besoins_balance;
CREATE TABLE besoins_balance (
  Num int(11) NOT NULL default '0',
  ORGANISATION varchar(50) default NULL,
  REFERENCE varchar(50) default NULL,
  DESCRIPTION varchar(50) default NULL,
  NUM_FOURNISSEUR varchar(50) default NULL,
  FOURNISSEUR varchar(50) default NULL,
  on_hand varchar(50) default NULL,
  bes_S0 varchar(50) default NULL,
  bes_S1 varchar(50) default NULL,
  bes_S2 varchar(50) default NULL,
  bes_S3 varchar(50) default NULL,
  bes_S4 varchar(50) default NULL,
  bes_S5 varchar(50) default NULL,
  bes_S6 varchar(50) default NULL,
  bes_S7 varchar(50) default NULL,
  bes_S8 varchar(50) default NULL,
  bes_M0 varchar(50) default NULL,
  bes_M1 varchar(50) default NULL,
  bes_M2 varchar(50) default NULL,
  bes_M3 varchar(50) default NULL,
  bes_M4 varchar(50) default NULL,
  bes_M5 varchar(50) default NULL,
  bes_tot varchar(50) default NULL,
  cde_S0 varchar(50) default NULL,
  cde_S1 varchar(50) default NULL,
  cde_S2 varchar(50) default NULL,
  cde_S3 varchar(50) default NULL,
  cde_S4 varchar(50) default NULL,
  cde_S5 varchar(50) default NULL,
  cde_S6 varchar(50) default NULL,
  cde_S7 varchar(50) default NULL,
  cde_S8 varchar(50) default NULL,
  cde_M0 varchar(50) default NULL,
  cde_M1 varchar(50) default NULL,
  cde_M2 varchar(50) default NULL,
  cde_M3 varchar(50) default NULL,
  cde_M4 varchar(50) default NULL,
  cde_M5 varchar(50) default NULL,
  cde_ret varchar(50) default NULL,
  cde_ret2 varchar(50) default NULL,
  STO_MINI varchar(50) default NULL,
  STO_MAXI varchar(50) default NULL,
  CONSIGNATION varchar(50) default NULL,
  FORECAST_02A varchar(50) default NULL,
  FORECAST_02B varchar(50) default NULL,
  tot_cde varchar(50) default NULL,
  bal_S1 varchar(50) default NULL,
  bal_S2 varchar(50) default NULL,
  bal_S3 varchar(50) default NULL,
  bal_S4 varchar(50) default NULL,
  bal_S5 varchar(50) default NULL,
  bal_S6 varchar(50) default NULL,
  bal_S7 varchar(50) default NULL,
  bal_S8 varchar(50) default NULL,
  PRIMARY KEY  (Num)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `besoins_coul`
--

DROP TABLE IF EXISTS besoins_coul;
CREATE TABLE besoins_coul (
  ORGANISATION varchar(100) default NULL,
  REFERENCE varchar(100) default NULL,
  DESCRIPTION varchar(100) default NULL,
  QTE_STOCK varchar(100) default NULL,
  S0 varchar(100) default NULL,
  S1 varchar(100) default NULL,
  S2 varchar(100) default NULL,
  S3 varchar(100) default NULL,
  S4 varchar(100) default NULL,
  M0 varchar(100) default NULL,
  M1 varchar(100) default NULL,
  M2 varchar(100) default NULL,
  M3 varchar(100) default NULL,
  M4 varchar(100) default NULL,
  M5 varchar(100) default NULL,
  TOTAL varchar(100) default NULL,
  FORECAST_02A varchar(100) default NULL,
  FORECAST_02B varchar(100) default NULL,
  STO_MINI varchar(100) default NULL,
  STO_MAXI varchar(100) default NULL,
  CONSIGNATION varchar(100) default NULL,
  NUM_FOURNISSEUR varchar(100) default NULL,
  FOURNISSEUR varchar(100) default NULL,
  KEY ORGANISATION (ORGANISATION),
  KEY REFERENCE (REFERENCE),
  KEY DESCRIPTION (DESCRIPTION),
  KEY NUM_FOURNISSEUR (NUM_FOURNISSEUR)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `commandes`
--

DROP TABLE IF EXISTS commandes;
CREATE TABLE commandes (
  ORGANISATION varchar(50) default NULL,
  REFERENCE varchar(50) default NULL,
  DESCRIPTION varchar(50) default NULL,
  QTE_STOCK varchar(10) default NULL,
  S0 varchar(10) default NULL,
  S1 varchar(10) default NULL,
  S2 varchar(10) default NULL,
  S3 varchar(10) default NULL,
  S4 varchar(10) default NULL,
  M0 varchar(10) default NULL,
  M1 varchar(10) default NULL,
  M2 varchar(10) default NULL,
  M3 varchar(10) default NULL,
  M4 varchar(10) default NULL,
  M5 varchar(10) default NULL,
  TOTAL varchar(10) default NULL,
  RETARD varchar(10) default NULL,
  RETARD2 varchar(10) default NULL,
  NUM_FOURNISSEUR int(11) default '0',
  FOURNISSEUR varchar(50) default NULL,
  KEY ORGANISATION (ORGANISATION),
  KEY REFERENCE (REFERENCE),
  KEY DESCRIPTION (DESCRIPTION),
  KEY NUM_FOURNISSEUR (NUM_FOURNISSEUR)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `detail_facture`
--

DROP TABLE IF EXISTS detail_facture;
CREATE TABLE detail_facture (
  INVOICE_NUM varchar(50) NOT NULL default '',
  INVOICE_DATE date NOT NULL default '0000-00-00',
  DESCRIPTION varchar(240) NOT NULL default '',
  VENDOR_NUM varchar(30) NOT NULL default '',
  INVOICE_AMOUNT double NOT NULL default '0',
  INVOICE_CURRENCY_CODE varchar(15) NOT NULL default '',
  LINE_NUMBER varchar(15) NOT NULL default '',
  AMOUNT double NOT NULL default '0',
  PO_NUMBER varchar(20) NOT NULL default '',
  RELEASE_NUM int(11) NOT NULL default '0',
  PO_SHIPMENT_NUM int(11) NOT NULL default '0',
  ITEM varchar(20) NOT NULL default '',
  ITEM_DESCRIPTION varchar(240) NOT NULL default '',
  QUANTITY_INVOICED int(11) NOT NULL default '0',
  UNIT_PRICE double NOT NULL default '0',
  BL_NUMBER varchar(30) NOT NULL default '',
  NUM_FOURNISSEUR int(11) NOT NULL default '0',
  KEY NUM_FOURNISSEUR (NUM_FOURNISSEUR)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `details_facture`
--

DROP TABLE IF EXISTS details_facture;
CREATE TABLE details_facture (
  NUMERO int(4) NOT NULL default '0',
  NUM_FOURNISSEUR int(11) NOT NULL default '0',
  NUM_FACTURE char(255) NOT NULL default '',
  NUM_CDE char(255) NOT NULL default '',
  NUM_APPEL char(255) NOT NULL default '',
  NUM_BL char(255) NOT NULL default '',
  REFERENCE char(255) default NULL,
  DESCRIPTION char(255) default NULL,
  QUANTITE_FACTURE double default NULL,
  PRIX_UNIT_DEV_HT double default NULL,
  MONT_FACTURE_DEV double default NULL,
  PRIMARY KEY  (NUMERO),
  KEY NUM_APPEL (NUM_APPEL),
  KEY NUM_BL (NUM_BL),
  KEY NUM_CDE (NUM_CDE),
  KEY NUM_FACTURE (NUM_FACTURE),
  KEY NUM_FOURNISSEUR (NUM_FOURNISSEUR)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `entetes_facture`
--

DROP TABLE IF EXISTS entetes_facture;
CREATE TABLE entetes_facture (
  NUMERO int(4) NOT NULL default '0',
  NUM_FOURNISSEUR int(11) NOT NULL default '0',
  NUM_FACTURE char(255) NOT NULL default '',
  DATE_FACTURE date default NULL,
  MONTANT double default NULL,
  DEVISE char(255) default NULL,
  MONTANT_TVA double default NULL,
  PRIMARY KEY  (NUMERO),
  KEY NUM_FACTURE (NUM_FACTURE),
  KEY NUM_FOURNISSEUR (NUM_FOURNISSEUR)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `expedit`
--

DROP TABLE IF EXISTS expedit;
CREATE TABLE expedit (
  ORG char(3) NOT NULL default '',
  NO_DOSSIER_AR_MAERSK varchar(10) NOT NULL default '',
  BATEAU varchar(10) NOT NULL default '',
  NUM_CONTAINER varchar(80) NOT NULL default '',
  NUM_PALETTE varchar(10) NOT NULL default '',
  SHIP_METHOD varchar(30) NOT NULL default '',
  PORT_DEP varchar(10) NOT NULL default '',
  PORT_ARR varchar(10) NOT NULL default '',
  DAT_EXPE_ETD date NOT NULL default '0000-00-00',
  DAT_ARR_ETA date NOT NULL default '0000-00-00',
  NUM_VENDOR varchar(10) NOT NULL default '',
  VENDOR_NAME varchar(35) NOT NULL default '',
  NUM_BL varchar(10) NOT NULL default '',
  NUM_US int(10) NOT NULL default '0',
  PART_NUMBER varchar(20) NOT NULL default '',
  VERSION char(3) NOT NULL default '',
  PART_NAME varchar(30) NOT NULL default '',
  QTY int(10) NOT NULL default '0',
  NUM_QUOTATION varchar(30) NOT NULL default '',
  NUM_COMMANDE varchar(10) NOT NULL default '',
  NUM_APPEL varchar(5) NOT NULL default '',
  NUM_LIGNE int(10) NOT NULL default '0',
  MAG_DEST char(3) NOT NULL default '',
  CODE_LOCALISATION char(3) NOT NULL default '',
  POSTE_TRAVAIL char(2) NOT NULL default '',
  FLUX char(3) NOT NULL default '',
  CONSIGNE char(1) NOT NULL default '',
  GABARIT char(3) NOT NULL default '',
  PIVOT varchar(15) NOT NULL default '',
  LOT varchar(30) NOT NULL default '',
  PRIMARY KEY  (NUM_US)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `expeditions`
--

DROP TABLE IF EXISTS expeditions;
CREATE TABLE expeditions (
  NUMERO int(4) NOT NULL auto_increment,
  DAT_EXPE date default NULL,
  NUM_FOURNISSEUR int(11) default NULL,
  NUM_BL varchar(255) default NULL,
  NUM_COMMANDE varchar(255) default NULL,
  NUM_APPEL int(11) default '0',
  NUM_LIGNE int(11) NOT NULL default '0',
  MAG_DEST double default NULL,
  REFERENCE varchar(255) default NULL,
  VERSION varchar(255) default NULL,
  QTE double default NULL,
  NUM_US double NOT NULL default '0',
  CODE_LOCALISATION varchar(10) NOT NULL default '',
  POSTE_TRAVAIL varchar(10) NOT NULL default '',
  FLUX varchar(10) NOT NULL default '',
  DESCRIPTION varchar(250) NOT NULL default '',
  NOM_FOURNISSEUR varchar(250) NOT NULL default '',
  CONSIGNE char(1) NOT NULL default '',
  GABARIT char(1) NOT NULL default '',
  PIVOT varchar(50) NOT NULL default '',
  LOT varchar(250) NOT NULL default '',
  PRIMARY KEY  (NUM_US),
  KEY NUM_FOURNISSEUR (NUM_FOURNISSEUR),
  KEY REFERENCE (REFERENCE),
  KEY NUMERO (NUMERO),
  KEY DAT_EXPE (DAT_EXPE),
  KEY NUM_COMMANDE (NUM_COMMANDE),
  KEY NUM_BL (NUM_BL)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `logins`
--

DROP TABLE IF EXISTS logins;
CREATE TABLE logins (
  log_index int(11) NOT NULL auto_increment,
  log_user varchar(15) NOT NULL default '',
  log_pw varchar(15) NOT NULL default '',
  log_droits int(2) NOT NULL default '0',
  log_destination varchar(60) NOT NULL default '',
  log_fournisseur int(11) NOT NULL default '0',
  log_email varchar(60) NOT NULL default '',
  log_nom varchar(50) NOT NULL default '',
  log_prenom varchar(50) NOT NULL default '',
  log_affbesoin date NOT NULL default '0000-00-00',
  PRIMARY KEY  (log_index),
  KEY log_user (log_user)
) TYPE=MyISAM CHARSET=latin1 COMMENT='Table des utilisateurs et des droits';

--
-- Table structure for table `maj_base`
--

DROP TABLE IF EXISTS maj_base;
CREATE TABLE maj_base (
  BASE varchar(25) NOT NULL default '',
  DATE_MAJ varchar(25) NOT NULL default '0000-00-00'
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `maj_mds`
--

DROP TABLE IF EXISTS maj_mds;
CREATE TABLE maj_mds (
  ORGANISATION varchar(10) NOT NULL default '',
  DATE_MAJ varchar(25) NOT NULL default '0000-00-00'
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `mcgallery`
--

DROP TABLE IF EXISTS mcgallery;
CREATE TABLE mcgallery (
  id int(4) NOT NULL auto_increment,
  file varchar(30) NOT NULL default '',
  idalbum int(3) NOT NULL default '0',
  album varchar(50) NOT NULL default '',
  title varchar(50) NOT NULL default '',
  author varchar(50) NOT NULL default '',
  descr text NOT NULL,
  visite int(6) NOT NULL default '0',
  UNIQUE KEY file (file),
  KEY id (id)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `mcgallery_album`
--

DROP TABLE IF EXISTS mcgallery_album;
CREATE TABLE mcgallery_album (
  idalbum int(3) NOT NULL default '0',
  descr text NOT NULL,
  KEY idalbum (idalbum)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS messages;
CREATE TABLE messages (
  mes_index int(11) NOT NULL auto_increment,
  mes_date_envoi date NOT NULL default '0000-00-00',
  mes_dest varchar(200) NOT NULL default '',
  mes_from varchar(200) NOT NULL default '',
  mes_objet varchar(200) default NULL,
  mes_body text,
  eme_index int(11) NOT NULL default '0',
  des_index int(11) NOT NULL default '0',
  mes_lu int(11) NOT NULL default '0',
  mes_reference varchar(255) NOT NULL default '',
  PRIMARY KEY  (mes_index,mes_index),
  KEY mes_dest (mes_dest),
  KEY mes_from (mes_from)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `planning`
--

DROP TABLE IF EXISTS planning;
CREATE TABLE planning (
  ORGANISATION varchar(50) default NULL,
  PRODUIT varchar(50) default NULL,
  DESCRIPTION varchar(50) default NULL,
  QTE_STOCK varchar(10) default NULL,
  S0 varchar(10) default NULL,
  S1 varchar(10) default NULL,
  S2 varchar(10) default NULL,
  S3 varchar(10) default NULL,
  S4 varchar(10) default NULL,
  M0 varchar(10) default NULL,
  M1 varchar(10) default NULL,
  M2 varchar(10) default NULL,
  M3 varchar(10) default NULL,
  M4 varchar(10) default NULL,
  M5 varchar(10) default NULL,
  TOTAL varchar(10) default NULL,
  FORECAST_02A varchar(10) default NULL,
  FORECAST_02B varchar(10) default NULL,
  KEY ORGANISATION (ORGANISATION),
  KEY REFERENCE (PRODUIT),
  KEY DESCRIPTION (DESCRIPTION)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `tit_besoins`
--

DROP TABLE IF EXISTS tit_besoins;
CREATE TABLE tit_besoins (
  ORGANISATION varchar(50) default NULL,
  REFERENCE varchar(50) default NULL,
  DESCRIPTION varchar(50) default NULL,
  QTE_STOCK varchar(50) default NULL,
  S0 varchar(50) default NULL,
  S1 varchar(50) default NULL,
  S2 varchar(50) default NULL,
  S3 varchar(50) default NULL,
  S4 varchar(50) default NULL,
  M0 varchar(50) default NULL,
  M1 varchar(50) default NULL,
  M2 varchar(50) default NULL,
  M3 varchar(50) default NULL,
  M4 varchar(50) default NULL,
  M5 varchar(50) default NULL,
  TOTAL varchar(50) default NULL,
  FORECAST_02A varchar(50) default NULL,
  FORECAST_02B varchar(50) default NULL,
  STO_MINI varchar(50) default NULL,
  STO_MAXI varchar(50) default NULL,
  CONSIGNATION varchar(12) default NULL,
  NUM_FOURNISSEUR varchar(50) default '0',
  FOURNISSEUR varchar(50) default NULL,
  KEY ORGANISATION (ORGANISATION),
  KEY REFERENCE (REFERENCE),
  KEY DESCRIPTION (DESCRIPTION),
  KEY NUM_FOURNISSEUR (NUM_FOURNISSEUR)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `tit_besoins_balance`
--

DROP TABLE IF EXISTS tit_besoins_balance;
CREATE TABLE tit_besoins_balance (
  Num int(11) NOT NULL default '0',
  REFERENCE varchar(50) default NULL,
  DESCRIPTION varchar(50) default NULL,
  on_hand varchar(50) default NULL,
  bes_S0 varchar(50) default NULL,
  bes_S1 varchar(50) default NULL,
  bes_S2 varchar(50) default NULL,
  bes_S3 varchar(50) default NULL,
  bes_S4 varchar(50) default NULL,
  bes_S5 varchar(50) default NULL,
  bes_S6 varchar(50) default NULL,
  bes_S7 varchar(50) default NULL,
  bes_S8 varchar(50) default NULL,
  bes_M0 varchar(50) default NULL,
  bes_M1 varchar(50) default NULL,
  bes_M2 varchar(50) default NULL,
  bes_M3 varchar(50) default NULL,
  bes_M4 varchar(50) default NULL,
  bes_tot varchar(50) default NULL,
  STO_MINI varchar(50) default NULL,
  STO_MAXI varchar(50) default NULL
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `tit_commandes`
--

DROP TABLE IF EXISTS tit_commandes;
CREATE TABLE tit_commandes (
  ORGANISATION varchar(50) default NULL,
  REFERENCE varchar(50) default NULL,
  DESCRIPTION varchar(50) default NULL,
  QTE_STOCK varchar(50) default NULL,
  S0 varchar(50) default NULL,
  S1 varchar(50) default NULL,
  S2 varchar(50) default NULL,
  S3 varchar(50) default NULL,
  S4 varchar(50) default NULL,
  M0 varchar(50) default NULL,
  M1 varchar(50) default NULL,
  M2 varchar(50) default NULL,
  M3 varchar(50) default NULL,
  M4 varchar(50) default NULL,
  M5 varchar(50) default NULL,
  TOTAL varchar(50) default NULL,
  RETARD varchar(50) default NULL,
  FORECAST_02B varchar(50) default NULL,
  NUM_FOURNISSEUR varchar(50) default '0',
  FOURNISSEUR varchar(50) default NULL,
  KEY ORGANISATION (ORGANISATION),
  KEY REFERENCE (REFERENCE),
  KEY DESCRIPTION (DESCRIPTION),
  KEY NUM_FOURNISSEUR (NUM_FOURNISSEUR)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `tsb_arrets_de_lignes`
--

DROP TABLE IF EXISTS tsb_arrets_de_lignes;
CREATE TABLE tsb_arrets_de_lignes (
  NUMERO int(11) NOT NULL default '0',
  ORGANISATION char(255) default NULL,
  DAT date default NULL,
  REFERENCE char(255) default NULL,
  DESCRIPTION char(255) default NULL,
  NUM_FOURNISSEUR int(11) NOT NULL default '0',
  FOURNISSEUR char(255) default NULL,
  MODELE char(255) default NULL,
  LOCALISATION char(255) default NULL,
  CAUSE char(255) default NULL,
  POURQUOI char(255) default NULL,
  RESPONSABILITE char(255) default NULL,
  COMMENTAIRE char(255) default NULL,
  HARRETS double default NULL,
  PARRETS double default NULL,
  VALIDE char(255) default NULL,
  ID int(11) default NULL,
  KEY REFERENCE (REFERENCE),
  KEY NUM_FOURNISSEUR (NUM_FOURNISSEUR),
  KEY NUMERO (NUMERO)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `tsb_articles`
--

DROP TABLE IF EXISTS tsb_articles;
CREATE TABLE tsb_articles (
  NUMERO int(4) NOT NULL auto_increment,
  ORGANISATION varchar(255) default NULL,
  REFERENCE varchar(255) default NULL,
  DESCRIPTION varchar(255) default NULL,
  VERSION varchar(255) default NULL,
  CAT_ACHAT varchar(255) default NULL,
  CAT_ORDSTOP varchar(255) default NULL,
  CAT_PLN varchar(255) default NULL,
  CAT_STOCK varchar(255) default NULL,
  ACHETEUR varchar(255) default NULL,
  FOURNISSEUR varchar(255) default NULL,
  DELAI_OBTENTION int(11) default NULL,
  DEVISE varchar(255) default NULL,
  CONSIGNATION varchar(255) default NULL,
  STO_MINI int(11) default NULL,
  STO_MAXI int(11) default NULL,
  NUM_FOURNISSEUR int(11) NOT NULL default '0',
  CONDITIONNEMENT varchar(255) default NULL,
  QTEparUS int(11) default NULL,
  POSTEDETRAVAIL varchar(255) default NULL,
  FLUXROUGEVERT varchar(255) default NULL,
  QTEparCONTENANT int(11) NOT NULL default '0',
  MOQ int(11) NOT NULL default '0',
  LOCALISATION varchar(200) NOT NULL default '',
  PRIMARY KEY  (NUMERO),
  KEY NUM_FOURNISSEUR (NUM_FOURNISSEUR),
  KEY REFERENCE (REFERENCE),
  KEY NUMERO (NUMERO),
  KEY VERSION (VERSION),
  KEY FOURNISSEUR (FOURNISSEUR),
  KEY LOCALISATION (LOCALISATION)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `tsb_commandes`
--

DROP TABLE IF EXISTS tsb_commandes;
CREATE TABLE tsb_commandes (
  ID_COMMANDE int(11) NOT NULL default '0',
  REFERENCE varchar(15) NOT NULL default '',
  NUM_COMMANDE varchar(10) NOT NULL default '',
  NUM_APPEL varchar(10) NOT NULL default '',
  NUM_LIGNE varchar(10) NOT NULL default '',
  NUM_FOURNISSEUR int(3) NOT NULL default '0',
  DATE_COMMANDE date NOT NULL default '0000-00-00',
  DATE_BESOIN date NOT NULL default '0000-00-00',
  QTE_COMMANDEE double NOT NULL default '0',
  QTE_RECUE double NOT NULL default '0',
  QTE_FACTUREE double NOT NULL default '0',
  QTE_ANNULEE double NOT NULL default '0',
  VERSION char(3) NOT NULL default '',
  UNIT varchar(10) NOT NULL default '',
  PRIX_UNITE double NOT NULL default '0',
  DEVISE char(3) NOT NULL default '',
  TAUX_DEVISE double NOT NULL default '0',
  STATUT varchar(25) NOT NULL default ''
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `tsb_consignation`
--

DROP TABLE IF EXISTS tsb_consignation;
CREATE TABLE tsb_consignation (
  ORGANISATION varchar(25) NOT NULL default '',
  NUM_FOURNISSEUR int(3) NOT NULL default '0',
  REFERENCE varchar(15) default NULL,
  NUM_COMMANDE varchar(50) NOT NULL default '',
  NUM_APPEL varchar(10) NOT NULL default '',
  NUM_LIGNE varchar(10) NOT NULL default '',
  NUM_BR varchar(50) NOT NULL default '',
  NUM_BL varchar(50) NOT NULL default '',
  DATE_BR date NOT NULL default '0000-00-00',
  CONSOMMATIONS decimal(10,2) NOT NULL default '0.00',
  PRIX decimal(10,4) NOT NULL default '0.0000',
  DEVISE varchar(50) NOT NULL default '',
  SITE_ACHAT varchar(50) NOT NULL default '',
  TX_DEVISE varchar(50) NOT NULL default '',
  TRANSACTION_DATE date NOT NULL default '0000-00-00',
  KEY NUM_FOURNISSEUR (NUM_FOURNISSEUR),
  KEY REFERENCE (REFERENCE),
  KEY ORGANISATION (ORGANISATION)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `tsb_fournisseurs`
--

DROP TABLE IF EXISTS tsb_fournisseurs;
CREATE TABLE tsb_fournisseurs (
  NUMERO int(4) NOT NULL auto_increment,
  NUM_FOURNISSEUR int(11) NOT NULL default '0',
  NOM_FOURNISSEUR varchar(255) default NULL,
  ADDRESS_LINE1 varchar(255) default NULL,
  ADDRESS_LINE2 varchar(255) default NULL,
  CODE_POSTAL varchar(255) NOT NULL default '',
  VILLE varchar(255) default NULL,
  PAYS varchar(255) default NULL,
  DEVISE varchar(255) default NULL,
  TEL varchar(30) NOT NULL default '',
  EMAIL varchar(100) NOT NULL default '',
  PRIMARY KEY  (NUMERO),
  KEY CODE_POSTAL (CODE_POSTAL),
  KEY NUM_FOURNISSEUR (NUM_FOURNISSEUR),
  KEY NOM_FOURNISSEUR (NOM_FOURNISSEUR)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `tsb_nomenclature`
--

DROP TABLE IF EXISTS tsb_nomenclature;
CREATE TABLE tsb_nomenclature (
  ORGANISATION varchar(5) NOT NULL default '',
  PRODUIT varchar(255) NOT NULL default '',
  REFERENCE varchar(255) NOT NULL default '0',
  COEFF double NOT NULL default '0',
  DAT_IN datetime NOT NULL default '0000-00-00 00:00:00',
  DAT_OUT datetime NOT NULL default '0000-00-00 00:00:00',
  KEY organisation (ORGANISATION),
  KEY produit (PRODUIT),
  KEY reference (REFERENCE)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `tsb_reception`
--

DROP TABLE IF EXISTS tsb_reception;
CREATE TABLE tsb_reception (
  NUMERO int(4) NOT NULL auto_increment,
  NUM_FOURNISSEUR int(3) NOT NULL default '0',
  ORGANISATION varchar(10) default NULL,
  REFERENCE varchar(15) default NULL,
  DAT_RECEPT date default NULL,
  NUM_BR varchar(10) NOT NULL default '',
  NUM_BL varchar(10) NOT NULL default '',
  NUM_COMMANDE varchar(10) NOT NULL default '',
  NUM_APPEL varchar(10) NOT NULL default '',
  NUM_LIGNE varchar(10) NOT NULL default '',
  QTY_RECUE double default NULL,
  NUM_US varchar(12) NOT NULL default '0',
  ID_COMMANDE int(11) NOT NULL default '0',
  PRIMARY KEY  (NUMERO,NUMERO),
  UNIQUE KEY NUMERO (NUMERO),
  UNIQUE KEY NUM_US_2 (NUM_US),
  KEY NUM_APPEL (NUM_APPEL),
  KEY NUM_BL (NUM_BL),
  KEY NUM_BR (NUM_BR),
  KEY NUM_COMMANDE (NUM_COMMANDE),
  KEY REFERENCE (REFERENCE),
  KEY DAT_RECEPT (DAT_RECEPT),
  KEY NUM_FOURNISSEUR (NUM_FOURNISSEUR),
  KEY ID_COMMANDE (ID_COMMANDE),
  KEY NUM_US (NUM_US)
) TYPE=MyISAM CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;

