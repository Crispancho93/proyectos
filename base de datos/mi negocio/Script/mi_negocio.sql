-- MySQL Script generated by MySQL Workbench
-- Wed Aug 28 19:11:43 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mi_negocio
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mi_negocio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mi_negocio` DEFAULT CHARACTER SET utf8 ;
USE `mi_negocio` ;

-- -----------------------------------------------------
-- Table `mi_negocio`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mi_negocio`.`categoria` 
(
  `idcategoria` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `descripcion` VARCHAR(256) NULL,
  `condicion` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idcategoria`)
  )
ENGINE = InnoDB;
CREATE UNIQUE INDEX  idx_categoria ON categoria(nombre);


-- -----------------------------------------------------
-- Table `mi_negocio`.`articulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mi_negocio`.`articulo` 
(
  `idarticulo` INT NOT NULL AUTO_INCREMENT,
  `idcategoria` INT NOT NULL,
  `codigo` VARCHAR(50) NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `stock` INT NOT NULL,
  `descripcion` VARCHAR(256) NULL,
  `imagen` VARCHAR(50) NULL,
  `condicion` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idarticulo`),
  CONSTRAINT `fk_articulo_categoria`
    FOREIGN KEY (`idcategoria`)
    REFERENCES `mi_negocio`.`categoria` (`idcategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
CREATE UNIQUE INDEX  idx_articulo ON articulo(nombre);
CREATE INDEX  `fk_articulo_categoria_idx` ON articulo(idcategoria);

-- -----------------------------------------------------
-- Table `mi_negocio`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mi_negocio`.`persona` (
  `idpersona` INT NOT NULL AUTO_INCREMENT,
  `tipo_persona` VARCHAR(20) NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `tipo_documento` VARCHAR(20) NULL,
  `num_documento` VARCHAR(20) NULL,
  `direccion` VARCHAR(70) NULL,
  `telefono` VARCHAR(20) NULL,
  `email` VARCHAR(50) NULL,
  PRIMARY KEY (`idpersona`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mi_negocio`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mi_negocio`.`usuario`
(
  `idusuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `tipo_usuario` VARCHAR(20) NOT NULL,
  `tipo_documento` VARCHAR(20) NOT NULL,
  `num_documento` VARCHAR(20) NOT NULL,
  `direccion` VARCHAR(70) NULL,
  `telefono` VARCHAR(20) NULL,
  `email` VARCHAR(50) NULL,
  `cargo` VARCHAR(20) NULL,
  `loguin` VARCHAR(20) NOT NULL,
  `clave` VARCHAR(64) NOT NULL,
  `condicion` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idusuario`)
  )
ENGINE = InnoDB;
CREATE UNIQUE INDEX  idx_usuario ON usuario(loguin);

-- -----------------------------------------------------
-- Table `mi_negocio`.`ingreso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mi_negocio`.`ingreso` (
  `idingreso` INT NOT NULL AUTO_INCREMENT,
  `idpersona` INT NOT NULL,
  `idusuario` INT NOT NULL,
  `idarticulo` INT NOT NULL,
  `tipo_comprobante` VARCHAR(20) NOT NULL,
  `num_comprobante` VARCHAR(10) NULL,
  `fecha_expedicion` DATETIME NULL,
  `fecha_vencimineto` DATETIME NULL,
  `cantidad` DECIMAL(11,2) NOT NULL,
  `valor_unitario` DECIMAL(11,2) NOT NULL,
  `subtotal` DECIMAL(11,2) NOT NULL,
  `descuento` DECIMAL(11,2) NULL,
  `subtotal_descuento` DECIMAL(11,2) NULL,
  `iva` DECIMAL(11,2) NULL,
  `total` DECIMAL(11,2) NULL,
  `rte_fuente` DECIMAL(11,2) NULL,
  `rte_iva` DECIMAL(11,2) NULL,
  `rte_ica` DECIMAL(11,2) NULL,
  `neto` DECIMAL(11,2) NULL,
  `estado` VARCHAR(45) NULL,
  `observaciones` VARCHAR(100) NULL,
  PRIMARY KEY (`idingreso`),
  CONSTRAINT `fk_ingreso_persona`
    FOREIGN KEY (`idpersona`)
    REFERENCES `mi_negocio`.`persona` (`idpersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ingreso_usuario`
    FOREIGN KEY (`idusuario`)
    REFERENCES `mi_negocio`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ingreso_articulo`
    FOREIGN KEY (`idarticulo`)
    REFERENCES `mi_negocio`.`articulo` (`idarticulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
CREATE INDEX  idx_ingreso_1 ON ingreso(idpersona);
CREATE INDEX  idx_ingreso_2 ON ingreso(idusuario);
CREATE INDEX  idx_ingreso_4 ON ingreso(idarticulo);

-- -----------------------------------------------------
-- Table `mi_negocio`.`venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mi_negocio`.`venta` (
  `idventa` INT NOT NULL AUTO_INCREMENT,
  `idpersona` INT NOT NULL,
  `idusuario` INT NOT NULL,
  `idarticulo` INT NOT NULL,
  `tipo_comprobante` VARCHAR(20) NOT NULL,
  `num_comprobante` VARCHAR(10) NULL,
  `fecha_expedicion` DATETIME NULL,
  `fecha_vencimineto` DATETIME NULL,
  `cantidad` DECIMAL(11,2) NOT NULL,
  `valor_unitario` DECIMAL(11,2) NOT NULL,
  `subtotal` DECIMAL(11,2) NOT NULL,
  `descuento` DECIMAL(11,2) NULL,
  `subtotal_descuento` DECIMAL(11,2) NULL,
  `iva` DECIMAL(11,2) NULL,
  `total` DECIMAL(11,2) NULL,
  `rte_fuente` DECIMAL(11,2) NULL,
  `rte_iva` DECIMAL(11,2) NULL,
  `rte_ica` DECIMAL(11,2) NULL,
  `neto` DECIMAL(11,2) NULL,
  `estado` VARCHAR(45) NULL,
  `observaciones` VARCHAR(100) NULL,
  PRIMARY KEY (`idventa`),
  CONSTRAINT `fk_venta_persona`
    FOREIGN KEY (`idpersona`)
    REFERENCES `mi_negocio`.`persona` (`idpersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_usuario`
    FOREIGN KEY (`idusuario`)
    REFERENCES `mi_negocio`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_articulo`
    FOREIGN KEY (`idarticulo`)
    REFERENCES `mi_negocio`.`articulo` (`idarticulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
ENGINE = InnoDB;
CREATE INDEX  idx_venta_1 ON venta(idpersona);
CREATE INDEX  idx_venta_2 ON venta(idusuario);
CREATE INDEX  idx_venta_3 ON venta(idarticulo);

-- -----------------------------------------------------
-- Table `mi_negocio`.`recibo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mi_negocio`.`recibo` (
  `idrecibo` INT NOT NULL AUTO_INCREMENT,
  `idpersona` INT NOT NULL,
  `idusuario` INT NOT NULL,
  `idarticulo` INT NOT NULL,
  `idventa` INT NOT NULL,
  `tipo_comprobante` VARCHAR(20) NOT NULL,
  `num_comprobante` VARCHAR(10) NULL,
  `fecha_expedicion` DATETIME NULL,
  `descuento` DECIMAL(11,2) NULL,
  `subtotal_descuento` DECIMAL(11,2) NULL,
  `total` DECIMAL(11,2) NULL,
  `rte_fuente` DECIMAL(11,2) NULL,
  `rte_iva` DECIMAL(11,2) NULL,
  `rte_ica` DECIMAL(11,2) NULL,
  `neto` DECIMAL(11,2) NULL,
  `estado` VARCHAR(45) NULL,
  `observaciones` VARCHAR(100) NULL,
  PRIMARY KEY (`idrecibo`),
  CONSTRAINT `fk_recibo_persona`
    FOREIGN KEY (`idpersona`)
    REFERENCES `mi_negocio`.`persona` (`idpersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recibo_usuario`
    FOREIGN KEY (`idusuario`)
    REFERENCES `mi_negocio`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recibo_articulo`
    FOREIGN KEY (`idarticulo`)
    REFERENCES `mi_negocio`.`articulo` (`idarticulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recibo_venta`
    FOREIGN KEY (`idventa`)
    REFERENCES `mi_negocio`.`venta` (`idventa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
CREATE INDEX  idx_recibo_1 ON venta(idpersona);
CREATE INDEX  idx_recibo_2 ON venta(idusuario);
CREATE INDEX  idx_recibo_3 ON venta(idarticulo);
CREATE INDEX  idx_recibo_4 ON venta(idventa);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
