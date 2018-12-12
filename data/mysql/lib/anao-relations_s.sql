-- MySQL dump 10.2
--
-- Host: localhost    Database: anao_relations
-- ------------------------------------------------------
-- Server version	4.1.0-alpha-Max

/*!40101 SET NAMES latin1*/;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=NO_AUTO_VALUE_ON_ZERO */;

--
-- Table structure for table `actions`
--

DROP TABLE IF EXISTS actions;
CREATE TABLE actions (
  act_index int(11) NOT NULL default '0',
  act_libelle varchar(100) default NULL,
  PRIMARY KEY  (act_index),
  UNIQUE KEY act_libelle (act_libelle)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `actions_cj`
--

DROP TABLE IF EXISTS actions_cj;
CREATE TABLE actions_cj (
  acj_index int(11) NOT NULL auto_increment,
  con_index int(11) NOT NULL default '0',
  ope_index int(11) NOT NULL default '0',
  act_index int(11) NOT NULL default '0',
  app_index int(11) NOT NULL default '0',
  mes_index int(11) NOT NULL default '0',
  rdv_index int(11) NOT NULL default '0',
  jrn_index int(11) NOT NULL default '0',
  att_index int(11) NOT NULL default '0',
  com_index int(11) NOT NULL default '0',
  PRIMARY KEY  (acj_index,acj_index),
  KEY con_index (con_index),
  KEY ope_index (ope_index),
  KEY act_index (act_index),
  KEY app_index (app_index),
  KEY mes_index (mes_index),
  KEY rdv_index (rdv_index),
  KEY jrn_index (jrn_index),
  KEY att_index (att_index),
  KEY com_index (com_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `agence_client`
--

DROP TABLE IF EXISTS agence_client;
CREATE TABLE agence_client (
  ag_index int(11) NOT NULL default '1',
  ag_nom_agence varchar(50) default NULL,
  ag_adresse1 varchar(100) default NULL,
  ag_adresse2 varchar(100) default NULL,
  ag_ville varchar(100) default NULL,
  cp_index int(11) default NULL,
  pay_index int(11) default NULL,
  ag_tel varchar(30) default NULL,
  ag_fax varchar(30) default NULL,
  ag_email varchar(50) default NULL,
  ag_date_creation date default NULL,
  PRIMARY KEY  (ag_index),
  KEY ag_nom_agence (ag_nom_agence)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `appels`
--

DROP TABLE IF EXISTS appels;
CREATE TABLE appels (
  app_index int(11) NOT NULL auto_increment,
  app_objet varchar(200) default NULL,
  app_contenu varchar(255) default NULL,
  app_date_appel date default NULL,
  app_date_rappel date default NULL,
  cli_index int(11) NOT NULL default '0',
  app_rappele smallint(1) NOT NULL default '0',
  app_minutes int(11) NOT NULL default '0',
  PRIMARY KEY  (app_index),
  KEY app_objet (app_objet),
  KEY app_date_rappel (app_date_rappel)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS articles;
CREATE TABLE articles (
  art_index int(11) NOT NULL auto_increment,
  art_fichier varchar(250) default NULL,
  art_titarticle varchar(200) default NULL,
  art_sujet varchar(255) default NULL,
  tar_index int(11) NOT NULL default '0',
  art_numpage smallint(6) default NULL,
  tai_index int(11) NOT NULL default '0',
  art_illustration varchar(50) default NULL,
  art_journaliste varchar(50) default NULL,
  art_date_parution date default NULL,
  art_selectionne char(3) NOT NULL default 'OUI',
  sco_index int(11) NOT NULL default '0',
  sou_index int(11) NOT NULL default '0',
  art_equivalent_pub double default NULL,
  cat_index int(11) NOT NULL default '0',
  art_bestoff char(3) NOT NULL default 'NON',
  art_remarques varchar(255) default NULL,
  art_dmaj date default NULL,
  tit_index int(11) default NULL,
  art_refus tinyint(1) NOT NULL default '0',
  art_date_refus date default NULL,
  ter_index int(11) NOT NULL default '0',
  fou_index int(11) NOT NULL default '0',
  sch_index int(11) NOT NULL default '0',
  ope_index int(11) NOT NULL default '0',
  art_heure datetime default NULL,
  art_duree datetime default NULL,
  art_qualifie char(3) NOT NULL default 'NON',
  art_vu char(3) NOT NULL default 'NON',
  art_nbphotos int(11) default NULL,
  cli_index int(11) NOT NULL default '0',
  jrn_index int(11) NOT NULL default '0',
  PRIMARY KEY  (art_index),
  KEY art_titarticle (art_titarticle),
  KEY jrn_index (jrn_index),
  KEY cli_index (cli_index),
  KEY tar_index (tar_index),
  KEY tai_index (tai_index),
  KEY sou_index (sou_index),
  KEY cat_index (cat_index),
  KEY tit_index (tit_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `attachees`
--

DROP TABLE IF EXISTS attachees;
CREATE TABLE attachees (
  att_index int(11) NOT NULL auto_increment,
  att_nom varchar(100) default NULL,
  att_prenom varchar(100) default NULL,
  att_remarques varchar(255) default NULL,
  att_login varchar(50) default NULL,
  att_pw varchar(50) default NULL,
  att_email varchar(100) NOT NULL default '',
  att_tel varchar(100) NOT NULL default '',
  att_fax varchar(100) NOT NULL default '',
  ag_index int(11) default '1',
  att_droits int(11) NOT NULL default '0',
  att_cout_horaire double NOT NULL default '0',
  PRIMARY KEY  (att_index,att_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `calendrier`
--

DROP TABLE IF EXISTS calendrier;
CREATE TABLE calendrier (
  id int(11) NOT NULL auto_increment,
  jour date default NULL,
  heure time default NULL,
  sujet varchar(30) default NULL,
  commentaire text,
  lieu varchar(20) default NULL,
  PRIMARY KEY  (id)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS categories;
CREATE TABLE categories (
  cat_index int(11) NOT NULL default '0',
  cat_libelle varchar(100) default NULL,
  PRIMARY KEY  (cat_index),
  UNIQUE KEY cat_libelle (cat_libelle)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `cibles`
--

DROP TABLE IF EXISTS cibles;
CREATE TABLE cibles (
  cib_index int(11) NOT NULL default '0',
  cib_libelle varchar(100) default NULL,
  cib_date_creation date default NULL,
  cib_pigiste tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (cib_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS clients;
CREATE TABLE clients (
  cli_index int(11) NOT NULL default '0',
  cli_nom_societe varchar(100) default NULL,
  cli_adresse1 varchar(100) default NULL,
  cli_adresse2 varchar(100) default NULL,
  cli_ville varchar(50) default NULL,
  cp_index varchar(50) NOT NULL default '',
  pay_index int(11) NOT NULL default '0',
  cli_tel varchar(30) default NULL,
  cli_fax varchar(30) default NULL,
  cli_email varchar(100) default NULL,
  cli_remarques varchar(255) default NULL,
  cli_debut_contrat date default NULL,
  cli_fin_contrat date default NULL,
  sec_index int(11) NOT NULL default '0',
  cli_date_creation datetime default NULL,
  cli_web varchar(200) default NULL,
  att_index int(11) NOT NULL default '0',
  old_code int(11) default NULL,
  PRIMARY KEY  (cli_index,cli_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `codepostal`
--

DROP TABLE IF EXISTS codepostal;
CREATE TABLE codepostal (
  cp_index varchar(5) default NULL,
  cp_ville varchar(50) default NULL,
  pay_index int(11) default NULL
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `communiques`
--

DROP TABLE IF EXISTS communiques;
CREATE TABLE communiques (
  com_index int(11) NOT NULL auto_increment,
  com_libelle varchar(200) default NULL,
  com_description mediumtext,
  cib_index int(11) NOT NULL default '0',
  com_objet varchar(200) default NULL,
  com_body text,
  cli_index int(11) NOT NULL default '0',
  com_date_creation date default NULL,
  ope_index int(11) NOT NULL default '0',
  act_index int(11) NOT NULL default '0',
  com_fichiers varchar(200) default NULL,
  image1 varchar(200) NOT NULL default '',
  image2 varchar(200) NOT NULL default '',
  com_format varchar(10) NOT NULL default 'html',
  com_date_de_rappel date NOT NULL default '0000-00-00',
  com_rappele smallint(1) NOT NULL default '0',
  com_heures int(11) NOT NULL default '0',
  com_minutes int(11) NOT NULL default '0',
  PRIMARY KEY  (com_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `compteur_pdf`
--

DROP TABLE IF EXISTS compteur_pdf;
CREATE TABLE compteur_pdf (
  numpdf int(11) NOT NULL default '0',
  id int(11) default NULL,
  PRIMARY KEY  (numpdf),
  KEY id (id)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS contacts;
CREATE TABLE contacts (
  con_index int(11) NOT NULL default '0',
  cli_index int(11) NOT NULL default '0',
  con_prenom varchar(100) default NULL,
  con_nom varchar(100) default NULL,
  con_adresse1 varchar(100) default NULL,
  con_adresse2 varchar(100) default NULL,
  con_ville varchar(50) default NULL,
  cp_index varchar(20) NOT NULL default '0',
  pay_index int(11) NOT NULL default '0',
  con_tel varchar(100) default NULL,
  con_tel_perso varchar(100) default NULL,
  con_portable varchar(50) default NULL,
  con_fax varchar(30) default NULL,
  con_fax_perso varchar(100) default NULL,
  con_email varchar(50) default NULL,
  con_remarques varchar(255) default NULL,
  fen_index int(11) NOT NULL default '0',
  con_genre varchar(5) default NULL,
  PRIMARY KEY  (con_index),
  KEY con_nom (con_nom),
  KEY con_prenom (con_prenom),
  KEY cli_index (cli_index),
  KEY fen_index (fen_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `critere2`
--

DROP TABLE IF EXISTS critere2;
CREATE TABLE critere2 (
  cr2_index int(11) NOT NULL default '0',
  critere2 varchar(50) default NULL,
  PRIMARY KEY  (cr2_index),
  KEY critere2 (critere2)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `ent_fonctions`
--

DROP TABLE IF EXISTS ent_fonctions;
CREATE TABLE ent_fonctions (
  fen_index int(11) NOT NULL default '0',
  fen_libelle varchar(100) default NULL,
  PRIMARY KEY  (fen_index),
  UNIQUE KEY fen_libelle (fen_libelle)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `etats`
--

DROP TABLE IF EXISTS etats;
CREATE TABLE etats (
  eta_index int(4) NOT NULL auto_increment,
  eta_nom_etat char(50) default NULL,
  eta_source_etat char(50) default NULL,
  eta_libelle0 char(50) default NULL,
  eta_libelle1 char(50) default NULL,
  eta_entete00 char(50) default NULL,
  eta_larg00 int(4) NOT NULL default '0',
  eta_type00 char(50) default NULL,
  eta_tri00 tinyint(1) default NULL,
  eta_var00 char(50) default NULL,
  eta_entete01 char(50) default NULL,
  eta_larg01 int(4) NOT NULL default '0',
  eta_type01 char(50) default NULL,
  eta_tri01 tinyint(1) default NULL,
  eta_var01 char(50) default NULL,
  eta_entete02 char(50) default NULL,
  eta_larg02 int(4) NOT NULL default '0',
  eta_type02 char(50) default NULL,
  eta_tri02 tinyint(1) default NULL,
  eta_var02 char(50) default NULL,
  eta_entete03 char(50) default NULL,
  eta_larg03 int(4) NOT NULL default '0',
  eta_type03 char(50) default NULL,
  eta_tri03 tinyint(1) default NULL,
  eta_var03 char(50) default NULL,
  eta_entete04 char(50) default NULL,
  eta_larg04 int(4) NOT NULL default '0',
  eta_type04 char(50) default NULL,
  eta_tri04 tinyint(1) default NULL,
  eta_var04 char(50) default NULL,
  eta_entete05 char(50) default NULL,
  eta_larg05 int(4) NOT NULL default '0',
  eta_type05 char(50) default NULL,
  eta_tri05 tinyint(1) default NULL,
  eta_var05 char(50) default NULL,
  eta_entete06 char(50) default NULL,
  eta_larg06 int(4) NOT NULL default '0',
  eta_type06 char(50) default NULL,
  eta_tri06 tinyint(1) default NULL,
  eta_var06 char(50) default NULL,
  eta_entete07 char(50) default NULL,
  eta_larg07 int(4) NOT NULL default '0',
  eta_type07 char(50) default NULL,
  eta_tri07 tinyint(1) default NULL,
  eta_var07 char(50) default NULL,
  eta_entete08 char(50) default NULL,
  eta_larg08 int(4) NOT NULL default '0',
  eta_type08 char(50) default NULL,
  eta_tri08 tinyint(1) default NULL,
  eta_var08 char(50) default NULL,
  eta_entete09 char(50) default NULL,
  eta_larg09 int(4) NOT NULL default '0',
  eta_type09 char(50) default NULL,
  eta_tri09 tinyint(1) default NULL,
  eta_var09 char(50) default NULL,
  eta_entete10 char(50) default NULL,
  eta_larg10 int(4) NOT NULL default '0',
  eta_type10 char(50) default NULL,
  eta_tri10 tinyint(1) default NULL,
  eta_var10 char(50) default NULL,
  eta_entete11 char(50) default NULL,
  eta_larg11 int(4) NOT NULL default '0',
  eta_type11 char(50) default NULL,
  eta_tri11 tinyint(1) default NULL,
  eta_var11 char(50) default NULL,
  eta_entete12 char(50) default NULL,
  eta_larg12 int(4) NOT NULL default '0',
  eta_type12 char(50) default NULL,
  eta_tri12 tinyint(1) default NULL,
  eta_var12 char(50) default NULL,
  eta_dmaj date default NULL,
  PRIMARY KEY  (eta_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `evenements`
--

DROP TABLE IF EXISTS evenements;
CREATE TABLE evenements (
  eve_index int(4) NOT NULL auto_increment,
  eve_objet varchar(200) default NULL,
  eve_contenu text,
  eve_date_eve date default NULL,
  eve_date_rappel date default NULL,
  eve_lieu varchar(100) default NULL,
  cli_index int(11) NOT NULL default '0',
  PRIMARY KEY  (eve_index),
  KEY eve_date_rappel (eve_date_rappel),
  KEY eve_date_eve (eve_date_eve)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `evenements_journalistes`
--

DROP TABLE IF EXISTS evenements_journalistes;
CREATE TABLE evenements_journalistes (
  evj_index int(4) NOT NULL auto_increment,
  jrn_index int(4) NOT NULL default '0',
  eve_index int(4) NOT NULL default '0',
  evj_present char(3) default 'OUI',
  PRIMARY KEY  (evj_index),
  UNIQUE KEY eve_index_2 (eve_index,jrn_index),
  KEY eve_index (eve_index),
  KEY jrn_index (jrn_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `familles`
--

DROP TABLE IF EXISTS familles;
CREATE TABLE familles (
  fam_index int(11) NOT NULL default '0',
  cli_index int(11) NOT NULL default '0',
  fam_libelle varchar(100) default NULL,
  fam_dmaj datetime default NULL,
  PRIMARY KEY  (fam_index),
  KEY cli_index (cli_index),
  KEY fam_libelle (fam_libelle)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `familles_articles`
--

DROP TABLE IF EXISTS familles_articles;
CREATE TABLE familles_articles (
  far_index int(11) NOT NULL default '0',
  art_index int(11) NOT NULL default '0',
  fam_index int(11) NOT NULL default '0',
  Produit varchar(100) default NULL,
  PRIMARY KEY  (far_index),
  KEY Produit (Produit),
  KEY art_index (art_index),
  KEY fam_index (fam_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `fournisseurs`
--

DROP TABLE IF EXISTS fournisseurs;
CREATE TABLE fournisseurs (
  fou_index int(11) NOT NULL default '0',
  fou_nom varchar(100) default NULL,
  fou_profil_production varchar(100) default NULL,
  fou_email_production varchar(100) default NULL,
  fou_profil_qualite varchar(100) default NULL,
  fou_email_qualite varchar(100) default NULL,
  fou_pu_article double NOT NULL default '0',
  PRIMARY KEY  (fou_index),
  UNIQUE KEY fou_nom (fou_nom)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `groupe_presse`
--

DROP TABLE IF EXISTS groupe_presse;
CREATE TABLE groupe_presse (
  gpr_index int(11) NOT NULL default '0',
  gpr_libelle varchar(100) default NULL,
  PRIMARY KEY  (gpr_index),
  UNIQUE KEY gpr_libelle (gpr_libelle)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `groupement`
--

DROP TABLE IF EXISTS groupement;
CREATE TABLE groupement (
  gro_index int(11) NOT NULL default '0',
  gro_libelle varchar(100) default NULL,
  PRIMARY KEY  (gro_index),
  UNIQUE KEY gro_libelle (gro_libelle)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `journalistes`
--

DROP TABLE IF EXISTS journalistes;
CREATE TABLE journalistes (
  jrn_index int(11) NOT NULL default '0',
  jrn_prenom varchar(100) default NULL,
  jrn_nom varchar(100) default NULL,
  jrn_tel_direct varchar(50) default NULL,
  jrn_email varchar(50) default NULL,
  jrn_remarques varchar(255) default NULL,
  jfo_index int(11) NOT NULL default '0',
  jrn_genre varchar(5) default NULL,
  jrn_fax_direct varchar(50) default NULL,
  jrn_portable varchar(50) default NULL,
  jrn_adresse1 varchar(100) default NULL,
  jrn_adresse2 varchar(100) default NULL,
  cp_index varchar(20) NOT NULL default '',
  jrn_ville varchar(100) default NULL,
  pay_index int(11) NOT NULL default '0',
  jrn_tel_perso varchar(50) default NULL,
  jrn_fax_perso varchar(50) default NULL,
  jrn_email_perso varchar(50) default NULL,
  jrn_envoi_courrier_dom char(3) default 'NON',
  jrn_email_dom char(3) default 'NON',
  jrn_info_livraison varchar(50) default NULL,
  jrn_dmaj date default NULL,
  jrn_pigiste char(3) default 'NON',
  lan_index int(11) NOT NULL default '0',
  tit_index int(11) NOT NULL default '0',
  PRIMARY KEY  (jrn_index),
  KEY jrn_nom (jrn_nom),
  KEY jrn_prenom (jrn_prenom),
  KEY jfo_index (jfo_index),
  KEY cp_index (cp_index),
  KEY lan_index (lan_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `jrn_fonctions`
--

DROP TABLE IF EXISTS jrn_fonctions;
CREATE TABLE jrn_fonctions (
  jfo_index int(11) NOT NULL default '0',
  jfo_libelle varchar(100) default NULL,
  jfo_ordre int(11) default NULL,
  PRIMARY KEY  (jfo_index),
  UNIQUE KEY jfo_libelle (jfo_libelle)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `langues`
--

DROP TABLE IF EXISTS langues;
CREATE TABLE langues (
  lan_index int(11) NOT NULL default '0',
  lan_libelle varchar(100) NOT NULL default '',
  PRIMARY KEY  (lan_index),
  KEY lan_libelle (lan_libelle)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `liste_cibles_journalistes`
--

DROP TABLE IF EXISTS liste_cibles_journalistes;
CREATE TABLE liste_cibles_journalistes (
  lcj_index int(11) unsigned NOT NULL auto_increment,
  jrn_index int(11) unsigned NOT NULL default '0',
  cib_index int(11) unsigned NOT NULL default '0',
  lcj_case int(1) NOT NULL default '1',
  PRIMARY KEY  (lcj_index),
  UNIQUE KEY jrn_index_2 (jrn_index,cib_index),
  KEY cib_index (cib_index),
  KEY jrn_index (jrn_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `mess_contacts`
--

DROP TABLE IF EXISTS mess_contacts;
CREATE TABLE mess_contacts (
  mec_index int(11) NOT NULL default '0',
  con_index int(11) NOT NULL default '0',
  ope_index int(11) NOT NULL default '0',
  act_index int(11) NOT NULL default '0',
  mes_index int(11) NOT NULL default '0',
  PRIMARY KEY  (mec_index),
  KEY con_index (con_index),
  KEY ope_index (ope_index),
  KEY act_index (act_index),
  KEY mes_index (mes_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `mess_jrn`
--

DROP TABLE IF EXISTS mess_jrn;
CREATE TABLE mess_jrn (
  mej_index int(11) NOT NULL default '0',
  jrn_index int(11) NOT NULL default '0',
  ope_index int(11) NOT NULL default '0',
  act_index int(11) NOT NULL default '0',
  mes_index int(11) NOT NULL default '0',
  PRIMARY KEY  (mej_index),
  KEY jrn_index (jrn_index),
  KEY ope_index (ope_index),
  KEY act_index (act_index),
  KEY mes_index (mes_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS messages;
CREATE TABLE messages (
  mes_index int(11) NOT NULL auto_increment,
  mes_date_envoi date default NULL,
  mes_dest varchar(200) default NULL,
  mes_cc varchar(200) default NULL,
  mes_objet varchar(200) default NULL,
  mes_body text,
  mes_fichiers varchar(200) default NULL,
  mes_email_entrant tinyint(1) NOT NULL default '0',
  cli_index int(11) NOT NULL default '0',
  mes_from varchar(200) default NULL,
  com_index int(11) NOT NULL default '0',
  mes_minutes int(11) NOT NULL default '0',
  PRIMARY KEY  (mes_index),
  KEY mes_index (mes_index),
  KEY com_index (com_index),
  KEY cli_index (cli_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `motsclef`
--

DROP TABLE IF EXISTS motsclef;
CREATE TABLE motsclef (
  mot_index int(11) NOT NULL default '0',
  cli_index varchar(100) NOT NULL default '',
  mot varchar(100) default NULL,
  PRIMARY KEY  (mot_index),
  KEY mot (mot),
  KEY cli_index (cli_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `motsclef_articles`
--

DROP TABLE IF EXISTS motsclef_articles;
CREATE TABLE motsclef_articles (
  mar_index int(11) NOT NULL default '0',
  mot_index varchar(100) NOT NULL default '',
  art_index int(11) NOT NULL default '0',
  cli_index int(11) NOT NULL default '0',
  PRIMARY KEY  (mar_index),
  KEY mot_index (mot_index),
  KEY art_index (art_index),
  KEY cli_index (cli_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `operations`
--

DROP TABLE IF EXISTS operations;
CREATE TABLE operations (
  ope_index int(11) NOT NULL default '0',
  ope_libelle varchar(100) default NULL,
  cli_index int(11) NOT NULL default '0',
  ope_date_debut date default NULL,
  ope_date_fin date default NULL,
  att_index int(11) NOT NULL default '0',
  ope_remarques varchar(255) default NULL,
  PRIMARY KEY  (ope_index),
  KEY ope_libelle (ope_libelle),
  KEY cli_index (cli_index),
  KEY att_index (att_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `operations_journalistes`
--

DROP TABLE IF EXISTS operations_journalistes;
CREATE TABLE operations_journalistes (
  opj_index int(11) NOT NULL default '0',
  jrn_index int(11) NOT NULL default '0',
  ope_index int(11) NOT NULL default '0',
  opj_Present tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (opj_index),
  KEY opj_Present (opj_Present),
  KEY ope_index (ope_index),
  KEY jrn_index (jrn_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `origines`
--

DROP TABLE IF EXISTS origines;
CREATE TABLE origines (
  ori_index int(11) NOT NULL default '0',
  ori_libelle varchar(100) default NULL,
  PRIMARY KEY  (ori_index),
  UNIQUE KEY ori_libelle (ori_libelle)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `pays`
--

DROP TABLE IF EXISTS pays;
CREATE TABLE pays (
  pay_index int(11) NOT NULL default '0',
  pay_codepays varchar(10) NOT NULL default '',
  pay_nompays varchar(100) NOT NULL default '',
  lan_index int(11) default NULL
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `periodicite`
--

DROP TABLE IF EXISTS periodicite;
CREATE TABLE periodicite (
  per_index int(11) NOT NULL default '0',
  per_libelle varchar(20) default NULL,
  PRIMARY KEY  (per_index),
  UNIQUE KEY per_libelle (per_libelle)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `planning_redac`
--

DROP TABLE IF EXISTS planning_redac;
CREATE TABLE planning_redac (
  pla_index int(11) NOT NULL auto_increment,
  tit_index int(11) NOT NULL default '0',
  jrn_index int(11) NOT NULL default '0',
  pla_sujet varchar(250) NOT NULL default '',
  pla_contenu text NOT NULL,
  pla_date_bouclage date NOT NULL default '0000-00-00',
  pla_date_sortie date NOT NULL default '0000-00-00',
  cli_index int(11) NOT NULL default '0',
  UNIQUE KEY pla_index (pla_index),
  KEY tit_index (tit_index),
  KEY jrn_index (jrn_index),
  KEY cli_index (cli_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `plannings_societes`
--

DROP TABLE IF EXISTS plannings_societes;
CREATE TABLE plannings_societes (
  pls_index int(11) NOT NULL default '0',
  pla_index int(11) NOT NULL default '0',
  cli_index int(11) NOT NULL default '0',
  PRIMARY KEY  (pls_index),
  KEY pla_index (pla_index),
  KEY cli_index (cli_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `prets`
--

DROP TABLE IF EXISTS prets;
CREATE TABLE prets (
  pre_index int(11) NOT NULL auto_increment,
  pro_index int(11) NOT NULL default '0',
  cli_index int(11) NOT NULL default '0',
  pre_date date NOT NULL default '0000-00-00',
  pre_date_retour date NOT NULL default '0000-00-00',
  jrn_index int(11) NOT NULL default '0',
  pre_remarques text NOT NULL,
  pre_rendu char(3) NOT NULL default 'NON',
  PRIMARY KEY  (pre_index),
  KEY pro_index (pro_index),
  KEY cli_index (cli_index),
  KEY jrn_index (jrn_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `produits`
--

DROP TABLE IF EXISTS produits;
CREATE TABLE produits (
  pro_index int(11) NOT NULL auto_increment,
  fam_index int(11) default NULL,
  pro_libelle varchar(100) default NULL,
  pro_detail text,
  cli_index int(11) NOT NULL default '0',
  UNIQUE KEY pro_index (pro_index),
  KEY fam_index (fam_index),
  KEY cli_index (cli_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `prospects`
--

DROP TABLE IF EXISTS prospects;
CREATE TABLE prospects (
  cli_index int(11) NOT NULL auto_increment,
  cli_nom varchar(100) NOT NULL default '',
  cli_prenom varchar(100) NOT NULL default '',
  cli_tel varchar(50) NOT NULL default '',
  cli_email varchar(100) NOT NULL default '',
  cli_societe varchar(100) NOT NULL default '',
  cli_type varchar(5) NOT NULL default 'IPC',
  cli_cg varchar(100) NOT NULL default '',
  UNIQUE KEY cli_index (cli_index,cli_nom,cli_email,cli_societe),
  KEY cli_type (cli_type)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `rdvs`
--

DROP TABLE IF EXISTS rdvs;
CREATE TABLE rdvs (
  rdv_index int(11) NOT NULL auto_increment,
  rdv_objet varchar(200) default NULL,
  rdv_contenu mediumtext,
  rdv_date_rdv date default NULL,
  rdv_date_rappel date default NULL,
  rdv_lieu varchar(100) default NULL,
  cli_index int(11) NOT NULL default '0',
  rdv_rappele smallint(1) NOT NULL default '0',
  rdv_heures int(11) NOT NULL default '0',
  rdv_minutes int(11) NOT NULL default '0',
  PRIMARY KEY  (rdv_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `rubriques`
--

DROP TABLE IF EXISTS rubriques;
CREATE TABLE rubriques (
  rub_index int(11) NOT NULL default '0',
  rub_libelle varchar(100) default NULL,
  PRIMARY KEY  (rub_index),
  UNIQUE KEY rub_libelle (rub_libelle)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `rubriques_journalistes`
--

DROP TABLE IF EXISTS rubriques_journalistes;
CREATE TABLE rubriques_journalistes (
  rjo_index int(11) NOT NULL default '0',
  jrn_index int(11) NOT NULL default '0',
  rub_index int(11) NOT NULL default '0',
  PRIMARY KEY  (rjo_index),
  UNIQUE KEY jrn_index_2 (jrn_index,rub_index),
  KEY jrn_index (jrn_index),
  KEY rub_index (rub_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `schemas_redac`
--

DROP TABLE IF EXISTS schemas_redac;
CREATE TABLE schemas_redac (
  sch_index int(11) NOT NULL default '0',
  sch_libelle varchar(100) default NULL,
  PRIMARY KEY  (sch_index),
  KEY sch_libelle (sch_libelle)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `scoring`
--

DROP TABLE IF EXISTS scoring;
CREATE TABLE scoring (
  sco_index int(11) NOT NULL default '0',
  sco_libelle varchar(200) default NULL,
  PRIMARY KEY  (sco_index),
  UNIQUE KEY sco_libelle (sco_libelle)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `secteurs`
--

DROP TABLE IF EXISTS secteurs;
CREATE TABLE secteurs (
  sec_index int(11) NOT NULL default '0',
  sec_libelle varchar(255) default NULL,
  PRIMARY KEY  (sec_index),
  UNIQUE KEY sec_libelle (sec_libelle)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `sources`
--

DROP TABLE IF EXISTS sources;
CREATE TABLE sources (
  sou_index int(11) NOT NULL default '0',
  sou_libelle varchar(100) default NULL,
  PRIMARY KEY  (sou_index),
  UNIQUE KEY sou_libelle (sou_libelle)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `taches`
--

DROP TABLE IF EXISTS taches;
CREATE TABLE taches (
  tac_index int(11) NOT NULL auto_increment,
  tac_libelle varchar(250) NOT NULL default '',
  tac_date date NOT NULL default '0000-00-00',
  tac_realise int(1) NOT NULL default '0',
  att_index int(11) NOT NULL default '0',
  tac_objet varchar(200) NOT NULL default '',
  tac_origine varchar(20) NOT NULL default '',
  PRIMARY KEY  (tac_index),
  KEY att_index (att_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `tailles_articles`
--

DROP TABLE IF EXISTS tailles_articles;
CREATE TABLE tailles_articles (
  tai_index int(11) NOT NULL default '0',
  tai_libelle varchar(100) default NULL,
  PRIMARY KEY  (tai_index),
  UNIQUE KEY tai_libelle (tai_libelle)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `titres`
--

DROP TABLE IF EXISTS titres;
CREATE TABLE titres (
  tit_index int(11) NOT NULL default '0',
  tit_titcourt varchar(100) NOT NULL default '',
  tit_titlong varchar(80) NOT NULL default '',
  tit_adress1 varchar(80) default NULL,
  tit_adress2 varchar(80) default NULL,
  cp_index varchar(5) NOT NULL default '',
  tit_ville varchar(50) default NULL,
  tit_tel varchar(20) default NULL,
  tit_fax varchar(20) default NULL,
  gpr_index int(11) NOT NULL default '0',
  pay_index int(11) NOT NULL default '0',
  tit_diffusion float default NULL,
  per_index int(11) NOT NULL default '0',
  tit_web varchar(100) default NULL,
  tit_email varchar(100) default NULL,
  tit_dmaj date default NULL,
  tpr_index int(11) NOT NULL default '0',
  ori_index int(11) NOT NULL default '0',
  tit_jour_sortie varchar(50) default NULL,
  tit_date_creation date default NULL,
  gro_index int(11) NOT NULL default '0',
  lan_index int(11) NOT NULL default '0',
  tit_remarques varchar(255) default NULL,
  PRIMARY KEY  (tit_index),
  UNIQUE KEY tit_titlong (tit_titlong),
  KEY cp_index (cp_index),
  KEY gpr_index (gpr_index),
  KEY pay_index (pay_index),
  KEY per_index (per_index),
  KEY tpr_index (tpr_index),
  KEY ori_index (ori_index),
  KEY gro_index (gro_index),
  KEY lan_index (lan_index),
  KEY tit_titcourt (tit_titcourt)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `titres_journalistes`
--

DROP TABLE IF EXISTS titres_journalistes;
CREATE TABLE titres_journalistes (
  tij_index int(11) NOT NULL auto_increment,
  jrn_index int(11) NOT NULL default '0',
  tit_index int(11) NOT NULL default '0',
  tij_principal char(3) NOT NULL default 'NON',
  PRIMARY KEY  (tij_index),
  UNIQUE KEY jrn_index_2 (jrn_index,tit_index),
  UNIQUE KEY jrn_index_3 (jrn_index,tit_index),
  KEY jrn_index (jrn_index),
  KEY tit_index (tit_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `type_erreur`
--

DROP TABLE IF EXISTS type_erreur;
CREATE TABLE type_erreur (
  ter_index int(11) NOT NULL default '0',
  ter_libelle varchar(100) default NULL,
  PRIMARY KEY  (ter_index),
  UNIQUE KEY ter_libelle (ter_libelle)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `types_articles`
--

DROP TABLE IF EXISTS types_articles;
CREATE TABLE types_articles (
  tar_index int(11) NOT NULL default '0',
  tar_libelle varchar(100) default NULL,
  PRIMARY KEY  (tar_index),
  UNIQUE KEY tar_libelle (tar_libelle)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `types_presse`
--

DROP TABLE IF EXISTS types_presse;
CREATE TABLE types_presse (
  tpr_index int(11) NOT NULL default '0',
  tpr_libelle varchar(100) NOT NULL default '',
  PRIMARY KEY  (tpr_index),
  UNIQUE KEY tpr_libelle (tpr_libelle)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `zcible_cp`
--

DROP TABLE IF EXISTS zcible_cp;
CREATE TABLE zcible_cp (
  id int(11) NOT NULL auto_increment,
  cp_index int(11) NOT NULL default '0',
  cib_index int(11) NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY cp_index (cp_index),
  KEY cib_index (cib_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `zcible_exclus`
--

DROP TABLE IF EXISTS zcible_exclus;
CREATE TABLE zcible_exclus (
  id int(11) NOT NULL auto_increment,
  jrn_index int(11) NOT NULL default '0',
  cib_index int(11) NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY cib_index (cib_index),
  KEY jrn_index (jrn_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `zcible_fonctions`
--

DROP TABLE IF EXISTS zcible_fonctions;
CREATE TABLE zcible_fonctions (
  id int(11) NOT NULL auto_increment,
  jfo_index int(11) NOT NULL default '0',
  cib_index int(11) NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY jfo_index (jfo_index),
  KEY cib_index (cib_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `zcible_journalistes`
--

DROP TABLE IF EXISTS zcible_journalistes;
CREATE TABLE zcible_journalistes (
  id int(11) NOT NULL auto_increment,
  jrn_index int(11) NOT NULL default '0',
  cib_index int(11) NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY jrn_index (jrn_index),
  KEY cib_index (cib_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `zcible_origines`
--

DROP TABLE IF EXISTS zcible_origines;
CREATE TABLE zcible_origines (
  id int(11) NOT NULL auto_increment,
  ori_index int(11) NOT NULL default '0',
  cib_index int(11) NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY ori_index (ori_index),
  KEY cib_index (cib_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `zcible_pays`
--

DROP TABLE IF EXISTS zcible_pays;
CREATE TABLE zcible_pays (
  id int(11) NOT NULL auto_increment,
  pay_index int(11) NOT NULL default '0',
  cib_index int(11) NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY pay_index (pay_index),
  KEY cib_index (cib_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `zcible_periodicite`
--

DROP TABLE IF EXISTS zcible_periodicite;
CREATE TABLE zcible_periodicite (
  id int(11) NOT NULL auto_increment,
  per_index int(11) NOT NULL default '0',
  cib_index int(11) NOT NULL default '0',
  PRIMARY KEY  (id,id),
  KEY per_index (per_index),
  KEY cib_index (cib_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `zcible_rubriques`
--

DROP TABLE IF EXISTS zcible_rubriques;
CREATE TABLE zcible_rubriques (
  id int(11) NOT NULL auto_increment,
  rub_index int(11) NOT NULL default '0',
  cib_index int(11) NOT NULL default '0',
  PRIMARY KEY  (id,id),
  KEY rub_index (rub_index),
  KEY cib_index (cib_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `zcible_secteurs`
--

DROP TABLE IF EXISTS zcible_secteurs;
CREATE TABLE zcible_secteurs (
  id int(11) NOT NULL auto_increment,
  sec_index int(11) NOT NULL default '0',
  cib_index int(11) NOT NULL default '0',
  PRIMARY KEY  (id)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `zcible_situations`
--

DROP TABLE IF EXISTS zcible_situations;
CREATE TABLE zcible_situations (
  id int(11) NOT NULL auto_increment,
  gro_index int(11) NOT NULL default '0',
  cib_index int(11) NOT NULL default '0',
  PRIMARY KEY  (id,id),
  KEY cib_index (cib_index),
  KEY gro_index (gro_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `zcible_titres`
--

DROP TABLE IF EXISTS zcible_titres;
CREATE TABLE zcible_titres (
  id int(11) NOT NULL auto_increment,
  tit_index int(11) NOT NULL default '0',
  cib_index int(11) NOT NULL default '0',
  PRIMARY KEY  (id,id),
  KEY tit_index (tit_index),
  KEY cib_index (cib_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `zcible_type_presse`
--

DROP TABLE IF EXISTS zcible_type_presse;
CREATE TABLE zcible_type_presse (
  id int(11) NOT NULL auto_increment,
  tpr_index int(11) NOT NULL default '0',
  cib_index int(11) NOT NULL default '0',
  PRIMARY KEY  (id,id),
  KEY tpr_index (tpr_index),
  KEY cib_index (cib_index)
) TYPE=MyISAM CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;

