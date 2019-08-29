create table empleado(
    id_empleado NUMBER GENERATED ALWAYS AS IDENTITY,
    nombre varchar2(50) not null,
    apellido varchar2(50 ) not null,
    cedula varchar2(30) not null,
    estado_civil varchar2(1) not null,
    genero varchar2(1) not null,
    edad number(3) not null,
    constraint llave_primaria_empleado primary key (id_empleado) 
);