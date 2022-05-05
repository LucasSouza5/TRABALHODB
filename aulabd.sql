/*
SQLyog Trial v13.1.9 (64 bit)
MySQL - 10.7.2-MariaDB : Database - aulabd
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`aulabd` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `aulabd`;

/*Table structure for table `alunos` */

DROP TABLE IF EXISTS `alunos`;

CREATE TABLE `alunos` (
  `id_aluno` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `matricula` varchar(15) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  `sexo` varchar(1) DEFAULT NULL,
  `fk_curso` int(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_aluno`),
  KEY `fk_curso` (`fk_curso`),
  CONSTRAINT `fk_curso` FOREIGN KEY (`fk_curso`) REFERENCES `curso` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `alunos` */

/*Table structure for table `cidade` */

DROP TABLE IF EXISTS `cidade`;

CREATE TABLE `cidade` (
  `id_cidade` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `pk_estado` varchar(2) NOT NULL,
  PRIMARY KEY (`id_cidade`),
  KEY `fk_estado` (`pk_estado`),
  CONSTRAINT `fk_estado` FOREIGN KEY (`pk_estado`) REFERENCES `estado` (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cidade` */

/*Table structure for table `curso` */

DROP TABLE IF EXISTS `curso`;

CREATE TABLE `curso` (
  `descricao` varchar(100) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `curso` */

/*Table structure for table `estado` */

DROP TABLE IF EXISTS `estado`;

CREATE TABLE `estado` (
  `id_estado` varchar(2) NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `estado` */

/*Table structure for table `professor` */

DROP TABLE IF EXISTS `professor`;

CREATE TABLE `professor` (
  `codigo` int(11) DEFAULT NULL,
  `nome` varchar(50) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `titulacao` varchar(50) DEFAULT NULL,
  `sexo` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `professor` */

insert  into `professor`(`codigo`,`nome`,`cpf`,`email`,`titulacao`,`sexo`) values 
(1,'Lucas','14513546587','professorlucas@gmail.com','mestre','M'),
(1,'Vani','14710036598','professoravani@gmail.com','doutora','F');

/*Table structure for table `resposta` */

DROP TABLE IF EXISTS `resposta`;

CREATE TABLE `resposta` (
  `numquestao` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `descresposta` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `resposta` */

insert  into `resposta`(`numquestao`,`id`,`descresposta`) values 
(2,2,'É o único identificador de um registro da tabela. Usado para identificar o registro sendo assim não há outro registro com a mesma PK.'),
(3,3,' Também conhecida como chave externa é a chave que permite referenciar o identificador principal de outras tabelas.'),
(4,4,'CREATE TABLE curso(id int PRIMARY KEY AUTO_INCREMENT, descricao VARCHAR(50));'),
(5,5,' CREATE TABLE alunos(id_aluno integer PRIMARY KEY AUTO_INCREMENT,nome VARCHAR(50), matricula VARCHAR(15), estado VARCHAR(10), sexo VARCHAR(1),fk_curso int, CONSTRAINT fk_curso FOREIGN KEY (fk_curso) REFERENCES curso (id));'),
(6,6,'ALTER TABLE alunos ADD email varchar(50);'),
(7,7,'ALTER TABLE professor DROP fone;'),
(8,8,'UPDATE professores sexo=M;'),
(9,9,'DELETE FROM professores WHERE sexo=F;'),
(10,10,'SELECT nome,matricula FROM alunos;'),
(11,11,'SELECT sexo FROM professores WHERE sexo=M;'),
(12,12,'SELECT alunos.nome,descricao.curso FROM alunos JOIN curso ON alunos.fk_curso = curso.id;'),
(13,13,'CREATE TABLE estado(id_estado VARCHAR(2) NOT NULL PRIMARY KEY, nome VARCHAR(30));'),
(14,14,'SELECT nome FROM cidade WHERE LOCATE( \'A\', nome ) > 0 ORDER BY LOCATE( \'A\', nome );\');'),
(15,15,'select * from cidade where UFestado = \'MG\';'),
(16,16,'select cidade.nome, estado.nome from cidade, estado where cidade.UFestado = estado.UF group by estado.nome ;'),
(17,17,'select LOWER(cidade.nome) from cidade ;'),
(18,18,'select UPPER(cidade.nome) from cidade ;'),
(19,19,'select count(cidade.id) as Quantidade_de_cidades , estado.nome as Estado from cidade,estado where cidade.UFestado = estado.UF group by estado.nome;');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
