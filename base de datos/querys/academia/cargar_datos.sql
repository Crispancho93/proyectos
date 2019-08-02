/*CURSO*/
INSERT INTO CURSO
(CNO, CNOMBRE, CDESCP, CRED, CTARIFA, CDEPT)
VALUES
('C19', 'bases de datos 2', 'informatica', 3, 100.00, 'THEO');

SELECT
    *
FROM CURSO ;



/*DEPARTAMENTO*/
SELECT
    *   
FROM DEPARTAMENTO ORDER BY nombre_departamento;

insert into departamento 
(nombre_departamento, edificio, despacho, num_cuerpo_docente)
values
('Ingenieria en sistemas', 'torre 2', '13', '233');

UPDATE DEPARTAMENTO
SET NOMBRE_DEPARTAMENTO = 'ingenieria industrial',
    EDIFICIO = 'torre 2',
    DESPACHO = '10',
    NUM_CUERPO_DOCENTE = '9'
WHERE ID_DEPARTAMENTO = 1;

/*CLASE*/
INSERT INTO CLASE
(CNO, SEC, GRUPO_DOCENTE, CDIA, CHORA, CEDIF, cdespacho)
VALUES
('C18', 'introdiccion', 'informatica', 3, 100.00, 'THEO');



/*MODIFICAR*/
