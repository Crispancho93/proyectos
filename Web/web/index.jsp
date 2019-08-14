<%-- 
    Document   : index
    Created on : 11/08/2019, 11:06:31 PM
    Author     : Crispancho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
    <form action="ejemplo.php" method="get">
        <p>Nombre: <input type="text" name="nombre" size="40"></p>
        <p>Año de nacimiento: <input type="number" name="nacido" min="1900"></p>
        <p>Sexo:
          <input type="radio" name="hm" value="h"> Hombre
          <input type="radio" name="hm" value="m"> Mujer
        </p>
        <p>
          <input type="submit" value="Enviar">
          <input type="reset" value="Borrar">
        </p>
    </form>
    
    
    
    </body>
</html>
