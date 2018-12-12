-- MySQL dump 10.2
--
-- Host: localhost    Database: phpmyadmin
-- ------------------------------------------------------
-- Server version	4.1.0-alpha-Max

/*!40101 SET NAMES latin1*/;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=NO_AUTO_VALUE_ON_ZERO */;

--
-- Dumping data for table `PMA_bookmark`
--


/*!40000 ALTER TABLE PMA_bookmark DISABLE KEYS */;
LOCK TABLES PMA_bookmark WRITE;
INSERT INTO PMA_bookmark (id, dbase, user, label, query) VALUES (1,'anao','root','','select d.di_index, p.pa_filename, d.di_fr_short, d.di_fr_long \nfrom pages p, menus m, dictionary d \nwhere m.di_index=d.di_index \nand p.di_index=m.di_index \nand m.me_index=10'),(2,'anao','root','','CREATE TABLE if not exists v_menus(\n	me_index int( 11 ) NOT NULL default \'1\',\n	pa_index int( 11 ) NOT NULL default \'1\',\n	me_target varchar( 7 ) NOT NULL default \'page\',\n	me_level char( 1 ) NOT NULL default \'1\',\n	di_index varchar( 8 ) NOT NULL default \'\',\n	pa_filename varchar( 255 ) NOT NULL default \'\',\n	di_fr_short varchar( 50 ) NOT NULL default \'\',\n	di_fr_long text NOT NULL ,\n	di_en_short varchar( 50 ) NOT NULL default \'\',\n	di_en_long text NOT NULL ,\n	PRIMARY KEY ( me_index ) ,\n	UNIQUE KEY me_index( me_index ) \n) TYPE = MYISAM CHARSET = latin1;\nINSERT INTO v_menus( me_index, pa_index, me_level, di_index, me_target, pa_filename, di_fr_short, di_fr_long, di_en_short, di_en_long ) \nSELECT m.me_index, m.pa_index, m.me_level, m.di_index, m.me_target, p.pa_filename, d.di_fr_short, d.di_fr_long, d.di_en_short, d.di_en_long\n	FROM menus m, pages p, dictionary d\n	WHERE m.di_index = d.di_index AND p.di_index = d.di_index\n	ORDER BY m.me_index;\nSELECT me_index AS Menu, pa_index AS Page, me_level AS Niveau, di_index AS Dictionnaire, me_target AS Cible, pa_filename AS Fichier, di_fr_short AS \'Francais court\', di_fr_long AS \'Francais long\', di_en_short AS \'Anglais court\', di_en_long AS \'Anglais long\'\n	FROM v_menus\n	ORDER BY me_index;'),(3,'anao','root','','CREATE TABLE if not exists v_menus(\n	me_index int( 11 ) NOT NULL default \'1\',\n	pa_index int( 11 ) NOT NULL default \'1\',\n	me_target varchar( 7 ) NOT NULL default \'page\',\n	me_level char( 1 ) NOT NULL default \'1\',\n	di_index varchar( 8 ) NOT NULL default \'\',\n	pa_filename varchar( 255 ) NOT NULL default \'\',\n	di_fr_short varchar( 50 ) NOT NULL default \'\',\n	di_fr_long text NOT NULL ,\n	di_en_short varchar( 50 ) NOT NULL default \'\',\n	di_en_long text NOT NULL ,\n	PRIMARY KEY ( me_index ) ,\n	UNIQUE KEY me_index( me_index ) \n) TYPE = MYISAM CHARSET = latin1;\nINSERT INTO v_menus( me_index, pa_index, me_level, di_index, me_target, pa_filename, di_fr_short, di_fr_long, di_en_short, di_en_long ) \nSELECT m.me_index, m.pa_index, m.me_level, m.di_index, m.me_target, p.pa_filename, d.di_fr_short, d.di_fr_long, d.di_en_short, d.di_en_long\n	FROM menus m, pages p, dictionary d\n	WHERE m.di_index = d.di_index AND p.di_index = d.di_index\n	ORDER BY m.me_index;\nSELECT me_index AS Menu, pa_index AS Page, me_level AS Niveau, di_index AS Dictionnaire, me_target AS Cible, pa_filename AS Fichier, di_fr_short AS \'Francais court\', di_fr_long AS \'Francais long\', di_en_short AS \'Anglais court\', di_en_long AS \'Anglais long\'\n	FROM v_menus\n	ORDER BY me_index;');
UNLOCK TABLES;
/*!40000 ALTER TABLE PMA_bookmark ENABLE KEYS */;

--
-- Dumping data for table `PMA_column_info`
--


/*!40000 ALTER TABLE PMA_column_info DISABLE KEYS */;
LOCK TABLES PMA_column_info WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE PMA_column_info ENABLE KEYS */;

--
-- Dumping data for table `PMA_history`
--


/*!40000 ALTER TABLE PMA_history DISABLE KEYS */;
LOCK TABLES PMA_history WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE PMA_history ENABLE KEYS */;

--
-- Dumping data for table `PMA_pdf_pages`
--


/*!40000 ALTER TABLE PMA_pdf_pages DISABLE KEYS */;
LOCK TABLES PMA_pdf_pages WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE PMA_pdf_pages ENABLE KEYS */;

--
-- Dumping data for table `PMA_relation`
--


/*!40000 ALTER TABLE PMA_relation DISABLE KEYS */;
LOCK TABLES PMA_relation WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE PMA_relation ENABLE KEYS */;

--
-- Dumping data for table `PMA_table_coords`
--


/*!40000 ALTER TABLE PMA_table_coords DISABLE KEYS */;
LOCK TABLES PMA_table_coords WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE PMA_table_coords ENABLE KEYS */;

--
-- Dumping data for table `PMA_table_info`
--


/*!40000 ALTER TABLE PMA_table_info DISABLE KEYS */;
LOCK TABLES PMA_table_info WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE PMA_table_info ENABLE KEYS */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;

