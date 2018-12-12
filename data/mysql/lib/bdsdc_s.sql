-- MySQL dump 10.2
--
-- Host: localhost    Database: bdsdc
-- ------------------------------------------------------
-- Server version	4.1.0-alpha-Max

/*!40101 SET NAMES latin1*/;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=NO_AUTO_VALUE_ON_ZERO */;

--
-- Table structure for table `acteurs`
--

DROP TABLE IF EXISTS acteurs;
CREATE TABLE acteurs (
  identifiant_acteurs int(5) NOT NULL default '0',
  nom_client varchar(40) NOT NULL default '',
  commercial varchar(40) default NULL,
  charge_affaires varchar(40) default NULL,
  technicien varchar(40) default NULL,
  PRIMARY KEY  (identifiant_acteurs)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `charge_affaires`
--

DROP TABLE IF EXISTS charge_affaires;
CREATE TABLE charge_affaires (
  id_charge_affaires int(4) NOT NULL default '0',
  charge_affaires varchar(40) default NULL,
  PRIMARY KEY  (id_charge_affaires)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS client;
CREATE TABLE client (
  id_client int(4) NOT NULL default '0',
  client varchar(40) default NULL,
  PRIMARY KEY  (id_client)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `commercial`
--

DROP TABLE IF EXISTS commercial;
CREATE TABLE commercial (
  id_commercial int(4) NOT NULL default '0',
  commercial varchar(40) default NULL,
  PRIMARY KEY  (id_commercial)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `decor_piece`
--

DROP TABLE IF EXISTS decor_piece;
CREATE TABLE decor_piece (
  id_decor_piece int(4) NOT NULL default '0',
  decor_piece varchar(40) default NULL,
  PRIMARY KEY  (id_decor_piece)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `dossiers`
--

DROP TABLE IF EXISTS dossiers;
CREATE TABLE dossiers (
  numero_dossier int(5) NOT NULL default '0',
  numero_pdp varchar(50) NOT NULL default '',
  dossier_projet varchar(60) default NULL,
  dossier_cao varchar(60) default NULL,
  dossier_qualite varchar(60) default NULL,
  dossier_csr varchar(60) default NULL,
  PRIMARY KEY  (numero_dossier)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `famille_de_pompe`
--

DROP TABLE IF EXISTS famille_de_pompe;
CREATE TABLE famille_de_pompe (
  id_famille_de_pompe int(4) NOT NULL default '0',
  famille_de_pompe varchar(40) default NULL,
  PRIMARY KEY  (id_famille_de_pompe)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `marges`
--

DROP TABLE IF EXISTS marges;
CREATE TABLE marges (
  identifiant_produit_fini int(5) NOT NULL default '0',
  numero_pdp varchar(50) NOT NULL default '',
  marge double default '0',
  PRIMARY KEY  (identifiant_produit_fini)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `matiere_piece`
--

DROP TABLE IF EXISTS matiere_piece;
CREATE TABLE matiere_piece (
  id_matiere_piece int(4) NOT NULL default '0',
  matiere_piece varchar(40) default NULL,
  PRIMARY KEY  (id_matiere_piece)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS menu;
CREATE TABLE menu (
  menu_index tinyint(4) NOT NULL default '0',
  nom varchar(50) NOT NULL default '',
  page varchar(255) NOT NULL default ''
) TYPE=MyISAM CHARSET=latin1 COMMENT='menu - liste des pages';

--
-- Table structure for table `nom_fournisseur`
--

DROP TABLE IF EXISTS nom_fournisseur;
CREATE TABLE nom_fournisseur (
  id_nom_fournisseur int(4) NOT NULL default '0',
  nom_fournisseur varchar(40) default NULL,
  PRIMARY KEY  (id_nom_fournisseur)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `nom_sous_traitant_fournisseur`
--

DROP TABLE IF EXISTS nom_sous_traitant_fournisseur;
CREATE TABLE nom_sous_traitant_fournisseur (
  id_nom_sous_traitant_fournisseur int(4) NOT NULL default '0',
  nom_sous_traitant_fournisseur varchar(40) default NULL,
  PRIMARY KEY  (id_nom_sous_traitant_fournisseur)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `nombre_empreinte_moule`
--

DROP TABLE IF EXISTS nombre_empreinte_moule;
CREATE TABLE nombre_empreinte_moule (
  id_nombre_empreinte_moule int(5) NOT NULL default '0',
  nombre_empreinte_moule int(3) default NULL,
  PRIMARY KEY  (id_nombre_empreinte_moule)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `piece`
--

DROP TABLE IF EXISTS piece;
CREATE TABLE piece (
  identifiant_piece int(5) NOT NULL default '0',
  identifiant_produit_fini int(5) NOT NULL default '0',
  code_article_valois varchar(30) default NULL,
  reference_piece varchar(20) default NULL,
  type_de_piece varchar(40) default NULL,
  numero_plan_piece varchar(40) default NULL,
  matiere_piece varchar(40) default NULL,
  decor_piece varchar(40) default NULL,
  detail_coloration_piece varchar(60) default NULL,
  dimensions_piece varchar(30) default NULL,
  chemin_image_piece text,
  nom_fournisseur varchar(40) default NULL,
  nom_sous_traitant_fournisseur varchar(40) default NULL,
  annee_lancement_outillages year(4) default NULL,
  cout_outillages double default NULL,
  nombre_empreinte_moule int(3) default NULL,
  version_du_moule varchar(20) default NULL,
  pru_fournisseur double default NULL,
  cadence_outillage double default NULL,
  PRIMARY KEY  (identifiant_piece)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `produit_fini`
--

DROP TABLE IF EXISTS produit_fini;
CREATE TABLE produit_fini (
  identifiant_produit_fini int(5) NOT NULL default '0',
  numero_pdp varchar(50) NOT NULL default '',
  code_produit_fini_sdc varchar(20) default NULL,
  reference_produit_fini varchar(20) default NULL,
  type_produit_fini varchar(40) default NULL,
  numero_plan_produit_fini varchar(40) default NULL,
  chemin_image_produit_fini text,
  type_gicleur varchar(40) default NULL,
  type_embout varchar(40) default NULL,
  cote_de_saillant double default '0',
  numero_echantillotheque int(10) default NULL,
  pru double default '0',
  prix_de_vente double default '0',
  type_site varchar(7) default NULL,
  type_machine varchar(6) default NULL,
  cadence_pf double default '0',
  PRIMARY KEY  (identifiant_produit_fini)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `projet`
--

DROP TABLE IF EXISTS projet;
CREATE TABLE projet (
  numero_pdp varchar(50) NOT NULL default '',
  numero_dossier int(5) NOT NULL default '0',
  identifiant_acteurs int(5) NOT NULL default '0',
  date_saisie date NOT NULL default '0000-00-00',
  date_maj date default NULL,
  date_ouverture_projet date default NULL,
  domaine_application varchar(30) default NULL,
  nom_ligne varchar(40) default NULL,
  contenance varchar(40) default NULL,
  famille_pompe varchar(40) default NULL,
  brevet varchar(20) default NULL,
  info_brevet varchar(60) default NULL,
  statut varchar(30) default NULL,
  PRIMARY KEY  (numero_pdp)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `projet_fonctions`
--

DROP TABLE IF EXISTS projet_fonctions;
CREATE TABLE projet_fonctions (
  numero_pdp varchar(50) NOT NULL default '',
  type_de_fonction varchar(40) NOT NULL default ''
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `technicien`
--

DROP TABLE IF EXISTS technicien;
CREATE TABLE technicien (
  id_technicien int(4) NOT NULL default '0',
  technicien varchar(40) default NULL,
  PRIMARY KEY  (id_technicien)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `type_de_fonction`
--

DROP TABLE IF EXISTS type_de_fonction;
CREATE TABLE type_de_fonction (
  id_type_de_fonction int(4) NOT NULL default '0',
  type_de_fonction varchar(40) default NULL,
  PRIMARY KEY  (id_type_de_fonction)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `type_embout`
--

DROP TABLE IF EXISTS type_embout;
CREATE TABLE type_embout (
  id_type_embout int(5) NOT NULL default '0',
  type_embout varchar(40) default NULL,
  PRIMARY KEY  (id_type_embout)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `type_gicleur`
--

DROP TABLE IF EXISTS type_gicleur;
CREATE TABLE type_gicleur (
  id_type_gicleur int(5) NOT NULL default '0',
  type_gicleur varchar(40) default NULL,
  PRIMARY KEY  (id_type_gicleur)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `type_machine`
--

DROP TABLE IF EXISTS type_machine;
CREATE TABLE type_machine (
  id_type_machine int(4) NOT NULL default '0',
  type_machine varchar(40) default NULL,
  PRIMARY KEY  (id_type_machine)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `type_piece`
--

DROP TABLE IF EXISTS type_piece;
CREATE TABLE type_piece (
  id_type_piece int(4) NOT NULL default '0',
  type_piece varchar(40) default NULL,
  PRIMARY KEY  (id_type_piece)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `type_produit_fini`
--

DROP TABLE IF EXISTS type_produit_fini;
CREATE TABLE type_produit_fini (
  id_type_produit_fini int(4) NOT NULL default '0',
  type_produit_fini varchar(40) default NULL,
  PRIMARY KEY  (id_type_produit_fini)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `type_site`
--

DROP TABLE IF EXISTS type_site;
CREATE TABLE type_site (
  id_type_site int(4) NOT NULL default '0',
  type_site varchar(40) default NULL,
  PRIMARY KEY  (id_type_site)
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

