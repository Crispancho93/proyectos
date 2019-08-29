Create Database univercidad
go 

use univercidad
go 

Create Table departamento 
( 
idDeparamento int Primary Key not null, 
Campo1 VarChar(15) not null, 
Campo2 nVarChar(15) not null, 
Campo3 VarChar(15) not null 
) 
go 

Insert Into departamento Values 
( 
1,
'Contenido1', 
'Contendo2',
'Contenido3'
) 
go 


SELECT * FROM departamento;