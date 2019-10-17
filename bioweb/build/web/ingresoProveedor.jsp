<%-- 
    Document   : ingresoProveedor
    Created on : 05-sep-2019, 14:45:38
    Author     : Crispancho
--%>

<%@include file="head.jsp" %>

<div class="container mt-5 mb-5">
    <h4 class="row justify-content-center align-items-center mb-5 text-dark">INGRESO PROVEEDOR</h4>
    <form action="IngresoProveedor" method="post">
        <div class="form-row">

            <div class="form-group col-md-4">
                <label for="nombre">* NOMBRE</label>
                <input type="text" class="form-control" id="nombre" name="nombre" required>
            </div>

            <!--tipo persona-->
            <input type="hidden" class="form-control" id="tipoPersona" name="tipoPersona" value="proveedor"> 

            <div class="form-group col-md-4">
                <label for="tipoDocumento">* TIPO DOCUMENTO</label>
                <select id="tipoDocumento" class="form-control" name="tipoDocumento">
                    <option selected>NIT</option>
                    <option>CC</option>
                    <option>NA</option>
                </select>
            </div>

            <div class="form-group col-md-4">
                <label for="numeroDocumento">* N�MERO DOCUMENTO</label>
                <input type="text" class="form-control" id="numeroDocumento" name="numeroDocumento" required>
            </div>

            <div class="form-group col-md-4">
                <label for="direccion">DIRECCI�N</label>
                <input type="text" class="form-control" id="direccion" name="direccion">
            </div>

            <div class="form-group col-md-4">
                <label for="telefono">TEL�FONO</label>
                <input type="text" class="form-control" id="telefono" name="telefono">
            </div>

            <div class="form-group col-md-4">
                <label for="correo">CORREO</label>
                <input type="text" class="form-control" id="correo" name="correo">
            </div>   
            
            <!--nombre de un contacto-->
            <div class="form-group col-md-4">
                <label for="nombreContacto">NOMBRE CONTACTO</label>
                <input type="text" class="form-control" id="nombreContacto" name="nombreContacto">
            </div>

            <!--n�mero de un contacto-->
            <div class="form-group col-md-4">
                <label for="numeroContacto">N�MERO CONTACTO</label>
                <input type="text" class="form-control" id="numeroContacto" name="numeroContacto">
            </div>
            
            <!--separador-->
            <div class="form-group col-md-4"></div>
            
            <!--agregar-->
            <button type="submit" class="btn btn-primary col-md-2" id="btnAgregarPersona" name="btnAgregarPersona">AGREGAR <i class="fas fa-user-plus"></i></button>
            <div class="col-md-3"></div>
            <!--volver-->
            <a href="buscarProveedor.jsp" class="btn btn-dark col-md-2">VOLVER <i class="far fa-hand-point-left"></i></a>
            <div class="col-md-3"></div>
            <!--limpiar-->
            <button type="reset" class="btn btn-danger col-md-2">LIMPIAR <i class="fas fa-broom"></i></button>
        </div>

    </form>
</div>

<%    // valido que halla ingresado el proveedor
    if (request.getAttribute("personaAgregada") != null) {

        if (request.getAttribute("personaAgregada").equals("1")) {
            out.write("<script type='text/javascript'>\n");
            out.write("window.location.href = \"ingresoProveedor.jsp\";");
            out.write("alert('Proveedor ingresado')");
            out.write("</script>\n");
        } else {
            out.write("<script type='text/javascript'>\n");
            out.write("window.location.href = \"ingresoProveedor.jsp\";");
            out.write("alert('Proveedor no ingresado')");
            out.write("</script>\n");
        }
    }
%>

<%@include file="footer.jsp" %>