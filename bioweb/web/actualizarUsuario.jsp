<%-- 
    Document   : actualizarUsuario
    Created on : 05-sep-2019, 9:11:18
    Author     : Crispancho
--%>

<%@page import="model.UsuarioDAO"%>
<%@page import="entity.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@include file="head.jsp" %>

<div class="container mt-5 mb-5">
    <h4 class="row justify-content-center align-items-center mb-5 text-dark">ACTUALIZAR USUARIO</h4>

    <form id="frmUsuario" action="ActualizarUsuario" method="post">

        <%            // valido el envio del id de buscarUsuarioSistema.jsp
            // para poder listarlo
            if (request.getParameter("btnActualizarUsuario") != null) {

                // copio array list que me llega del controller NO USO
                //ArrayList<Usuario> listaUsuario = (ArrayList<Usuario>) request.getAttribute("usuarioSeleccionado");
                UsuarioDAO miUsuarioDao = new UsuarioDAO();
                for (Usuario usuario : miUsuarioDao.buscarUnUsuario(request.getParameter("btnActualizarUsuario").toString())) {

        %>

        <div class="form-row">

            <div class="form-group col-md-4">
                <label for="idUsuario">* ID</label>
                <input type="text" class="form-control" id="idUsuario" name="idUsuario" readonly="readonly" value="<%out.println(usuario.getIdUsuario());%>" required>
            </div> 
            <div class="form-group col-md-4">
                <label for="nombre">* NOMBRE</label>
                <input type="text" class="form-control" id="nombre" name="nombre" value="<%out.println(usuario.getNombre());%>" required>
            </div>

            <!--tipo de usuario-->
            <div class="form-group col-md-4">
                <label for="tipoUsuario">* TIPO USUARIO</label>
                <select id="tipoUsuario" class="form-control" name="tipoUsuario" required>
                    <option selected><%out.println(usuario.getTipoUsuario());%></option>
                    <option>admin</option>
                    <option>user</option>
                </select>
            </div>


            <div class="form-group col-md-4">
                <label for="tipoDocumento">* TIPO DOCUMENTO</label>
                <select id="tipoDocumento" class="form-control" name="tipoDocumento" required>
                    <option selected><%out.println(usuario.getTipoDocumento());%></option>
                    <option>NA</option>
                </select>
            </div>

            <div class="form-group col-md-4">
                <label for="numeroDocumento">* NÚMERO DOCUMENTO</label>
                <input type="text" class="form-control" id="numeroDocumento" name="numeroDocumento" value="<%out.println(usuario.getNumeroDocumento());%>" required>
            </div>

            <div class="form-group col-md-4">
                <label for="direccion">DIRECCIÓN</label>
                <input type="text" class="form-control" id="direccion" name="direccion" value="<%out.println(usuario.getDireccion());%>">
            </div>

            <div class="form-group col-md-4">
                <label for="telefono">TELÉFONO</label>
                <input type="text" class="form-control" id="telefono" name="telefono" value="<%out.println(usuario.getTelefono());%>">
            </div>

            <div class="form-group col-md-4">
                <label for="loguin">* LOGUIN</label>
                <input type="text" class="form-control" id="loguin" name="loguin" value="<%out.println(usuario.getLoguin());%>" required>
            </div> 

            <div class="form-group col-md-4">
                <label for="clave">* CLAVE</label>
                <input type="text" class="form-control" id="clave" name="clave" value="<%out.println(usuario.getClave());%>" required>
            </div> 

            <div class="form-group col-md-12">
                <label for="correo">CORREO</label>
                <input type="text" class="form-control" id="correo" name="correo" value="<%out.println(usuario.getCorreo());%>">
            </div>   


            <!--actualizar usuario-->
            <button type="submit" class="btn btn-primary col-md-2" id="botonActualizarUsuario" name="actualizarUsuario" value="actualizarUsuario">EDITAR <i class="fas fa-user-edit"></i></button>
            <div class="col-md-3"></div>
            <!--volver-->
            <a href="buscarUsuarioSistema.jsp" class="btn btn-dark col-md-2 ">VOLVER <i class="far fa-hand-point-left"></i></a>
            <div class="col-md-3"></div>
            <!--boton oculto-->
            <button type="submit" id="btnEliminarUsuario" name="btnEliminarUsuario"></button>
            <!--eliminar-->
            <a  class="btn btn-danger text-white col-md-2" id="linkEliminarUsuario">BORRAR <i class="fas fa-trash-alt"></i></a>

            <!--confirmar para eliminar-->
            <script type="text/javascript">
                // oculto el boton eliminar  
                document.getElementById('btnEliminarUsuario').style.display = 'none';
                // capturo el evento click del link del enlace
                $('#linkEliminarUsuario').on('click', function () {
                    if (confirm("Seguro que desea eliminar")) {
                        // doy click sobre el boton eliminar
                        document.getElementById("btnEliminarUsuario").click();
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