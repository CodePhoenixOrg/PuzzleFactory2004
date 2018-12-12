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
-- Dumping data for table `applications`
--


/*!40000 ALTER TABLE applications DISABLE KEYS */;
LOCK TABLES applications WRITE;
INSERT INTO applications (app_index, app_link, di_index) VALUES (10,'admin/','modadmin');
UNLOCK TABLES;
/*!40000 ALTER TABLE applications ENABLE KEYS */;

--
-- Dumping data for table `blocks`
--


/*!40000 ALTER TABLE blocks DISABLE KEYS */;
LOCK TABLES blocks WRITE;
INSERT INTO blocks (bl_index, bl_column, bl_type, di_index) VALUES (10,'1','static','home'),(1,'1','members','members'),(30,'3','newsletter','newsltr'),(53,'3','static','client'),(52,'1','dynamic','fournis'),(51,'1','dynamic','param'),(60,'3','diary','diary'),(54,'1','dynamic','treso');
UNLOCK TABLES;
/*!40000 ALTER TABLE blocks ENABLE KEYS */;

--
-- Dumping data for table `diary`
--


/*!40000 ALTER TABLE diary DISABLE KEYS */;
LOCK TABLES diary WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE diary ENABLE KEYS */;

--
-- Dumping data for table `dictionary`
--


/*!40000 ALTER TABLE dictionary DISABLE KEYS */;
LOCK TABLES dictionary WRITE;
INSERT INTO dictionary (di_index, di_fr_short, di_fr_long, di_en_short, di_en_long) VALUES ('home','Accueil','Page d\'accueil','Home','Home page'),('members','Accès membres','Gérez votre profil membre','Members area','Manage your data'),('newsltr','Newsletter','','Newsletter',''),('ed_membe','Profil','Données de votre profil membre','Profile','Your member\'s profile data'),('param','Parametres','Parametres','',''),('client','Clients','Clients','',''),('fournis','Fournisseurs','Fournisseurs','',''),('treso','Trésorerie','Trésorerie','',''),('saicli','Saisie','Saisie','',''),('saifou','Saisie','Saisie','',''),('regfou','Réglements','Réglements','',''),('regcli','Réglements','Réglements','',''),('confou','Consultation','Consultation','',''),('concli','Consultation','Consultation','',''),('cafou','Chiffre d\'affaire','Chiffre d\'affaire','',''),('cacli','Chiffre d\'affaire','Chiffre d\'affaire','',''),('contre','Consultation','Consultation','',''),('pointre','Pointage','Pointage','',''),('plantre','Plan Trésorerie','Plan Trésorerie','',''),('clipar','Clients','Clients','',''),('foupar','Fournisseurs','Fournisseurs','',''),('autpar','Autre Tiers','Autre Tiers','',''),('itepar','Items de saisie','Items de saisie','',''),('catpar','Catalogues','Catalogues','','');
UNLOCK TABLES;
/*!40000 ALTER TABLE dictionary ENABLE KEYS */;

--
-- Dumping data for table `groups`
--


/*!40000 ALTER TABLE groups DISABLE KEYS */;
LOCK TABLES groups WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE groups ENABLE KEYS */;

--
-- Dumping data for table `li_tie_cat`
--


/*!40000 ALTER TABLE li_tie_cat DISABLE KEYS */;
LOCK TABLES li_tie_cat WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE li_tie_cat ENABLE KEYS */;

--
-- Dumping data for table `members`
--


/*!40000 ALTER TABLE members DISABLE KEYS */;
LOCK TABLES members WRITE;
INSERT INTO members (mbr_index, mbr_nom, mbr_prenom, mbr_adr1, mbr_adr2, mbr_cp, mbr_ville, mbr_pays, mbr_email, mbr_ident, mbr_mpasse, grp_group) VALUES (1,'David BLANCHARD','','Pas d\'adresse','','76000','','','davidbl@wanadoo.fr','dpjb','1p2+ar','administrator'),(2,'Pierre-Yves Le Bihan','','Pas d\'adresse','','92800','','','pylb@wanadoo.fr','pylb','K3r1v31','administrator'),(3,'Pallu','','-','','75001','','','','brice','udtqcssh','user');
UNLOCK TABLES;
/*!40000 ALTER TABLE members ENABLE KEYS */;

--
-- Dumping data for table `menus`
--


/*!40000 ALTER TABLE menus DISABLE KEYS */;
LOCK TABLES menus WRITE;
INSERT INTO menus (me_index, me_level, me_target, pa_index, bl_index, di_index, grp_group) VALUES (10,'1','page',10,10,'home','user'),(5330,'2','page',5330,53,'concli','user'),(5320,'2','page',5320,53,'regcli','user'),(5310,'2','page',5310,53,'saicli','user'),(5240,'2','page',5240,52,'cafou','user'),(5230,'2','page',5230,52,'confou','user'),(5220,'2','page',5220,52,'regfou','user'),(5210,'2','page',5210,52,'saifou','user'),(16,'1','page',16,0,'ed_membe','user'),(5340,'2','page',5340,53,'cacli','user'),(1,'1','page',1,10,'nisc','user'),(5410,'2','page',5410,54,'contre','user'),(5420,'2','page',5420,54,'pointre','user'),(5430,'2','page',5430,54,'plantre','user'),(5110,'2','page',5110,51,'clipar','user'),(5120,'2','page',5120,51,'foupar','user'),(5130,'2','page',5130,51,'autpar','user'),(5140,'2','page',5140,51,'itepar','user'),(5150,'2','page',5150,51,'catpar','user');
UNLOCK TABLES;
/*!40000 ALTER TABLE menus ENABLE KEYS */;

--
-- Dumping data for table `newsletter`
--


/*!40000 ALTER TABLE newsletter DISABLE KEYS */;
LOCK TABLES newsletter WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE newsletter ENABLE KEYS */;

--
-- Dumping data for table `pages`
--


/*!40000 ALTER TABLE pages DISABLE KEYS */;
LOCK TABLES pages WRITE;
INSERT INTO pages (pa_index, di_index, pa_filename) VALUES (10,'home','home.php'),(5320,'regcli','regcli.php'),(5310,'saicli','saicli.php'),(5240,'cafou','cafou.php'),(5230,'confou','confou.php'),(5220,'regfou','regfou.php'),(5210,'saifou','saifou.php'),(16,'ed_membe','edit_members.php'),(5330,'concli','concli.php'),(5340,'cacli','cacli.php'),(5410,'contre','contre.php'),(5420,'pointre','pointre.php'),(5430,'plantre','plantre.php'),(5110,'clipar','clipar.php'),(5120,'foupar','foupar.php'),(5130,'autpar','autpar.php'),(5140,'itepar','itepar.php'),(5150,'catpar','catpar.php');
UNLOCK TABLES;
/*!40000 ALTER TABLE pages ENABLE KEYS */;

--
-- Dumping data for table `subscribers`
--


/*!40000 ALTER TABLE subscribers DISABLE KEYS */;
LOCK TABLES subscribers WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE subscribers ENABLE KEYS */;

--
-- Dumping data for table `tb_cata`
--


/*!40000 ALTER TABLE tb_cata DISABLE KEYS */;
LOCK TABLES tb_cata WRITE;
INSERT INTO tb_cata (cat_id, cat_abrege, cat_libelle, cat_type) VALUES (1,'MAT','Matériel','F'),(2,'FGX','Frais Généraux','F'),(3,'ASS','Assurances','F'),(4,'ABT','Abonnements','F'),(5,'NDF','Notes de Frais','P'),(6,'BQE','Banque','F');
UNLOCK TABLES;
/*!40000 ALTER TABLE tb_cata ENABLE KEYS */;

--
-- Dumping data for table `tb_pays`
--


/*!40000 ALTER TABLE tb_pays DISABLE KEYS */;
LOCK TABLES tb_pays WRITE;
INSERT INTO tb_pays (pay_id, pay_libelle01) VALUES (1,'FRANCE');
UNLOCK TABLES;
/*!40000 ALTER TABLE tb_pays ENABLE KEYS */;

--
-- Dumping data for table `tb_pieces`
--


/*!40000 ALTER TABLE tb_pieces DISABLE KEYS */;
LOCK TABLES tb_pieces WRITE;
INSERT INTO tb_pieces (pie_id, tie_id, pie_date, pie_libelle01, pie_numero, pie_ttc) VALUES (1,1,'2003-11-13','INSPIRON 1100','6400526410',1027.36),(2,2,'2004-02-12','WINDEV','633',2600.57),(3,1,'2003-11-15','STATION','1234',160.00),(4,1,'2003-12-15','PDA','2456',325.00);
UNLOCK TABLES;
/*!40000 ALTER TABLE tb_pieces ENABLE KEYS */;

--
-- Dumping data for table `tb_tiers`
--


/*!40000 ALTER TABLE tb_tiers DISABLE KEYS */;
LOCK TABLES tb_tiers WRITE;
INSERT INTO tb_tiers (tie_id, tie_type, tie_code, tie_abrege, tie_libelle01, tie_libelle02, tie_libelle03, tie_libelle04, tie_cdpo, tie_ville, pay_id) VALUES (1,'F','F01','DELL','DELL COMPUTERS','12 rue des alouettes','','','94210','ST MAUR','1'),(2,'F','F02','PCSOFT','PC SOFT','216 rue des Escarceliers','BP 3019','','34034','MONTPELLIER','1'),(3,'','','','','','','','','','');
UNLOCK TABLES;
/*!40000 ALTER TABLE tb_tiers ENABLE KEYS */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;

