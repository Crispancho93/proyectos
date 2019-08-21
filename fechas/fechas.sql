-- -----------------------------------------------------
-- Schema fechas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema fechas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `fechas` DEFAULT CHARACTER SET utf8 ;
USE `fechas` ;

-- -----------------------------------------------------
-- Table `fechas`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fechas`.`persona` 
(
  `id_persona` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `numero_documento` VARCHAR(45) NULL,
  `fecha_nacimineto` DATETIME NOT NULL,
  PRIMARY KEY (`id_persona`)
)
ENGINE = InnoDB;

SELECT * FROM fechas.persona;

use fechas;
INSERT INTO persona
(nombre, numero_documento, fecha_nacimineto)
VALUES
('Cristian Arboleda', '1152694003', '2019-08-20 11:15:10');