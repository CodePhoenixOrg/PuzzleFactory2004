-- MySQL dump 10.2
--
-- Host: localhost    Database: rp
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
UNLOCK TABLES;
/*!40000 ALTER TABLE applications ENABLE KEYS */;

--
-- Dumping data for table `blocks`
--


/*!40000 ALTER TABLE blocks DISABLE KEYS */;
LOCK TABLES blocks WRITE;
INSERT INTO blocks (bl_index, bl_column, bl_type, di_index) VALUES (10,'1','static','general'),(20,'1','dynamic','profili'),(30,'1','dynamic','mediali'),(40,'3','dynamic','journali'),(50,'3','dynamic','retombee'),(1,'1','members','members'),(25,'3','newsletter','newsltr'),(60,'3','diary','diary'),(70,'1','dynamic','editions');
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
INSERT INTO dictionary (di_index, di_fr_short, di_fr_long, di_en_short, di_en_long, di_ru_short, di_ru_long) VALUES ('home','Accueil','','','','',''),('profils','Votre Choix','Votre Choix','','','',''),('media','Votre Choix','Votre Choix','','','',''),('journal','Votre Choix','Votre Choix','','','',''),('ciblages','Ciblages','Ciblages','','','',''),('report','Reporting','Reporting','','','',''),('retombee','Retombées Presse','Retombées Presse','','','',''),('general','Menu Général','Menu Général','','','',''),('articles','Articles','Articles','','','',''),('procont','Contacts','Contacts','','','',''),('proeve','Evenements','Evenements','','','',''),('prodos','Dossiers','Dossiers','','','',''),('procom','Communiqués','Communiqués','','','',''),('proart','Articles','Articles','','','',''),('jourcom','Communiqués','Communiqués','','','',''),('medart','Articles','Articles','','','',''),('medjour','Journalistes','Journalistes','','','',''),('joureve','Evenements','Evenements','','','',''),('jourmed','Media','Media','','','',''),('journali','Journalistes','Journalistes','','','',''),('profili','Profils','Profils','','','',''),('mediali','Media','Media','','','',''),('dprof','Détail profil','Détail profil','','','',''),('jourrub','Rubriques','Rubriques','','','',''),('refpro','         Tables','Tbl Références Profils','','','',''),('refmed','____________','Tbl Références Media','','','',''),('refjrn','____________','Tbl Références Journalistes','','','',''),('refart','____________','Tbl Références Articles','','','',''),('sectpro','<hr color =\'black\' size =\'1\'>Secteurs','Secteurs','','','',''),('foncpro','Fonctions','Fonctions','','','',''),('actpro','Actions','Actions','','','',''),('rubjrn','<hr color =\'black\' size =\'1\'>Rubriques','Rubriques','','','',''),('foncjrn','Fonctions','Fonctions','','','',''),('tpremed','<hr color =\'black\' size =\'1\'>Types','Types de Presse','','','',''),('situmed','Situations','Situations','','','',''),('orimed','Origines','Origines','','','',''),('perimed','Périodicités','Périodicités','','','',''),('gpremed','Groupes','Groupes de Presse','','','',''),('typart','<hr color =\'black\' size =\'1\'>Types','Types','','','',''),('taiart','Tailles','Tailles','','','',''),('scorart','Scoring','Scoring','','','',''),('catart','Catégories','Catégories','','','',''),('schart','Schémas','Schémas rédactionnels','','','',''),('edcible','Edition Cible','Edition Cible','','','',''),('vutpr','Types de Presse','Types de Presse','','','',''),('editions','Editions','Editions','','','',''),('vue_cibl','Cibles sélectionnées','','','','','');
UNLOCK TABLES;
/*!40000 ALTER TABLE dictionary ENABLE KEYS */;

--
-- Dumping data for table `forums`
--


/*!40000 ALTER TABLE forums DISABLE KEYS */;
LOCK TABLES forums WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE forums ENABLE KEYS */;

--
-- Dumping data for table `groups`
--


/*!40000 ALTER TABLE groups DISABLE KEYS */;
LOCK TABLES groups WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE groups ENABLE KEYS */;

--
-- Dumping data for table `members`
--


/*!40000 ALTER TABLE members DISABLE KEYS */;
LOCK TABLES members WRITE;
INSERT INTO members (mbr_index, mbr_nom, mbr_prenom, mbr_adr1, mbr_adr2, mbr_cp, mbr_ville, mbr_pays, mbr_email, mbr_ident, mbr_mpasse, grp_group) VALUES (3,'Le Bihan','','30 jardins Boieldieu','','92800','','','pylb@anao.fr','pylb','K3r1v31','user');
UNLOCK TABLES;
/*!40000 ALTER TABLE members ENABLE KEYS */;

--
-- Dumping data for table `menus`
--


/*!40000 ALTER TABLE menus DISABLE KEYS */;
LOCK TABLES menus WRITE;
INSERT INTO menus (me_index, me_level, me_target, pa_index, bl_index, di_index, grp_group) VALUES (1,'1','page',1,10,'home','user'),(20,'2','page',20,20,'profils','user'),(120,'2','page',120,30,'media','user'),(130,'2','page',130,40,'journal','user'),(160,'1','page',160,10,'ciblages','user'),(170,'1','page',170,10,'report','user'),(150,'2','page',150,50,'articles','user'),(21,'2','page',21,20,'procont','user'),(22,'2','page',22,20,'prodos','user'),(23,'2','page',23,20,'proeve','user'),(24,'2','page',24,20,'procom','user'),(25,'2','page',25,20,'proart','user'),(121,'2','page',121,30,'medjour','user'),(122,'2','page',122,30,'medart','user'),(131,'2','page',131,40,'jourmed','user'),(132,'2','page',132,40,'joureve','user'),(133,'2','page',133,40,'jourcom','user'),(2001,'0','page',2001,0,'dprof','user'),(134,'2','page',134,40,'jourrub','user'),(2110,'2','page',2110,20,'sectpro','user'),(2120,'2','page',2120,20,'foncpro','user'),(2130,'2','page',2130,20,'actpro','user'),(4110,'2','page',4110,40,'rubjrn','user'),(4120,'2','page',4120,40,'foncjrn','user'),(3110,'2','page',3110,30,'tpremed','user'),(3120,'2','page',3120,30,'situmed','user'),(3130,'2','page',3130,30,'orimed','user'),(3140,'2','page',3140,30,'perimed','user'),(3150,'2','page',3150,30,'gpremed','user'),(5110,'2','page',5110,50,'typart','user'),(5120,'2','page',5120,50,'taiart','user'),(5130,'2','page',5130,50,'scorart','user'),(5140,'2','page',5140,50,'catart','user'),(5150,'2','page',5150,50,'schart','user'),(3115,'0','page',3115,0,'vutpr','user'),(165,'0','page',0,10,'edcible','user'),(166,'0','page',166,0,'vue_cibl','user');
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
INSERT INTO pages (pa_index, di_index, pa_filename) VALUES (1,'home','home.php'),(20,'profils','profils.php'),(120,'media','media.php'),(130,'journal','journalistes.php'),(160,'ciblages','ciblages.php'),(150,'articles','articles.php'),(170,'report','reporting.php'),(21,'procont','procont.php'),(22,'prodos','prodos.php'),(23,'proeve','proeve.php'),(24,'procom','procom.php'),(25,'proart','proart.php'),(121,'medjour','medjour.php'),(122,'medart','medart.php'),(131,'jourmed','jourmed.php'),(132,'joureve','joureve.php'),(133,'jourcom','jourcom.php'),(2001,'dprof','dprof.php'),(134,'jourrub','jourrub.php'),(2110,'sectpro','sectpro.php'),(2120,'foncpro','foncpro.php'),(2130,'actpro','actpro.php'),(4110,'rubjrn','rubjrn.php'),(4120,'foncjrn','foncjrn.php'),(3110,'tpremed','tpremed.php'),(3120,'situmed','situmed.php'),(3130,'orimed','orimed.php'),(3140,'perimed','perimed.php'),(3150,'gpremed','gpremed.php'),(5110,'typart','typart.php'),(5120,'taiart','taiart.php'),(5130,'scorart','scorart.php'),(5140,'catart','catart.php'),(5150,'schart','schart.php'),(3115,'vutpr','vutpr.php'),(165,'edcible','editer_cible.php'),(166,'vue_cibl','vue_ciblage.php');
UNLOCK TABLES;
/*!40000 ALTER TABLE pages ENABLE KEYS */;

--
-- Dumping data for table `subscribers`
--


/*!40000 ALTER TABLE subscribers DISABLE KEYS */;
LOCK TABLES subscribers WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE subscribers ENABLE KEYS */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;

