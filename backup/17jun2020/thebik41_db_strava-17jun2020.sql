-- MariaDB dump 10.17  Distrib 10.4.13-MariaDB, for Linux (x86_64)
--
-- Host: 108.179.252.33    Database: thebik41_db_strava
-- ------------------------------------------------------
-- Server version	5.6.41-84.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_files`
--

DROP TABLE IF EXISTS `tb_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(12) NOT NULL,
  `nome` varchar(80) NOT NULL,
  `data` date DEFAULT NULL,
  `file_name` varchar(100) NOT NULL,
  `lat_max` double DEFAULT '0',
  `lon_max` double DEFAULT '0',
  `lat_min` double DEFAULT '0',
  `lon_min` double DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `file_name` (`file_name`),
  KEY `user` (`user`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_files`
--

LOCK TABLES `tb_files` WRITE;
/*!40000 ALTER TABLE `tb_files` DISABLE KEYS */;
INSERT INTO `tb_files` VALUES (1,'tales','07/06/20 -  Jambeiro','2020-06-07','atleta/tales/GPX/07_06_20_Jambeiro.gpx',-23.110236,-45.703019,-23.255953,-45.73348),(2,'teste','14/03/20  -  Jambeiro','2020-03-14','atleta/teste/GPX/14_03_20_Jambeiro.gpx',-23.105137,-45.690935,-23.256062,-45.733479),(3,'amador','Carvalho - Osvaldo Cruz - RedenÃ§Ã£o da Serra (ida e volta)','2020-06-13','atleta/amador/GPX/Carvalho_Osvaldo_Cruz_Reden_o_da_Serra_ida_e_volta_.gpx',-23.08282,-45.464736,-23.278618,-45.705679),(4,'amador','Jambeiro','2020-06-09','atleta/amador/GPX/Jambeiro (1).gpx',-23.091182,-45.695342,-23.255996,-45.733523),(5,'tales','14/03/20  -  Jambeiro','2020-03-14','atleta/tales/GPX/14_03_20_Jambeiro.gpx',-23.105137,-45.690935,-23.256062,-45.733479),(6,'tales','16/02/20 -  Banheirinha','2020-02-16','atleta/tales/GPX/16_02_20_Banheirinha.gpx',-22.978237,-45.66683,-23.115537,-45.729736),(7,'tales','24/05/20 -  XCO do CarlÃ£o','2020-05-24','atleta/tales/GPX/24_05_20_XCO_do_Carl_o.gpx',-23.094302,-45.628676,-23.117551,-45.721762),(8,'tales','Afternoon Ride','2020-05-25','atleta/tales/GPX/Afternoon_Ride.gpx',-23.094371,-45.628726,-23.102366,-45.642165);
/*!40000 ALTER TABLE `tb_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_seg_points`
--

DROP TABLE IF EXISTS `tb_seg_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_seg_points` (
  `id` int(11) NOT NULL,
  `seg_id` int(11) NOT NULL,
  `lat` double DEFAULT '0',
  `lon` double DEFAULT '0',
  PRIMARY KEY (`id`,`seg_id`),
  KEY `seg_id` (`seg_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_seg_points`
--

LOCK TABLES `tb_seg_points` WRITE;
/*!40000 ALTER TABLE `tb_seg_points` DISABLE KEYS */;
INSERT INTO `tb_seg_points` VALUES (1,1,-23.214686,-45.729935),(2,1,-23.215545,-45.729113),(3,1,-23.217349,-45.728208),(4,1,-23.218722,-45.728026),(5,1,-23.219911,-45.728663),(6,1,-23.220375,-45.729883),(7,1,-23.221086,-45.730491),(8,1,-23.22201,-45.732064),(9,1,-23.223592,-45.732563),(10,1,-23.224484,-45.733244),(11,1,-23.225516,-45.733086),(12,1,-23.226382,-45.733135),(13,1,-23.227289,-45.733334),(14,1,-23.228503,-45.732261),(15,1,-23.229062,-45.731289),(16,1,-23.229775,-45.730693),(17,1,-23.23045,-45.730289),(18,1,-23.231135,-45.729878),(19,1,-23.232039,-45.729967),(20,1,-23.232999,-45.729759),(21,1,-23.233847,-45.729738),(22,1,-23.234683,-45.72944),(23,1,-23.235625,-45.729395),(24,1,-23.236532,-45.729404),(25,1,-23.237159,-45.729036),(26,1,-23.23659,-45.728269),(27,1,-23.236656,-45.727459),(28,1,-23.237263,-45.726948),(29,1,-23.237925,-45.726645),(30,1,-23.238569,-45.726329),(31,1,-23.239539,-45.726066),(32,1,-23.24071,-45.726743),(33,1,-23.24104,-45.728029),(34,1,-23.241817,-45.727998),(35,1,-23.24119,-45.726582),(36,1,-23.240924,-45.725467),(37,1,-23.241097,-45.724753),(38,1,-23.24077,-45.723949),(1,2,-23.240649,-45.722863),(2,2,-23.242553,-45.722811),(3,2,-23.244029,-45.724437),(4,2,-23.244708,-45.725949),(5,2,-23.244544,-45.72436),(6,2,-23.243452,-45.722568),(7,2,-23.244368,-45.721502),(8,2,-23.244132,-45.720035),(9,2,-23.24502,-45.718924),(10,2,-23.246176,-45.717558),(11,2,-23.24746,-45.717579),(12,2,-23.249148,-45.718691),(13,2,-23.250698,-45.71893),(14,2,-23.252608,-45.718366),(15,2,-23.254325,-45.717458),(16,2,-23.25466,-45.71504),(17,2,-23.255909,-45.714126),(18,2,-23.255785,-45.712317),(19,2,-23.255043,-45.710363),(20,2,-23.25358,-45.707595),(21,2,-23.251803,-45.703891),(1,3,-23.13295,-45.718696),(2,3,-23.134299,-45.719209),(3,3,-23.137305,-45.7193),(4,3,-23.140015,-45.720196),(5,3,-23.14144,-45.721051),(6,3,-23.143976,-45.722174),(7,3,-23.146436,-45.723258),(8,3,-23.147643,-45.722907),(9,3,-23.149359,-45.722906),(10,3,-23.149445,-45.72289),(1,4,-23.254978,-45.710203),(2,4,-23.253324,-45.707054),(3,4,-23.251706,-45.703682),(4,4,-23.251438,-45.703282),(1,5,-23.18238,-45.725073),(2,5,-23.184972,-45.726745),(3,5,-23.187278,-45.72716),(4,5,-23.188209,-45.727875),(5,5,-23.188033,-45.727385),(6,5,-23.188024,-45.727393),(7,5,-23.188024,-45.727399),(8,5,-23.188126,-45.728126),(9,5,-23.187657,-45.72931),(10,5,-23.189898,-45.731306),(11,5,-23.191421,-45.731352),(12,5,-23.192998,-45.731387),(13,5,-23.19539,-45.731451),(14,5,-23.198038,-45.731218),(15,5,-23.200715,-45.730926),(16,5,-23.202515,-45.731401),(17,5,-23.203838,-45.731762),(1,6,-23.091366,-45.705479),(2,6,-23.092921,-45.705227),(3,6,-23.094936,-45.704844),(4,6,-23.097002,-45.704511),(5,6,-23.099157,-45.70413),(6,6,-23.101461,-45.703779),(7,6,-23.101862,-45.703708),(8,6,-23.103049,-45.703434),(9,6,-23.104604,-45.70242),(10,6,-23.105489,-45.70254),(11,6,-23.106607,-45.704007),(12,6,-23.1081,-45.703815),(13,6,-23.109484,-45.703632),(14,6,-23.110005,-45.703704),(15,6,-23.110974,-45.70343),(16,6,-23.111605,-45.70456),(17,6,-23.112277,-45.705927),(18,6,-23.112739,-45.706782),(19,6,-23.113172,-45.707675),(20,6,-23.113569,-45.708196),(21,6,-23.114106,-45.708302),(22,6,-23.114799,-45.708445),(23,6,-23.115276,-45.708564),(24,6,-23.11691,-45.709496),(25,6,-23.117695,-45.710187),(26,6,-23.11895,-45.711705),(27,6,-23.121541,-45.712881),(28,6,-23.122834,-45.71296),(29,6,-23.125525,-45.713429),(30,6,-23.127406,-45.715639),(31,6,-23.128008,-45.716375),(32,6,-23.128795,-45.716932),(33,6,-23.129362,-45.717703),(34,6,-23.130366,-45.719049),(35,6,-23.132567,-45.718757),(36,6,-23.133551,-45.718687),(37,6,-23.134247,-45.719154),(38,6,-23.136694,-45.719298),(39,6,-23.139954,-45.720158),(40,6,-23.141008,-45.720757),(41,6,-23.142012,-45.721343),(42,6,-23.143194,-45.72193),(43,6,-23.144298,-45.722215),(44,6,-23.145393,-45.722606),(45,6,-23.147174,-45.723137),(46,6,-23.147785,-45.722908),(47,6,-23.148324,-45.722884),(48,6,-23.149661,-45.72283),(49,6,-23.150519,-45.722479),(50,6,-23.151196,-45.722182),(51,6,-23.152011,-45.72185),(52,6,-23.152669,-45.721769),(53,6,-23.154032,-45.721462),(54,6,-23.155311,-45.721388),(55,6,-23.156241,-45.720897),(56,6,-23.158471,-45.720865),(57,6,-23.160544,-45.720528),(58,6,-23.161608,-45.720711),(59,6,-23.162745,-45.720847),(60,6,-23.164718,-45.720859),(61,6,-23.166017,-45.722711),(62,6,-23.168159,-45.723634),(63,6,-23.171394,-45.72353),(64,6,-23.172667,-45.723551),(65,6,-23.173446,-45.723595),(66,6,-23.175075,-45.723465),(67,6,-23.176475,-45.723025),(68,6,-23.177966,-45.722883),(69,6,-23.180964,-45.724187),(70,6,-23.183091,-45.725591),(71,6,-23.184861,-45.726624),(72,6,-23.186018,-45.72701),(73,6,-23.187162,-45.727122),(74,6,-23.188186,-45.727799),(75,6,-23.187827,-45.72869),(76,6,-23.188037,-45.729791),(77,6,-23.190306,-45.731317),(78,6,-23.19113,-45.731285),(79,6,-23.191958,-45.731318),(80,6,-23.192975,-45.731354),(81,6,-23.194052,-45.731377),(82,6,-23.196395,-45.731363),(83,6,-23.197318,-45.731283),(84,6,-23.198826,-45.731089),(85,6,-23.200604,-45.730911),(86,6,-23.201509,-45.731106),(87,6,-23.202369,-45.731349),(88,6,-23.203588,-45.731674),(89,6,-23.204557,-45.731951),(90,6,-23.205719,-45.732087),(91,6,-23.206955,-45.731851),(92,6,-23.207766,-45.731691),(93,6,-23.208732,-45.731517),(94,6,-23.209528,-45.731351),(95,6,-23.210492,-45.731182),(96,6,-23.211299,-45.731042),(97,6,-23.21272,-45.730881),(98,6,-23.213702,-45.730882),(99,6,-23.214272,-45.730792),(100,6,-23.21461,-45.730147),(101,6,-23.214851,-45.729442),(102,6,-23.215348,-45.729186),(103,6,-23.215874,-45.728933),(104,6,-23.216596,-45.728596),(105,6,-23.217737,-45.72777),(106,6,-23.218687,-45.727962),(107,6,-23.219972,-45.728794),(108,6,-23.220085,-45.729263),(109,6,-23.220315,-45.729854),(110,6,-23.220984,-45.730304),(111,6,-23.221257,-45.73182),(112,6,-23.222024,-45.732058),(113,6,-23.223027,-45.73178),(114,6,-23.223731,-45.73272),(115,6,-23.224182,-45.733178),(116,6,-23.224616,-45.733207),(117,6,-23.225186,-45.733123),(118,6,-23.225612,-45.732999),(119,6,-23.226094,-45.732904),(120,6,-23.226528,-45.733242),(121,6,-23.227107,-45.733402),(122,6,-23.2279,-45.732772),(123,6,-23.228656,-45.732102),(124,6,-23.228954,-45.731518),(125,6,-23.229172,-45.731105),(126,6,-23.229541,-45.730797),(127,6,-23.229991,-45.730572),(128,6,-23.230413,-45.730304),(129,6,-23.230645,-45.730031),(130,6,-23.231057,-45.729846),(131,6,-23.231668,-45.729964),(132,6,-23.232026,-45.729935),(133,6,-23.232528,-45.729754),(134,6,-23.233008,-45.729733),(135,6,-23.23335,-45.729772),(136,6,-23.233839,-45.729705),(137,6,-23.234309,-45.729529),(138,6,-23.234694,-45.729402),(139,6,-23.235083,-45.729356),(140,6,-23.235543,-45.72938),(141,6,-23.236026,-45.729362),(142,6,-23.236484,-45.729376),(143,6,-23.236957,-45.729286),(144,6,-23.237076,-45.72885),(145,6,-23.236852,-45.728549),(146,6,-23.236547,-45.728247),(147,6,-23.236391,-45.727847),(148,6,-23.236618,-45.727413),(149,6,-23.237018,-45.727099),(150,6,-23.237302,-45.726906),(151,6,-23.237785,-45.726628),(152,6,-23.238116,-45.726473),(153,6,-23.238436,-45.726321),(154,6,-23.238947,-45.726103),(155,6,-23.239467,-45.726022),(156,6,-23.240018,-45.726171),(157,6,-23.240788,-45.726925),(158,6,-23.240963,-45.727752),(159,6,-23.241816,-45.728025),(160,6,-23.241454,-45.727168),(161,6,-23.241004,-45.726299),(162,6,-23.240854,-45.725668),(163,6,-23.24104,-45.725175),(164,6,-23.241097,-45.724659),(165,6,-23.240844,-45.724133),(166,6,-23.240554,-45.72377),(167,6,-23.240197,-45.723364),(168,6,-23.240932,-45.722805),(169,6,-23.242382,-45.7227),(170,6,-23.243404,-45.723972),(171,6,-23.244264,-45.72497),(172,6,-23.244798,-45.725775),(173,6,-23.245018,-45.724553),(174,6,-23.244284,-45.723229),(175,6,-23.243292,-45.722385),(176,6,-23.244001,-45.721592),(177,6,-23.244057,-45.720581),(178,6,-23.244326,-45.719175),(179,6,-23.245538,-45.71828),(180,6,-23.246539,-45.717062),(181,6,-23.247554,-45.717644),(182,6,-23.248449,-45.718572),(183,6,-23.249703,-45.718891),(184,6,-23.250808,-45.718903),(185,6,-23.252278,-45.718401),(186,6,-23.253418,-45.718062),(187,6,-23.254392,-45.717249),(188,6,-23.254539,-45.715783),(189,6,-23.254921,-45.714437),(190,6,-23.255996,-45.713951),(191,6,-23.255856,-45.712446),(192,6,-23.255266,-45.710938),(193,6,-23.254606,-45.709523),(194,6,-23.253689,-45.707835),(195,6,-23.252714,-45.705805),(196,6,-23.251785,-45.703889),(197,6,-23.251572,-45.703404),(198,6,-23.252146,-45.704727),(199,6,-23.253143,-45.706796),(200,6,-23.253888,-45.708397),(201,6,-23.254855,-45.710042),(202,6,-23.255041,-45.71053),(203,6,-23.255223,-45.711039),(204,6,-23.255479,-45.711668),(205,6,-23.255648,-45.712189),(206,6,-23.255747,-45.712574),(207,6,-23.255861,-45.713129),(208,6,-23.255921,-45.713594),(209,6,-23.255886,-45.714166),(210,6,-23.255436,-45.714525),(211,6,-23.255063,-45.714513),(212,6,-23.254689,-45.714771),(213,6,-23.254589,-45.715254),(214,6,-23.254502,-45.715824),(215,6,-23.254393,-45.716232),(216,6,-23.254326,-45.716737),(217,6,-23.25434,-45.717279),(218,6,-23.25407,-45.717621),(219,6,-23.253377,-45.718042),(220,6,-23.253017,-45.718179),(221,6,-23.252316,-45.718366),(222,6,-23.251769,-45.718359),(223,6,-23.250464,-45.718856),(224,6,-23.249533,-45.718742),(225,6,-23.248888,-45.718779),(226,6,-23.247947,-45.718214),(227,6,-23.247337,-45.717579),(228,6,-23.246835,-45.717084),(229,6,-23.24626,-45.717333),(230,6,-23.245885,-45.717851),(231,6,-23.245668,-45.718153),(232,6,-23.245356,-45.718659),(233,6,-23.244866,-45.718971),(234,6,-23.244461,-45.719165),(235,6,-23.244172,-45.719548),(236,6,-23.244088,-45.720045),(237,6,-23.244063,-45.720473),(238,6,-23.244267,-45.720912),(239,6,-23.244456,-45.721363),(240,6,-23.244228,-45.721668),(241,6,-23.244035,-45.721948),(242,6,-23.243739,-45.722186),(243,6,-23.243443,-45.722598),(244,6,-23.243732,-45.722853),(245,6,-23.244279,-45.723409),(246,6,-23.245114,-45.724801),(247,6,-23.245026,-45.725515),(248,6,-23.244595,-45.725673),(249,6,-23.244401,-45.725286),(250,6,-23.244223,-45.724636),(251,6,-23.243654,-45.724088),(252,6,-23.243132,-45.723603),(253,6,-23.241668,-45.722697),(254,6,-23.240756,-45.722721),(255,6,-23.240155,-45.723401),(256,6,-23.240903,-45.724219),(257,6,-23.240895,-45.725398),(258,6,-23.241176,-45.726689),(259,6,-23.24177,-45.727855),(260,6,-23.241041,-45.727748),(261,6,-23.240738,-45.726713),(262,6,-23.239674,-45.726028),(263,6,-23.238561,-45.726197),(264,6,-23.237352,-45.72677),(265,6,-23.236323,-45.72777),(266,6,-23.237079,-45.729081),(267,6,-23.235974,-45.729409),(268,6,-23.234564,-45.729433),(269,6,-23.233162,-45.729756),(270,6,-23.23173,-45.73001),(271,6,-23.23042,-45.73015),(272,6,-23.229205,-45.730916),(273,6,-23.228453,-45.732201),(274,6,-23.227315,-45.733209),(275,6,-23.22628,-45.733082),(276,6,-23.22514,-45.733116),(277,6,-23.223879,-45.732978),(278,6,-23.223096,-45.73186),(279,6,-23.221582,-45.732085),(280,6,-23.221098,-45.730598),(281,6,-23.220099,-45.729551),(282,6,-23.219679,-45.728478),(283,6,-23.218638,-45.727964),(284,6,-23.21766,-45.727725),(285,6,-23.21698,-45.728344),(286,6,-23.215377,-45.729108),(287,6,-23.214606,-45.72971),(288,6,-23.214201,-45.730834),(289,6,-23.213038,-45.73086),(290,6,-23.21132,-45.730956),(291,6,-23.210061,-45.73119),(292,6,-23.208683,-45.731445),(293,6,-23.207627,-45.731635),(294,6,-23.206568,-45.731842),(295,6,-23.20557,-45.732032),(296,6,-23.203891,-45.731711),(297,6,-23.202271,-45.731255),(298,6,-23.201029,-45.730923),(299,6,-23.199995,-45.730874),(300,6,-23.198047,-45.731127),(301,6,-23.196549,-45.73129),(302,6,-23.194147,-45.731331),(303,6,-23.192766,-45.731284),(304,6,-23.191301,-45.731258),(305,6,-23.190281,-45.73123),(306,6,-23.189258,-45.730954),(307,6,-23.187739,-45.728868),(308,6,-23.188084,-45.728328),(309,6,-23.188198,-45.72779),(310,6,-23.187485,-45.726996),(311,6,-23.18647,-45.727139),(312,6,-23.185666,-45.726891),(313,6,-23.184746,-45.72655),(314,6,-23.183707,-45.725942),(315,6,-23.18218,-45.724742),(316,6,-23.179436,-45.722953),(317,6,-23.176142,-45.722796),(318,6,-23.174495,-45.723148),(319,6,-23.173453,-45.723406),(320,6,-23.171782,-45.723458),(321,6,-23.170237,-45.723719),(322,6,-23.167307,-45.723391),(323,6,-23.164764,-45.720839),(324,6,-23.163714,-45.720712),(325,6,-23.16258,-45.720793),(326,6,-23.161904,-45.72071),(327,6,-23.16137,-45.72062),(328,6,-23.160665,-45.720503),(329,6,-23.159901,-45.720379),(330,6,-23.158194,-45.7209),(331,6,-23.156195,-45.720836),(332,6,-23.154781,-45.721332),(333,6,-23.154145,-45.721363),(334,6,-23.153279,-45.721582),(335,6,-23.151847,-45.721816),(336,6,-23.15086,-45.722241),(337,6,-23.149842,-45.722673),(338,6,-23.148292,-45.722785),(339,6,-23.147047,-45.723026),(340,6,-23.145953,-45.722651),(341,6,-23.144588,-45.722249),(342,6,-23.143479,-45.721936),(343,6,-23.142684,-45.72159),(344,6,-23.142049,-45.721237),(345,6,-23.141104,-45.720715),(346,6,-23.140217,-45.720238),(347,6,-23.139365,-45.719726),(348,6,-23.136377,-45.719227),(349,6,-23.134197,-45.719092),(350,6,-23.132728,-45.718633),(351,6,-23.13095,-45.718985),(352,6,-23.129414,-45.71768),(353,6,-23.128617,-45.716667),(354,6,-23.127764,-45.716044),(355,6,-23.127128,-45.714928),(356,6,-23.125924,-45.713427),(357,6,-23.123024,-45.712812),(358,6,-23.120368,-45.712164),(359,6,-23.118118,-45.710866),(360,6,-23.11669,-45.709228),(361,6,-23.114899,-45.708345),(362,6,-23.113905,-45.708138),(363,6,-23.112976,-45.70736),(364,6,-23.112499,-45.706387),(365,6,-23.112364,-45.705977),(366,6,-23.112177,-45.705622),(367,6,-23.111715,-45.704731),(368,6,-23.111124,-45.703468),(369,6,-23.110142,-45.703629),(370,6,-23.109395,-45.702533),(371,6,-23.107557,-45.699788),(372,6,-23.106754,-45.698623),(373,6,-23.105639,-45.696992),(374,6,-23.105129,-45.696261),(375,6,-23.104546,-45.695443),(376,6,-23.103102,-45.695569),(377,6,-23.100545,-45.696009),(378,6,-23.098775,-45.696472),(379,6,-23.099421,-45.697835),(380,6,-23.097756,-45.698536),(381,6,-23.096202,-45.699185),(382,6,-23.096618,-45.702045),(383,6,-23.095827,-45.702241),(384,6,-23.094945,-45.702363),(385,6,-23.093024,-45.702678),(386,6,-23.093121,-45.704703),(387,6,-23.091976,-45.705331),(388,6,-23.091182,-45.705663),(1,7,-23.255639,-45.712186),(2,7,-23.255846,-45.712972),(3,7,-23.255871,-45.713798),(4,7,-23.25551,-45.714403),(5,7,-23.254772,-45.714599),(6,7,-23.254541,-45.71545),(7,7,-23.254321,-45.716216),(8,7,-23.254312,-45.716984),(9,7,-23.253847,-45.717738),(10,7,-23.252875,-45.718202),(11,7,-23.252036,-45.718362),(12,7,-23.250542,-45.718815),(13,7,-23.249315,-45.718734),(14,7,-23.248337,-45.7185),(15,7,-23.247372,-45.717498),(16,7,-23.246458,-45.717256),(17,7,-23.245708,-45.718009),(18,7,-23.245101,-45.718808),(19,7,-23.244375,-45.719175),(20,7,-23.244073,-45.720064),(21,7,-23.244216,-45.720881),(22,7,-23.244251,-45.721556),(23,7,-23.243502,-45.722204),(24,7,-23.243577,-45.722825),(25,7,-23.244322,-45.72368),(26,7,-23.245099,-45.724943),(27,7,-23.244572,-45.725666),(28,7,-23.244296,-45.724846),(29,7,-23.244268,-45.72475),(1,8,-23.1998,-45.730985),(2,8,-23.200997,-45.730962),(3,8,-23.201907,-45.731228),(4,8,-23.202562,-45.731412),(5,8,-23.204109,-45.731824),(6,8,-23.204899,-45.732036),(7,8,-23.205919,-45.732047),(8,8,-23.207368,-45.731767),(9,8,-23.208282,-45.731607),(10,8,-23.209042,-45.73146),(11,8,-23.210116,-45.731244),(12,8,-23.210841,-45.731125),(13,8,-23.211533,-45.73099),(14,8,-23.213232,-45.730867),(15,8,-23.213881,-45.730892),(16,8,-23.214445,-45.730627),(17,8,-23.214694,-45.729795),(18,8,-23.215008,-45.729331),(19,8,-23.215565,-45.729082),(20,8,-23.216127,-45.728813),(21,8,-23.217342,-45.728181),(22,8,-23.217737,-45.72777),(1,9,-22.987694,-45.695917),(2,9,-22.987429,-45.696561),(3,9,-22.98669,-45.698116),(4,9,-22.985909,-45.698571),(5,9,-22.985619,-45.698898),(6,9,-22.985463,-45.69929),(7,9,-22.98514,-45.699751),(8,9,-22.984712,-45.700305),(9,9,-22.984503,-45.700681),(10,9,-22.984469,-45.700976),(11,9,-22.984443,-45.70124),(12,9,-22.984438,-45.701488),(13,9,-22.98471,-45.702094),(14,9,-22.984492,-45.702588),(15,9,-22.98433,-45.70329),(16,9,-22.984494,-45.703672),(17,9,-22.984718,-45.703895),(18,9,-22.984788,-45.704599),(19,9,-22.984472,-45.70558),(20,9,-22.984343,-45.706247),(21,9,-22.984279,-45.706852),(22,9,-22.984098,-45.707415),(23,9,-22.983501,-45.708305),(24,9,-22.982751,-45.709357),(25,9,-22.982494,-45.710164),(26,9,-22.982312,-45.710608),(27,9,-22.982156,-45.711407),(28,9,-22.982054,-45.711894),(29,9,-22.981924,-45.712413),(30,9,-22.98159,-45.712959),(31,9,-22.9811,-45.713672),(32,9,-22.98091,-45.714243),(33,9,-22.979922,-45.715015),(34,9,-22.979259,-45.715649),(35,9,-22.978818,-45.71598),(36,9,-22.978582,-45.716297),(37,9,-22.978854,-45.717172),(38,9,-22.978864,-45.718213),(39,9,-22.978661,-45.718706),(40,9,-22.978506,-45.719024),(41,9,-22.978478,-45.719106),(1,10,-23.099019,-45.630718),(2,10,-23.098866,-45.631137),(3,10,-23.097619,-45.631689),(4,10,-23.096682,-45.632184),(5,10,-23.096172,-45.6331),(6,10,-23.095952,-45.633771),(7,10,-23.095601,-45.634737),(8,10,-23.095793,-45.635272),(9,10,-23.095352,-45.635592),(10,10,-23.095355,-45.636459),(11,10,-23.094832,-45.636876),(12,10,-23.094611,-45.637389),(13,10,-23.094664,-45.63794),(14,10,-23.094417,-45.638403),(15,10,-23.094755,-45.638946),(16,10,-23.094899,-45.639679),(17,10,-23.095641,-45.640114),(18,10,-23.095658,-45.640792),(19,10,-23.095477,-45.641333),(20,10,-23.095324,-45.641719),(21,10,-23.096017,-45.642118),(22,10,-23.096982,-45.641998),(23,10,-23.097445,-45.641616),(24,10,-23.097343,-45.641063),(25,10,-23.097494,-45.640363),(26,10,-23.097678,-45.639527),(27,10,-23.097639,-45.639172),(28,10,-23.097648,-45.638729),(29,10,-23.097365,-45.637914),(30,10,-23.09772,-45.637562),(31,10,-23.097581,-45.637277),(32,10,-23.097471,-45.636961),(33,10,-23.097383,-45.636657),(34,10,-23.097333,-45.63617),(35,10,-23.097837,-45.636437),(36,10,-23.098203,-45.636022),(37,10,-23.09852,-45.635525),(38,10,-23.098565,-45.635117),(39,10,-23.098837,-45.634434),(40,10,-23.099369,-45.634558),(41,10,-23.099782,-45.635536),(42,10,-23.100771,-45.636498),(43,10,-23.100912,-45.637166),(44,10,-23.101154,-45.637606),(45,10,-23.101046,-45.638085),(46,10,-23.101038,-45.639248),(47,10,-23.101095,-45.639792),(48,10,-23.101242,-45.639837),(49,10,-23.101309,-45.639303),(50,10,-23.101398,-45.638329),(51,10,-23.10183,-45.63732),(52,10,-23.101763,-45.636573),(53,10,-23.101233,-45.63531),(54,10,-23.101452,-45.634903),(55,10,-23.101696,-45.634381),(56,10,-23.102228,-45.632909),(57,10,-23.101522,-45.632383),(58,10,-23.101067,-45.631969),(59,10,-23.100868,-45.632093),(60,10,-23.100532,-45.631954),(61,10,-23.100346,-45.631843),(62,10,-23.099913,-45.631374),(63,10,-23.099639,-45.631172),(64,10,-23.099782,-45.630588),(65,10,-23.099186,-45.630245),(66,10,-23.099155,-45.629533),(67,10,-23.098853,-45.628924),(68,10,-23.098412,-45.628741),(69,10,-23.098265,-45.629064),(70,10,-23.098104,-45.629319),(71,10,-23.098191,-45.629839),(72,10,-23.098663,-45.629497),(73,10,-23.098842,-45.629817),(74,10,-23.098166,-45.630156),(75,10,-23.097744,-45.630291),(76,10,-23.098217,-45.630482),(77,10,-23.098266,-45.630472),(1,11,-23.098927,-45.631115),(2,11,-23.097794,-45.631635),(3,11,-23.096858,-45.63214),(4,11,-23.09624,-45.632943),(5,11,-23.095977,-45.633641),(6,11,-23.09558,-45.634682),(7,11,-23.095772,-45.635223),(8,11,-23.095438,-45.635507),(9,11,-23.09535,-45.636393),(10,11,-23.094834,-45.636728),(11,11,-23.094611,-45.637359),(12,11,-23.094671,-45.637794),(13,11,-23.094395,-45.638373),(14,11,-23.094706,-45.63891),(15,11,-23.094864,-45.639569),(16,11,-23.095315,-45.640083),(17,11,-23.095658,-45.64076),(18,11,-23.095489,-45.641321),(19,11,-23.095343,-45.641715),(20,11,-23.095962,-45.642112),(21,11,-23.096925,-45.641987),(22,11,-23.097464,-45.64165),(23,11,-23.09733,-45.641129),(24,11,-23.097467,-45.640445),(25,11,-23.097694,-45.639555),(26,11,-23.097681,-45.639231),(27,11,-23.097687,-45.638785),(28,11,-23.09736,-45.63793),(29,11,-23.097686,-45.637637),(30,11,-23.09757,-45.63729),(31,11,-23.097522,-45.636993),(32,11,-23.097454,-45.636712),(33,11,-23.097306,-45.636213),(34,11,-23.097802,-45.636431),(35,11,-23.098169,-45.636071),(36,11,-23.098482,-45.635585),(37,11,-23.098574,-45.635141),(38,11,-23.09878,-45.634441),(39,11,-23.099312,-45.634458),(40,11,-23.09964,-45.635406),(41,11,-23.10075,-45.636465),(42,11,-23.10089,-45.637155),(43,11,-23.101196,-45.637508),(44,11,-23.101001,-45.637948),(45,11,-23.101014,-45.639194),(46,11,-23.101028,-45.639751),(47,11,-23.101199,-45.639784),(48,11,-23.10128,-45.639441),(49,11,-23.101377,-45.638448),(50,11,-23.1018,-45.637394),(51,11,-23.101833,-45.636628),(52,11,-23.101223,-45.635329),(53,11,-23.101433,-45.634943),(54,11,-23.101677,-45.63443),(55,11,-23.102221,-45.63297),(56,11,-23.101573,-45.632376),(57,11,-23.101125,-45.632045),(58,11,-23.100904,-45.632139),(59,11,-23.100566,-45.63192),(60,11,-23.100356,-45.63185),(61,11,-23.099903,-45.631395),(62,11,-23.099685,-45.631162),(63,11,-23.099807,-45.630609),(64,11,-23.099189,-45.630316),(65,11,-23.099164,-45.629632),(66,11,-23.098859,-45.62896),(67,11,-23.098449,-45.628688),(68,11,-23.09825,-45.629058),(69,11,-23.098135,-45.629319),(70,11,-23.098156,-45.629819),(71,11,-23.098653,-45.629566),(72,11,-23.098873,-45.629718),(73,11,-23.098335,-45.630231),(74,11,-23.097645,-45.630096),(75,11,-23.097986,-45.630648),(1,12,-23.099075,-45.630833),(2,12,-23.098286,-45.631546),(3,12,-23.097227,-45.63201),(4,12,-23.09626,-45.632993),(5,12,-23.095981,-45.63356),(6,12,-23.095586,-45.63409),(7,12,-23.095735,-45.635062),(8,12,-23.095615,-45.635494),(9,12,-23.09535,-45.636164),(10,12,-23.095355,-45.636813),(11,12,-23.095185,-45.637184),(12,12,-23.094896,-45.637322),(13,12,-23.094738,-45.63797),(14,12,-23.094431,-45.638392),(15,12,-23.094772,-45.639074),(16,12,-23.095001,-45.639682),(17,12,-23.095684,-45.640172),(18,12,-23.09564,-45.64074),(19,12,-23.095529,-45.641323),(20,12,-23.095391,-45.641711),(21,12,-23.095374,-45.641942),(22,12,-23.096477,-45.642092),(23,12,-23.097107,-45.642003),(24,12,-23.097311,-45.641355),(25,12,-23.097286,-45.640775),(26,12,-23.09733,-45.640464),(9,14,-23.099245,-45.630462),(8,14,-23.099776,-45.630616),(7,14,-23.099671,-45.631123),(6,14,-23.099944,-45.631423),(5,14,-23.100373,-45.631771),(4,14,-23.100613,-45.63191),(3,14,-23.100821,-45.631812),(2,14,-23.101001,-45.632058),(1,14,-23.101451,-45.632315);
/*!40000 ALTER TABLE `tb_seg_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_seg_ranking`
--

DROP TABLE IF EXISTS `tb_seg_ranking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_seg_ranking` (
  `seg_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `time` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`seg_id`,`user_id`,`file_id`),
  KEY `user_id` (`user_id`),
  KEY `file_id` (`file_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_seg_ranking`
--

LOCK TABLES `tb_seg_ranking` WRITE;
/*!40000 ALTER TABLE `tb_seg_ranking` DISABLE KEYS */;
INSERT INTO `tb_seg_ranking` VALUES (1,8,1,1209,1),(2,8,1,386,1),(3,8,1,269,1),(4,8,1,52,1),(1,2,2,1047,1),(2,2,2,755,1),(3,2,2,269,1),(4,2,2,67,1),(5,8,1,406,1),(5,2,2,819,1),(1,3,4,1110,1),(2,3,4,416,1),(3,3,4,224,1),(4,3,4,70,1),(5,3,4,408,1),(6,3,4,8165,1),(7,8,1,1240,1),(7,2,2,3317,1),(7,3,4,1583,1),(8,8,1,430,1),(8,2,2,461,1),(8,3,4,392,1),(1,8,5,1047,1),(2,8,5,755,1),(3,8,5,269,1),(4,8,5,67,1),(5,8,5,819,1),(7,8,5,3317,1),(8,8,5,461,1),(9,8,6,1152,1),(10,8,7,2057,1),(11,8,7,2060,1),(10,8,8,1722,1),(11,8,8,1721,1),(10,8,7,2322,2),(10,8,7,1860,3),(11,8,7,2323,2),(11,8,7,1853,3),(10,8,8,2216,2),(10,8,8,2302,3),(11,8,8,2216,2),(11,8,8,2303,3),(12,8,8,521,1),(12,8,8,1057,2),(12,8,8,1431,3),(12,8,7,831,3),(12,8,7,1526,2),(12,8,7,964,1),(14,8,7,184,4),(14,8,7,147,3),(14,8,7,172,2),(14,8,7,173,1);
/*!40000 ALTER TABLE `tb_seg_ranking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_segmento`
--

DROP TABLE IF EXISTS `tb_segmento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_segmento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) NOT NULL,
  `data` date DEFAULT NULL,
  `resp` int(11) NOT NULL,
  `lat_ini` double DEFAULT '0',
  `lon_ini` double DEFAULT '0',
  `lat_fin` double DEFAULT '0',
  `lon_fin` double DEFAULT '0',
  `dist` double DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `resp` (`resp`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_segmento`
--

LOCK TABLES `tb_segmento` WRITE;
/*!40000 ALTER TABLE `tb_segmento` DISABLE KEYS */;
INSERT INTO `tb_segmento` VALUES (1,'Up Jambeiro completo','2020-06-16',8,-23.214686,-45.729935,-23.24077,-45.723949,4.55),(2,'DH Jambeiro Completo','2020-06-16',8,-23.240649,-45.722863,-23.251803,-45.703891,4.37),(3,'seg01','2020-06-16',8,-23.13295,-45.718696,-23.149445,-45.72289,1.94),(4,'retao do idu','2020-06-16',8,-23.254978,-45.710203,-23.251438,-45.703282,0.86),(5,'teste 02','2020-06-16',2,-23.18238,-45.725073,-23.203838,-45.731762,2.93),(6,'jambeiro- piedade','2020-06-16',3,-23.091366,-45.705479,-23.091182,-45.705663,50.8),(7,'chupa marquinho','2020-06-16',8,-23.255639,-45.712186,-23.244268,-45.72475,2.92),(8,'RETÃƒO TESTE','2020-06-16',3,-23.1998,-45.730985,-23.217737,-45.72777,2.16),(9,'Up da Banheirinha','2020-06-16',8,-22.987694,-45.695917,-22.978478,-45.719106,2.83),(10,'Volta do XCO do Carlao','2020-06-16',8,-23.099019,-45.630718,-23.098266,-45.630472,6.09),(11,'Volta OFICIAL XCO do Carlao','2020-06-16',8,-23.098927,-45.631115,-23.097986,-45.630648,5.98),(12,'XCO Carlao parte 1','2020-06-17',8,-23.099075,-45.630833,-23.09733,-45.640464,2),(14,'XCO Ultima Subida','2020-06-17',8,-23.101451,-45.632315,-23.099245,-45.630462,0.47);
/*!40000 ALTER TABLE `tb_segmento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_usuario`
--

DROP TABLE IF EXISTS `tb_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(12) NOT NULL,
  `pass` varchar(12) NOT NULL,
  `class` int(11) DEFAULT NULL,
  `nome` varchar(40) DEFAULT NULL,
  `email` varchar(70) DEFAULT NULL,
  `status` varchar(10) DEFAULT 'DESATIVADO',
  `sexo` varchar(1) NOT NULL DEFAULT 'M',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_usuario`
--

LOCK TABLES `tb_usuario` WRITE;
/*!40000 ALTER TABLE `tb_usuario` DISABLE KEYS */;
INSERT INTO `tb_usuario` VALUES (8,'tales','spider',1,'Tales Cembraneli Dantas','tales@flexibus.com.br','ATIVO','M'),(2,'teste','1234',1,'teste 1234','talescd@gmail.com','ATIVO','M'),(3,'amador','amador',1,'Marcus Vinicius','marvinidias28@gmail.com','ATIVO','M'),(4,'fdeval','fdeval',1,'Flavio de Val Barreto','Fdeval@hotmail.com','ATIVO','M'),(6,'novo','123',1,'novo usuario','tales@thebikeinbox.com.br','ATIVO','M'),(7,'mulher','1122',1,'mulher','teste@teste.com','DESATIVADO','F'),(9,'alvaro','1234',1,'Alvaro orioli','br532003@yahoo.com.br','ATIVO','M'),(10,'testtes','abcd',1,'TesTe','teste@jjkhk.adfs.bg','DESATIVADO','F'),(11,'aaaagfagfds','aaaaaa',1,'AaAaA','aaaaaaaaa','DESATIVADO','M');
/*!40000 ALTER TABLE `tb_usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-17 19:50:58