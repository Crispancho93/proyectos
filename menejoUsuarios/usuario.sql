-- -----------------------------------------------------
-- Schema manejo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema manejo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `manejo` DEFAULT CHARACTER SET utf8 ;
USE `manejo` ;

-- -----------------------------------------------------
-- Table `manejo`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `manejo`.`usuario` 
(
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(45) NOT NULL,
  `clave` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(80) NOT NULL,
  `las_sesion` DATETIME NULL DEFAULT '0000-00-00 00:00:00',
  `id_tipo` INT NULL DEFAULT NULL,
   FOREIGN KEY (id_tipo) REFERENCES tipo_usuario (id_tipo_usuario)
		ON DELETE RESTRICT
		ON UPDATE CASCADE,
  PRIMARY KEY (`id_usuario`)
)
ENGINE = InnoDB;


INSERT INTO usuario
(usuario, clave, nombre, las_sesion, id_tipo)
VALUES
('crispancho', '123', 'cristian arboleda', '0000-00-00 00:00:00', 1);

/*TIPO USUARIO*/
CREATE TABLE IF NOT EXISTS `manejo`.`tipo_usuario`
(
	`id_tipo_usuario` INT NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(45) NOT NULL,
	PRIMARY KEY(`id_tipo_usuario`)
)
ENGINE = InnoDB;

