-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.45-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema ob1
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ ob1;
USE ob1;

--
-- Table structure for table `ob1`.`items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `id` int(11) NOT NULL auto_increment,
  `venda` int(11) NOT NULL,
  `produto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `valor` double(8,2) default NULL,
  `subtotal` double(8,2) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_venda` (`venda`),
  KEY `FK_produto` (`produto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ob1`.`items`
--

/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`id`,`venda`,`produto`,`quantidade`,`valor`,`subtotal`) VALUES 
 (1,2,12,2,1.00,2.00),
 (2,2,13,2,2.00,4.00),
 (3,2,260,10,5.00,50.00),
 (4,3,1,1,1.00,1.00),
 (5,3,2,2,2.00,4.00);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;


--
-- Table structure for table `ob1`.`produto`
--

DROP TABLE IF EXISTS `produto`;
CREATE TABLE `produto` (
  `idProduto` int(10) unsigned NOT NULL auto_increment,
  `Segmento` int(4) unsigned NOT NULL,
  `UnidadeMedida` int(3) unsigned NOT NULL,
  `DescProduto` varchar(40) default NULL,
  `valorUnitario` double(10,2) default NULL,
  PRIMARY KEY  (`idProduto`),
  KEY `Fk_UnidadeMedida` (`UnidadeMedida`),
  KEY `Fk_Segmento` (`Segmento`)
) ENGINE=InnoDB AUTO_INCREMENT=363 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ob1`.`produto`
--

/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` (`idProduto`,`Segmento`,`UnidadeMedida`,`DescProduto`,`valorUnitario`) VALUES 
 (1,1,1,'Agua Sanitaria QBoa 1 lt',1.00),
 (2,1,1,'Agua Sanitaria Brilhante 1 Lt',2.00),
 (3,1,1,'Agua Sanitaria Eficassy 1 Lt',0.00),
 (4,1,1,'Agua Sanitaria DA Oma 1 Lt',0.00),
 (5,1,1,'Agua Sanitaria Big 1 Lt',1.00),
 (6,1,1,'Agua Sanitaria Candura 1 lt',0.00),
 (7,1,1,'Agua Sanitaria Candura 2 lt',1.00),
 (8,1,1,'Agua Sanitaria Brilhante 2 Lt',4.00),
 (9,1,1,'Agua Sanitaria DA Oma 2 Lt',1.00),
 (10,1,1,'Agua Sanitaria QBoa 2 Lt',2.00),
 (11,1,1,'Agua Sanitaria Big 2 Lt',1.00),
 (12,1,1,'Agua Sanitaria Eficassy 2 Lt',1.00),
 (13,1,1,'Amaciante Eficassy 2 Lt',2.00),
 (14,1,1,'Amaciante Baby Soft 2 Lt',2.00),
 (15,1,1,'Amaciante Minuano 2 Lt',2.00),
 (16,1,1,'Amaciante Confort 2 Lt',4.00),
 (17,1,1,'Amaciante Mon Bijou 1,5 Lt',3.00),
 (18,1,1,'Amaciante Fofo 2 Lt',5.00),
 (19,1,1,'Amaciante Toque 2 Lt',2.00),
 (20,1,1,'Amaciante Santhinner 2 Lt',2.00),
 (21,1,1,'Amaciante Estrela 2 Lt',2.00),
 (22,1,1,'Desengordurador Veja 500ml',2.00);
INSERT INTO `produto` (`idProduto`,`Segmento`,`UnidadeMedida`,`DescProduto`,`valorUnitario`) VALUES 
 (23,1,1,'Desengordurador Cif 500g',3.00),
 (24,1,1,'Desengordurador X-14 500ml',2.00),
 (25,1,1,'Desengordurador QBoa Multiuso 500ml',0.00),
 (26,1,1,'Desengordurador Ajax Multiuso 500ml',2.00),
 (27,1,1,'Desengordurador Pratice 500ml',2.00),
 (28,1,1,'Desinfetante Pinho Sol 500ml',1.00),
 (29,1,1,'Desinfetante Pinho Bril 500ml',1.00),
 (30,1,1,'Desinfetante Minuano 500ml',1.00),
 (31,1,1,'Desinfetante de Sanitario Veja 500ml',3.00),
 (32,1,1,'Desinfetante de Sanitario Harpic 500ml',3.00),
 (33,1,1,'Desinfetante de Sanitario Pato 500ml',3.00),
 (34,1,1,'Detergente Minuano 500ml',0.00),
 (35,1,1,'Detergente Ype 500ml',0.00),
 (36,1,1,'Detergente 2000 500ml',0.00),
 (37,1,1,'Detergente Eficassy 500ml',0.00),
 (38,1,1,'Detergente Limpol 500ml',0.00),
 (39,1,1,'Detergente Higie 500ml',0.00),
 (40,1,1,'Detergente Font 500ml',0.00),
 (41,1,1,'Detergente Qlar 500ml',0.00),
 (42,1,1,'Lustra Moveis Poliflor 200ml',2.00),
 (43,1,1,'Lustra Moveis Peroba 200ml',1.00);
INSERT INTO `produto` (`idProduto`,`Segmento`,`UnidadeMedida`,`DescProduto`,`valorUnitario`) VALUES 
 (44,1,1,'Lustra Moveis Bravo 200ml',2.00),
 (45,1,2,'Palha de Aco Bombril 60g',1.00),
 (46,1,2,'Palha de Aco Assolan 60g',1.00),
 (47,1,2,'Sabao Minuano 1 Kg',3.00),
 (48,1,2,'Sabao Rio 1 Kg',2.00),
 (49,1,2,'Sabao Minerva 1 Kg',3.00),
 (50,1,2,'Sabao Brilhante 1 Kg',4.00),
 (51,1,2,'Sabao Cruz Azul 1 Kg',3.00),
 (52,1,2,'Sabao em po Bold 1 Kg',4.00),
 (53,1,2,'Sabao em Po Omo 1 Kg',6.00),
 (54,1,2,'Sabao em Po Brilhante 1 Kg',5.00),
 (55,1,2,'Sabao em Po Minerva 1 Kg',5.00),
 (56,1,2,'Sabao em Po Eficassy 1 Kg',2.00),
 (57,1,2,'Sabao em Po Ace 1 Kg',5.00),
 (58,1,3,'Toalha de Papel Chifon 2 rolos',2.00),
 (59,1,3,'Toalha de Papel Kitchen 2 Rolos',1.00),
 (60,1,3,'Toalha de Papel Snob 2 Rolos',2.00),
 (61,1,3,'Toalha de Papel Yuri 2 Rolos',1.00),
 (62,1,3,'Toalha de Papel Residense 2 Rolos',2.00),
 (63,1,3,'Toalha de Papel Big 2 Rolos',2.00),
 (64,1,3,'Toalha de Papel Toallita 2 Rolos',1.00),
 (65,2,2,'Acucar Alto Alegre ref. branco 1 Kg',1.00);
INSERT INTO `produto` (`idProduto`,`Segmento`,`UnidadeMedida`,`DescProduto`,`valorUnitario`) VALUES 
 (66,2,2,'Acucar Dolce ref. branco 1 Kg',1.00),
 (67,2,2,'Acucar Uniao ref. branco 1 Kg',1.00),
 (68,2,2,'Acucar Ducula ref. branco 1 Kg',1.00),
 (69,2,2,'Acucar Ducula ref. branco 5 Kg',5.00),
 (70,2,2,'Acucar Alto Alegre ref. branco 5 Kg',4.00),
 (71,2,2,'Acucar Uniao ref. branco 5 Kg',7.00),
 (72,2,2,'Acucar Da Barra ref. branco 5 Kg',4.00),
 (73,2,2,'Acucar Dolce ref. branco 5 Kg',6.00),
 (74,2,1,'Adocante Zero-cal 100ml',1.00),
 (75,2,1,'Adocante Adocyl 100ml',1.00),
 (76,2,1,'Adocante Stevia 80ml',2.00),
 (77,2,1,'Adocante Doce Menor 100ml',1.00),
 (78,2,1,'Adocante Magro 100ml',1.00),
 (79,2,1,'Adocante Finn 100ml',1.00),
 (80,2,2,'Amido de Milho Maizena 500g',2.00),
 (81,2,2,'Amido de Milho Tell 500g',2.00),
 (82,2,2,'Amido de Milho Maxsenna 500g',1.00),
 (83,2,2,'Amido de Milho Big 500g',2.00),
 (84,2,2,'Amido de Milho Sinha 500g',1.00),
 (85,2,2,'Amido de Milho Molinari 500g',1.00),
 (86,2,2,'Amido de Milho Yoki 500g',1.00);
INSERT INTO `produto` (`idProduto`,`Segmento`,`UnidadeMedida`,`DescProduto`,`valorUnitario`) VALUES 
 (87,2,2,'Arroz Tio Urbano 1 5 Kg',6.00),
 (88,2,2,'Arroz Naco 1 5 Kg',3.00),
 (89,2,2,'Arroz Branco Kiarroz 1 5 Kg',6.00),
 (90,2,2,'Arroz Branco Tia Maria 1 5 Kg',6.00),
 (91,2,2,'Arroz Branco Tio Joao 1 5 Kg',7.00),
 (92,2,2,'Arroz Branco Chines 1 5 Kg',5.00),
 (93,2,2,'Arroz Branco Campeiro 1 5 kg',6.00),
 (94,2,2,'Arroz Branco Gelao 1 5 Kg',5.00),
 (95,2,2,'Arroz Branco Super A 1 5 Kg',5.00),
 (96,2,1,'Azeite Galo 500ml',13.00),
 (97,2,1,'Azeite Arisco 500ml',11.00),
 (98,2,2,'Azeitona Vale Fertil Verde 500g',7.00),
 (99,2,2,'Azeitona Rivoli Verde 500g',7.00),
 (100,2,2,'Azeitona La Violetera Verde 500g',4.00),
 (101,2,2,'Biscoito Tortinhas 185g',1.00),
 (102,2,2,'Biscoito Paraty 130g',0.00),
 (103,2,2,'Biscoito Trakinas 164g',1.00),
 (104,2,2,'Biscoito Bono 200g',1.00),
 (105,2,2,'Biscoito Negresco 200g',1.00),
 (106,2,2,'Biscoito Gulosos 170g',1.00),
 (107,2,2,'Biscoito Isabel Agua e Sal 200g',1.00),
 (108,2,2,'Biscoito Parati Agua e Sal 200g',1.00);
INSERT INTO `produto` (`idProduto`,`Segmento`,`UnidadeMedida`,`DescProduto`,`valorUnitario`) VALUES 
 (109,2,2,'Biscoito Club Social Cream Cracker 156g',1.00),
 (110,2,2,'Biscoito Triunfo Cream Cracker 200g',1.00),
 (111,2,2,'Biscoito Bauducco Agua e Sal 200g',1.00),
 (112,2,2,'Cafe em po Damasco 500g',4.00),
 (113,2,2,'Cafe em po Uniao 500g',3.00),
 (114,2,2,'Cafe em po Sasse 500g',4.00),
 (115,2,2,'Cafe em po Melita 500g',4.00),
 (116,2,2,'Cafe em po Caboclo 500g',3.00),
 (117,2,2,'Cafe Soluvel Nescafe 100g',4.00),
 (118,2,2,'Cafe Soluvel Pele 100g',4.00),
 (119,2,2,'Cafe Soluvel Iguacu 100g',2.00),
 (120,2,2,'Cafe Soluvel Melita 100g',4.00),
 (121,2,2,'Cafe Soluvel Colonial 100g',3.00),
 (122,2,2,'Cafe Soluvel - refil Nescafe 50g',1.00),
 (123,2,2,'Cafe Soluvel - refil Pele 50g',1.00),
 (124,2,2,'Cafe Soluvel - refil Damasco 50g',1.00),
 (125,2,2,'Cafe Soluvel - refil Iguacu 50g',1.00),
 (126,2,2,'Cafe Soluvel - refil Colonial 50g',1.00),
 (127,2,2,'Catchup Hellmanns 397g',2.00),
 (128,2,2,'Catchup Arisco 390g',2.00),
 (129,2,2,'Catchup Tell 400g',1.00);
INSERT INTO `produto` (`idProduto`,`Segmento`,`UnidadeMedida`,`DescProduto`,`valorUnitario`) VALUES 
 (130,2,2,'Catchup Pic 400g',2.00),
 (131,2,2,'Chocolate em po Nescau 400g',2.00),
 (132,2,2,'Chocolate em po Garotada 400g',2.00),
 (133,2,2,'Chocolate em po Magico 400g',1.00),
 (134,2,2,'Chocolate em po Toddy 400g',3.00),
 (135,2,2,'Chocolate em po Ovomaltine 300g',4.00),
 (136,2,2,'Chocolate em po Chocoleite 400g',1.00),
 (137,2,2,'Ervilha Poupe Mais 200g',0.00),
 (138,2,2,'Ervilha Twist 200g',0.00),
 (139,2,2,'Ervilha Quero 200g',0.00),
 (140,2,2,'Ervilha Etti 200g',0.00),
 (141,2,2,'Ervilha Jussara 200g',1.00),
 (142,2,2,'Ervilha Lar 200g',0.00),
 (143,2,2,'Ervilha Oderich 200g',0.00),
 (144,2,2,'Ervilha Jurema 200g',1.00),
 (145,2,2,'Extrato de Tomate Elefante 350g',1.00),
 (146,2,2,'Extrato de Tomate Pomarola Molho 340g',1.00),
 (147,2,2,'Extrato de Tomate Arisco 350g',0.00),
 (148,2,2,'Extrato de Tomate Cajamar 350g',1.00),
 (149,2,2,'Extrato de Tomate Quero 350g',1.00),
 (150,2,2,'Extrato de Tomate Luc 350g',0.00),
 (151,2,2,'Farinha de Mandioca Molinari 500g',2.00);
INSERT INTO `produto` (`idProduto`,`Segmento`,`UnidadeMedida`,`DescProduto`,`valorUnitario`) VALUES 
 (152,2,2,'Farinha de Mandioca Jaragua Kg',1.00),
 (153,2,2,'Farinha de Mandioca Zuque Kg',2.00),
 (154,2,2,'Farinha de Mandioca Gelao Kg',1.00),
 (155,2,2,'Farinha de Mandioca Rocha Kg',0.00),
 (156,2,2,'Farinha de trigo Nordeste 1 kg',1.00),
 (157,2,2,'Farinha de trigo Dona Benta 1 Kg',1.00),
 (158,2,2,'Farinha de trigo Boa Sorte 1 Kg',1.00),
 (159,2,2,'Farinha de trigo Flor de Liz 1 kg',0.00),
 (160,2,2,'Farinha de trigo Rosa Branca 1 kg',0.00),
 (161,2,2,'Farinha de trigo Guth 1 kg',1.00),
 (162,2,2,'Farinha de trigo Sol 1 kg',1.00),
 (163,2,2,'Feijao Preto Biju 1 Kg',2.00),
 (164,2,2,'Feijao Preto Jaragua 1 KG',2.00),
 (165,2,2,'Feijao Preto Naco 1 Kg',1.00),
 (166,2,2,'Feijao Preto Jureia 1 Kg',2.00),
 (167,2,2,'Feijao Preto Caldao 1 Kg',2.00),
 (168,2,2,'Feijao Preto Azulao 1 Kg',2.00),
 (169,2,2,'Feijao Preto Caldo Bom 1 Kg',2.00),
 (170,2,2,'Feijao Preto Super A 1 Kg',2.00),
 (171,2,2,'Macarrao Renata Semola 500g',1.00),
 (172,2,2,'Macarrao Galo Semola 500g',1.00);
INSERT INTO `produto` (`idProduto`,`Segmento`,`UnidadeMedida`,`DescProduto`,`valorUnitario`) VALUES 
 (173,2,2,'Macarrao Todeschini Semola 500g',1.00),
 (174,2,2,'Macarrao Isabela Semola 500g',1.00),
 (175,2,2,'Macarrao Dona Benta Semola 500g',1.00),
 (176,2,2,'Macarrao Germani Semola 500g',0.00),
 (177,2,2,'Macarrao Instantaneo Nissin 80g',0.00),
 (178,2,2,'Macarrao Instantaneo Maggi 85g',0.00),
 (179,2,2,'Macarrao Instantaneo Renata 80g',0.00),
 (180,2,2,'Macarrao Instantaneo Arisco 85g',0.00),
 (181,2,2,'Macarrao Instantaneo Orient 85g',0.00),
 (182,2,2,'Maionese Hellmanns 500g',3.00),
 (183,2,2,'Maionese Arisco 500g',1.00),
 (184,2,2,'Maionese Primor 500g',1.00),
 (185,2,2,'Maionese Oderich 500g',2.00),
 (186,2,2,'Maionese Delicia 500g',2.00),
 (187,2,2,'Milho Twist 200g',0.00),
 (188,2,2,'Milho Quero 200g',1.00),
 (189,2,2,'Milho Oderich 200g',1.00),
 (190,2,2,'Milho Lar 200g',0.00),
 (191,2,2,'Milho Jurema 200g',1.00),
 (192,2,1,'Oleo de milho Salada 900ml',3.00),
 (193,2,1,'Oleo de soja Soya 900ml',2.00),
 (194,2,1,'Oleo de soja Sadia 900ml',1.00);
INSERT INTO `produto` (`idProduto`,`Segmento`,`UnidadeMedida`,`DescProduto`,`valorUnitario`) VALUES 
 (195,2,1,'Oleo de soja Primor 900ml',1.00),
 (196,2,1,'Oleo de soja Big 900ml',1.00),
 (197,2,1,'Oleo de soja Liza 900ml',1.00),
 (198,2,2,'Sal Diana Fino 1 Kg',0.00),
 (199,2,2,'Sal Cisne 1 Kg',1.00),
 (200,2,2,'Sal Jasmine 1 Kg',1.00),
 (201,2,2,'Sal Big 1 Kg',0.00),
 (202,2,2,'Sal Lebre 1 Kg',0.00),
 (203,2,2,'Sal Zizo 1 Kg',0.00),
 (204,2,2,'Sal Cruzeiro 1 Kg',0.00),
 (205,2,1,'Vinagre Belmont Vinho 750ml',1.00),
 (206,2,1,'Vinagre Chemim Branco 900ml',0.00),
 (207,2,1,'Vinagre Heining Branco 900ml',0.00),
 (208,2,1,'Vinagre Da Ilha Branco 900ml',0.00),
 (209,3,1,'Condicionador Seda Selective 350ml',6.00),
 (210,3,1,'Condicionador Palmolive 350ml',2.00),
 (211,3,1,'Condicionador Monange 350ml',4.00),
 (212,3,1,'Condicionador Colorama 500ml',4.00),
 (213,3,1,'Desodorante Rexona Spray 90ml',2.00),
 (214,3,1,'Desodorante Dove Aerosol 103ml',11.00),
 (215,3,1,'Desodorante Axe Spray 90ml',3.00),
 (216,3,4,'Palito Theoto cx 100 unid.',0.00);
INSERT INTO `produto` (`idProduto`,`Segmento`,`UnidadeMedida`,`DescProduto`,`valorUnitario`) VALUES 
 (217,3,4,'Palitos Gaboardi cx 100 unid.',0.00),
 (218,3,4,'Palitos Maua cx 100 unid.',0.00),
 (219,3,4,'Palitos Gina cx 100 unid.',0.00),
 (220,3,3,'Papel Higienico Neve 4 Rolos',3.00),
 (221,3,3,'Papel Higienico Scott 4 Rolos',2.00),
 (222,3,3,'Papel Higienico Personal 4 Rolos',2.00),
 (223,3,3,'Papel Higienico Mili 4 Rolos',2.00),
 (224,3,3,'Papel Higienico Sirius 4 Rolos',1.00),
 (225,3,3,'Papel Higienico Sublime 4 Rolos',1.00),
 (226,3,3,'Papel Higienico Poupe Mais 4 Rolos',1.00),
 (227,3,3,'Papel Higienico Paloma 4 Rolos',1.00),
 (228,3,3,'Papel Higienico Sirius 8 Rolos',2.00),
 (229,3,3,'Papel Higienico Personal 8 Rolos',2.00),
 (230,3,3,'Papel Higienico Paloma 8 Rolos',3.00),
 (231,3,3,'Papel Higienico Scott 8 Rolos',4.00),
 (232,3,2,'Pasta de Dente Sorriso 90g',1.00),
 (233,3,2,'Pasta de Dente Colgate 90g',1.00),
 (234,3,2,'Pasta de Dente Signal 90g',1.00),
 (235,3,2,'Pasta de Dente Close-up 90g',1.00),
 (236,3,2,'Sabonete Palmolive 90g',0.00);
INSERT INTO `produto` (`idProduto`,`Segmento`,`UnidadeMedida`,`DescProduto`,`valorUnitario`) VALUES 
 (237,3,2,'Sabonete Phebo 90g',1.00),
 (238,3,2,'Sabonete Lux 90g',0.00),
 (239,3,2,'Sabonete Vinolia 90g',0.00),
 (240,3,2,'Sabonete Dove 100g',1.00),
 (241,3,2,'Sabonete Francis 90g',0.00),
 (242,3,1,'Shampoo Seda Selective 500ml',5.00),
 (243,3,1,'Shampoo Seda Lamolina 500ml',5.00),
 (244,3,1,'Shampoo Palmolive 500ml',2.00),
 (245,3,1,'Shampoo Elseve 250ml',3.00),
 (246,3,1,'Shampoo Monange 350ml',4.00),
 (247,3,1,'Shampoo Colorama 500ml',4.00),
 (248,4,2,'Carne de Boi Alcatra 1 kg',9.00),
 (249,4,2,'Carne de Boi Costela 1 Kg',3.00),
 (250,4,2,'Carne de Boi Picanha 1 Kg',17.00),
 (251,4,2,'Carne de Boi Coxao Duro 1 Kg',4.00),
 (252,4,2,'Carne de Boi Coxao Mole 1 Kg',7.00),
 (253,4,2,'Carne de Boi Patinho 1 Kg',7.00),
 (254,4,2,'Frango Macedo Inteiro 1 Kg',2.00),
 (255,4,2,'Frango FrangoBom Inteiro 1 Kg',2.00),
 (256,4,2,'Frango Agro Veneto Inteiro 1 Kg',2.00),
 (257,4,2,'Frango (cs) Agro Veneto Coxa/sobrecoxa 1',4.00),
 (258,4,2,'Frango (cs) Macedo Coxa/sobrecoxa 1 Kg',4.00);
INSERT INTO `produto` (`idProduto`,`Segmento`,`UnidadeMedida`,`DescProduto`,`valorUnitario`) VALUES 
 (259,4,2,'Frango (cs) Copacol Coxa/sobrecoxa 1 Kg',3.00),
 (260,4,2,'Frango (p) Macedo Peito 1 Kg',5.00),
 (261,4,2,'Frango (p) Copacol Peito 1 Kg',3.00),
 (262,4,2,'Frango (p) TopFrango Peito 1 Kg',3.00),
 (263,4,4,'Ovos Kasulke Vermelho 12 unid.',2.00),
 (264,4,4,'Ovos Kasulke Branco 12 unid.',2.00),
 (265,4,4,'Ovos Ronchi Vermelho 12 unid.',1.00),
 (266,4,4,'Ovos Barao Vermelho 12 und.',2.00),
 (267,4,4,'Ovos Friolar Ver/Branco 12 unid.',2.00),
 (268,5,1,'Agua Da Guarda Sem Gas 20 Lt',4.00),
 (269,5,1,'Agua Santa Catarina Sem Gas 20 Lt',4.00),
 (270,5,1,'Agua Imperatriz Sem Gas 20 Lt',4.00),
 (271,5,1,'Cerveja Antartica 350 Ml',0.00),
 (272,5,1,'Cerveja Schincariol 350 Ml',0.00),
 (273,5,1,'Cerveja Skol 350 Ml',1.00),
 (274,5,1,'Cerveja Brahma 350 Ml',1.00),
 (275,5,1,'Cerveja Kaiser 350 Ml',0.00),
 (276,5,1,'Refrigerante Cocacola 2 Lt',2.00),
 (277,5,1,'Refrigerante Kuat 2 Lt',1.00),
 (278,5,1,'Refrigerante Fanta 2 Lt',1.00);
INSERT INTO `produto` (`idProduto`,`Segmento`,`UnidadeMedida`,`DescProduto`,`valorUnitario`) VALUES 
 (279,5,1,'Refrigerante Guarana Antartica 2 Lt',2.00),
 (280,5,1,'Refrigerante Thom 2 Lt',1.00),
 (281,5,1,'Refrigerante Thom-Cola 2 Lt',1.00),
 (282,6,2,'Creme de Leite Parmalat 290g',1.00),
 (283,6,2,'Creme de Leite Nestle 300g',1.00),
 (284,6,2,'Creme de Leite Gloria 300g',2.00),
 (285,6,2,'Creme de Leite Batavo 250g',1.00),
 (286,6,2,'Creme de Leite Itambe 300g',1.00),
 (287,6,1,'Leite Elege Integral 1 lt',1.00),
 (288,6,1,'Leite Tirol Integral 1 lt',1.00),
 (289,6,1,'Leite Frimesa Integral 1 lt',1.00),
 (290,6,1,'Leite Polli Integral 1 lt',1.00),
 (291,6,1,'Leite Lider Integral 1 lt',1.00),
 (292,6,1,'Leite Bom Gosto Integral 1 lt',1.00),
 (293,6,1,'Leite Aurolat Integral 1 lt',1.00),
 (294,6,1,'Leite Nutrilat Integral 1 lt',1.00),
 (295,6,1,'Leite Cedrense Integral 1 lt',1.00),
 (296,6,2,'Leite Condensado Moca 395g',1.00),
 (297,6,2,'Leite Condensado Elege 395g',1.00),
 (298,6,2,'Leite Condensado Parmalat 395g',1.00),
 (299,6,2,'Leite Condensado Gloria 395g',2.00);
INSERT INTO `produto` (`idProduto`,`Segmento`,`UnidadeMedida`,`DescProduto`,`valorUnitario`) VALUES 
 (300,6,2,'Leite Condensado Mococa 395g',1.00),
 (301,6,2,'Leite Condensado Itambe 395g',1.00),
 (302,6,2,'Leite em po Ninho Integral 400g',4.00),
 (303,6,2,'Leite em po Itambe Integral 400g',6.00),
 (304,6,2,'Leite em po Gloria Integral 400g',6.00),
 (305,6,2,'Leite em po Elege Integral 400g',5.00),
 (306,6,2,'Leite em po Molico Integral 300g',5.00),
 (307,6,2,'Margarina Qualy 500g',2.00),
 (308,6,2,'Margarina Becel c/ sal 500g',2.00),
 (309,6,2,'Margarina Delicata 500g',1.00),
 (310,6,2,'Margarina Delícia 500g',2.00),
 (311,6,2,'Margarina Soya 500g',0.00),
 (312,6,2,'Margarina Primor 500g',2.00),
 (313,6,2,'Margarina Mila 500g',2.00),
 (314,6,2,'Queijo Frimesa Prato 1 Kg',11.00),
 (315,6,2,'Queijo Prove Prato 1 Kg',11.00),
 (316,6,2,'Queijo Cedrense Prato 1 Kg',13.00),
 (317,6,2,'Queijo Tirol Prato 1 Kg',10.00),
 (318,6,2,'Queijo Predileto Prato 1 Kg',9.00),
 (319,6,2,'Queijo Tirolez Prato 1 Kg',11.00),
 (320,6,2,'Queijo Ralado Cedrense Parmesao 50g',0.00);
INSERT INTO `produto` (`idProduto`,`Segmento`,`UnidadeMedida`,`DescProduto`,`valorUnitario`) VALUES 
 (321,6,2,'Queijo Ralado Parmezao Parmesao 50g',0.00),
 (322,6,2,'Queijo Ralado Dinamarca 50g',0.00),
 (323,6,2,'Queijo Ralado Bufalo 50g',0.00),
 (324,6,2,'Queijo Ralado Tres Fronteiras 50g',0.00),
 (325,6,2,'Queijo San Diego Minas 1 Kg',4.00),
 (326,6,2,'Queijo Predileto Minas 1 kg',8.00),
 (327,6,2,'Queijo Tres Fronteiras Minas 1 Kg',7.00),
 (328,6,2,'Queijo Cedrense Minas 1 Kg',9.00),
 (329,6,2,'Queijo Tirol Mussarela 1 Kg',10.00),
 (330,6,2,'Queijo Calcar Mussarela 1 Kg',12.00),
 (331,6,2,'Queijo Frimesa Mussarela 1 Kg',10.00),
 (332,6,2,'Queijo Cedrense Mussarela 1 Kg',9.00),
 (333,6,2,'Requeijao Tirol 250g',3.00),
 (334,6,2,'Requeijao Vigor 200g',1.00),
 (335,6,2,'Requeijao Lider 250g',2.00),
 (336,6,2,'Requeijao Do Vale 250g',2.00),
 (337,6,2,'Requeijao Catupiry 250g',2.00),
 (338,6,2,'Requeijao Frimesa 250g',1.00),
 (339,6,2,'Iogurte Veneza 720g',2.00),
 (340,6,2,'Iogurte Danone 540g',3.00),
 (341,6,2,'Iogurte Parmalat 720g',2.00);
INSERT INTO `produto` (`idProduto`,`Segmento`,`UnidadeMedida`,`DescProduto`,`valorUnitario`) VALUES 
 (342,6,2,'Iogurte Batavo 600g',2.00),
 (343,6,2,'Iogurte Vigor 720',2.00),
 (344,6,2,'Iogurte DoVale 720g',2.00),
 (345,7,2,'Alho 100g',1.00),
 (346,7,2,'Banana Branca 1 Kg',2.00),
 (347,7,2,'Banana Caturra 1 Kg',0.00),
 (348,7,2,'Batata Escovada Inglesa 1 Kg',0.00),
 (349,7,2,'Batata Lavada Inglesa 1 Kg',1.00),
 (350,7,2,'Beterraba 1 kg',1.00),
 (351,7,2,'Cebola 1 Kg',1.00),
 (352,7,2,'Cenoura 1 Kg',0.00),
 (353,7,2,'Chuchu 1 Kg',0.00),
 (354,7,2,'Laranja Lima 1 Kg',1.00),
 (355,7,2,'Laranja Pera 1 Kg',1.00),
 (356,7,2,'Limao 1 Kg',2.00),
 (357,7,2,'Maca Gala 1 kg',3.00),
 (358,7,2,'Mamao Papaya 1 Kg',1.00),
 (359,7,2,'Mamao (u) Papaya Unid.',0.00),
 (360,7,2,'Pimentao 1 Kg',2.00),
 (361,7,2,'Repolho 1 Kg',1.00),
 (362,7,2,'Tomate 1 Kg',2.00);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;


--
-- Table structure for table `ob1`.`segmento`
--

DROP TABLE IF EXISTS `segmento`;
CREATE TABLE `segmento` (
  `idSegmProduto` int(4) unsigned NOT NULL auto_increment,
  `DescSegmProduto` varchar(30) default NULL,
  PRIMARY KEY  (`idSegmProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ob1`.`segmento`
--

/*!40000 ALTER TABLE `segmento` DISABLE KEYS */;
INSERT INTO `segmento` (`idSegmProduto`,`DescSegmProduto`) VALUES 
 (1,'Limpeza'),
 (2,'Mercearia'),
 (3,'Higiene'),
 (4,'Carnes'),
 (5,'Bebidas'),
 (6,'Leite'),
 (7,'Hortifruti');
/*!40000 ALTER TABLE `segmento` ENABLE KEYS */;


--
-- Table structure for table `ob1`.`unidmedida`
--

DROP TABLE IF EXISTS `unidmedida`;
CREATE TABLE `unidmedida` (
  `idUnidMedida` int(3) unsigned NOT NULL auto_increment,
  `SiglaUnidMedida` char(2) default NULL,
  `DescrUnidMedida` varchar(20) default NULL,
  PRIMARY KEY  (`idUnidMedida`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ob1`.`unidmedida`
--

/*!40000 ALTER TABLE `unidmedida` DISABLE KEYS */;
INSERT INTO `unidmedida` (`idUnidMedida`,`SiglaUnidMedida`,`DescrUnidMedida`) VALUES 
 (1,'LT','Litros'),
 (2,'KG','Kilo'),
 (3,'RL','Rolo'),
 (4,'UM','Unidade');
/*!40000 ALTER TABLE `unidmedida` ENABLE KEYS */;


--
-- Table structure for table `ob1`.`user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL auto_increment,
  `nome` varchar(50) default NULL,
  `usuario` varchar(8) default NULL,
  `senha` varchar(8) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ob1`.`user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`,`nome`,`usuario`,`senha`) VALUES 
 (1,'JoÆo Alberto Nogueira','joao','12345678');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


--
-- Table structure for table `ob1`.`vendas`
--

DROP TABLE IF EXISTS `vendas`;
CREATE TABLE `vendas` (
  `id` int(11) NOT NULL auto_increment,
  `usuario` int(11) default NULL,
  `dta` date default NULL,
  `hr` time default NULL,
  `ip` varchar(20) default NULL,
  `navegador` varchar(255) default NULL,
  `total` double(8,2) default NULL,
  `pagamento` varchar(50) default NULL,
  `cartao` varchar(50) default NULL,
  `boleto` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ob1`.`vendas`
--

/*!40000 ALTER TABLE `vendas` DISABLE KEYS */;
INSERT INTO `vendas` (`id`,`usuario`,`dta`,`hr`,`ip`,`navegador`,`total`,`pagamento`,`cartao`,`boleto`) VALUES 
 (2,1,'2011-04-08','20:06:39','127.0.0.1','Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/534.16 (KHTML, like Gecko) Chrome/10.0.648.204 Safari/534.16',56.00,'BOLETO','','10526872391020'),
 (3,1,'2011-04-08','20:31:02','127.0.0.1','Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/534.16 (KHTML, like Gecko) Chrome/10.0.648.204 Safari/534.16',5.00,'VISA','1020304050','');
/*!40000 ALTER TABLE `vendas` ENABLE KEYS */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
