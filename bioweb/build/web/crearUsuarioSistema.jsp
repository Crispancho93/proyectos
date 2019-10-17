<%-- 
    Document   : crearUsuarioSistema
    Created on : 05-sep-2019, 8:21:34
    Author     : Crispancho
--%>

<%@include file="head.jsp" %>


<div class="container mt-5 mb-5">
    <h4 class="row justify-content-center align-items-center mb-5 text-dark">INGRESO USUARIO SISTEMA</h4>
    <form action="IngresoUsuario" method="post">
        <div class="form-row">

            <div class="form-group col-md-4">
                <label for="nombre">* NOMBRE</label>
                <input type="text" class="form-control" id="nombre" name="nombre" required>
            </div>

            <div class="form-group col-md-4">
                <label for="tipoUsuario">* TIPO USUARIO</label>
                <select id="tipoUsuario" class="form-control" name="tipoUsuario" required>
                    <option selected>admin</option>
                    <option>user</option>
                </select>
            </div>    

            <div class="form-group col-md-4">
                <label for="tipoDocumento">* TIPO DOCUMENTO</label>
                <select id="tipoDocumento" class="form-control" name="tipoDocumento" required>
                    <option selected>CC</option>
                    <option >NA</option>
                </select>
            </div>

            <div class="form-group col-md-4">
                <label for="numeroDocumento">* NÚMERO DOCUMENTO</label>
                <input type="text" class="form-control" id="numeroDocumento" name="numeroDocumento" required>
            </div>

            <div class="form-group col-md-4">
                <label for="direccion">DIRECCIÓN</label>
                <input type="text" class="form-control" id="direccion" name="direccion">
            </div>

            <div class="form-group col-md-4">
                <label for="telefono">TELÉFONO</label>
                <input type="text" class="form-control" id="telefono" name="telefono">
            </div>

            <div class="form-group col-md-4">
                <label for="correo">CORREO</label>
                <input type="text" class="form-control" id="correo" name="correo">
            </div>    

            <div class="form-group col-md-4">
                <label for="loguin">* LOGUIN</label>
                <input type="text" class="form-control" id="loguin" name="loguin" required>
            </div> 

            <div class="form-group col-md-4">
                <label for="clave">* CLAVE</label>
                <input type="text" class="form-control" id="clave" name="clave" required>
            </div>
            
            <!--agregar-->
            <button type="submit" class="btn btn-primary col-md-2" id="btnAgregarUsuario" name="btnAgregarUsuario">AGREGAR  <i class="fas fa-user-plus"></i></button>
            <div class="col-md-3"></div>
            <!--volver-->
            <a href="buscarUsuarioSistema.jsp" class="btn btn-dark col-md-2">VOLVER <i class="far fa-hand-point-left"></i></a>
            <div class="col-md-3"></div>
            <!--limpiar-->
            <button type="reset" class="btn btn-danger col-md-2">LIMPIAR <i class="fas fa-broom"></i></button>
        </div>

    </form>
</div>

<%    // valido el usuario creado
    if (request.getAttribute("usuarioCreado") != null) {

        if (request.getAttribute("usuarioCreado").equals("1")) {
            out.write("<script type='text/javascript'>\n");
            out.write("window.location.href = \"crearUsuarioSistema.jsp\";");
            out.write("alert('Usuario agregado')");
            out.write("</script>\n");

        } else {
            out.write("<script type='text/javascript'>\n");
            out.write("window.location.href = \"crearUsuarioSistema.jsp\";");
            out.write("alert('Usuario no agregado')");
            out.write("</script>\n");
        }
    }
%>



<%@include file="footer.jsp" %>