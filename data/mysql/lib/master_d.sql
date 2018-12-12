-- MySQL dump 10.2
--
-- Host: localhost    Database: master
-- ------------------------------------------------------
-- Server version	4.1.0-alpha-Max

/*!40101 SET NAMES latin1*/;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=NO_AUTO_VALUE_ON_ZERO */;

--
-- Dumping data for table `db`
--


/*!40000 ALTER TABLE db DISABLE KEYS */;
LOCK TABLES db WRITE;
INSERT INTO db (db_index, db_name, db_server, db_site) VALUES (1,'leela',1,1);
UNLOCK TABLES;
/*!40000 ALTER TABLE db ENABLE KEYS */;

--
-- Dumping data for table `graph_texts`
--


/*!40000 ALTER TABLE graph_texts DISABLE KEYS */;
LOCK TABLES graph_texts WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE graph_texts ENABLE KEYS */;

--
-- Dumping data for table `images`
--


/*!40000 ALTER TABLE images DISABLE KEYS */;
LOCK TABLES images WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE images ENABLE KEYS */;

--
-- Dumping data for table `queries`
--


/*!40000 ALTER TABLE queries DISABLE KEYS */;
LOCK TABLES queries WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE queries ENABLE KEYS */;

--
-- Dumping data for table `servers`
--


/*!40000 ALTER TABLE servers DISABLE KEYS */;
LOCK TABLES servers WRITE;
INSERT INTO servers (se_index, se_type, se_host, se_site) VALUES (1,5,'localhost',1),(2,6,'localhost',2);
UNLOCK TABLES;
/*!40000 ALTER TABLE servers ENABLE KEYS */;

--
-- Dumping data for table `sites`
--


/*!40000 ALTER TABLE sites DISABLE KEYS */;
LOCK TABLES sites WRITE;
INSERT INTO sites (si_index, si_name, si_server_name, si_root_dir, si_temp_dir, si_http_url, si_ftp_url, si_perl_bin_dir) VALUES (1,'akades','localhost','d:/www/html/','d:/www/html/base/tmp/','localhost','localhost','c:/unix/perl/bin/perl.exe'),(2,'mywebsite','phybe','D:/Sites/','D:/Sites/Kylix is here!_fichiers/','','','');
UNLOCK TABLES;
/*!40000 ALTER TABLE sites ENABLE KEYS */;

--
-- Dumping data for table `texts`
--


/*!40000 ALTER TABLE texts DISABLE KEYS */;
LOCK TABLES texts WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE texts ENABLE KEYS */;

--
-- Dumping data for table `users`
--


/*!40000 ALTER TABLE users DISABLE KEYS */;
LOCK TABLES users WRITE;
INSERT INTO users (us_name, us_passwd, us_web_pages, us_databases, us_texts, us_images, us_users, us_site) VALUES ('root','67457e226a1a15bd','Y','Y','Y','Y','Y',1),('akades','4b21ace34e26d8f6','Y','Y','Y','Y','N',1);
UNLOCK TABLES;
/*!40000 ALTER TABLE users ENABLE KEYS */;

--
-- Dumping data for table `v_menus`
--


/*!40000 ALTER TABLE v_menus DISABLE KEYS */;
LOCK TABLES v_menus WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE v_menus ENABLE KEYS */;

--
-- Dumping data for table `web_pages`
--


/*!40000 ALTER TABLE web_pages DISABLE KEYS */;
LOCK TABLES web_pages WRITE;
INSERT INTO web_pages (wb_index, wb_name, wb_type, wb_dir, wb_url, wb_site) VALUES (1,'index.html','html','d:/WWW/HTML/','localhost',1);
UNLOCK TABLES;
/*!40000 ALTER TABLE web_pages ENABLE KEYS */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;

