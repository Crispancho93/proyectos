<%-- 
    Document   : agregarPersona
    Created on : 30-ago-2019, 11:20:41
    Author     : Crispancho
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@include file="head.jsp" %>

<div class="container mt-5 mb-5">
    <h4 class="row justify-content-center align-items-center mb-5 text-dark">INGRESO EMPLEADO</h4>
    <form action="IngresoEmpleado" method="post">
        <div class="form-row">
            
            <!--nombre del empleado-->
            <div class="form-group col-md-4">
                <label for="nombre">* NOMBRE</label>
                <input type="text" class="form-control" id="nombre" name="nombre" required>
            </div>
            
            <!--tipo de persona, para realizar la inserción del tipo empleado -->
            <input type="hidden" class="form-control" name="tipoPersona" value="empleado">
            
            <!--tipo de documento-->
            <div class="form-group col-md-4">
                <label for="tipoDocumento">* TIPO DOCUMENTO</label>
                <select id="tipoDocumento" class="form-control" name="tipoDocumento">
                    <option selected>CC</option>
                    <option>NA</option>
                </select>
            </div>
            
            <!--numero del documento-->
            <div class="form-group col-md-4">
                <label for="numeroDocumento">* NÚMERO DOCUMENTO</label>
                <input type="text" class="form-control" id="numeroDocumento" name="numeroDocumento" required>
            </div>
            
            <!--dirección del empleado-->
            <div class="form-group col-md-4">
                <label for="direccion">* DIRECCIÓN</label>
                <input type="text" class="form-control" id="direccion" name="direccion" required>
            </div>
            
            <!--telefono-->
            <div class="form-group col-md-4">
                <label for="telefono">TELÉFONO</label>
                <input type="text" class="form-control" id="telefono" name="telefono">
            </div>
            
            <!--correo-->
            <div class="form-group col-md-4">
                <label for="correo">CORREO</label>
                <input type="text" class="form-control" id="correo" name="correo">
            </div>
            
            <!--nombre de un contacto-->
            <div class="form-group col-md-4">
                <label for="nombreContacto">NOMBRE CONTACTO</label>
                <input type="text" class="form-control" id="nombreContacto" name="nombreContacto">
            </div>
            
            <!--numero de un contacto-->
            <div class="form-group col-md-4">
                <label for="numeroContacto">NÚMERO CONTACTO</label>
                <input type="text" class="form-control" id="numeroContacto" name="numeroContacto">
            </div>
            
            <!--separador-->
            <div class="form-group col-md-4"></div>
            
            <!--agregar-->
            <button type="submit" class="btn btn-primary col-md-2" id="btnAgregarPersona" name="btnAgregarPersona">AGREGAR <i class="fas fa-user-plus"></i></button>
            <div class="col-md-3"></div>
            <!--volver-->
            <a href="buscarEmpleado.jsp" class="btn btn-dark col-md-2">VOLVER <i class="far fa-hand-point-left"></i></a>
            <div class="col-md-3"></div>
            <!--limpiar-->
            <button type="reset" class="btn btn-danger col-md-2" >LIMPIAR <i class="fas fa-broom"></i></button>
        </div>

    </form>
</div>

<%    if (request.getAttribute("personaAgregada") != null) {
        if (request.getAttribute("personaAgregada").equals("1")) {
            out.println("<script type=\"text/javascript\">");
            out.write("window.location.href = \"ingresoEmpleado.jsp\";");
            out.println("alert('Empleado agregado');");
            out.println("</script>");
        } else {
            out.println("<script type=\"text/javascript\">");
            out.write("window.location.href = \"ingresoEmpleado.jsp\";");
            out.println("alert('Empleado no agregado');");
            out.println("</script>");
        }
    }
%>    




<%@ include file="footer.jsp" %>
