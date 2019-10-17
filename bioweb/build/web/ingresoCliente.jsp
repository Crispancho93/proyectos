<%-- 
    Document   : ingresoCliente
    Created on : 05-sep-2019, 11:05:06
    Author     : Crispancho
--%>

<%@include file="head.jsp" %>

<div class="container mt-5 mb-5">
    <h4 class="row justify-content-center align-items-center mb-5 text-dark">INGRESO CLIENTE</h4>
    <form action="IngresoCliente" method="post">
        <div class="form-row">


            <!--tipo persona-->
            <input type="hidden" class="form-control" id="tipoPersona" name="tipoPersona" value="cliente"> 

            <!--cliente no requiere tipo documento-->
            <input type="hidden" class="form-control" id="tipoDocumento" name="tipoDocumento" value="">

            <!--cliente no requiere numero de documento-->
            <input type="hidden" class="form-control" id="numeroDocumento" name="numeroDocumento" value="">


            <!--cliente no requiere dirección-->
            <input type="hidden" class="form-control" id="direccion" name="direccion" value="">

            <!--nombre cliente-->
            <div class="form-group col-md-4">
                <label for="nombre">* NOMBRE</label>
                <input type="text" class="form-control" id="nombre" name="nombre" required>
            </div>

            <!--teléfono-->
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

            <!--número de un contacto-->
            <div class="form-group col-md-4">
                <label for="numeroContacto">NÚMERO CONTACTO</label>
                <input type="text" class="form-control" id="numeroContacto" name="numeroContacto">
            </div>

            <!--separador-->
            <div class="form-group col-md-4"></div>

            <!--agregar cliente-->
            <button type="submit" class="btn btn-primary col-md-2" id="btnAgregarPersona" name="btnAgregarPersona">AGREGAR <i class="fas fa-user-plus"></i></button>
            <div class="col-md-3"></div>
            <!--volver-->
            <a href="buscarCliente.jsp" class="btn btn-dark col-md-2">VOLVER <i class="far fa-hand-point-left"></i></a>
            <div class="col-md-3"></div>
            <!--limpiar-->
            <button type="reset" class="btn btn-danger col-md-2 " id="btnAgregarPersona" name="btnAgregarPersona">LIMPIAR <i class="fas fa-broom"></i></button>
        </div>

    </form>
</div>

<%    // valido que halla ingresado el cliente
    if (request.getAttribute("personaAgregada") != null) {

        if (request.getAttribute("personaAgregada").equals("1")) {
            out.write("<script type='text/javascript'>\n");
            out.write("window.location.href = \"ingresoCliente.jsp\";");
            out.write("alert('Cliente ingresado')");
            out.write("</script>\n");
        } else {
            out.write("<script type='text/javascript'>\n");
            out.write("window.location.href = \"ingresoCliente.jsp\";");
            out.write("alert('Cliente no ingresado')");
            out.write("</script>\n");
        }
    }
%>
<%@include file="footer.jsp" %>