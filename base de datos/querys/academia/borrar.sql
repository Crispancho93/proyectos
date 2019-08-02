/*BORRAR TABLA*/
DROP TABLE DEPARTAMENTO;
DROP TABLE CURSO;

/*BORRAR CLAVE SECUNDARIA*/
ALTER TABLE clase
DROP CONSTRAINT fk_clase_curso;

/*BORRAR REGISTRO*/
DELETE FROM departamento
WHERE ID_DEPARTAMENTO = 1;

 select space_limit/1024/1024 "Limit MB", space_used/1024/1024 "Used MB",
	space_reclaimable/1024/1024 "Reclaimable MB"
	from v$recovery_file_dest;  2    3  