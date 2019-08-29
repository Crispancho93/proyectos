INSERT INTO empleado
(nombre, apellido, cedula, estado_civil,  genero, edad)
VALUES
( 'julian', 'torres', '198973', '1', '1', 25);

SELECT * FROM empleado;

UPDATE empleado
SET nombre = 'julio',
    apellido = 'velez',
    cedula = '10354',
    estado_civil = '1',
    genero = '1',
    edad = 30
WHERE ID_EMPLEADO = 1;