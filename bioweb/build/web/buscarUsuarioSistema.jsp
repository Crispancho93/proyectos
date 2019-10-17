<%-- 
    Document   : buscarUsuarioSistema
    Created on : 04-sep-2019, 9:29:57
    Author     : Crispancho
--%>

<%@page import="model.UsuarioDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Usuario"%>
<%@include file="head.jsp" %>

<div class="container-fluid">
    <div class="table-responsive">
        <h4 class="row justify-content-center align-items-center  mb-4 mt-4 text-dark">USUARIOS SISTEMA</h4>
        <form action="UsuarioBO" id="frmUsuarioSistema" method="post">

            <table class="table table-bordered table-striped table-hover">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">NOMBRE_USUARIO</th>
                        <th scope="col">TIPO USUARIO</th>
                        <th scope="col">TIPO DOCUMENTO</th>
                        <th scope="col">NÚMERO DODUMENTO</th>
                        <th scope="col">DIRECCIÓN</th>
                        <th scope="col">TÉLEFONO</th>
                        <th scope="col">CORREO</th>
                        <th scope="col">LOGUIN</th>
                        <th scope="col">CLAVE</th>
                    </tr>
                </thead>
                <tbody>

                    <%        // creo un miDAO de la clase UsuarioDAO 
                        UsuarioDAO miDAO = new UsuarioDAO();

                        for (Usuario usuario : miDAO.buscarUsuarios()) {

                    %>

                    <tr>
                        <!--ID-->
                        <td>
                            <a href="actualizarUsuario.jsp?btnActualizarUsuario=<%out.println(usuario.getIdUsuario());%>" class="btn btn-warning btn-sm mr-1" id="btnActualizarUsuario">EDITAR <i class="fas fa-pencil-alt"></i></a><%out.println(usuario.getIdUsuario());%>
                        </td>

                        <!--Nombre-->
                        <td>
                            <%out.println(usuario.getNombre());%>
                        </td>

                        <!--Tipo de usuario-->
                        <td>
                            <%out.println(usuario.getTipoUsuario());%>
                        </td>

                        <!--Tipo documento-->
                        <td>
                            <%out.println(usuario.getTipoDocumento());%>
                        </td>

                        <!--Numero documento--->
                        <td>
                            <%out.println(usuario.getNumeroDocumento());%>
                        </td>

                        <!--Dirección-->
                        <td>
                            <%out.println(usuario.getDireccion());%>
                        </td>

                        <!--Teléfono-->
                        <td>
                            <%out.println(usuario.getTelefono());%>
                        </td>

                        <!--Correo--->
                        <td>
                            <%out.println(usuario.getCorreo());%>
                        </td>

                        <!--Loguin-->
                        <td>
                            <%out.println(usuario.getLoguin());%>
                        </td>

                        <!--Clave--->
                        <td>
                            <%out.println(usuario.getClave());%>
                        </td> 
                    </tr>
                    <%
                        }
                    %>
                </tbody>
                <tfoot>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">NOMBRE_USUARIO</th>
                        <th scope="col">TIPO USUARIO</th>
                        <th scope="col">TIPO DOCUMENTO</th>
                        <th scope="col">NÚMERO DODUMENTO</th>
                        <th scope="col">DIRECCIÓN</th>
                        <th scope="col">TÉLEFONO</th>
                        <th scope="col">CORREO</th>
                        <th scope="col">LOGUIN</th>
                        <th scope="col">CLAVE</th>
                    </tr>
                </tfoot>
            </table>

        </form>
    </div>
</div>   
<%
    // valido si el usuario fue eliminado correctamente
    if (request.getAttribute("usuarioEliminado") != null) {
        if (request.getAttribute("usuarioEliminado").equals("1")) {
            out.write("<script type='text/javascript'>\n");
            out.write("window.location.href = \"buscarUsuarioSistema.jsp\";");
            out.write("alert('Usuario eliminado')");
            out.write("</script>\n");
        } else {
            out.write("<script type='text/javascript'>\n");
            out.write("window.location.href = \"buscarUsuarioSistema.jsp\";");
            out.write("alert('No se pudo eliminar el usuario')");
            out.write("</script>\n");
        }

    }

    // valido actualización de usuario
    if (request.getAttribute("usuarioActualizado") != null) {
        if (request.getAttribute("usuarioActualizado").equals("1")) {
            out.write("<script type='text/javascript'>\n");
            out.write("window.location.href = \"buscarUsuarioSistema.jsp\";");
            out.write("alert('Usuario actualizado')");
            out.write("</script>\n");
        } else {
            out.write("<script type='text/javascript'>\n");
            out.write("window.location.href = \"buscarUsuarioSistema.jsp\";");
            out.write("alert('Usuario no actualizado')");
            out.write("</script>\n");
        }

    }
%>   
<%@include file="footer.jsp" %>