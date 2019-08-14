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
  PRIMARY KEY (`id_usuario`)) 
ENGINE = InnoDB;
  
CREATE UNIQUE INDEX idx_login ON usuario(login);

-- -----------------------------------------------------
-- Table `mi_negocio`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mi_negocio`.`persona` (
  `id_persona` INT NOT NULL AUTO_INCREMENT,
  `tipo_persona` VARCHAR(20) NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `tipo_documento` VARCHAR(20) NULL,
  `num_documento` VARCHAR(20) NULL,
  `ciudad` VARCHAR(45) NULL,
  `direccion` VARCHAR(70) NULL,
  `telefono` VARCHAR(20) NULL,
  `correo` VARCHAR(50) NULL,
  PRIMARY KEY (`id_persona`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX idx_cedula ON persona(num_documento);
CREATE INDEX idx_nombre ON persona(nombre);

-- -----------------------------------------------------
-- Table `mi_negocio`.`mi_empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mi_negocio`.`mi_empresa` (
  `id_mi_empresa` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `tipo_documento` VARCHAR(20) NOT NULL,
  `numero_documento` VARCHAR(20) NOT NULL,
  `cuidad` VARCHAR(20) NOT NULL,
  `direccion` VARCHAR(70) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(256) NULL,
  `logo` VARCHAR(45) NULL,
  PRIMARY KEY (`id_mi_empresa`))
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
  CONSTRAINT `fk_hacia_categoria`
    FOREIGN KEY (`id_categoria`)
    REFERENCES `mi_negocio`.`categoria` (`id_categoria`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
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
  `total_compra` DECIMAL(19,3) NULL,
  `estado` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_ingreso`),
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
-- Table `mi_negocio`.`usuario_permiso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mi_negocio`.`usuario_permiso` (
  `id_usuario_permiso` INT NOT NULL AUTO_INCREMENT,
  `id_usuario` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_usuario_permiso`),
  CONSTRAINT `fk_usuario_permiso_ausuario`
    FOREIGN KEY (`id_usuario`) 
    REFERENCES `mi_negocio`.`usuario` (`id_usuario`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mi_negocio`.`credito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mi_negocio`.`credito` (
  `id_credito` INT NOT NULL AUTO_INCREMENT,
  `id_persona` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  `cuota` VARCHAR(45) NOT NULL,
  `cupo_disponible` DECIMAL(19,3) NOT NULL,
  PRIMARY KEY (`id_credito`),
  CONSTRAINT `fk_credito_persona`
    FOREIGN KEY (`id_persona`)
    REFERENCES `mi_negocio`.`persona` (`id_persona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_credito_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `mi_negocio`.`usuario` (`id_usuario`)
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
  `id_mi_empresa` INT NOT NULL,
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
  CONSTRAINT `fk_venta_cliente`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `mi_negocio`.`persona` (`id_persona`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_venta_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `mi_negocio`.`usuario` (`id_usuario`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_mi_empresa`
    FOREIGN KEY (`id_mi_empresa`)
    REFERENCES `mi_negocio`.`mi_empresa` (`id_mi_empresa`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_venta_articulo`
    FOREIGN KEY (`id_articulo`)
    REFERENCES `mi_negocio`.`articulo` (`id_articulo`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_venta_detalle_ingreso`
    FOREIGN KEY (`id_detalle_ingreso`)
    REFERENCES `mi_negocio`.`detalle_ingreso` (`id_detalle_ingreso`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_hacia_credito`
    FOREIGN KEY (`id_credito`)
    REFERENCES `mi_negocio`.`credito` (`id_credito`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;

