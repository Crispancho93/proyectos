<%-- 
    Document   : loguin
    Created on : 26-ago-2019, 10:08:26
    Author     : Crispancho
--%>

<%@page contentType="text/html; charset=iso-8859-1" pageEncoding="iso-8859-1"%>
<%@page session="true"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
        <title>Loguin</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
   
    <div class="container well" id="conteinerLogin">
        <center><img class="img-rounded" src="imagenes/biologo.png" alt=""/></center>
        <form method="post" action="ValidarUsuarioBO" id="frmLoguin">
        
        <!--usuario-->    
        <div class="form-group">
            <input type="text" class="form-control" id="usuario" name="usuario" placeholder="Usuario" required>
        </div>
         
        <!--clave--> 
        <div class="form-group">
            <input type="password" class="form-control" id="clave" name="clave" placeholder="Clave" required>
        </div>
        
        <button type="submit" class="btn btn-primary" id="btnLoguin" name="enviar">INICIAR</button>
      </form>
  </div>
    <% 
        // si el usuario existe creo la sesión
        if (request.getAttribute("v") != null) {
            if (request.getAttribute("v").equals("1")) {
                    
                // creo objeto de sesión y recupero las sesiones
                HttpSession miSesion = request.getSession();
                
                // creo sesión con el nombre sesionActiva y paso el usuario,
                // que va a tener la sesión, recuperandolo de el controlador
                miSesion.setAttribute("sesionActiva", request.getAttribute("usuario"));
                miSesion.setMaxInactiveInterval(28800);
               
                // valido si el tipo de usuario es user
                if (request.getAttribute("tipoUsuario")!= null) {
                    if (request.getAttribute("tipoUsuario").equals("user")) {
                        miSesion.setAttribute("usuario", "user");
                    }
                } 
                
                // redireccionamos al home
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
