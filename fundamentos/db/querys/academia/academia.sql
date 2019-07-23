 /* TABLA DEPARTAMENTO,
    padre en el modelo entidad relacion
 */   
CREATE TABLE DEPARTAMENTO(
    ID_DEPARTAMENTO NUMBER GENERATED ALWAYS AS IDENTITY,
    NOMBRE_DEPARTAMENTO VARCHAR2(50) NOT NULL,
    EDIFICIO VARCHAR2(50) NOT NULL,
    DESPACHO VARCHAR2(50) NOT NULL,
    NUM_CUERPO_DOCENTE VARCHAR2(50) NOT NULL,
    CONSTRAINT llave_primaria_departamento PRIMARY KEY (ID_DEPARTAMENTO)  
);


/*TABLA CURSO*/
CREATE TABLE CURSO(
    NUM_CURSO NCHAR(3) NOT NULL,
    NOMBRE_CURSO VARCHAR2(22) NOT NULL,
    DESCRIPCION VARCHAR2(25) NOT NULL,
    CREDITO NUMBER(5) NOT NULL,
    TARIFA NUMBER(5,2) NOT NULL,
    ID_DEPARTAMENTO NCHAR(4) NOT NULL,
    CONSTRAINT llave_primaria_curso PRIMARY KEY (NUM_CURSO),
    CONSTRAINT fk_clase_curso
        FOREIGN KEY (ID_DEPARTAMENTO)
        REFERENCES DEPARTAMENTO(ID_DEPARTAMENTO)
);

CREATE INDEX nombre_curso
  ON CURSO (NOMBRE_CURSO);
  
CREATE INDEX descripcion_curso
    ON CURSO (DESCRIPCION); 
    
    
    

/*TABLA CLASE*/
CREATE TABLE CLASE(
    NUM_CURSO NCHAR(3) NOT NULL,
    SECCION NCHAR(2) NOT NULL,
    NUM_PROFESOR NCHAR(2) NOT NULL,
    DIA NCHAR(2) NOT NULL,
    HORA NCHAR(14) NOT NULL,
    EDIFICIO NCHAR(2) NOT NULL,
    DESPACHO NUMBER(3) NOT NULL,
    CONSTRAINT llaves_primarias_clase PRIMARY KEY (NUM_CURSO, SECCION),
    CONSTRAINT fk_clase_curso
        FOREIGN KEY (NUM_CURSO)
        REFERENCES CURSO(NUM_CURSO)
);


/*ESTUDIANTE*/
CREATE TABLE ESTUDIANTE(
    NUM_ESTUDIANTE NCHAR(3) NOT NULL,
    NOMBRE VARCHAR2(30) NOT NULL,
    DIRECCION VARCHAR2(15) NOT NULL,
    TELEFONO VARCHAR2(15) NOT NULL,
    FECHA_NACIMIENTO DATE NOT NULL,
    NUM_CENTRO_EDU NUMBER(5) NOT NULL,
    ID_DEPARTAMENTO NCHAR(3) NOT NULL,
    NOM_ID_DEPARTAMENTO NCHAR(4) NOT NULL,
    CONSTRAINT llave_primaria_estudiante PRIMARY KEY(NUM_ESTUDIANTE),
    CONSTRAINT fk_matricula_estudiante
        FOREIGN KEY (NOM_ID_DEPARTAMENTO)
        REFERENCES DEPARTAMENTO(ID_DEPARTAMENTO)
);

/*MATRICULA*/
CREATE TABLE MATRICULA(
    NUM_CURSO NCHAR(3) NOT NULL,
    SECCION NCHAR(2) NOT NULL,
    NUM_ESTUDIANTE NCHAR(3) NOT NULL,
    FECHA DATE NOT NULL,
    HORA TIMESTAMP NOT NULL,
    CONSTRAINT llaves_primarias_matricula PRIMARY KEY (NUM_CURSO, SECCION, NUM_ESTUDIANTE),
    CONSTRAINT fk_matricula_clase
        FOREIGN KEY (NUM_CURSO, SECCION)
        REFERENCES CLASE(NUM_CURSO, SECCION),
    CONSTRAINT fk_matricula_estudiante
        FOREIGN KEY (NUM_ESTUDIANTE)
        REFERENCES ESTUDIANTE(NUM_ESTUDIANTE)
);

/*USUARIO*/
