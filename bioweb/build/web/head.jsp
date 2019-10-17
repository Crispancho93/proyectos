<%-- 
    Document   : head
    Created on : 26-ago-2019, 13:28:27
    Author     : Crispancho
--%>

<%@page contentType="text/html; charset=iso-8859-1" pageEncoding="iso-8859-1"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
        
        <!--funciones-->
        <script src="js/funciones.js" type="text/javascript"></script>
        
        <!--iconos-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        
        <!--bootstrap-->
        <link href="css/bootstrap4.1.3.min.css" rel="stylesheet" type="text/css"/>
        
        <!--jquery-->
        <script src="js/jquery-3.4.1.min.js" type="text/javascript"></script>   
        
        <!--estilos-->
        <link href="css/style.css" rel="stylesheet" type="text/css"/>

        <!--data tables-->
        <link href="css/datatables.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css"/>

        
        <title>Principal</title>
    </head>
    <body>

 <nav class="navbar navbar-expand-sm navbar-expand-md bg-dark navbar-dark">
  
  <!--Logo-->
  <a class="navbar-brand" href="home.jsp">
      <img src="imagenes/biologo.png"  style="width:100px;">
  </a>

  <!-- Links menu -->
  <ul class="navbar-nav">
    

    <!-- Entrada -->
   <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        ENTRADA
      </a>
      <div class="dropdown-menu">
          <a class="dropdown-item" href="entrada.jsp">NUEVA ENTRADA</a>
          <a class="dropdown-item" href="buscarEntrada.jsp">BUSCAR ENTRADA</a>
          <a class="dropdown-item" href="buscarEntradaAvanzada.jsp">BÚSQUEDA AVANZADA</a>
      </div>
    </li>
    
    <!--Salida -->
   <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        SALIDA
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="salida.jsp">NUEVA SALIDA</a>
        <a class="dropdown-item" href="buscarSalida.jsp">BUSCAR SALIDA</a>
        <a class="dropdown-item" href="buscarSalidaAvanzada.jsp">BÚSQUEDA AVANZADA</a>
      </div>
    </li>
    
    <!-- Productos -->
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        PRODUCTOS
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="ingresoProducto.jsp">INGRESO PRODUCTO</a>
        <a class="dropdown-item" href="buscarProducto.jsp">BUSCAR</a>
        
      </div>
    </li>
    
    <!-- Proveedores -->
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        PROVEEDORES
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="ingresoProveedor.jsp">INGRESO PROVEEDOR</a>
        <a class="dropdown-item" href="buscarProveedor.jsp">BUSCAR</a>
      </div>
    </li>
    
    <!--Clientes-->
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        CLIENTES
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="ingresoCliente.jsp">INGRESO CLIENTE</a>
        <a class="dropdown-item" href="buscarCliente.jsp">BUSCAR</a>
      </div>
    </li>
    
    <!--Empleados-->
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        EMPLEADOS
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="ingresoEmpleado.jsp">INGRESO EMPLEADO</a>
        <a class="dropdown-item" href="buscarEmpleado.jsp">BUSCAR</a>
      </div>
    </li>
    
    <!--Ajustes-->
    <li class="nav-item dropdown" id="ajustes">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        AJUSTES <i class="fas fa-cogs"></i>
      </a>
      <div class="dropdown-menu">
          <a class="dropdown-item" id="usuariosSistema" href="buscarUsuarioSistema.jsp">USUARIOS SISTEMA</a>
          <a class="dropdown-item" id="crearUsuariosSistema" href="crearUsuarioSistema.jsp">CREAR USUARIO</a>
      </div>
    </li>
    
    <!--Bienvenido-->
    <li class="nav-item">
      <a class="nav-link" href="#" id="navbardrop" data-toggle="dropdown">
        <%
        // creo objeto de sesión y recupero las seiones
        HttpSession miSesion = request.getSession();

        // valido que este activa la sesión
        if (miSesion.getAttribute("sesionActiva") != null) {
            out.print("<i class=\"fas fa-user-circle\"></i>"+ " " +miSesion.getAttribute("sesionActiva"));

        } else{
            response.sendRedirect("loguin.jsp");
        }

        // validamos c para cerrar la sesión
        if (request.getParameter("c") != null) {

            miSesion.removeAttribute("sesionActiva");
            //miSesion.invalidate();
            response.sendRedirect("loguin.jsp");
        }
        
        // si tipoUsuario es diferente de null, es tipo user 
        if (miSesion.getAttribute("usuario") != null) {
            out.write("<script type='text/javascript'>\n");
            out.write("ocultarUsuariosSistema();");
            out.write("</script>\n");
   
        } 
        %>
      </a>
    </li>
    
    <!--Cerrar sesión-->
    <li class="nav-item">
        <a class="nav-link " href=head.jsp?c=1>SALIR <i class="fas fa-sign-out-alt"></i></a>
    </li>
  </ul>
  
</nav>

