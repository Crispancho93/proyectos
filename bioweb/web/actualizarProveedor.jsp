<%-- 
    Document   : actualizarProveedor
    Created on : 05-sep-2019, 14:46:01
    Author     : Crispancho
--%>
<%@page import="model.PersonaDAO"%>
<%@page import="entity.Persona"%>
<%@page import="java.util.ArrayList"%>
<%@include file="head.jsp" %>
<div class="container mt-5 mb-5">
    <h4 class="row justify-content-center align-items-center mb-5 text-dark">ACTUALIZAR PROVEEDOR</h4>

    <form action="ActualizarProveedor" method="post">

        <%   // valido el envio id, desde buscarProveedor.jsp
            // para poder listarlo
            if (request.getParameter("btnBuscarPersona") != null) {

                // copio array list que me llega del controller
                //ArrayList<Persona> listaPersona = (ArrayList<Persona>) request.getAttribute("unaPersona"); NO USO
                PersonaDAO miProveedorDao = new PersonaDAO();
                for (Persona proveedor : miProveedorDao.buscarUnaPersona(request.getParameter("btnBuscarPersona").toString())) {

        %>

        <div class="form-row">

            <!--id-->
            <div class="form-group col-md-4">
                <label for="idPersona">* ID</label>
                <input type="text" class="form-control" id="idPersona" name="idPersona" readonly="readonly" value="<%out.println(proveedor.getIdPersona());%>" required>
            </div> 

            <!--nombre-->
            <div class="form-group col-md-4">
                <label for="nombre">* NOMBRE</label>
                <input type="text" class="form-control" id="nombre" name="nombre" value="<%out.println(proveedor.getNombre());%>" required>
            </div>

            <!--tipo de persona-->
            <input type="hidden" name="tipoPersona" value="<%out.println(proveedor.getTipoPersona());%>">

            <!--tipo documento-->
            <div class="form-group col-md-4">
                <label for="tipoDocumento">* TIPO DOCUMENTO</label>
                <select id="tipoDocumento" class="form-control" name="tipoDocumento">
                    <option selected><%out.println(proveedor.getTipoDocumento());%></option>
                    <option>NIT</option>
                    <option>CC</option>
                    <option>NA</option>
                </select>
            </div>

            <!--numero documento-->        
            <div class="form-group col-md-4">
                <label for="numeroDocumento">* NÚMERO DOCUMENTO</label>
                <input type="text" class="form-control" id="numeroDocumento" name="numeroDocumento" value="<%out.println(proveedor.getNumeroDocumento());%>" required>
            </div>

            <!--dirección-->
            <div class="form-group col-md-4">
                <label for="direccion">DIRECCIÓN</label>
                <input type="text" class="form-control" id="direccion" name="direccion" value="<%out.println(proveedor.getDireccion());%>">
            </div>

            <!--teléfono-->
            <div class="form-group col-md-4">
                <label for="telefono">TELÉFONO</label>
                <input type="text" class="form-control" id="telefono" name="telefono" value="<%out.println(proveedor.getTelefono());%>">
            </div>

            <!--correo-->
            <div class="form-group col-md-4">
                <label for="correo">CORREO</label>
                <input type="text" class="form-control" id="correo" name="correo" value="<%out.println(proveedor.getCorreo());%>">
            </div>    

            <!--nombre de un contacto-->
            <div class="form-group col-md-4">
                <label for="nombreContacto">NOMBRE CONTACTO</label>
                <input type="text" class="form-control" id="nombreContacto" name="nombreContacto" value="<%out.println(proveedor.getNombreContacto());%>">
            </div>

            <!--número de un contacto-->
            <div class="form-group col-md-4">
                <label for="numeroContacto">NÚMERO CONTACTO</label>
                <input type="text" class="form-control" id="numeroContacto" name="numeroContacto" value="<%out.println(proveedor.getNumeroContacto());%>">
            </div>

           

            <!--actualizar-->
            <button type="submit" class="btn btn-primary col-md-2" id="btnActualizarPersona" name="btnActualizarPersona" value="btnActualizarPersona">EDITAR <i class="fas fa-user-edit"></i></button>
            <div class="col-md-3"></div>
            <!--volver-->
            <a href="buscarProveedor.jsp" class="btn btn-dark col-md-2">VOLVER <i class="far fa-hand-point-left"></i></a>
            <div class="col-md-3"></div>
            <!--boton oculto-->
            <button type="submit" id="btnEliminarPersona" name="btnEliminarPersona" ></button>
            <!--eliminar-->
            <a class="btn btn-danger text-white col-md-2" id="linkEliminarPersona">BORRAR <i class="fas fa-trash-alt"></i></a>

            <!--oculto btnEliminarPerson y confirmo eliminación -->
            <script type="text/javascript">
                document.getElementById('btnEliminarPersona').style.display = 'none';
                $('#linkEliminarPersona').on('click', function () {
                    if (confirm("Seguro que desea eliminar")) {
                        document.getElementById('btnEliminarPersona').click();
                    }
                });
            </script>
        </div>
    </form>
</div>
<%
        }
    }

%>    

<%@include file="footer.jsp" %>