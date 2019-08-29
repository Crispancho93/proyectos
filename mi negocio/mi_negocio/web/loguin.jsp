<%-- 
    Document   : loguin
    Created on : 28-ago-2019, 19:27:07
    Author     : Crispancho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Loguin</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
   
    <div class="container well"  id="conteinerLogin">
        <center><img class="img-rounded" width="350" src="imagenes/FOTO-1-COMERCIO-_0.png" alt=""/></center>
        <form method="post" action="UsuarioBO" id="frmLoguin">
        
        <!--usuario-->    
        <div class="form-group">
            <input type="text" class="form-control" id="usuario" name="usuario" placeholder="Usuario" required>
        </div>
         
        <!--clave--> 
        <div class="form-group">
            <input type="password" class="form-control" id="clave" name="clave" placeholder="Clave" required>
        </div>
        
        <button type="submit" class="btn btn-primary" id="btnLoguin" name="enviar">Iniciar</button>
      </form>
  </div>
    <% 
        // si el usuario existe creo la sesión
        if (request.getAttribute("v") != null) {
            if (request.getAttribute("v").equals("1")) {
                    
                // creo objeto de sesión y recupero las seiones
                HttpSession miSesion = request.getSession();
                
                // creo sesion con el nombre sesionActiva y paso el usuario,
                // que va a tener la sesión, recuperandolo de el controlador
                miSesion.setAttribute("sesionActiva", request.getAttribute("usuario"));
                
                // redireccionamos a principal
                response.sendRedirect("home.jsp");
                
            }else{
                out.write("<script type='text/javascript'>\n");
                out.write("alert('Datos incorrectos')");
                out.write("</script>\n");
                
            }
        }
    %>
        
    </body>
</html>
