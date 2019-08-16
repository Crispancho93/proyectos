-- MySQL Script generated by MySQL Workbench
-- Thu Aug 15 22:16:42 2019
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
CREATE TABLE IF NOT EXISTS `mi_negocio`.`categoria` (
  `id_categoria` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(256) NULL,
  `condicion` BIT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_categoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mi_negocio`.`articulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mi_negocio`.`articulo` (
  `id_articulo` INT NOT NULL AUTO_INCREMENT,
  `id_categoria` INT NOT NULL,
  `codigo` VARCHAR(50) NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `stock` INT NOT NULL,
  `descripcion` VARCHAR(512) NULL,
  `imagen` VARCHAR(50) NULL,
  `condicion` BIT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_articulo`),
  INDEX `fk_hacia_categoria_idx` (`id_categoria` ASC) VISIBLE,
  CONSTRAINT `fk_hacia_categoria`
    FOREIGN KEY (`id_categoria`)
    REFERENCES `mi_negocio`.`categoria` (`id_categoria`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mi_negocio`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mi_negocio`.`usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `tipo_documento` VARCHAR(20) NOT NULL,
  `num_documento` VARCHAR(20) NOT NULL,
  `direccion` VARCHAR(70) NULL,
  `telefono` VARCHAR(20) NULL,
  `correo` VARCHAR(50) NULL,
  `cargo` VARCHAR(20) NULL,
  `login` VARCHAR(20) NOT NULL,
  `clave` VARCHAR(64) NOT NULL,
  `condicion` BIT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_usuario`),
  UNIQUE INDEX `login_UNIQUE` (`login` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mi_negocio`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mi_negocio`.`persona` (
  `id_persona` INT NOT NULL AUTO_INCREMENT,
  `regimen` VARCHAR(45) NULL,
  `tipo_persona` VARCHAR(20) NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `tipo_documento` VARCHAR(20) NOT NULL,
  `num_documento` VARCHAR(20) NOT NULL,
  `ciudad` VARCHAR(45) NULL,
  `direccion` VARCHAR(70) NULL,
  `telefono` VARCHAR(20) NULL,
  `celular` VARCHAR(20) NULL,
  `correo` VARCHAR(50) NULL,
  PRIMARY KEY (`id_persona`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mi_negocio`.`ingreso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mi_negocio`.`ingreso` (
  `id_ingreso` INT NOT NULL AUTO_INCREMENT,
  `id_proveedor` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  `tipo_comprobante` VARCHAR(20) NOT NULL,
  `serie_comprobante` VARCHAR(45) NULL,
  `numero_comprobante` VARCHAR(45) NOT NULL,
  `fecha_hora` DATETIME NOT NULL,
  `iva` DECIMAL(19,3) NULL,
  `retefuente` DECIMAL(19,3) NULL,
  `reteica` DECIMAL(19,3) NULL,
  `reteiva` DECIMAL(19,3) NULL,
  `total_compra` DECIMAL(19,3) NOT NULL,
  `estado` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_ingreso`),
  INDEX `fk_hacia_usuario_idx` (`id_usuario` ASC) VISIBLE,
  INDEX `fk_hacia_persona_idx` (`id_proveedor` ASC) VISIBLE,
  CONSTRAINT `fk_hacia_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `mi_negocio`.`usuario` (`id_usuario`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_hacia_persona`
    FOREIGN KEY (`id_proveedor`)
    REFERENCES `mi_negocio`.`persona` (`id_persona`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mi_negocio`.`detalle_ingreso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mi_negocio`.`detalle_ingreso` (
  `id_detalle_ingreso` INT NOT NULL AUTO_INCREMENT,
  `id_ingreso` INT NOT NULL,
  `id_articulo` INT NOT NULL,
  `cantidad` INT NOT NULL,
  `precio_compra` DECIMAL(19,3) NOT NULL,
  `precio_venta` DECIMAL(19,3) NOT NULL,
  PRIMARY KEY (`id_detalle_ingreso`),
  INDEX `fk_hacia_ingreso_idx` (`id_ingreso` ASC) VISIBLE,
  INDEX `fk_hacia_articulo_idx` (`id_articulo` ASC) VISIBLE,
  CONSTRAINT `fk_hacia_ingreso`
    FOREIGN KEY (`id_ingreso`)
    REFERENCES `mi_negocio`.`ingreso` (`id_ingreso`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_hacia_articulo`
    FOREIGN KEY (`id_articulo`)
    REFERENCES `mi_negocio`.`articulo` (`id_articulo`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mi_negocio`.`fiador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mi_negocio`.`fiador` (
  `id_fiador` INT NOT NULL AUTO_INCREMENT,
  `id_persona` INT NULL,
  `fecha` DATETIME NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `tipo_documento` VARCHAR(20) NOT NULL,
  `num_documento` VARCHAR(20) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(70) NOT NULL,
  `telefono` VARCHAR(20) NOT NULL,
  `celular` VARCHAR(20) NOT NULL,
  `correo` VARCHAR(50) NULL,
  `lugar_trabajo` VARCHAR(45) NULL,
  `cargo` VARCHAR(45) NULL,
  `fecha_ingre` DATE NULL,
  `salario` DECIMAL(19,3) NULL,
  `telefono_empresa` VARCHAR(20) NULL,
  `tipo_vivienda` VARCHAR(45) NOT NULL,
  `valor_propiedad` DECIMAL(19,3) NOT NULL,
  `estado` VARCHAR(20) NOT NULL,
  `observacion` VARCHAR(500) NULL,
  PRIMARY KEY (`id_fiador`),
  INDEX `yjdth_idx` (`id_persona` ASC) VISIBLE,
  CONSTRAINT `fk_referencia_personal0`
    FOREIGN KEY (`id_persona`)
    REFERENCES `mi_negocio`.`persona` (`id_persona`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mi_negocio`.`solicitud_credito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mi_negocio`.`solicitud_credito` (
  `id_solicitud_credito` INT NOT NULL AUTO_INCREMENT,
  `id_persona` INT NULL,
  `id_fiador` INT NULL,
  `fecha` DATETIME NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `tipo_documento` VARCHAR(20) NOT NULL,
  `num_documento` VARCHAR(20) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(70) NOT NULL,
  `telefono` VARCHAR(20) NULL,
  `celular` VARCHAR(20) NOT NULL,
  `correo` VARCHAR(50) NULL,
  `lugar_trabajo` VARCHAR(45) NULL,
  `cargo` VARCHAR(45) NULL,
  `fecha_ingreso` DATE NULL,
  `salario` DECIMAL(19,3) NULL,
  `telefono_empresa` VARCHAR(20) NULL,
  `tipo_vivienda` VARCHAR(45) NOT NULL,
  `valor_propiedad` DECIMAL(19,3) NOT NULL,
  `observacion` VARCHAR(500) NULL,
  `estado` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_solicitud_credito`),
  INDEX `yjdth_idx` (`id_persona` ASC) VISIBLE,
  INDEX `fk_hacia_fiador_idx` (`id_fiador` ASC) VISIBLE,
  CONSTRAINT `fk_referencia_personal`
    FOREIGN KEY (`id_persona`)
    REFERENCES `mi_negocio`.`persona` (`id_persona`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_hacia_fiador`
    FOREIGN KEY (`id_fiador`)
    REFERENCES `mi_negocio`.`fiador` (`id_fiador`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mi_negocio`.`credito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mi_negocio`.`credito` (
  `id_credito` INT NOT NULL AUTO_INCREMENT,
  `id_persona` INT NULL,
  `id_solicitud_credito` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  `numero_cuota` INT NOT NULL,
  `cupo_disponible` DECIMAL(19,3) NOT NULL,
  PRIMARY KEY (`id_credito`),
  INDEX `fk_hacia_persona_idx` (`id_persona` ASC) VISIBLE,
  INDEX `fk_hacia_usuario_idx` (`id_usuario` ASC) VISIBLE,
  INDEX `fk_solicitud_credito_idx` (`id_solicitud_credito` ASC) VISIBLE,
  CONSTRAINT `fk_hacia_persona`
    FOREIGN KEY (`id_persona`)
    REFERENCES `mi_negocio`.`persona` (`id_persona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_hacia_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `mi_negocio`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_solicitud_credito`
    FOREIGN KEY (`id_solicitud_credito`)
    REFERENCES `mi_negocio`.`solicitud_credito` (`id_solicitud_credito`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mi_negocio`.`venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mi_negocio`.`venta` (
  `id_venta` INT NOT NULL AUTO_INCREMENT,
  `id_cliente` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  `id_articulo` INT NOT NULL,
  `id_detalle_ingreso` INT NOT NULL,
  `id_credito` INT NULL,
  `tipo_comprobante` VARCHAR(20) NOT NULL,
  `fecha_hora` DATETIME NOT NULL,
  `iva` DECIMAL(19,3) NULL,
  `rete_fuente` DECIMAL(19,3) NULL,
  `rete_iva` DECIMAL(19,3) NULL,
  `valor_unitario` DECIMAL(19,3) NOT NULL,
  `subtotal` DECIMAL(19,3) NOT NULL,
  `total` DECIMAL(19,3) NOT NULL,
  `descuento` DECIMAL(19,3) NULL,
  `estado` VARCHAR(20) NOT NULL,
  `observacion` VARCHAR(256) NULL,
  PRIMARY KEY (`id_venta`),
  INDEX `fk_hacia_cliente_idx` (`id_cliente` ASC) VISIBLE,
  INDEX `fk_usuario_idx` (`id_usuario` ASC) VISIBLE,
  INDEX `fk_hacia_articulo_idx` (`id_articulo` ASC) VISIBLE,
  INDEX `fk_hacia_detalle_ingreso_idx` (`id_detalle_ingreso` ASC) VISIBLE,
  INDEX `fk_hacia_credito_idx` (`id_credito` ASC) VISIBLE,
  CONSTRAINT `fk_hacia_cliente`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `mi_negocio`.`persona` (`id_persona`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `mi_negocio`.`usuario` (`id_usuario`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_hacia_articulo`
    FOREIGN KEY (`id_articulo`)
    REFERENCES `mi_negocio`.`articulo` (`id_articulo`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_hacia_detalle_ingreso`
    FOREIGN KEY (`id_detalle_ingreso`)
    REFERENCES `mi_negocio`.`detalle_ingreso` (`id_detalle_ingreso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_hacia_credito`
    FOREIGN KEY (`id_credito`)
    REFERENCES `mi_negocio`.`credito` (`id_credito`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mi_negocio`.`usuario_permiso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mi_negocio`.`usuario_permiso` (
  `id_usuario_permiso` INT NOT NULL AUTO_INCREMENT,
  `id_usuario` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_usuario_permiso`),
  INDEX `fk_hacia_usuario_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_hacia_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `mi_negocio`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;