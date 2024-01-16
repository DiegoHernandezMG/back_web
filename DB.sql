-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: pruebaback
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `acompaniante`
--

DROP TABLE IF EXISTS `acompaniante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acompaniante` (
  `ID_ACOMPANIANTE` int NOT NULL AUTO_INCREMENT,
  `NOMBRE_ACOMPANIANTE` varchar(100) NOT NULL,
  `IMPLEMENTO` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_ACOMPANIANTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acompaniante`
--

LOCK TABLES `acompaniante` WRITE;
/*!40000 ALTER TABLE `acompaniante` DISABLE KEYS */;
/*!40000 ALTER TABLE `acompaniante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `ID_CATEGORIA` int NOT NULL AUTO_INCREMENT,
  `CATEGORIA` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_CATEGORIA`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'DOCENTE'),(2,'ADMINISTRATIVO');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependencia`
--

DROP TABLE IF EXISTS `dependencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dependencia` (
  `ID_DEPENDENCIA` int NOT NULL AUTO_INCREMENT,
  `DEPENDENCIA` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_DEPENDENCIA`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependencia`
--

LOCK TABLES `dependencia` WRITE;
/*!40000 ALTER TABLE `dependencia` DISABLE KEYS */;
INSERT INTO `dependencia` VALUES (1,'CENTRO INTERDISCIPLINARIO DE CIENCIAS DE LA SALUD (CICS) ,UNIDAD MILPA ALTA'),(2,'CENTRO INTERDISCIPLINARIO DE CIENCIAS DE LA SALUD (CICS), UNIDAD SANTO TOMÁS'),(3,'ESCUELA NACIONAL DE CIENCIAS BIOLÓGICAS (ENCB)'),(4,'ESCUELA NACIONAL DE MEDICINA Y HOMEOPATÍA (ENMH)'),(5,'ESCUELA SUPERIOR DE COMERCIO Y ADMINISTRACIÓN (ESCA), UNIDAD TEPEPAN'),(6,'ESCUELA SUPERIOR DE COMERCIO Y ADMINISTRACIÓN (ESCA), UNIDAD SANTO TOMÁS'),(7,'ESCUELA SUPERIOR DE CÓMPUTO (ESCOM)'),(8,'ESCUELA SUPERIOR DE ECONOMÍA (ESE)'),(9,'ESCUELA SUPERIOR DE ENFERMERÍA Y OBSTETRICIA (ESEO)'),(10,'ESCUELA SUPERIOR DE FÍSICA Y MATEMÁTICAS (ESFM)'),(11,'ESCUELA SUPERIOR DE INGENIERÍA MECÁNICA Y ELÉCTRICA (ESIME) UNIDAD AZCAPOTZALCO'),(12,'ESCUELA SUPERIOR DE INGENIERÍA MECÁNICA Y ELÉCTRICA (ESIME) UNIDAD CULHUACÁN'),(13,'ESCUELA SUPERIOR DE INGENIERÍA MECÁNICA Y ELÉCTRICA (ESIME) UNIDAD TICOMÁN'),(14,'ESCUELA SUPERIOR DE INGENIERÍA MECÁNICA Y ELÉCTRICA (ESIME) UNIDAD ZACATENCO'),(15,'ESCUELA SUPERIOR DE INGENIERÍA QUÍMICA E INDUSTRIAS EXTRACTIVAS (ESIQIE)'),(16,'ESCUELA SUPERIOR DE INGENIERÍA TEXTIL (ESIT)'),(17,'ESCUELA SUPERIOR DE INGENIERÍA Y ARQUITECTURA (ESIA) UNIDAD TECAMACHALCO'),(18,'ESCUELA SUPERIOR DE INGENIERÍA Y ARQUITECTURA (ESIA) UNIDAD TICOMÁN'),(19,'ESCUELA SUPERIOR DE INGENIERÍA Y ARQUITECTURA (ESIA) UNIDAD ZACATENCO'),(20,'ESCUELA SUPERIOR DE MEDICINA (ESM)'),(21,'ESCUELA SUPERIOR DE TURISMO (EST)'),(22,'UNIDAD PROFESIONAL INTERDISCIPLINARIA DE INGENIERÍA CAMPUS GUANAJUATO (UPIIG)'),(23,'UNIDAD PROFESIONAL INTERDISCIPLINARIA DE INGENIERÍA CAMPUS HIDALGO (UPIIH)'),(24,'UNIDAD PROFESIONAL INTERDISCIPLINARIA DE INGENIERÍA CAMPUS ZACATECAS (UPIIZ)'),(25,'UNIDAD PROFESIONAL INTERDISCIPLINARIA DE INGENIERÍA Y CIENCIAS SOCIALES Y ADMINISTRATIVAS (UPIICSA)'),(26,'UNIDAD PROFESIONAL INTERDISCIPLINARIA EN INGENIERÍA Y TECNOLOGÍAS AVANZADAS (UPIITA)');
/*!40000 ALTER TABLE `dependencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distincion`
--

DROP TABLE IF EXISTS `distincion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `distincion` (
  `ID_DISTINCION` int NOT NULL AUTO_INCREMENT,
  `DISTINCION` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_DISTINCION`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distincion`
--

LOCK TABLES `distincion` WRITE;
/*!40000 ALTER TABLE `distincion` DISABLE KEYS */;
INSERT INTO `distincion` VALUES (1,'Diploma a la Cultura'),(2,'Diploma a la Investigación'),(3,'Diploma al Deporte'),(4,'Diploma al Maestro Decano'),(5,'Presea \"Juan de Dios Bátiz\"'),(6,'Diploma de Eficiencia y Eficacia'),(7,'Presea Carlos Vallejo Márquez');
/*!40000 ALTER TABLE `distincion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `NOMBRE` varchar(100) NOT NULL,
  `DEPENDENCIA` int NOT NULL,
  `DISTINCION` int NOT NULL,
  `CATEGORIA` int NOT NULL,
  `CURP` varchar(18) NOT NULL,
  `ID` int NOT NULL AUTO_INCREMENT,
  `ASISTENCIA` tinyint(1) NOT NULL,
  `ASISTENCIA_ACOMPANIANTE` tinyint(1) NOT NULL,
  `ACOMPANIANTE` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `DEPENDENCIA` (`DEPENDENCIA`),
  KEY `DISTINCION` (`DISTINCION`),
  KEY `CATEGORIA` (`CATEGORIA`),
  KEY `ACOMPANIANTE` (`ACOMPANIANTE`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`DEPENDENCIA`) REFERENCES `dependencia` (`ID_DEPENDENCIA`),
  CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`DISTINCION`) REFERENCES `distincion` (`ID_DISTINCION`),
  CONSTRAINT `usuarios_ibfk_3` FOREIGN KEY (`CATEGORIA`) REFERENCES `categoria` (`ID_CATEGORIA`),
  CONSTRAINT `usuarios_ibfk_4` FOREIGN KEY (`ACOMPANIANTE`) REFERENCES `acompaniante` (`ID_ACOMPANIANTE`)
) ENGINE=InnoDB AUTO_INCREMENT=326 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES ('Lucina Ortiz Gomez',11,6,2,'OIGL600516MDFRMC09',1,0,0,NULL),('Olga Arvizu Saucedo',12,6,2,'AISO671002MDFRCL02',2,0,0,NULL),('Teresa Soriano Aragon',12,6,2,'SOAT790617MOCRRR00',3,0,0,NULL),('Amada Gabriela Brenes Lopez',13,6,2,'BELA640913MDFRPM09',4,0,0,NULL),('Cristina Fernandez Manrique',13,6,2,'FEMC800724MDFRNR02',5,0,0,NULL),('Gabriel Cortes Ramirez',13,6,2,'CORG701230HDFRMB01',6,0,0,NULL),('Cecilia Mijangos Escobedo',14,6,2,'MIEC810529MQTJSC01',7,0,0,NULL),('Jose Alejandro Lopez Leon',14,6,2,'LOLA721123HDFPNL05',8,0,0,NULL),('Liliana Arellano Mendoza',14,6,2,'AEML770818MMCRNL09',9,0,0,NULL),('Ingrid Mariel Martinez Delgadillo',10,6,2,'MADI841121MDFRLN00',10,0,0,NULL),('Irene Kumul Trejo',10,6,2,'KUTI690611MDFMRR04',11,0,0,NULL),('Jose Alfonso Ordaz Reyes',10,5,2,'OARA651230HDFRYL09',12,0,0,NULL),('Nicolas Zamora Mendoza',10,6,2,'ZAMN751111HDFMNC05',13,0,0,NULL),('Olga Cortez Gonzalez',15,6,2,'COGO771129MDFRNL03',14,0,0,NULL),('Roberto Medellin Lozano',15,6,2,'MELR820908HDFDZB02',15,0,0,NULL),('Ana Lilia Echeverria Rivera',17,6,2,'EERA720108MMCCVN06',16,0,0,NULL),('Jose Alfredo Prado Monsalvo',10,5,2,'PAMA710117HDFRNL03',17,0,0,NULL),('Cristian Evaristo Reyes Lara',17,6,2,'RELC840724HDFYRR07',18,0,0,NULL),('Jose Clemente Reza Garcia',15,7,1,'REGC500630HDFZRL04',19,0,0,NULL),('Jose Luis Martinez Zendejas',15,7,1,'MAZL470830HDFRNS02',20,0,0,NULL),('Veronica Gabriela Ceja Ramirez',17,6,2,'CERV600206MDFJMR04',21,0,0,NULL),('Alejandro Lopez Hernandez',18,6,2,'LOHA840321HMCPRL02',22,0,0,NULL),('Maria Isabel Garcia Soperanes',10,5,2,'GASI670913MDFRPS09',23,0,0,NULL),('Maria Magdalena Prado Monsalvo',10,5,2,'PAMM620529MDFRNG07',24,0,0,NULL),('Delia Patricia Muci¤o Castillo',15,5,2,'MUCD660317MTSCSL03',25,0,0,NULL),('Jose Alberto Hernandez Campech',15,5,2,'HECA690925HTLRML06',26,0,0,NULL),('Juana Garcia Monroy',15,5,2,'GAMJ710109MDFRNN04',27,0,0,NULL),('Juana Maria Ya¤ez Castro',15,5,2,'YACJ720904MDFXSN02',28,0,0,NULL),('Carlos Aguilar Lopez',16,5,2,'AULC650915HHGGPR05',29,0,0,NULL),('Jorge Angel Gonzalez Rodriguez',16,5,2,'GORJ710903HDFNDR09',30,0,0,NULL),('Jose Luis Soto Pe¤a',15,7,1,'SOPL490624HDFTXS07',31,0,0,NULL),('Maria Luisa Ramos Altamirano',16,5,2,'RAAL680121MDFMLS05',32,0,0,NULL),('Carlos Carrillo Rios',17,5,2,'CARC610819HDFRSR03',33,0,0,NULL),('Ruben Castelar Batalla',15,7,1,'CABR440406HMSSTB00',34,0,0,NULL),('Claudia Cortes Palacios',17,5,2,'COPC690614MDFRLL06',35,0,0,NULL),('Yoshio Nagamatsu Takaqui',15,7,1,'NATY480713HDFGKS03',36,0,0,NULL),('Eduardo Contreras Pineda',17,5,2,'COPE481010HDFNND08',37,0,0,NULL),('Aristides de la Cruz Gallegos',17,7,1,'CUGA530831HOCRLR04',38,0,0,NULL),('Mario Fernandez Gomez',17,5,2,'FEGM700908HDFRMR08',39,0,0,NULL),('Efren Antonio Garrido Tellez',17,7,1,'GATE510618HDFRLF05',40,0,0,NULL),('Rosa Maria Martinez Reyes',17,5,2,'MARR610319MDFRYS01',41,0,0,NULL),('Virginia Mendoza Casta¤eda',17,5,2,'MECV670521MDFNSR03',42,0,0,NULL),('Ana Aurora Montoya Ramirez',18,5,2,'MORA740726MDFNMN01',43,0,0,NULL),('Jorge Garcia Espinosa',17,7,1,'GAEJ420514HDFRSR03',44,0,0,NULL),('Marino Bertin Diaz Bautista',17,7,1,'DIBM480303HGRZTR04',45,0,0,NULL),('Esteban Luciano Rojas Guerrero',19,7,1,'ROGE430328HHGJRS00',46,0,0,NULL),('Mario Fortino Morales Gutierrez',19,7,1,'MOGM420815HDFRTR07',47,0,0,NULL),('Edmundo Gonzalez Gonzalez',6,7,1,'GOGE530301HSRNND07',48,0,0,NULL),('Rosaura Unzueta Vazquez',5,7,1,'UUVR530528MGRNZS05',49,0,0,NULL),('Carlos Mario Godinez Camacho',8,7,1,'GOCC461020HDFDMR05',50,0,0,NULL),('Fernando Isaias Vega Zatarain',8,7,1,'VEZF450706HSLGTR04',51,0,0,NULL),('Jose Luis Mu¤oz Camacho',18,6,2,'MUCL880113HDFXMS04',52,0,0,NULL),('Luis Manuel Tovar Sanchez',10,7,1,'TOSL490610HDFVNS01',53,0,0,NULL),('Juan Duarte Morales',18,6,2,'DUMJ790514HPLRRN01',54,0,0,NULL),('Ramon Sebastian Salat Figols',10,7,1,'SAFR500926HNELGM09',55,0,0,NULL),('Jose Arturo Trejo Mosqueda',19,6,2,'TEMA821106HDFRSR16',56,0,0,NULL),('Victor David Granados Garcia',10,7,1,'GAGV490910HDFRRC09',57,0,0,NULL),('Martha Rosa Garcia Aguilar',19,6,2,'GAAM730703MDFRGR06',58,0,0,NULL),('Rocio Martinez Mendoza',19,6,2,'MAMR790519MDFRNC06',59,0,0,NULL),('Alma Rosa Pineda Batalla',6,6,2,'PIBA690823MDFNTL09',60,0,0,NULL),('Karla Patricia Santiago Veites Peza',5,6,2,'SAPK711020MDFNZR09',61,0,0,NULL),('Lino Alberto Delgado Rodriguez',5,6,2,'DERL781129HDFLDN06',62,0,0,NULL),('Rodrigo Marin Avila',5,6,2,'MAAR900502HDFRVD01',63,0,0,NULL),('Arturo Medecigo Rodriguez',7,6,2,'MERA720220HDFDDR04',64,0,0,NULL),('Jorge Nieva Arango',7,6,2,'NIAJ610304HTSVRR03',65,0,0,NULL),('Sergio Anselmo Aragon Guerrero',7,6,2,'AAGS640421HDFRRR07',66,0,0,NULL),('Adriana del Pilar Rojas Perez',8,6,2,'ROPA780727MDFJRD00',67,0,0,NULL),('Javier Esdras Chacon Escobedo',8,6,2,'CAEJ731209HDFHSV09',68,0,0,NULL),('Mariano Pacheco Flores',8,6,2,'PAFM550927HDFCLR00',69,0,0,NULL),('Monica Catalina Dominguez Vargas',16,6,2,'DOVM870408MDFMRN02',70,0,0,NULL),('Nohemi Casta¤on Pineda',16,6,2,'CAPN780330MVZSNH04',71,0,0,NULL),('Saynacuri Libreros Jimenez',16,6,2,'LIJS880206MDFBMY00',72,0,0,NULL),('Aida Vences Cortes',21,6,2,'VECA701230MDFNRD09',73,0,0,NULL),('Alvaro Ramirez Lopez',21,6,2,'RALA730818HDFMPL09',74,0,0,NULL),('Nancy Fabiola Rico Mu¤oz',21,6,2,'RIMN780321MMCCXN02',75,0,0,NULL),('Alejandro Rico Gomez',3,6,2,'RIGA720623HDFCML09',76,0,0,NULL),('Concepcion Hernandez Castillo',3,6,2,'HECC571127MDFRSN05',77,0,0,NULL),('Ruth Beatriz Vallejo Ramirez',3,6,2,'VARR660311MDFLMT02',78,0,0,NULL),('Alejandra Delgado Trejo',20,6,2,'DETA740619MMCLRL09',79,0,0,NULL),('Dalia Yescas Ramirez',20,6,2,'YERD710101MDFSML05',80,0,0,NULL),('Jovita Garcia Vidal',20,6,2,'GAVJ650215MVZRDV05',81,0,0,NULL),('Josefina Angelica Qui¤ones Roa',18,5,2,'QURJ690813MDFXXS08',82,0,0,NULL),('Juan Martinez Huerta',18,5,2,'MAHJ670228HDFRRN00',83,0,0,NULL),('Roman Jimenez Rios',18,5,2,'JIRR520809HHGMSM06',84,0,0,NULL),('Ulises Jaramillo Molina',18,5,2,'JAMU710713HGRRLL03',85,0,0,NULL),('Norma Carolina Bravo Garcia',4,6,2,'BAGN751124MDFRRR06',86,0,0,NULL),('Mayra Maura Olloqui Mora',19,5,2,'OOMM731214MDFLRY07',87,0,0,NULL),('Santa Barbara Jimenez Barrera',4,6,2,'JIBS741204MMCMRN08',88,0,0,NULL),('Veronica Avila Azuara',4,6,2,'AIAV720416MPLVZR00',89,0,0,NULL),('Juan Antonio Sanchez Martinez',9,6,2,'SAMJ630901HVZNRN08',90,0,0,NULL),('Mireya del Carmen Conde Romero',19,5,2,'CORM700326MDFNMR02',91,0,0,NULL),('Maria Eugenia Vertiz Alguera',9,6,2,'VEAE581227MDFRLG06',92,0,0,NULL),('Sergio Gomez Morales',19,5,2,'GOMS661008HHGMRR07',93,0,0,NULL),('Ricardo Galina Ramirez',9,6,2,'GARR560121HDFLMC00',94,0,0,NULL),('Alejandro Valencia Aguilar',6,5,2,'VAAA680425HDFLGL08',95,0,0,NULL),('Anibal Vazquez Guzman',1,6,2,'VXGA660516HDFZZN09',96,0,0,NULL),('Jesus Gomez Galicia',6,5,2,'GOGJ681012HDFMLS00',97,0,0,NULL),('Hector Regalado Rivas',21,7,1,'RERH490709HDFGVC03',98,0,0,NULL),('Eloy Garces Espinoza',1,6,2,'GAEE680606HDFRSL04',99,0,0,NULL),('Mauro Valdovinos Diaz',1,6,2,'VADM770129HMSLZR08',100,0,0,NULL),('Doris Neri Cortes',3,7,1,'NECD511126MDFRRR08',101,0,0,NULL),('Cynthia Ivonne Garcia Ramirez',2,6,2,'GARC810714MDFRMY06',102,0,0,NULL),('Ethel Awilda Garcia Latorre',3,7,1,'GALE400425MNERTT00',103,0,0,NULL),('Maria Guadalupe Riou Hernandez',6,5,2,'RIHG640217MBCXRD01',104,0,0,NULL),('Hortensia Montellano Rosales',3,7,1,'MORH471112MZSNSR01',105,0,0,NULL),('Nabor Zacateco Rojas',6,5,2,'ZARN700825HPLCJB05',106,0,0,NULL),('Jorge Belmar Perez',3,7,1,'BEPJ520830HDFLRR01',107,0,0,NULL),('Claudia Guillermina Gonzalez Lozada',5,5,2,'GOLC730519MDFNZL09',108,0,0,NULL),('Eudoxia Paulino Benitez',5,5,2,'PABE551102MGRLND08',109,0,0,NULL),('Maria de los Angeles Romero Sosa',2,6,2,'ROSA730412MDFMSN06',110,0,0,NULL),('Fabiola Veronica Rodriguez Pozos',5,5,2,'ROPF710120MDFDZB09',111,0,0,NULL),('Georgina Elena Cruz Flores',5,5,2,'CUFG610423MTLRLR09',112,0,0,NULL),('Maria Eugenia Castro Mussot',3,7,1,'CAME491228MDFSSG07',113,0,0,NULL),('Gildardo Gonzalez Migranas',5,5,2,'GOMG660608HPLNGL09',114,0,0,NULL),('Evelyn Limas Maga¤a',22,6,2,'LIME730511MDFMGV06',115,0,0,NULL),('Martha Lilia Cassani Galindo',3,7,1,'CAGM461215MDFSLR05',116,0,0,NULL),('Jaime Uribe Rojas',22,6,2,'UIRJ690213HDFRJM04',117,0,0,NULL),('Maria Guadalupe Arrieta Navarro',22,6,2,'AING861227MGTRVD04',118,0,0,NULL),('Jose Juan Cruz Duran',5,5,2,'CUDJ700330HDFRRN05',119,0,0,NULL),('Adriana Bautista Hernandez',23,6,2,'BAHA670305MDFTRD09',120,0,0,NULL),('Mario Miranda Hernandez',5,5,2,'MIHM610119HMCRRR09',121,0,0,NULL),('Rodolfo Arturo Guerrero Huerta',3,7,1,'GUHR480912HDFRRD08',122,0,0,NULL),('Hector Hugo Tapia Hernandez',23,6,2,'TAHH911010HMCPRC02',123,0,0,NULL),('Marisela Navarrete Rivas',5,5,2,'NARM720613MDFVVR02',124,0,0,NULL),('Yadira Fonseca Sabater',3,7,1,'FOSY500108MVZNBD09',125,0,0,NULL),('Monica Alejandra Valencia Paz',23,6,2,'VAPM810508MDFLZN01',126,0,0,NULL),('Araceli Perusquia Santamaria',23,6,2,'PESA740518MHGRNR06',127,0,0,NULL),('Eduardo Ramon Rivera Jimenez',24,6,2,'RIJE750830HMCVMD06',128,0,0,NULL),('Miguel Angel Quintas Lopez',5,5,2,'QULM691110HDFNPG03',129,0,0,NULL),('Alfredo Gonzalez Torres',20,7,1,'GOTA430112HTSNRL03',130,0,0,NULL),('Rocio Ledesma Gomez',5,5,2,'LEGR690831MDFDMC04',131,0,0,NULL),('Alfredo Montiel Marquez',20,7,1,'MOMA480529HDFNRL04',132,0,0,NULL),('Juana Erendira Galvan Rodriguez',24,6,2,'GARJ820124MTSLDN08',133,0,0,NULL),('Rocio Perez Ferrer',5,5,2,'PEFR750522MDFRRC03',134,0,0,NULL),('Angelina Anaya Rodriguez',20,7,1,'AARA471001MDFNDN01',135,0,0,NULL),('Pablo Cesar Urrutia Arroyo',24,6,2,'UUAP761009HNLRRB08',136,0,0,NULL),('Victor Manuel Montero Olivos',5,5,2,'MOOV640318HDFNLC06',137,0,0,NULL),('Javier Castrejon Martinez',20,7,1,'CAMJ371128HDFSRV09',138,0,0,NULL),('Maricela Morales Vazquez',25,6,2,'MOVM731214MDFRZR05',139,0,0,NULL),('Beatriz Monroy Arriaga',8,5,2,'MOAB720617MDFNRT07',140,0,0,NULL),('Juan Guillermo Ordorica Vargas',20,7,1,'OOVJ490314HDFRRN08',141,0,0,NULL),('Maria Cristina Eguia Lis Gutierrez',20,7,1,'EUGC450711MDFGTR07',142,0,0,NULL),('Blanca Elena Sandoval Vargas',8,5,2,'SAVB720119MDFNRL08',143,0,0,NULL),('Octaviano Humberto Dominguez Marquez',20,7,1,'DOMO390322HVZMRC00',144,0,0,NULL),('Ricardo Valencia Sanchez',8,5,2,'VASR651116HDFLNC04',145,0,0,NULL),('Mario Alfredo Bizarro Moreno',25,6,2,'BIMM750318HDFZRR03',146,0,0,NULL),('Veronica Paredes Jimenez',21,5,2,'PAJV690711MDFRMR02',147,0,0,NULL),('David Olmos Pe¤a',26,6,2,'OOPD751017HDFLXV02',148,0,0,NULL),('Margarita Perez Vallejo',26,6,2,'PEVM630712MDFRLR09',149,0,0,NULL),('Rafael Guerrero Dominguez',20,7,1,'GUDR510518HDFRMF07',150,0,0,NULL),('Maria del Carmen Estrada Rodriguez',26,6,2,'EARC751002MDFSDR09',151,0,0,NULL),('Alfonso Torres Lobaton',20,7,1,'TOLA440224HDFRBL09',152,0,0,NULL),('Ana Maria Vargas Gonzalez',11,5,2,'VXGA751018MDFRNN05',153,0,0,NULL),('Manuel Landeros Ledesma',4,7,1,'LALM530506HDFNDN05',154,0,0,NULL),('Rogelio Suarez Olvera',3,5,2,'SUOR691207HDFRLG04',155,0,0,NULL),('Antonio Orendain Rodriguez',11,5,2,'OERA620708HDFRDN07',156,0,0,NULL),('Ariana Minerva Leyva Quintana',11,5,2,'LEQA720503MDFYNR08',157,0,0,NULL),('Alicia Guel Rodriguez',20,5,2,'GURA690419MDFLDL04',158,0,0,NULL),('Cesar Miguel Mejia Barradas',20,5,2,'MEBC660713HDFJRS03',159,0,0,NULL),('Ma. Eugenia Pliego Padilla',9,7,1,'PIPE480622MMCLDG09',160,0,0,NULL),('Gerardo Nava Lugo',20,5,2,'NALG601122HDFVGR00',161,0,0,NULL),('Esther Rubio Duran',11,5,2,'RUDE670722MDFBRS00',162,0,0,NULL),('Alfonso Rivas Garcia',25,7,1,'RIGA491006HDFVRL03',163,0,0,NULL),('Irad Sella Maruri Correa',20,5,2,'MACI721204MDFRRR05',164,0,0,NULL),('Fernando Vazquez Torres',25,7,1,'VATF490925HCLZRR00',165,0,0,NULL),('Ricardo Rosete Ladino',20,5,2,'ROLR550403HDFSDC09',166,0,0,NULL),('Francisco Ramirez Torres',25,7,1,'RATF410724HMCMRR01',167,0,0,NULL),('Ma. Paula Gutierrez Guzman',9,5,2,'GUGP470524MGTTZL14',168,0,0,NULL),('Humberto Oviedo Galdeano',25,7,1,'OIGH460815HSPVLM01',169,0,0,NULL),('Oscar Israel Espejel Sosa',1,5,2,'EESO710420HDFSSS01',170,0,0,NULL),('Ofir Jose Ramirez Garcia',25,7,1,'RAGO460827HCHMRF01',171,0,0,NULL),('Paula Castelan Alfaro',1,5,2,'CAAP700618MHGSLL05',172,0,0,NULL),('Ramon Moreno Martinez',25,7,1,'MOMR460831HDFRRM01',173,0,0,NULL),('Pedro Luis Everardo Degan',1,5,2,'EEDP710226HDFVGD05',174,0,0,NULL),('Salvador Nava Rodriguez',25,7,1,'NARS460214HDFVDL09',175,0,0,NULL),('Maria Patricia Alarcon Velazquez',2,5,2,'AAVP620827MDFLLT01',176,0,0,NULL),('Eduardo Otero Arce',25,5,2,'OEAE730327HDFTRD01',177,0,0,NULL),('Sylvio Julio Garcia',25,7,1,'GAXS460712HOCRXY00',178,0,0,NULL),('Jorge Sosa Ramirez',25,5,2,'SORJ481225HDFSMR07',179,0,0,NULL),('Jose Luis Arelio Palma',25,5,2,'AEPL670722HDFRLS03',180,0,0,NULL),('Tania del Carmen Flores Vazquez',25,5,2,'FOVT701027MJCLZN01',181,0,0,NULL),('Victor Manuel Rafael Cordoba Lobo',25,7,1,'COLV421201HVZRBC02',182,0,0,NULL),('Victor Manuel Gomora Berriel',25,5,2,'GOBV710616HDFMRC05',183,0,0,NULL),('Maria Teresa Cruz Rodriguez',26,5,2,'CURT690225MDFRDR08',184,0,0,NULL),('Pedro Ruiz Ordorica',19,6,2,'RUOP550505HDFZRD06',185,0,0,NULL),('Francisco Sosa Alonso',15,6,2,'SOAF560529HDFSLR04',186,0,0,NULL),('Gabriela Hernandez Hernandez',11,5,2,'HEHG730324MMCRRB01',187,0,0,NULL),('Ivonne Romo Hernandez',11,5,2,'ROHI710319MDFMRV09',188,0,0,NULL),('Jose Ramon Suarez Toledo',11,5,2,'SUTR650831HMNRLM07',189,0,0,NULL),('Miguel Angel Gasca Zempoalteca',16,6,2,'GAZM520801HDFSMG05',190,0,0,NULL),('Dolores Legorreta Aguilar',20,6,2,'LEAD520511MDFGGL05',191,0,0,NULL),('Diego Martinez Sanchez',25,6,2,'MASD501113HDFRNG08',192,0,0,NULL),('Juan Gabriel Hernandez Montero',11,5,2,'HEMJ720413HMCRNN01',193,0,0,NULL),('Juan Valadez Sandoval',11,5,2,'VASJ661102HDFLNN09',194,0,0,NULL),('Judith Isabel Montes Juarez',11,5,2,'MOJJ550506MDFNRD03',195,0,0,NULL),('Magda Elena Berrospe Martinez',11,5,2,'BEMM700213MDFRRG08',196,0,0,NULL),('Victor Morales Marin',25,6,2,'MOMV480203HPLRRC06',197,0,0,NULL),('Maria Guadalupe Olmedo Anaya',11,5,2,'OEAG740413MDFLND08',198,0,0,NULL),('Miguel Montiel Cortes',2,4,1,'MOCM540817HDFNRG02',199,0,0,NULL),('Erinn Michelle Valdez Enriquez',3,3,1,'VAEE030207MMCLNRA3',200,0,0,NULL),('Benjamin Carlos Sedano Guadarrama',11,5,1,'SEGB590331HGRDDN08',201,0,0,NULL),('Gabriel Arturo Villegas Ortiz',11,5,1,'VIOG680919HDFLRB03',202,0,0,NULL),('Martin Figueroa Sanchez',11,5,2,'FISM660313HDFGNR05',203,0,0,NULL),('Gabriela Leticia Mercado Mancera',11,5,1,'MEMG730324MDFRNB06',204,0,0,NULL),('Noralba Juarez Antonio',11,5,2,'JUAN630820MVZRNR03',205,0,0,NULL),('Gerardo Irving Arjona Ramirez',11,5,1,'AORG660307HDFRMR00',206,0,0,NULL),('Virginia Gonzalez Gonzalez',11,5,2,'GOGV530928MDFNNR03',207,0,0,NULL),('Olga Arvizu Saucedo',12,5,2,'AISO671002MDFRCL02',208,0,0,NULL),('Claudia Garcia Ramirez',13,5,2,'GARC670125MDFRML05',209,0,0,NULL),('Maria del Carmen Canales Morales',13,5,2,'CAMC590406MDFNRR09',210,0,0,NULL),('J. Santana Villarreal Reyes',11,5,1,'VIRS620726HGRLYN04',211,0,0,NULL),('Jose Antonio Hernandez Cuellar',11,5,1,'HECA550821HDFRLN02',212,0,0,NULL),('Jose Ruben Aguilar Sanchez',11,5,1,'AUSR560615HSPGNB00',213,0,0,NULL),('Maria del Carmen Rodriguez Hernandez',11,5,1,'ROHC651221MDFDRR09',214,0,0,NULL),('Enrique Jimenez Lezama',14,5,2,'JILE681129HDFMZN04',215,0,0,NULL),('Blanca Estela Castillo Tapolla',10,5,2,'CATB571204MDFSPL09',216,0,0,NULL),('Irma Aguilar Gutierrez',10,5,2,'AUGI680512MGTGTR04',217,0,0,NULL),('Maria Esther Zavala Ramirez',11,5,1,'ZARE680703MDFVMS00',218,0,0,NULL),('Marina Espitia Badillo',11,5,1,'EIBM651226MDFSDR01',219,0,0,NULL),('Ricardo Gallardo Alvarez',11,5,1,'GAAR581106HDFLLC09',220,0,0,NULL),('Rocio de Jesus Urrieta Olivares',11,5,1,'UIOR701222MDFRLC09',221,0,0,NULL),('Fermin Verdin Figueroa',12,5,1,'VEFF690504HNTRGR04',222,0,0,NULL),('Jose Garcia Flores',12,5,1,'GAFJ700318HTLRLS19',223,0,0,NULL),('Maria Teresa Lopez Villa',12,5,1,'LOVT630802MDFPLR01',224,0,0,NULL),('Rafaela Jaimes Leon',12,5,1,'JALR711104MGRMNF09',225,0,0,NULL),('Sergio Nu¤ez Perez',12,5,1,'NUPS610603HDFXRR05',226,0,0,NULL),('Ana Maria Cruz Herrera',13,5,1,'CUHA610417MDFRRN03',227,0,0,NULL),('Sergio Rivera Vega',13,5,1,'RIVS690516HDFVGR08',228,0,0,NULL),('Fortunato Cerecedo Hernandez',14,5,1,'CEHF511014HHGRRR01',229,0,0,NULL),('Francisco Martinez Rasgado',14,5,1,'MARF681004HOCRSR02',230,0,0,NULL),('Isaias Candelario Reyes',14,5,1,'CARI640825HVZNYS09',231,0,0,NULL),('Jerardo Rodriguez Coroy',14,5,1,'ROCJ670405HMCDRR07',232,0,0,NULL),('Mario Bernabe y de la Luz',14,5,1,'BELM670409HVZRZR04',233,0,0,NULL),('Rita Aguilar Osorio',14,5,1,'AUOR550517MTCGST06',234,0,0,NULL),('Eloy Martinez Crisostomo',15,5,1,'MACE620702HPLRRL08',235,0,0,NULL),('Jahel Valdes Sauceda',15,5,1,'VASJ640923MSLLCH04',236,0,0,NULL),('Jose Javier Castro Arellano',15,5,1,'CAAJ610213HGTSRV02',237,0,0,NULL),('Patricia Gutierrez Reynoso',15,5,1,'GURP580416MDFTYT08',238,0,0,NULL),('Alejandro Perez Pineda',17,5,1,'PEPA581206HTLRNL09',239,0,0,NULL),('Alfredo Legorreta Gutierrez',17,5,1,'LEGA570103HDFGTL09',240,0,0,NULL),('Blanca Margarita Martinez Perez',17,5,1,'MAPB570310MPLRRL00',241,0,0,NULL),('Carlos Cisneros Araujo',17,5,1,'CIAC571110HTSSRR03',242,0,0,NULL),('Elena Florentina Pi¤a Gutierrez',17,5,1,'PIGE571016MDFXTL03',243,0,0,NULL),('Fabiola Fragoso Castillo',17,5,1,'FACF591114MDFRSB01',244,0,0,NULL),('Faustino Garcia Camacho',17,5,1,'GACF460414HMCRMS12',245,0,0,NULL),('Feliciano Ramirez Parrales',17,5,1,'RAPF540921HDFMRL03',246,0,0,NULL),('Gerardo Zambrano Ramirez',17,5,1,'ZARG551028HDFMMR06',247,0,0,NULL),('Hector Samuel Sandoval Marin',17,5,1,'SAMH491213HDFNRC07',248,0,0,NULL),('Jose Lopez Guzman',17,5,1,'LOGJ510709HDFPZS07',249,0,0,NULL),('Jose Manuel Sanchez Velazquez',17,5,1,'SAVM510620HDFNLN02',250,0,0,NULL),('Ma. Guadalupe Colin Vaca',17,5,1,'COVG660401MMNLCD02',251,0,0,NULL),('Marco Antonio Chino Vite',17,5,1,'CIVM690228HDFHTR05',252,0,0,NULL),('Raul Vazquez Cruz',17,5,1,'VACR580418HDFZRL00',253,0,0,NULL),('Tomas Salomon Phillips Barcenas',17,5,1,'PIBT600120HDFHRM05',254,0,0,NULL),('Victor Ruben Gallegos Martinez',17,5,1,'GAMV590912HDFLRC06',255,0,0,NULL),('Gustavo Mendoza Romero',18,5,1,'MERG560913HDFNMS07',256,0,0,NULL),('Lauro Lira Gomez',18,5,1,'LIGL470506HVZRMR01',257,0,0,NULL),('Francisco Flores Juarez',19,5,1,'FOJF600402HDFLRR02',258,0,0,NULL),('M. Evelia Figueroa Arellano',19,5,1,'FIAE550708MNTGRV05',259,0,0,NULL),('Aida Araceli Mendoza Perez',6,5,1,'MEPA640519MOCNRD09',260,0,0,NULL),('Amapola Pando De Lira',6,5,1,'PALA680807MDFNRM15',261,0,0,NULL),('Antonio Ramos Mendoza',6,5,1,'RAMA620613HOCMNN15',262,0,0,NULL),('Jose Angel Solano Hernandez',6,5,1,'SOHA561001HDFLRN09',263,0,0,NULL),('Luis Arturo Rivas Tovar',6,5,1,'RITL591017HDFVVS01',264,0,0,NULL),('Ma. Guadalupe Hortencia Nava Granillo',6,5,1,'NAGG500111MHGVRD08',265,0,0,NULL),('Rosa Maria del Carmen Ancona Sanchez',6,5,1,'AOSR580410MDFNNS02',266,0,0,NULL),('Jaime Galicia Betancourt',5,5,1,'GABJ570701HDFLTM06',267,0,0,NULL),('Martha Mendoza Flores',5,5,1,'MEFM600511MDFNLR08',268,0,0,NULL),('Encarnacion Salinas Hernandez',7,5,1,'SAHE680209HDFLRN02',269,0,0,NULL),('J. Jesus Casiano Cruz',8,5,1,'CACJ571003HGRSRS07',270,0,0,NULL),('Roberto Ortega Pineda',8,5,1,'OEPR650304HDFRNB06',271,0,0,NULL),('Adolfo Helmut Rudolf Navarro',10,5,1,'RUNA661228HDFDVD04',272,0,0,NULL),('Adrian Alcantar Torres',10,5,1,'AATA630305HDFLRD06',273,0,0,NULL),('Porfirio Reyes Lopez',10,5,1,'RELP680915HMCYPR05',274,0,0,NULL),('Antonio Hernandez Cardoso',21,5,1,'HECA701009HDFRRN05',275,0,0,NULL),('Juan Carlos Rios Juarez',21,5,1,'RIJJ710510HDFSRN02',276,0,0,NULL),('Maria Dolores Garcia Martinez',21,5,1,'GAMD691130MDFRRL09',277,0,0,NULL),('Graciela Margarita Gonzalez Lugo',3,5,1,'GOLG650610MDFNGR06',278,0,0,NULL),('Jose Francisco Delgado Reyes',3,5,1,'DERF540120HDFLYR06',279,0,0,NULL),('Oscar Rodolfo Rodas Suarez',3,5,1,'ROSO610529HDFDRS08',280,0,0,NULL),('Elvia Galindo Caciano',20,5,1,'GACE630530MDFLCL09',281,0,0,NULL),('Gerardo Ramirez Colin',20,5,1,'RACG631021HDFMLR05',282,0,0,NULL),('Maria Estela Quezada Cervantes',20,5,1,'QUCE571026MGRZRS03',283,0,0,NULL),('Norma Estela Herrera Gonzalez',20,5,1,'HEGN570629MDFRNR04',284,0,0,NULL),('Adriana Cecilia Leos Franco',4,5,1,'LEFA680806MDFSRD01',285,0,0,NULL),('Laura Villagomez Najera',4,5,1,'VINL700118MDFLJR02',286,0,0,NULL),('Dominga Irene Ramirez Martinez',1,5,1,'RAMD630221MMCMRM05',287,0,0,NULL),('Adolfo Escamilla Esquivel',23,5,1,'EAEA600529HDFSSD07',288,0,0,NULL),('Domingo Hernandez Garcia',23,5,1,'HEGD570804HHGRRM01',289,0,0,NULL),('Jaime Ledesma Ortiz',23,5,1,'LEOJ640906HDFDRM00',290,0,0,NULL),('Juan Vera Romero',23,5,1,'VERJ650926HDFRMN07',291,0,0,NULL),('Abel Bueno Meza',25,5,1,'BUMA590409HDFNZB02',292,0,0,NULL),('Alberto Serna Mendez',25,5,1,'SEMA670429HDFRNL06',293,0,0,NULL),('Alfonso Leobardo Zarco Istiga',25,5,1,'ZAIA520118HDFRSL09',294,0,0,NULL),('Angel Leon Maldonado',25,5,1,'LEMA730605HDFNLN09',295,0,0,NULL),('Antonio Garcia Rosas',25,5,1,'GARA550902HDFRSN00',296,0,0,NULL),('Araceli Ponce Martinez',25,5,1,'POMA730916MDFNRR07',297,0,0,NULL),('Carlos Olicon Nava',25,5,1,'OINC630714HDFLVR06',298,0,0,NULL),('Eduardo Sanchez Solorzano',25,5,1,'SASE680421HDFNLD08',299,0,0,NULL),('Guillermo Granados Muci¤o',25,5,1,'GAMG701207HDFRCL07',300,0,0,NULL),('Guillermo Rivera Rangel',25,5,1,'RIRG580213HDFVNL07',301,0,0,NULL),('Jorge Flores Garcia',25,5,1,'FOGJ720420HDFLRR08',302,0,0,NULL),('Jose Mario Rodriguez Aparicio',25,5,1,'ROAM680524HDFDPR02',303,0,0,NULL),('Judith Sonck Ledesma',25,5,1,'SOLJ640611MDFNDD08',304,0,0,NULL),('Maria Eloisa Ayuso Naranjo',25,5,1,'AUNE640706MOCYRL05',305,0,0,NULL),('Maria Lydia Perez Jimenez',25,5,1,'PEJL600712MDFRMY06',306,0,0,NULL),('Maria Mayra Vazquez Jimenez',25,5,1,'VAJM631103MDFZMY07',307,0,0,NULL),('Rocio Garcia Pedraza',25,5,1,'GAPR660520MTCRDC03',308,0,0,NULL),('Carlos Cruz ',26,5,1,'CUXC660910HDFRXR05',309,0,0,NULL),('Emilio Niceforo Brito Martinez',26,5,1,'BIME690211HDFRRM07',310,0,0,NULL),('Jorge Perez Hernandez',26,5,1,'PEHJ700404HDFRRR06',311,0,0,NULL),('Manuel Gonzalez Sarabia',26,5,1,'GOSM671212HMCNRN08',312,0,0,NULL),('Sofia Arreola Cervantes',12,7,1,'AECS450126MDFRRF05',313,0,0,NULL),('Carlos Rodriguez Mota',14,7,1,'ROMC480406HDFDTR05',314,0,0,NULL),('Daniel Galindo Ortega',14,7,1,'GAOD490527HDFLRN03',315,0,0,NULL),('Eduardo Acosta Cartas',14,7,1,'AOCE491013HVZCRD04',316,0,0,NULL),('Luis Raul Marin Torres',14,7,1,'MATL540217HPLRRS09',317,0,0,NULL),('Manuel Rosas Ya¤ez',14,7,1,'ROYM441008HDFSXN02',318,0,0,NULL),('Marco Antonio Cerecedo Diaz',14,7,1,'CEDM480211HTLRZR07',319,0,0,NULL),('Maria Antonieta Mayoral Guzman',14,7,1,'MAGA490624MDFYZN08',320,0,0,NULL),('Norberto Rochin Rivera',14,7,1,'RORN450812HDFCVR02',321,0,0,NULL),('Andrea Marmol Salazar',15,7,1,'MASA521130MDFRLN01',322,0,0,NULL),('Elsa Miriam Arce Estrada',15,7,1,'AEEE480426MDFRSL04',323,0,0,NULL),('Enrique Ortega Mu¤oz',15,7,1,'OEME480716HTLRXN02',324,0,0,NULL),('Ismael Medina Mondragon',15,7,1,'MEMI470211HDFDNS05',325,0,0,NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-15 16:38:29
