/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.1.36-MariaDB : Database - lomi
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`lomi` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `lomi`;

/*Table structure for table `aperturacierre` */

DROP TABLE IF EXISTS `aperturacierre`;

CREATE TABLE `aperturacierre` (
  `id` int(11) NOT NULL,
  `fechaapertura` date NOT NULL,
  `horaapertura` time NOT NULL,
  `montoapertura` int(11) NOT NULL,
  `fechacierre` date DEFAULT NULL,
  `horacierra` time DEFAULT NULL,
  `montocierre` int(11) DEFAULT NULL,
  `idcaja` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `caja_aperturacierre_fk` (`idcaja`),
  KEY `usuario_apercierre_fk` (`idusuario`),
  CONSTRAINT `caja_aperturacierre_fk` FOREIGN KEY (`idcaja`) REFERENCES `caja` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usuario_apercierre_fk` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `aperturacierre` */

insert  into `aperturacierre`(`id`,`fechaapertura`,`horaapertura`,`montoapertura`,`fechacierre`,`horacierra`,`montocierre`,`idcaja`,`idusuario`) values (1,'2018-08-29','13:09:00',100000,'2018-09-14','00:00:00',200000,1,1),(2,'2018-09-05','10:08:00',50000,'2018-09-14','15:13:22',277000,1,1),(3,'2018-09-14','15:36:58',20000,'2018-09-14','15:37:51',66000,1,1),(4,'2018-09-15','08:06:02',50000,'2018-09-19','23:18:46',297000,1,1),(5,'2018-09-19','23:19:02',50000,'2018-09-19','23:26:28',143000,1,1),(6,'2018-09-19','23:27:09',50000,'2018-09-19','23:28:22',50000,1,1),(7,'2018-09-19','23:28:32',50000,'2018-09-19','23:32:45',120000,1,2),(8,'2018-09-20','10:05:54',10000,'2018-09-25','11:07:59',10000,1,1),(9,'2018-09-25','11:45:12',10000,'2018-09-26','09:38:49',72000,1,2);

/*Table structure for table `bancoemisor` */

DROP TABLE IF EXISTS `bancoemisor`;

CREATE TABLE `bancoemisor` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `bancoemisor` */

insert  into `bancoemisor`(`id`,`descripcion`) values (1,'Vision'),(2,'Itau');

/*Table structure for table `caja` */

DROP TABLE IF EXISTS `caja`;

CREATE TABLE `caja` (
  `id` int(11) NOT NULL,
  `nrocaja` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `caja` */

insert  into `caja`(`id`,`nrocaja`) values (1,1);

/*Table structure for table `cargos` */

DROP TABLE IF EXISTS `cargos`;

CREATE TABLE `cargos` (
  `id` int(11) NOT NULL,
  `descripcion` char(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cargos` */

insert  into `cargos`(`id`,`descripcion`) values (1,'Cocinero'),(2,'Cajero'),(3,'Desarrollador');

/*Table structure for table `cheque` */

DROP TABLE IF EXISTS `cheque`;

CREATE TABLE `cheque` (
  `id` int(11) NOT NULL,
  `nrocheque` int(11) NOT NULL,
  `vencimiento` date NOT NULL,
  `idtipocheque` int(11) NOT NULL,
  `idbancoemisor` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tipocheque_cheque_fk` (`idtipocheque`),
  KEY `bancoemisor_cheque_fk` (`idbancoemisor`),
  CONSTRAINT `bancoemisor_cheque_fk` FOREIGN KEY (`idbancoemisor`) REFERENCES `bancoemisor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tipocheque_cheque_fk` FOREIGN KEY (`idtipocheque`) REFERENCES `tipocheque` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cheque` */

/*Table structure for table `ciudades` */

DROP TABLE IF EXISTS `ciudades`;

CREATE TABLE `ciudades` (
  `id` int(11) NOT NULL,
  `descripcion` char(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ciudades` */

insert  into `ciudades`(`id`,`descripcion`) values (1,'Asuncion'),(2,'NANAWA'),(3,'luque'),(4,'san lorenzo'),(5,'lambare'),(10,'lambare');

/*Table structure for table `clientes` */

DROP TABLE IF EXISTS `clientes`;

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `razonsocial` char(40) NOT NULL,
  `documento` varchar(15) NOT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `idciudad` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ciudades_clientes_fk` (`idciudad`),
  CONSTRAINT `ciudades_clientes_fk` FOREIGN KEY (`idciudad`) REFERENCES `ciudades` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `clientes` */

insert  into `clientes`(`id`,`razonsocial`,`documento`,`direccion`,`telefono`,`idciudad`) values (2,'Sin nombre','--','--','--',1),(3,'Ivan Bogarin','2332435',NULL,NULL,1),(4,'WALTER diaz','233223','walberto moreno','2323',2);

/*Table structure for table `cobro_detalle` */

DROP TABLE IF EXISTS `cobro_detalle`;

CREATE TABLE `cobro_detalle` (
  `idfactura` int(11) NOT NULL,
  `idcobro` int(11) NOT NULL,
  `idtipocobro` int(11) DEFAULT NULL,
  `montoefectivo` int(11) NOT NULL,
  `montotarjeta` int(11) DEFAULT NULL,
  `montocheque` int(11) DEFAULT NULL,
  `iva10` int(11) DEFAULT NULL,
  `montototal` int(11) DEFAULT NULL,
  PRIMARY KEY (`idfactura`,`idcobro`),
  KEY `tipocobro_cobro_detalle_fk` (`idtipocobro`),
  KEY `cobros_cobro_detalle_fk` (`idcobro`),
  CONSTRAINT `cobros_cobro_detalle_fk` FOREIGN KEY (`idcobro`) REFERENCES `cobros` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `facturaventa_cobro_detalle_fk` FOREIGN KEY (`idfactura`) REFERENCES `facturaventa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tipocobro_cobro_detalle_fk` FOREIGN KEY (`idtipocobro`) REFERENCES `tipocobro` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cobro_detalle` */

insert  into `cobro_detalle`(`idfactura`,`idcobro`,`idtipocobro`,`montoefectivo`,`montotarjeta`,`montocheque`,`iva10`,`montototal`) values (1,1,1,27000,NULL,NULL,2455,24545),(2,2,1,7000,NULL,NULL,636,6364),(3,5,1,46000,NULL,NULL,4182,41818),(4,7,1,94000,NULL,NULL,8545,85455),(5,9,1,40000,NULL,NULL,3636,36364),(6,3,1,73000,NULL,NULL,6636,66364),(7,4,1,120000,NULL,NULL,10909,109091),(8,6,1,97000,NULL,NULL,8818,88182),(9,8,1,16000,NULL,NULL,1455,14545),(10,10,1,0,NULL,NULL,0,0),(11,11,1,93000,NULL,NULL,8455,84545),(12,12,1,70000,NULL,NULL,6364,63636),(13,14,1,0,NULL,NULL,0,0),(14,13,1,62000,NULL,NULL,5636,56364);

/*Table structure for table `cobros` */

DROP TABLE IF EXISTS `cobros`;

CREATE TABLE `cobros` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `idcaja` int(11) NOT NULL,
  `idaperturacierre` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `caja_cobros_fk` (`idcaja`),
  KEY `aperturacierre_cobros_fk` (`idaperturacierre`),
  CONSTRAINT `aperturacierre_cobros_fk` FOREIGN KEY (`idaperturacierre`) REFERENCES `aperturacierre` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `caja_cobros_fk` FOREIGN KEY (`idcaja`) REFERENCES `caja` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cobros` */

insert  into `cobros`(`id`,`fecha`,`idcaja`,`idaperturacierre`) values (1,'2018-09-11',1,2),(2,'2018-09-11',1,2),(3,'2018-09-13',1,2),(4,'2018-09-13',1,2),(5,'2018-09-14',1,3),(6,'2018-09-16',1,4),(7,'2018-09-17',1,4),(8,'2018-09-17',1,4),(9,'2018-09-19',1,4),(10,'2018-09-19',1,4),(11,'2018-09-19',1,5),(12,'2018-09-19',1,7),(13,'2018-09-25',1,9),(14,'2018-09-25',1,9);

/*Table structure for table `compras` */

DROP TABLE IF EXISTS `compras`;

CREATE TABLE `compras` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `fechaemision` date NOT NULL,
  `nrofactura` varchar(15) NOT NULL,
  `cuota` int(11) NOT NULL,
  `idtipofactura` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idsucursal` int(11) NOT NULL,
  `idordencompra` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sucursal_compras_fk` (`idsucursal`),
  KEY `usuarios_compras_fk` (`idusuario`),
  KEY `ordencompra_compras_fk` (`idordencompra`),
  KEY `tipofactura_facturaventa_compras_fk` (`idtipofactura`),
  CONSTRAINT `ordencompra_compras_fk` FOREIGN KEY (`idordencompra`) REFERENCES `ordencompra` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sucursal_compras_fk` FOREIGN KEY (`idsucursal`) REFERENCES `sucursal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tipofactura_facturaventa_compras_fk` FOREIGN KEY (`idtipofactura`) REFERENCES `tipofactura` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usuarios_compras_fk` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `compras` */

/*Table structure for table `deposito` */

DROP TABLE IF EXISTS `deposito`;

CREATE TABLE `deposito` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  `idsucursal` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sucursal_deposito_fk` (`idsucursal`),
  CONSTRAINT `sucursal_deposito_fk` FOREIGN KEY (`idsucursal`) REFERENCES `sucursal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `deposito` */

insert  into `deposito`(`id`,`descripcion`,`idsucursal`) values (1,'principal',1);

/*Table structure for table `detallecompra` */

DROP TABLE IF EXISTS `detallecompra`;

CREATE TABLE `detallecompra` (
  `idcompra` int(11) NOT NULL,
  `idinsumo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` int(11) NOT NULL,
  PRIMARY KEY (`idcompra`,`idinsumo`),
  KEY `insumos_detallecompra_compra_fk` (`idinsumo`),
  CONSTRAINT `compras_detallecompra_compra_fk` FOREIGN KEY (`idcompra`) REFERENCES `compras` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `insumos_detallecompra_compra_fk` FOREIGN KEY (`idinsumo`) REFERENCES `insumos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `detallecompra` */

/*Table structure for table `detallefacturaventa` */

DROP TABLE IF EXISTS `detallefacturaventa`;

CREATE TABLE `detallefacturaventa` (
  `idfactura` int(11) NOT NULL,
  `idpedido` int(11) NOT NULL,
  `precio` int(11) NOT NULL,
  `iva10` int(11) NOT NULL,
  PRIMARY KEY (`idfactura`,`idpedido`),
  KEY `ped_detalleventa_fk` (`idpedido`),
  CONSTRAINT `facturaventa_detallefacturaventa_fk` FOREIGN KEY (`idfactura`) REFERENCES `facturaventa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ped_detalleventa_fk` FOREIGN KEY (`idpedido`) REFERENCES `pedidos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `detallefacturaventa` */

insert  into `detallefacturaventa`(`idfactura`,`idpedido`,`precio`,`iva10`) values (1,1,24545,2455),(2,2,6364,636),(3,3,6364,636),(3,4,0,0),(3,5,0,0),(4,6,7273,727),(4,7,49091,4909),(5,8,36364,3636),(6,9,66364,6636),(7,10,109091,10909),(8,13,88182,8818),(9,14,14545,1455),(11,15,25455,2545),(11,16,59091,5909),(12,17,63636,6364),(14,18,44545,4455),(14,19,11818,1182),(15,20,44545,4455);

/*Table structure for table `empleados` */

DROP TABLE IF EXISTS `empleados`;

CREATE TABLE `empleados` (
  `id` int(11) NOT NULL,
  `nombres` char(30) NOT NULL,
  `documento` varchar(20) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(40) DEFAULT NULL,
  `idciudad` int(11) NOT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `idcargo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cargos_empleados_fk` (`idcargo`),
  KEY `usuarios_empleados_fk` (`idusuario`),
  KEY `ciudades_empleados_fk` (`idciudad`),
  CONSTRAINT `cargos_empleados_fk` FOREIGN KEY (`idcargo`) REFERENCES `cargos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ciudades_empleados_fk` FOREIGN KEY (`idciudad`) REFERENCES `ciudades` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usuarios_empleados_fk` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `empleados` */

insert  into `empleados`(`id`,`nombres`,`documento`,`telefono`,`direccion`,`idciudad`,`idusuario`,`idcargo`) values (1,'Lucas Garcia','12','0972134234','calle sin nombre',1,1,2),(2,'Leo Fernandez','321',NULL,NULL,1,2,3),(3,'Marta Diaz','5555',NULL,NULL,2,NULL,2),(4,'MARCOS JARA','321','01234','WALBERTO MORENO 543',1,NULL,1),(6,'MATEO HERNANDEZ','22192','1222','WALBERTO MORENO',2,NULL,2);

/*Table structure for table `existencias` */

DROP TABLE IF EXISTS `existencias`;

CREATE TABLE `existencias` (
  `iddeposito` int(11) NOT NULL,
  `idinsumo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`iddeposito`,`idinsumo`),
  KEY `insumos_existencias_fk` (`idinsumo`),
  CONSTRAINT `deposito_existencias_fk` FOREIGN KEY (`iddeposito`) REFERENCES `deposito` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `insumos_existencias_fk` FOREIGN KEY (`idinsumo`) REFERENCES `insumos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `existencias` */

/*Table structure for table `facturaventa` */

DROP TABLE IF EXISTS `facturaventa`;

CREATE TABLE `facturaventa` (
  `id` int(11) NOT NULL,
  `fechaemision` date NOT NULL,
  `nrofactura` int(11) NOT NULL,
  `hora` time NOT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `cuota` int(11) NOT NULL,
  `idtipodocumento` int(11) NOT NULL,
  `idtipofactura` int(11) NOT NULL,
  `idtimbrado` int(11) NOT NULL,
  `idaperturacierre` int(11) NOT NULL,
  `idcaja` int(11) DEFAULT NULL,
  `idempleados` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `idsucursal` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nrofactura` (`nrofactura`),
  KEY `timbrado_facturaventa_fk` (`idtimbrado`),
  KEY `caja_facturaventa_fk` (`idcaja`),
  KEY `aperturacierre_facturaventa_fk` (`idaperturacierre`),
  KEY `tipodocumento_facturaventa_fk` (`idtipodocumento`),
  KEY `clientes_facturaventa_fk` (`idcliente`),
  KEY `empleados_facturaventa_fk` (`idempleados`),
  KEY `tipofactura_facturaventa_facturaventa_fk` (`idtipofactura`),
  KEY `idsucursal` (`idsucursal`),
  CONSTRAINT `aperturacierre_facturaventa_fk` FOREIGN KEY (`idaperturacierre`) REFERENCES `aperturacierre` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `caja_facturaventa_fk` FOREIGN KEY (`idcaja`) REFERENCES `caja` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `clientes_facturaventa_fk` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `empleados_facturaventa_fk` FOREIGN KEY (`idempleados`) REFERENCES `empleados` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `facturaventa_ibfk_1` FOREIGN KEY (`idsucursal`) REFERENCES `sucursal` (`id`),
  CONSTRAINT `timbrado_facturaventa_fk` FOREIGN KEY (`idtimbrado`) REFERENCES `timbrado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tipodocumento_facturaventa_fk` FOREIGN KEY (`idtipodocumento`) REFERENCES `tipodocumento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tipofactura_facturaventa_facturaventa_fk` FOREIGN KEY (`idtipofactura`) REFERENCES `tipofactura` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `facturaventa` */

insert  into `facturaventa`(`id`,`fechaemision`,`nrofactura`,`hora`,`estado`,`cuota`,`idtipodocumento`,`idtipofactura`,`idtimbrado`,`idaperturacierre`,`idcaja`,`idempleados`,`idcliente`,`idsucursal`) values (1,'2018-09-06',1,'07:35:38','COBRADO',1,1,1,2,2,1,1,2,1),(2,'2018-09-06',2,'07:36:19','COBRADO',1,1,1,2,2,1,1,2,1),(3,'2018-09-06',3,'07:38:34','COBRADO',1,1,1,2,2,1,1,2,1),(4,'2018-09-07',4,'10:35:03','COBRADO',1,1,1,2,2,1,1,2,1),(5,'2018-09-10',5,'10:01:57','COBRADO',1,1,1,2,2,1,1,2,1),(6,'2018-09-13',6,'19:53:21','COBRADO',1,1,1,2,2,1,1,2,1),(7,'2018-09-13',7,'19:59:55','COBRADO',1,1,1,2,2,1,1,2,1),(8,'2018-09-16',8,'20:19:59','COBRADO',1,1,1,2,4,1,1,2,1),(9,'2018-09-17',9,'10:15:07','COBRADO',1,1,1,2,4,1,1,2,1),(10,'2018-09-19',10,'23:07:09','COBRADO',1,1,1,2,4,1,1,2,1),(11,'2018-09-19',11,'23:25:23','COBRADO',1,1,1,2,5,1,1,2,1),(12,'2018-09-19',12,'23:29:47','COBRADO',1,1,1,2,7,1,2,2,1),(13,'2018-09-20',13,'10:20:41','COBRADO',1,1,1,2,8,1,1,2,1),(14,'2018-09-25',14,'11:45:53','COBRADO',1,1,1,2,9,1,2,2,1),(15,'2018-09-25',15,'11:53:24','PENDIENTE',1,1,1,2,9,1,2,2,1),(16,'2018-09-26',16,'06:38:19','PENDIENTE',1,1,1,2,9,1,2,2,1),(17,'2018-09-26',17,'06:40:54','PENDIENTE',1,1,2,2,9,1,2,2,1);

/*Table structure for table `impuesto` */

DROP TABLE IF EXISTS `impuesto`;

CREATE TABLE `impuesto` (
  `id` int(11) NOT NULL,
  `descripcion` char(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `impuesto` */

insert  into `impuesto`(`id`,`descripcion`) values (1,'iva10'),(2,'iva5');

/*Table structure for table `insumos` */

DROP TABLE IF EXISTS `insumos`;

CREATE TABLE `insumos` (
  `id` int(11) NOT NULL,
  `descripcion` char(20) NOT NULL,
  `idimpuesto` int(11) NOT NULL,
  `idmarca` int(11) NOT NULL,
  `idproveedor` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `proveedores_insumos_fk` (`idproveedor`),
  KEY `marca_insumos_fk` (`idmarca`),
  KEY `impuesto_insumos_fk` (`idimpuesto`),
  CONSTRAINT `impuesto_insumos_fk` FOREIGN KEY (`idimpuesto`) REFERENCES `impuesto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `marca_insumos_fk` FOREIGN KEY (`idmarca`) REFERENCES `marca` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `proveedores_insumos_fk` FOREIGN KEY (`idproveedor`) REFERENCES `proveedores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `insumos` */

insert  into `insumos`(`id`,`descripcion`,`idimpuesto`,`idmarca`,`idproveedor`) values (1,'Harina',1,2,2),(3,'RODAJA TOMATE',2,3,2),(4,'QUESO',2,4,2),(5,'MEDALLON CARNE',2,7,2),(6,'LECHUGA',2,3,2),(7,'PAN',2,9,2),(8,'JAMON',2,4,2),(9,'FILETE LOMITO',2,3,2),(10,'MEDALLON POLLO',2,6,2),(11,'MASA PIZZA REGULAR',2,8,2),(12,'MASA PIZZA ESPECIAL',2,8,1),(13,'MASA PIZZA ESTANDAR',1,9,1),(14,'FILETE LOMITO CERDO',2,3,2),(15,'HUEVO',2,3,2);

/*Table structure for table `marca` */

DROP TABLE IF EXISTS `marca`;

CREATE TABLE `marca` (
  `id` int(11) NOT NULL,
  `descripcion` char(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `marca` */

insert  into `marca`(`id`,`descripcion`) values (1,'coca cola'),(2,'ersa'),(3,'origen natural'),(4,'lactolanda'),(6,'Guarani'),(7,'Heterei'),(8,'El Bunker'),(9,'San Jorge');

/*Table structure for table `marcatarjeta` */

DROP TABLE IF EXISTS `marcatarjeta`;

CREATE TABLE `marcatarjeta` (
  `id` int(11) NOT NULL,
  `descripcion` char(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `marcatarjeta` */

insert  into `marcatarjeta`(`id`,`descripcion`) values (1,'visa'),(2,'mastercard');

/*Table structure for table `medida` */

DROP TABLE IF EXISTS `medida`;

CREATE TABLE `medida` (
  `id` int(11) NOT NULL,
  `descripcion` char(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `medida` */

insert  into `medida`(`id`,`descripcion`) values (1,'litro'),(2,'gramos'),(3,'unidad');

/*Table structure for table `nivel` */

DROP TABLE IF EXISTS `nivel`;

CREATE TABLE `nivel` (
  `id` int(11) NOT NULL,
  `descripcion` char(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `nivel` */

insert  into `nivel`(`id`,`descripcion`) values (1,'ADMINISTRADOR'),(2,'CAJERO'),(3,'VENDEDOR'),(5,'COCINERO'),(6,'JEFE COMPRAS'),(7,'DESARROLLADOR'),(8,'ENCARGADO COMPRA'),(9,'JEFE PRODUCCION');

/*Table structure for table `ordencompra` */

DROP TABLE IF EXISTS `ordencompra`;

CREATE TABLE `ordencompra` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `estado` varchar(10) NOT NULL,
  `idpedidocompra` int(11) NOT NULL,
  `idinsumo` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idproveedor` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `proveedores_ordencompra_fk` (`idproveedor`),
  KEY `usuarios_ordencompra_fk` (`idusuario`),
  KEY `pedidocompradetalle_ordencompra_fk` (`idpedidocompra`,`idinsumo`),
  CONSTRAINT `pedidocompradetalle_ordencompra_fk` FOREIGN KEY (`idpedidocompra`, `idinsumo`) REFERENCES `pedidocompradetalle` (`idpedidocompra`, `idinsumo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `proveedores_ordencompra_fk` FOREIGN KEY (`idproveedor`) REFERENCES `proveedores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usuarios_ordencompra_fk` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ordencompra` */

/*Table structure for table `ordencompradetalle` */

DROP TABLE IF EXISTS `ordencompradetalle`;

CREATE TABLE `ordencompradetalle` (
  `idordencompra` int(11) NOT NULL,
  `idinsumo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`idordencompra`,`idinsumo`),
  KEY `insumos_ordencompradetalle_fk` (`idinsumo`),
  CONSTRAINT `insumos_ordencompradetalle_fk` FOREIGN KEY (`idinsumo`) REFERENCES `insumos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ordencompra_ordencompradetalle_fk` FOREIGN KEY (`idordencompra`) REFERENCES `ordencompra` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ordencompradetalle` */

/*Table structure for table `pedidocompra` */

DROP TABLE IF EXISTS `pedidocompra`;

CREATE TABLE `pedidocompra` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `iddeposito` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idproveedor` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `proveedores_pedidocompra_fk` (`idproveedor`),
  KEY `deposito_pedidocompra_fk` (`iddeposito`),
  KEY `usuarios_pedidocompra_fk` (`idusuario`),
  CONSTRAINT `deposito_pedidocompra_fk` FOREIGN KEY (`iddeposito`) REFERENCES `deposito` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `proveedores_pedidocompra_fk` FOREIGN KEY (`idproveedor`) REFERENCES `proveedores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usuarios_pedidocompra_fk` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pedidocompra` */

/*Table structure for table `pedidocompradetalle` */

DROP TABLE IF EXISTS `pedidocompradetalle`;

CREATE TABLE `pedidocompradetalle` (
  `idpedidocompra` int(11) NOT NULL,
  `idinsumo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`idpedidocompra`,`idinsumo`),
  KEY `insumos_pedidocompradetalle_fk` (`idinsumo`),
  CONSTRAINT `insumos_pedidocompradetalle_fk` FOREIGN KEY (`idinsumo`) REFERENCES `insumos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pedidocompra_pedidocompradetalle_fk` FOREIGN KEY (`idpedidocompra`) REFERENCES `pedidocompra` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pedidocompradetalle` */

/*Table structure for table `pedidodetalle` */

DROP TABLE IF EXISTS `pedidodetalle`;

CREATE TABLE `pedidodetalle` (
  `idpedido` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` int(11) NOT NULL,
  PRIMARY KEY (`idpedido`,`idproducto`),
  KEY `productos_pedido_detalle_fk` (`idproducto`),
  CONSTRAINT `pedidos_pedido_detalle_fk` FOREIGN KEY (`idpedido`) REFERENCES `pedidos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `productos_pedido_detalle_fk` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pedidodetalle` */

insert  into `pedidodetalle`(`idpedido`,`idproducto`,`cantidad`,`precio`) values (1,1,1,7000),(1,2,1,13000),(1,3,1,7000),(2,1,1,7000),(3,1,1,7000),(4,2,3,13000),(6,3,5,8000),(7,1,4,7000),(7,2,2,13000),(8,3,5,8000),(9,1,7,7000),(9,3,3,8000),(10,1,8,7000),(10,3,8,8000),(12,2,4,13000),(13,2,5,13000),(13,3,4,8000),(14,3,2,8000),(15,1,4,7000),(16,2,5,13000),(17,1,10,7000),(18,1,7,7000),(19,2,1,13000),(20,1,7,7000),(20,2,2,2500),(21,1,1,7000),(22,1,5,2500),(22,2,5,2500),(23,1,10,2500),(23,3,5,3000),(24,1,10,2500),(24,2,50,2500);

/*Table structure for table `pedidos` */

DROP TABLE IF EXISTS `pedidos`;

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `nropedido` int(11) NOT NULL,
  `fechapedido` date NOT NULL,
  `estado` varchar(20) NOT NULL,
  `cliente` int(11) DEFAULT NULL,
  `nombrecli` char(20) DEFAULT NULL,
  `idusuario` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuarios_pedidos_fk` (`idusuario`),
  KEY `cliente` (`cliente`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`cliente`) REFERENCES `clientes` (`id`),
  CONSTRAINT `usuarios_pedidos_fk` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pedidos` */

insert  into `pedidos`(`id`,`nropedido`,`fechapedido`,`estado`,`cliente`,`nombrecli`,`idusuario`) values (1,12,'2018-08-21','FACTURADO',2,'raul',1),(2,13,'2018-08-30','FACTURADO',2,'luis',1),(3,14,'2018-09-06','FACTURADO',NULL,'lucas',1),(4,15,'2018-09-06','FACTURADO',NULL,'lucas',1),(5,16,'2018-09-06','FACTURADO',NULL,'raul',1),(6,17,'2018-09-06','FACTURADO',NULL,NULL,1),(7,18,'2018-09-07','FACTURADO',NULL,NULL,1),(8,19,'2018-09-10','FACTURADO',NULL,'martin',1),(9,20,'2018-09-13','FACTURADO',NULL,'fulano',1),(10,21,'2018-09-13','FACTURADO',NULL,NULL,1),(11,22,'2018-09-13','FACTURADO',NULL,NULL,1),(12,23,'2018-09-15','FACTURADO',NULL,'alfredo',1),(13,24,'2018-09-16','FACTURADO',NULL,NULL,1),(14,25,'2018-09-17','FACTURADO',NULL,'ivan',1),(15,26,'2018-09-19','FACTURADO',NULL,NULL,1),(16,27,'2018-09-19','FACTURADO',NULL,NULL,1),(17,28,'2018-09-19','FACTURADO',NULL,NULL,2),(18,29,'2018-09-20','FACTURADO',NULL,NULL,1),(19,30,'2018-09-25','FACTURADO',NULL,'ivan',2),(20,31,'2018-09-25','FACTURADO',NULL,NULL,1),(21,32,'2018-09-26','COMPLETADO',NULL,NULL,1),(22,33,'2018-12-14','PENDIENTE',NULL,'fulano',2),(23,34,'2018-12-14','PENDIENTE',NULL,'martin',2),(24,35,'2018-12-18','PENDIENTE',NULL,'JoyeriaSan',2);

/*Table structure for table `productos` */

DROP TABLE IF EXISTS `productos`;

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `descripcion` char(30) NOT NULL,
  `precio` int(11) NOT NULL,
  `idtipo` int(11) NOT NULL,
  `idtamano` int(11) NOT NULL,
  `idreceta` int(11) DEFAULT NULL,
  `idimpuesto` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tipo_productos_fk` (`idtipo`),
  KEY `tamano_productos_fk` (`idtamano`),
  KEY `fk_re_pro` (`idreceta`),
  KEY `fk_pro_imp` (`idimpuesto`),
  CONSTRAINT `fk_pro_imp` FOREIGN KEY (`idimpuesto`) REFERENCES `impuesto` (`id`),
  CONSTRAINT `fk_re_pro` FOREIGN KEY (`idreceta`) REFERENCES `receta` (`id`),
  CONSTRAINT `tamano_productos_fk` FOREIGN KEY (`idtamano`) REFERENCES `tamano` (`idtamano`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tipo_productos_fk` FOREIGN KEY (`idtipo`) REFERENCES `tipo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `productos` */

insert  into `productos`(`id`,`descripcion`,`precio`,`idtipo`,`idtamano`,`idreceta`,`idimpuesto`) values (1,'EMPANADA CARNE',2500,5,1,1,1),(2,'EMPANADA POLLO',2500,5,1,2,NULL),(3,'EMPANADA JAMON QUESO',3000,5,1,3,1),(4,'EMPANADA 4 QUESOS',3500,5,1,4,1);

/*Table structure for table `proveedores` */

DROP TABLE IF EXISTS `proveedores`;

CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL,
  `razonsocial` varchar(40) NOT NULL,
  `documento` varchar(20) NOT NULL,
  `direccion` varchar(40) DEFAULT NULL,
  `telefono` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `proveedores` */

insert  into `proveedores`(`id`,`razonsocial`,`documento`,`direccion`,`telefono`) values (1,'Coca Cola Co.','1235213','calle sin nombre','1234556'),(2,'Comercial Abastecimientos S.A','324123','calle sin nombre','234324');

/*Table structure for table `recaudaciones` */

DROP TABLE IF EXISTS `recaudaciones`;

CREATE TABLE `recaudaciones` (
  `id` int(11) NOT NULL,
  `efectivo` int(11) NOT NULL,
  `cheque` int(11) NOT NULL,
  `tarjeta` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `idaperturacierre` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `aperturacierre_recaudaciones_fk` (`idaperturacierre`),
  CONSTRAINT `aperturacierre_recaudaciones_fk` FOREIGN KEY (`idaperturacierre`) REFERENCES `aperturacierre` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `recaudaciones` */

/*Table structure for table `receta` */

DROP TABLE IF EXISTS `receta`;

CREATE TABLE `receta` (
  `id` int(11) NOT NULL,
  `nombre` char(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `receta` */

insert  into `receta`(`id`,`nombre`) values (1,'HAMBURGUESA EL BUNKER'),(2,'LOMITO VACUNO ESPECIAL'),(3,'HAMBURGUESA REGULAR'),(4,'Pizza especial');

/*Table structure for table `recetadetalle` */

DROP TABLE IF EXISTS `recetadetalle`;

CREATE TABLE `recetadetalle` (
  `idinsumo` int(11) NOT NULL,
  `idreceta` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `idmedida` int(11) NOT NULL,
  PRIMARY KEY (`idinsumo`,`idreceta`),
  KEY `medida_recetadetalle_fk` (`idmedida`),
  KEY `receta_recetadetalle_fk` (`idreceta`),
  CONSTRAINT `insumos_recetadetalle_fk` FOREIGN KEY (`idinsumo`) REFERENCES `insumos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `medida_recetadetalle_fk` FOREIGN KEY (`idmedida`) REFERENCES `medida` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `receta_recetadetalle_fk` FOREIGN KEY (`idreceta`) REFERENCES `receta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `recetadetalle` */

insert  into `recetadetalle`(`idinsumo`,`idreceta`,`cantidad`,`idmedida`) values (3,2,1,3),(3,3,2,3),(4,1,1,3),(4,2,1,3),(4,3,1,3),(5,1,2,3),(6,1,1,3),(6,3,2,3),(7,1,1,3),(7,2,1,3),(7,3,1,3),(8,1,1,3),(8,2,1,3);

/*Table structure for table `sucursal` */

DROP TABLE IF EXISTS `sucursal`;

CREATE TABLE `sucursal` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sucursal` */

insert  into `sucursal`(`id`,`descripcion`) values (1,'Central');

/*Table structure for table `tamano` */

DROP TABLE IF EXISTS `tamano`;

CREATE TABLE `tamano` (
  `idtamano` int(11) NOT NULL,
  `descripcion` char(20) NOT NULL,
  PRIMARY KEY (`idtamano`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tamano` */

insert  into `tamano`(`idtamano`,`descripcion`) values (1,'regular'),(2,'especial'),(3,'1 Litro'),(4,'500 Ml.');

/*Table structure for table `tarjeta` */

DROP TABLE IF EXISTS `tarjeta`;

CREATE TABLE `tarjeta` (
  `id` int(11) NOT NULL,
  `nrotarjeta` varchar(20) NOT NULL,
  `vencimiento` varchar(10) NOT NULL,
  `idtipotarjeta` int(11) NOT NULL,
  `idmarcatarjeta` int(11) NOT NULL,
  `idbancoemisor` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bancoemisor_tarjeta_fk` (`idbancoemisor`),
  KEY `marcatarjeta_tarjeta_fk` (`idmarcatarjeta`),
  KEY `tipotarjeta_tarjeta_fk` (`idtipotarjeta`),
  CONSTRAINT `bancoemisor_tarjeta_fk` FOREIGN KEY (`idbancoemisor`) REFERENCES `bancoemisor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `marcatarjeta_tarjeta_fk` FOREIGN KEY (`idmarcatarjeta`) REFERENCES `marcatarjeta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tipotarjeta_tarjeta_fk` FOREIGN KEY (`idtipotarjeta`) REFERENCES `tipotarjeta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tarjeta` */

/*Table structure for table `test` */

DROP TABLE IF EXISTS `test`;

CREATE TABLE `test` (
  `idfactura` int(11) DEFAULT NULL,
  `idpedido` int(11) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `iva10` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `test` */

insert  into `test`(`idfactura`,`idpedido`,`precio`,`iva10`) values (3,3,6364,636),(3,4,0,0),(3,5,0,0),(1,1,24545,2455),(2,2,6364,636),(3,3,6364,636),(3,4,0,0),(3,5,0,0),(4,6,7273,727),(4,7,49091,4909),(5,8,36364,3636),(6,9,66364,6636),(7,10,109091,10909),(8,13,88182,8818),(9,14,14545,1455),(11,15,25455,2545),(11,16,59091,5909),(12,17,63636,6364),(14,18,44545,4455),(14,19,11818,1182),(15,20,44545,4455);

/*Table structure for table `timbrado` */

DROP TABLE IF EXISTS `timbrado`;

CREATE TABLE `timbrado` (
  `id` int(11) NOT NULL,
  `nrotimbrado` int(11) NOT NULL,
  `fechaemision` date NOT NULL,
  `fechavencimiento` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `timbrado` */

insert  into `timbrado`(`id`,`nrotimbrado`,`fechaemision`,`fechavencimiento`) values (1,16543,'2018-07-10','2018-08-10'),(2,22342,'2018-09-03','2019-09-20');

/*Table structure for table `tipo` */

DROP TABLE IF EXISTS `tipo`;

CREATE TABLE `tipo` (
  `id` int(11) NOT NULL,
  `descripcion` char(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tipo` */

insert  into `tipo`(`id`,`descripcion`) values (1,'Bebidas'),(2,'Hamburguesa'),(3,'Pizzas'),(4,'Lomitos'),(5,'EMPANADAS'),(6,'Especiales'),(7,'Sandwiches');

/*Table structure for table `tipocheque` */

DROP TABLE IF EXISTS `tipocheque`;

CREATE TABLE `tipocheque` (
  `id` int(11) NOT NULL,
  `descripcion` char(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tipocheque` */

/*Table structure for table `tipocobro` */

DROP TABLE IF EXISTS `tipocobro`;

CREATE TABLE `tipocobro` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tipocobro` */

insert  into `tipocobro`(`id`,`descripcion`) values (1,'EFECTIVO'),(2,'TARJETA'),(3,'CHEQUE');

/*Table structure for table `tipodocumento` */

DROP TABLE IF EXISTS `tipodocumento`;

CREATE TABLE `tipodocumento` (
  `id` int(11) NOT NULL,
  `descripcion` char(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tipodocumento` */

insert  into `tipodocumento`(`id`,`descripcion`) values (1,'factura venta');

/*Table structure for table `tipofactura` */

DROP TABLE IF EXISTS `tipofactura`;

CREATE TABLE `tipofactura` (
  `id` int(11) NOT NULL,
  `descripcion` char(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tipofactura` */

insert  into `tipofactura`(`id`,`descripcion`) values (1,'contado'),(2,'credito');

/*Table structure for table `tipotarjeta` */

DROP TABLE IF EXISTS `tipotarjeta`;

CREATE TABLE `tipotarjeta` (
  `id` int(11) NOT NULL,
  `descripcion` char(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tipotarjeta` */

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `idnivel` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nivel_usuarios_fk` (`idnivel`),
  CONSTRAINT `nivel_usuarios_fk` FOREIGN KEY (`idnivel`) REFERENCES `nivel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `usuarios` */

insert  into `usuarios`(`id`,`usuario`,`password`,`idnivel`) values (1,'lucgarcia','123',6),(2,'admin','admin',7);

/*Table structure for table `vsapercierre` */

DROP TABLE IF EXISTS `vsapercierre`;

/*!50001 DROP VIEW IF EXISTS `vsapercierre` */;
/*!50001 DROP TABLE IF EXISTS `vsapercierre` */;

/*!50001 CREATE TABLE  `vsapercierre`(
 `id` int(11) ,
 `fechaapertura` date ,
 `horaapertura` time ,
 `montoapertura` int(11) ,
 `fechacierre` date ,
 `horacierra` time ,
 `montocierre` int(11) ,
 `idcaja` int(11) ,
 `nrocaja` int(11) ,
 `idusuario` int(11) ,
 `usuario` varchar(20) 
)*/;

/*Table structure for table `vsclientes` */

DROP TABLE IF EXISTS `vsclientes`;

/*!50001 DROP VIEW IF EXISTS `vsclientes` */;
/*!50001 DROP TABLE IF EXISTS `vsclientes` */;

/*!50001 CREATE TABLE  `vsclientes`(
 `id` int(11) ,
 `razonsocial` char(40) ,
 `documento` varchar(15) ,
 `telefono` varchar(20) ,
 `direccion` varchar(50) ,
 `idciudad` int(11) ,
 `descripcion` char(30) 
)*/;

/*Table structure for table `vscobrodetalle` */

DROP TABLE IF EXISTS `vscobrodetalle`;

/*!50001 DROP VIEW IF EXISTS `vscobrodetalle` */;
/*!50001 DROP TABLE IF EXISTS `vscobrodetalle` */;

/*!50001 CREATE TABLE  `vscobrodetalle`(
 `idfactura` int(11) ,
 `nrofactura` int(11) ,
 `idcobro` int(11) ,
 `fecha` date ,
 `idtipocobro` int(11) ,
 `montoefectivo` int(11) ,
 `montotarjeta` int(11) ,
 `montocheque` int(11) ,
 `iva10` int(11) ,
 `gravada` int(11) ,
 `total` bigint(12) ,
 `idaperturacierre` int(11) 
)*/;

/*Table structure for table `vscobros` */

DROP TABLE IF EXISTS `vscobros`;

/*!50001 DROP VIEW IF EXISTS `vscobros` */;
/*!50001 DROP TABLE IF EXISTS `vscobros` */;

/*!50001 CREATE TABLE  `vscobros`(
 `id` int(11) ,
 `fecha` date ,
 `idcaja` int(11) ,
 `nrocaja` int(11) ,
 `idaperturacierre` int(11) ,
 `idusuario` int(11) ,
 `usuario` varchar(20) 
)*/;

/*Table structure for table `vsdetallepedido` */

DROP TABLE IF EXISTS `vsdetallepedido`;

/*!50001 DROP VIEW IF EXISTS `vsdetallepedido` */;
/*!50001 DROP TABLE IF EXISTS `vsdetallepedido` */;

/*!50001 CREATE TABLE  `vsdetallepedido`(
 `idpedido` int(11) ,
 `nropedido` int(11) ,
 `idproducto` int(11) ,
 `descripcion` char(30) ,
 `precio` int(11) ,
 `cantidad` int(11) 
)*/;

/*Table structure for table `vsdetallereceta` */

DROP TABLE IF EXISTS `vsdetallereceta`;

/*!50001 DROP VIEW IF EXISTS `vsdetallereceta` */;
/*!50001 DROP TABLE IF EXISTS `vsdetallereceta` */;

/*!50001 CREATE TABLE  `vsdetallereceta`(
 `idreceta` int(11) ,
 `nombre` char(100) ,
 `idinsumo` int(11) ,
 `insumo` char(20) ,
 `cantidad` int(11) ,
 `medida` char(20) ,
 `idmedida` int(11) 
)*/;

/*Table structure for table `vsdetalleventa` */

DROP TABLE IF EXISTS `vsdetalleventa`;

/*!50001 DROP VIEW IF EXISTS `vsdetalleventa` */;
/*!50001 DROP TABLE IF EXISTS `vsdetalleventa` */;

/*!50001 CREATE TABLE  `vsdetalleventa`(
 `idfactura` int(11) ,
 `nrofactura` int(11) ,
 `idpedido` int(11) ,
 `nropedido` int(11) ,
 `precio` int(11) ,
 `iva10` int(11) 
)*/;

/*Table structure for table `vsempleados` */

DROP TABLE IF EXISTS `vsempleados`;

/*!50001 DROP VIEW IF EXISTS `vsempleados` */;
/*!50001 DROP TABLE IF EXISTS `vsempleados` */;

/*!50001 CREATE TABLE  `vsempleados`(
 `id` int(11) ,
 `nombres` char(30) ,
 `documento` varchar(20) ,
 `telefono` varchar(20) ,
 `direccion` varchar(40) ,
 `idciudad` int(11) ,
 `idusuario` int(11) ,
 `idcargo` int(11) 
)*/;

/*Table structure for table `vsinsumos` */

DROP TABLE IF EXISTS `vsinsumos`;

/*!50001 DROP VIEW IF EXISTS `vsinsumos` */;
/*!50001 DROP TABLE IF EXISTS `vsinsumos` */;

/*!50001 CREATE TABLE  `vsinsumos`(
 `id` int(11) ,
 `descripcion` char(20) ,
 `idimpuesto` int(11) ,
 `impuesto` char(20) ,
 `idmarca` int(11) ,
 `marca` char(20) ,
 `idproveedor` int(11) ,
 `proveedor` varchar(40) 
)*/;

/*Table structure for table `vspedidos` */

DROP TABLE IF EXISTS `vspedidos`;

/*!50001 DROP VIEW IF EXISTS `vspedidos` */;
/*!50001 DROP TABLE IF EXISTS `vspedidos` */;

/*!50001 CREATE TABLE  `vspedidos`(
 `idpedido` int(11) ,
 `nropedido` int(11) ,
 `fechapedido` date ,
 `estado` varchar(20) ,
 `cliente` int(11) ,
 `razonsocial` char(40) ,
 `nombrecli` char(20) ,
 `idusuario` int(11) ,
 `usuario` varchar(20) 
)*/;

/*Table structure for table `vsproductos` */

DROP TABLE IF EXISTS `vsproductos`;

/*!50001 DROP VIEW IF EXISTS `vsproductos` */;
/*!50001 DROP TABLE IF EXISTS `vsproductos` */;

/*!50001 CREATE TABLE  `vsproductos`(
 `id` int(11) ,
 `descripcion` char(30) ,
 `precio` int(11) ,
 `idtipo` int(11) ,
 `tipo` char(25) ,
 `idtamano` int(11) ,
 `tamano` char(20) ,
 `idreceta` int(11) ,
 `receta` char(100) ,
 `idimpuesto` int(11) ,
 `impuesto` char(20) 
)*/;

/*Table structure for table `vsreceta` */

DROP TABLE IF EXISTS `vsreceta`;

/*!50001 DROP VIEW IF EXISTS `vsreceta` */;
/*!50001 DROP TABLE IF EXISTS `vsreceta` */;

/*!50001 CREATE TABLE  `vsreceta`(
 `id` int(11) ,
 `receta` char(100) ,
 `producto` char(30) ,
 `idproducto` int(11) 
)*/;

/*Table structure for table `vsusuario` */

DROP TABLE IF EXISTS `vsusuario`;

/*!50001 DROP VIEW IF EXISTS `vsusuario` */;
/*!50001 DROP TABLE IF EXISTS `vsusuario` */;

/*!50001 CREATE TABLE  `vsusuario`(
 `idempleado` int(11) ,
 `nombres` char(30) ,
 `idusuario` int(11) ,
 `id` int(11) ,
 `usuario` varchar(20) ,
 `passwrd` varchar(20) ,
 `idnivel` int(11) ,
 `nivel` char(20) 
)*/;

/*Table structure for table `vsventa` */

DROP TABLE IF EXISTS `vsventa`;

/*!50001 DROP VIEW IF EXISTS `vsventa` */;
/*!50001 DROP TABLE IF EXISTS `vsventa` */;

/*!50001 CREATE TABLE  `vsventa`(
 `id` int(11) ,
 `fechaemision` date ,
 `nrofactura` int(11) ,
 `idcaja` int(11) ,
 `nrocaja` int(11) ,
 `idsucursal` int(11) ,
 `sucursal` varchar(20) ,
 `hora` time ,
 `estado` varchar(20) ,
 `cuota` int(11) ,
 `idtipodocumento` int(11) ,
 `Documento` char(20) ,
 `idtipofactura` int(11) ,
 `Factura` char(20) ,
 `idtimbrado` int(11) ,
 `nrotimbrado` int(11) ,
 `fechavencimiento` date ,
 `idaperturacierre` int(11) ,
 `idcliente` int(11) ,
 `razonsocial` char(40) ,
 `idempleados` int(11) ,
 `usuario` char(30) 
)*/;

/*View structure for view vsapercierre */

/*!50001 DROP TABLE IF EXISTS `vsapercierre` */;
/*!50001 DROP VIEW IF EXISTS `vsapercierre` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vsapercierre` AS select `ap`.`id` AS `id`,`ap`.`fechaapertura` AS `fechaapertura`,`ap`.`horaapertura` AS `horaapertura`,`ap`.`montoapertura` AS `montoapertura`,`ap`.`fechacierre` AS `fechacierre`,`ap`.`horacierra` AS `horacierra`,`ap`.`montocierre` AS `montocierre`,`ap`.`idcaja` AS `idcaja`,`caja`.`nrocaja` AS `nrocaja`,`ap`.`idusuario` AS `idusuario`,`usuarios`.`usuario` AS `usuario` from ((`aperturacierre` `ap` left join `caja` on((`caja`.`id` = `ap`.`idcaja`))) left join `usuarios` on((`usuarios`.`id` = `ap`.`idusuario`))) */;

/*View structure for view vsclientes */

/*!50001 DROP TABLE IF EXISTS `vsclientes` */;
/*!50001 DROP VIEW IF EXISTS `vsclientes` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vsclientes` AS select `clientes`.`id` AS `id`,`clientes`.`razonsocial` AS `razonsocial`,`clientes`.`documento` AS `documento`,`clientes`.`telefono` AS `telefono`,`clientes`.`direccion` AS `direccion`,`clientes`.`idciudad` AS `idciudad`,`ciudades`.`descripcion` AS `descripcion` from (`clientes` left join `ciudades` on((`clientes`.`idciudad` = `ciudades`.`id`))) */;

/*View structure for view vscobrodetalle */

/*!50001 DROP TABLE IF EXISTS `vscobrodetalle` */;
/*!50001 DROP VIEW IF EXISTS `vscobrodetalle` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vscobrodetalle` AS select `cd`.`idfactura` AS `idfactura`,`facturaventa`.`nrofactura` AS `nrofactura`,`cd`.`idcobro` AS `idcobro`,`cobros`.`fecha` AS `fecha`,`cd`.`idtipocobro` AS `idtipocobro`,`cd`.`montoefectivo` AS `montoefectivo`,`cd`.`montotarjeta` AS `montotarjeta`,`cd`.`montocheque` AS `montocheque`,`cd`.`iva10` AS `iva10`,`cd`.`montototal` AS `gravada`,(`cd`.`iva10` + `cd`.`montototal`) AS `total`,`cobros`.`idaperturacierre` AS `idaperturacierre` from ((`cobro_detalle` `cd` left join `facturaventa` on((`facturaventa`.`id` = `cd`.`idfactura`))) left join `cobros` on((`cobros`.`id` = `cd`.`idcobro`))) */;

/*View structure for view vscobros */

/*!50001 DROP TABLE IF EXISTS `vscobros` */;
/*!50001 DROP VIEW IF EXISTS `vscobros` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vscobros` AS select `cobros`.`id` AS `id`,`cobros`.`fecha` AS `fecha`,`cobros`.`idcaja` AS `idcaja`,`caja`.`nrocaja` AS `nrocaja`,`cobros`.`idaperturacierre` AS `idaperturacierre`,`aperturacierre`.`idusuario` AS `idusuario`,`usuarios`.`usuario` AS `usuario` from (((`cobros` left join `caja` on((`cobros`.`idcaja` = `caja`.`id`))) left join `aperturacierre` on((`cobros`.`idaperturacierre` = `aperturacierre`.`id`))) left join `usuarios` on((`aperturacierre`.`idusuario` = `usuarios`.`id`))) */;

/*View structure for view vsdetallepedido */

/*!50001 DROP TABLE IF EXISTS `vsdetallepedido` */;
/*!50001 DROP VIEW IF EXISTS `vsdetallepedido` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vsdetallepedido` AS select `pd`.`idpedido` AS `idpedido`,`pedidos`.`nropedido` AS `nropedido`,`pd`.`idproducto` AS `idproducto`,`productos`.`descripcion` AS `descripcion`,`pd`.`precio` AS `precio`,`pd`.`cantidad` AS `cantidad` from ((`pedidodetalle` `pd` left join `pedidos` on((`pedidos`.`id` = `pd`.`idpedido`))) left join `productos` on((`productos`.`id` = `pd`.`idproducto`))) */;

/*View structure for view vsdetallereceta */

/*!50001 DROP TABLE IF EXISTS `vsdetallereceta` */;
/*!50001 DROP VIEW IF EXISTS `vsdetallereceta` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vsdetallereceta` AS select `rd`.`idreceta` AS `idreceta`,`r`.`nombre` AS `nombre`,`rd`.`idinsumo` AS `idinsumo`,`i`.`descripcion` AS `insumo`,`rd`.`cantidad` AS `cantidad`,`m`.`descripcion` AS `medida`,`rd`.`idmedida` AS `idmedida` from (((`recetadetalle` `rd` left join `insumos` `i` on((`rd`.`idinsumo` = `i`.`id`))) left join `receta` `r` on((`rd`.`idreceta` = `r`.`id`))) left join `medida` `m` on((`rd`.`idmedida` = `m`.`id`))) */;

/*View structure for view vsdetalleventa */

/*!50001 DROP TABLE IF EXISTS `vsdetalleventa` */;
/*!50001 DROP VIEW IF EXISTS `vsdetalleventa` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vsdetalleventa` AS select `dv`.`idfactura` AS `idfactura`,`fv`.`nrofactura` AS `nrofactura`,`dv`.`idpedido` AS `idpedido`,`pd`.`nropedido` AS `nropedido`,`dv`.`precio` AS `precio`,`dv`.`iva10` AS `iva10` from ((`detallefacturaventa` `dv` left join `facturaventa` `fv` on((`dv`.`idfactura` = `fv`.`id`))) left join `pedidos` `pd` on((`dv`.`idpedido` = `pd`.`id`))) */;

/*View structure for view vsempleados */

/*!50001 DROP TABLE IF EXISTS `vsempleados` */;
/*!50001 DROP VIEW IF EXISTS `vsempleados` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vsempleados` AS select `empleados`.`id` AS `id`,`empleados`.`nombres` AS `nombres`,`empleados`.`documento` AS `documento`,`empleados`.`telefono` AS `telefono`,`empleados`.`direccion` AS `direccion`,`empleados`.`idciudad` AS `idciudad`,`empleados`.`idusuario` AS `idusuario`,`empleados`.`idcargo` AS `idcargo` from `empleados` */;

/*View structure for view vsinsumos */

/*!50001 DROP TABLE IF EXISTS `vsinsumos` */;
/*!50001 DROP VIEW IF EXISTS `vsinsumos` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vsinsumos` AS select `insumos`.`id` AS `id`,`insumos`.`descripcion` AS `descripcion`,`insumos`.`idimpuesto` AS `idimpuesto`,`impuesto`.`descripcion` AS `impuesto`,`insumos`.`idmarca` AS `idmarca`,`marca`.`descripcion` AS `marca`,`insumos`.`idproveedor` AS `idproveedor`,`proveedores`.`razonsocial` AS `proveedor` from (((`insumos` left join `impuesto` on((`insumos`.`idimpuesto` = `impuesto`.`id`))) left join `marca` on((`insumos`.`idmarca` = `marca`.`id`))) left join `proveedores` on((`insumos`.`idproveedor` = `proveedores`.`id`))) */;

/*View structure for view vspedidos */

/*!50001 DROP TABLE IF EXISTS `vspedidos` */;
/*!50001 DROP VIEW IF EXISTS `vspedidos` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vspedidos` AS select `p`.`id` AS `idpedido`,`p`.`nropedido` AS `nropedido`,`p`.`fechapedido` AS `fechapedido`,`p`.`estado` AS `estado`,`p`.`cliente` AS `cliente`,`clientes`.`razonsocial` AS `razonsocial`,`p`.`nombrecli` AS `nombrecli`,`p`.`idusuario` AS `idusuario`,`usuarios`.`usuario` AS `usuario` from ((`pedidos` `p` left join `clientes` on((`clientes`.`id` = `p`.`cliente`))) left join `usuarios` on((`usuarios`.`id` = `p`.`idusuario`))) */;

/*View structure for view vsproductos */

/*!50001 DROP TABLE IF EXISTS `vsproductos` */;
/*!50001 DROP VIEW IF EXISTS `vsproductos` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vsproductos` AS select `p`.`id` AS `id`,`p`.`descripcion` AS `descripcion`,`p`.`precio` AS `precio`,`p`.`idtipo` AS `idtipo`,`t`.`descripcion` AS `tipo`,`p`.`idtamano` AS `idtamano`,`ta`.`descripcion` AS `tamano`,`p`.`idreceta` AS `idreceta`,`r`.`nombre` AS `receta`,`p`.`idimpuesto` AS `idimpuesto`,`i`.`descripcion` AS `impuesto` from ((((`productos` `p` left join `tipo` `t` on((`p`.`idtipo` = `t`.`id`))) left join `tamano` `ta` on((`p`.`idtamano` = `ta`.`idtamano`))) left join `receta` `r` on((`p`.`idreceta` = `r`.`id`))) left join `impuesto` `i` on((`p`.`idimpuesto` = `i`.`id`))) */;

/*View structure for view vsreceta */

/*!50001 DROP TABLE IF EXISTS `vsreceta` */;
/*!50001 DROP VIEW IF EXISTS `vsreceta` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vsreceta` AS select `r`.`id` AS `id`,`r`.`nombre` AS `receta`,`p`.`descripcion` AS `producto`,`p`.`id` AS `idproducto` from (`productos` `p` left join `receta` `r` on((`p`.`idreceta` = `r`.`id`))) */;

/*View structure for view vsusuario */

/*!50001 DROP TABLE IF EXISTS `vsusuario` */;
/*!50001 DROP VIEW IF EXISTS `vsusuario` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vsusuario` AS select `e`.`id` AS `idempleado`,`e`.`nombres` AS `nombres`,`e`.`idusuario` AS `idusuario`,`u`.`id` AS `id`,`u`.`usuario` AS `usuario`,`u`.`password` AS `passwrd`,`u`.`idnivel` AS `idnivel`,`n`.`descripcion` AS `nivel` from ((`empleados` `e` left join `usuarios` `u` on((`e`.`idusuario` = `u`.`id`))) left join `nivel` `n` on((`u`.`idnivel` = `n`.`id`))) */;

/*View structure for view vsventa */

/*!50001 DROP TABLE IF EXISTS `vsventa` */;
/*!50001 DROP VIEW IF EXISTS `vsventa` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vsventa` AS select `fv`.`id` AS `id`,`fv`.`fechaemision` AS `fechaemision`,`fv`.`nrofactura` AS `nrofactura`,`fv`.`idcaja` AS `idcaja`,`caja`.`nrocaja` AS `nrocaja`,`fv`.`idsucursal` AS `idsucursal`,`sucursal`.`descripcion` AS `sucursal`,`fv`.`hora` AS `hora`,`fv`.`estado` AS `estado`,`fv`.`cuota` AS `cuota`,`fv`.`idtipodocumento` AS `idtipodocumento`,`tipodocumento`.`descripcion` AS `Documento`,`fv`.`idtipofactura` AS `idtipofactura`,`tipofactura`.`descripcion` AS `Factura`,`fv`.`idtimbrado` AS `idtimbrado`,`timbrado`.`nrotimbrado` AS `nrotimbrado`,`timbrado`.`fechavencimiento` AS `fechavencimiento`,`fv`.`idaperturacierre` AS `idaperturacierre`,`fv`.`idcliente` AS `idcliente`,`clientes`.`razonsocial` AS `razonsocial`,`fv`.`idempleados` AS `idempleados`,`empleados`.`nombres` AS `usuario` from ((((((((`facturaventa` `fv` left join `caja` on((`caja`.`id` = `fv`.`idcaja`))) left join `sucursal` on((`caja`.`id` = `fv`.`idcaja`))) left join `tipodocumento` on((`tipodocumento`.`id` = `fv`.`idtipodocumento`))) left join `tipofactura` on((`tipofactura`.`id` = `fv`.`idtipofactura`))) left join `timbrado` on((`timbrado`.`id` = `fv`.`idtimbrado`))) left join `aperturacierre` on((`aperturacierre`.`id` = `fv`.`idaperturacierre`))) left join `clientes` on((`clientes`.`id` = `fv`.`idcliente`))) left join `empleados` on((`empleados`.`id` = `fv`.`idempleados`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
