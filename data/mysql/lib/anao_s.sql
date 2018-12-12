-- MySQL dump 10.2
--
-- Host: localhost    Database: anao
-- ------------------------------------------------------
-- Server version	4.1.0-alpha-Max

/*!40101 SET NAMES latin1*/;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=NO_AUTO_VALUE_ON_ZERO */;

--
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS albums;
CREATE TABLE albums (
  al_index int(11) NOT NULL default '0',
  al_title varchar(255) NOT NULL default ''
) TYPE=MyISAM CHARSET=latin1;

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
-- Table structure for table `archives`
--

DROP TABLE IF EXISTS archives;
CREATE TABLE archives (
  id int(11) NOT NULL auto_increment,
  Messages text,
  Date date default NULL,
  Envois int(11) default NULL,
  Format varchar(5) default NULL,
  Sujet varchar(100) default NULL,
  PRIMARY KEY  (id)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS articles;
CREATE TABLE articles (
  ar_index int(11) NOT NULL default '1',
  ar_libelle varchar(255) NOT NULL default 'none',
  ar_auteur varchar(255) NOT NULL default 'none',
  ar_description text NOT NULL,
  ar_url varchar(255) NOT NULL default 'none',
  ar_date date NOT NULL default '1980-01-01',
  ar_heure time NOT NULL default '12:00:00',
  PRIMARY KEY  (ar_index)
) TYPE=MyISAM CHARSET=latin1;

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
-- Table structure for table `calendrier`
--

DROP TABLE IF EXISTS calendrier;
CREATE TABLE calendrier (
  id int(11) NOT NULL auto_increment,
  jour date default NULL,
  heure time default NULL,
  sujet varchar(100) default NULL,
  commentaire text,
  lieu varchar(100) default NULL,
  eve_index int(11) NOT NULL default '0',
  cli_index int(11) NOT NULL default '0',
  eve_document varchar(250) NOT NULL default '',
  eve_synthese varchar(250) NOT NULL default '',
  ste_index int(11) NOT NULL default '0',
  tra_index int(11) NOT NULL default '0',
  eve_extrait varchar(250) NOT NULL default '',
  ste_duree time default '00:00:00',
  tra_duree time default '00:00:00',
  PRIMARY KEY  (id),
  KEY cli_index (cli_index),
  KEY eve_index (eve_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `catalog`
--

DROP TABLE IF EXISTS catalog;
CREATE TABLE catalog (
  ct_index int(4) NOT NULL auto_increment,
  ct_title varchar(50) NOT NULL default '',
  ct_file varchar(255) NOT NULL default '',
  ct_author varchar(50) NOT NULL default '',
  ct_description text NOT NULL,
  ct_visits int(6) NOT NULL default '0',
  ct_price double(12,2) NOT NULL default '0.00',
  al_index int(11) NOT NULL default '1',
  KEY ct_index (ct_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `cib_criteres`
--

DROP TABLE IF EXISTS cib_criteres;
CREATE TABLE cib_criteres (
  cc_index int(11) NOT NULL auto_increment,
  cib_index int(11) NOT NULL default '0',
  crit_index int(11) NOT NULL default '0',
  PRIMARY KEY  (cc_index),
  KEY cib_index (cib_index),
  KEY crit_index (crit_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `cibles`
--

DROP TABLE IF EXISTS cibles;
CREATE TABLE cibles (
  cib_index int(11) NOT NULL default '0',
  cib_libelle varchar(100) default NULL,
  PRIMARY KEY  (cib_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `cli_con`
--

DROP TABLE IF EXISTS cli_con;
CREATE TABLE cli_con (
  cc_index int(11) NOT NULL auto_increment,
  cli_index int(11) default NULL,
  con_index int(11) NOT NULL default '0',
  PRIMARY KEY  (cc_index),
  KEY con_index (con_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `cli_crit`
--

DROP TABLE IF EXISTS cli_crit;
CREATE TABLE cli_crit (
  clcr_index int(11) NOT NULL auto_increment,
  cli_index int(11) NOT NULL default '0',
  crit_index int(11) NOT NULL default '0',
  PRIMARY KEY  (clcr_index),
  KEY cli_index (cli_index,crit_index)
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
  cli_cp varchar(20) NOT NULL default '',
  cli_pays varchar(50) NOT NULL default '0',
  cli_tel varchar(30) default NULL,
  cli_fax varchar(30) default NULL,
  cli_email varchar(100) default NULL,
  PRIMARY KEY  (cli_index,cli_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `con_crit`
--

DROP TABLE IF EXISTS con_crit;
CREATE TABLE con_crit (
  concl_index int(11) NOT NULL default '0',
  con_index int(11) NOT NULL default '0',
  crit_index int(11) NOT NULL default '0',
  PRIMARY KEY  (concl_index),
  KEY con_index (con_index,crit_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS contacts;
CREATE TABLE contacts (
  con_index int(11) NOT NULL auto_increment,
  con_prenom varchar(50) default NULL,
  con_nom varchar(50) default NULL,
  con_adresse1 varchar(255) default NULL,
  con_ville varchar(50) default NULL,
  con_cp varchar(20) default NULL,
  con_tel varchar(30) default NULL,
  con_tel_perso varchar(30) default NULL,
  con_email varchar(50) default NULL,
  con_portable varchar(30) default NULL,
  PRIMARY KEY  (con_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `critere_tab`
--

DROP TABLE IF EXISTS critere_tab;
CREATE TABLE critere_tab (
  tab_index int(11) NOT NULL auto_increment,
  tab_lib varchar(200) NOT NULL default '',
  tab_type varchar(10) NOT NULL default '',
  PRIMARY KEY  (tab_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `criteres`
--

DROP TABLE IF EXISTS criteres;
CREATE TABLE criteres (
  crit_index int(11) NOT NULL auto_increment,
  crit_lib varchar(200) NOT NULL default '',
  tab_index int(11) NOT NULL default '0',
  PRIMARY KEY  (crit_index)
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
-- Table structure for table `journalistes`
--

DROP TABLE IF EXISTS journalistes;
CREATE TABLE journalistes (
  jrn_index int(11) NOT NULL auto_increment,
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
-- Table structure for table `members`
--

DROP TABLE IF EXISTS members;
CREATE TABLE members (
  mbr_index int(11) NOT NULL auto_increment,
  mbr_nom varchar(50) NOT NULL default 'Sans nom',
  mbr_adr1 varchar(50) NOT NULL default 'Pas d''adresse',
  mbr_adr2 varchar(50) NOT NULL default '',
  cp_index int(11) NOT NULL default '75001',
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
  bl_index int(11) NOT NULL default '1',
  di_index varchar(8) NOT NULL default 'nisc',
  grp_group enum('administrator','manager','operator','moderator','user') NOT NULL default 'user',
  PRIMARY KEY  (me_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS messages;
CREATE TABLE messages (
  id int(11) NOT NULL default '0',
  Message_bienvenue text,
  Message_aurevoir text,
  Password varchar(20) default NULL,
  Login varchar(20) default NULL,
  PRIMARY KEY  (id)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS news;
CREATE TABLE news (
  nw_index int(11) NOT NULL default '1',
  nw_title varchar(255) NOT NULL default 'none',
  nw_author varchar(255) NOT NULL default 'none',
  nw_description text NOT NULL,
  nw_picture varchar(255) NOT NULL default 'none',
  nw_date date NOT NULL default '2003-12-08',
  nw_time time NOT NULL default '12:00:00',
  PRIMARY KEY  (nw_index)
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
  nl_time time NOT NULL default '12:00:00',
  PRIMARY KEY  (nl_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `newsltr_history`
--

DROP TABLE IF EXISTS newsltr_history;
CREATE TABLE newsltr_history (
  nh_index int(11) NOT NULL default '0',
  nh_sent enum('Y','N') NOT NULL default 'Y',
  nl_index int(11) NOT NULL default '0',
  sub_index int(11) NOT NULL default '0'
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
-- Table structure for table `parameters`
--

DROP TABLE IF EXISTS parameters;
CREATE TABLE parameters (
  par_index int(11) NOT NULL auto_increment,
  par_profile varchar(25) NOT NULL default '',
  par_page_back_color varchar(7) NOT NULL default '',
  par_page_text_color varchar(7) NOT NULL default '',
  par_page_link_color varchar(7) NOT NULL default '',
  par_page_alink_color varchar(7) NOT NULL default '',
  par_page_vlink_color varchar(7) NOT NULL default '',
  par_titlebar_back_color varchar(7) NOT NULL default '',
  par_titlebar_text_color varchar(7) NOT NULL default '',
  par_object_border_color varchar(7) NOT NULL default '',
  par_object_back_color varchar(7) NOT NULL default '',
  par_object_text_color varchar(7) NOT NULL default '',
  par_highlight_back_color varchar(7) NOT NULL default '',
  par_highlight_text_color varchar(7) NOT NULL default '',
  par_grid_even_back_color varchar(7) NOT NULL default '',
  par_grid_even_text_color varchar(7) NOT NULL default '',
  par_grid_odd_back_color varchar(7) NOT NULL default '',
  par_grid_odd_text_color varchar(7) NOT NULL default '',
  par_skin_model varchar(25) NOT NULL default '',
  par_apply_skin enum('N','Y') NOT NULL default 'N',
  PRIMARY KEY  (par_index)
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
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS photos;
CREATE TABLE photos (
  id int(4) NOT NULL auto_increment,
  file varchar(30) NOT NULL default '',
  idalbum int(3) NOT NULL default '0',
  album varchar(50) NOT NULL default '',
  title varchar(50) NOT NULL default '',
  author varchar(50) NOT NULL default '',
  descr text NOT NULL,
  visite int(6) NOT NULL default '0',
  prix double(12,2) NOT NULL default '0.00',
  UNIQUE KEY file (file),
  KEY id (id)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `prestations`
--

DROP TABLE IF EXISTS prestations;
CREATE TABLE prestations (
  nw_index int(11) NOT NULL default '1',
  nw_title varchar(255) NOT NULL default 'none',
  nw_author varchar(255) NOT NULL default 'none',
  nw_description text NOT NULL,
  nw_picture varchar(255) NOT NULL default 'none',
  nw_date date NOT NULL default '2003-12-08',
  nw_time time NOT NULL default '12:00:00',
  PRIMARY KEY  (nw_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `produits`
--

DROP TABLE IF EXISTS produits;
CREATE TABLE produits (
  nw_index int(11) NOT NULL default '1',
  nw_title varchar(255) NOT NULL default 'none',
  nw_author varchar(255) NOT NULL default 'none',
  nw_description text NOT NULL,
  nw_picture varchar(255) NOT NULL default 'none',
  nw_date date NOT NULL default '2003-12-08',
  nw_time time NOT NULL default '12:00:00',
  PRIMARY KEY  (nw_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `references`
--

DROP TABLE IF EXISTS references;
CREATE TABLE references (
  nw_index int(11) NOT NULL default '1',
  nw_title varchar(255) NOT NULL default 'none',
  nw_author varchar(255) NOT NULL default 'none',
  nw_description text NOT NULL,
  nw_picture varchar(255) NOT NULL default 'none',
  nw_date date NOT NULL default '2003-12-08',
  nw_time time NOT NULL default '12:00:00',
  PRIMARY KEY  (nw_index)
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
  rjo_index int(11) NOT NULL auto_increment,
  jrn_index int(11) NOT NULL default '0',
  rub_index int(11) NOT NULL default '0',
  PRIMARY KEY  (rjo_index),
  UNIQUE KEY jrn_index_2 (jrn_index,rub_index),
  KEY jrn_index (jrn_index),
  KEY rub_index (rub_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `skins`
--

DROP TABLE IF EXISTS skins;
CREATE TABLE skins (
  sk_index int(11) NOT NULL auto_increment,
  sk_theme varchar(25) NOT NULL default '',
  sk_top_left_pic varchar(255) NOT NULL default '',
  sk_top_pic varchar(255) NOT NULL default '',
  sk_top_right_pic varchar(255) NOT NULL default '',
  sk_right_pic varchar(255) NOT NULL default '',
  sk_bottom_right_pic varchar(255) NOT NULL default '',
  sk_bottom_pic varchar(255) NOT NULL default '',
  sk_bottom_left_pic varchar(255) NOT NULL default '',
  sk_left_pic varchar(255) NOT NULL default '',
  PRIMARY KEY  (sk_index)
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
-- Table structure for table `titres`
--

DROP TABLE IF EXISTS titres;
CREATE TABLE titres (
  tit_index int(11) NOT NULL auto_increment,
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
-- Table structure for table `types_presse`
--

DROP TABLE IF EXISTS types_presse;
CREATE TABLE types_presse (
  tpr_index int(11) NOT NULL default '0',
  tpr_libelle varchar(100) NOT NULL default '',
  PRIMARY KEY  (tpr_index),
  UNIQUE KEY tpr_libelle (tpr_libelle)
) TYPE=MyISAM CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;

