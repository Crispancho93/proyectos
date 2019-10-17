<%-- 
    Document   : buscarProveedor
    Created on : 05-sep-2019, 14:46:19
    Author     : Crispancho
--%>

<%@page import="entity.Persona"%>
<%@page import="model.PersonaDAO"%>
<%@include file="head.jsp" %>

<div class="container-fluid">
    <div class="table-responsive">
        <h4 class="row justify-content-center align-items-center mb-4 mt-4 text-dark">PROVEEDORES</h4>
        <form action="PersonaBO" method="post">
            <table class="table table-bordered table-striped table-hover">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">NOMBRE_PROVEEDOR</th>
                        <th scope="col">TIPO DOCUMENTO</th>
                        <th scope="col">NÚMERO DOCUMENTO</th>
                        <th scope="col">DIRECCIÓN</th>
                        <th scope="col">TELÉFONO</th>
                        <th scope="col">CORREO</th>
                        <th scope="col">NOMBRE_CONTACTO</th>
                        <th scope="col">NÚMERO_CONTACTO</th>
                    </tr>
                </thead>
                <tbody>
                    <%  PersonaDAO miDAO = new PersonaDAO();

                        // creo objeto de tipo persona y le paso los datos del arreglo
                        for (Persona proveedor : miDAO.buscarPersona("proveedor")) {

                    %>    
                    <tr>
                        <td>
                            <a href="actualizarProveedor.jsp?btnBuscarPersona=<%out.println(proveedor.getIdPersona());%>" class="btn btn-warning btn-sm mr-1">EDITAR <i class="fas fa-pencil-alt"></i></a><%out.println(proveedor.getIdPersona());%>

                        </td>
                        <td>
                            <%out.println(proveedor.getNombre());%>

                        </td>
                        <td>
                            <%out.println(proveedor.getTipoDocumento());%>

                        </td>



                        <td>
                            <%out.println(proveedor.getNumeroDocumento());%>

                        </td>
                        <td>
                            <%out.println(proveedor.getDireccion());%>

                        </td>
                        <td>
                            <%out.println(proveedor.getTelefono());%>

                        </td>
                        <td>
                            <%out.println(proveedor.getCorreo());%>

                        </td>  

                        <td>
                            <%out.println(proveedor.getNombreContacto());%>
                        </td>
                        <td>
                            <%out.println(proveedor.getNumeroContacto());%>
                        </td>
                    </tr>
                    <%

                        }

                    %> 
                </tbody>

                <tfoot>
                <th scope="col">ID</th>
                <th scope="col">NOMBRE_PROVEEDOR</th>
                <th scope="col">TIPO DOCUMENTO</th>
                <th scope="col">NÚMERO DOCUMENTO</th>
                <th scope="col">DIRECCIÓN</th>
                <th scope="col">TELÉFONO</th>
                <th scope="col">CORREO</th>
                <th scope="col">NOMBRE_CONTACTO</th>
                <th scope="col">NÚMERO_CONTACTO</th>
                </tfoot>
            </table>

        </form>
        <%    // valido que que se halla actualizado el proveedor
            if (request.getAttribute("personaActualizada") != null) {

                if (request.getAttribute("personaActualizada").equals("1")) {
                    out.println("<script type=\"text/javascript\">");
                    out.write("window.location.href = \"buscarProveedor.jsp\";");
                    out.println("alert('Proveedor actualizado');");
                    out.println("</script>");
                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.write("window.location.href = \"buscarProveedor.jsp\";");
                    out.println("alert('Proveedor no actualizado');");
                    out.println("</script>");
                }

            }

            // valido que empleadoEliminado seea diferente de null
            if (request.getAttribute("personaEliminada") != null) {

                // valido que se halla eliminado el empleado
                if (request.getAttribute("personaEliminada").equals("1")) {
                    out.println("<script type=\"text/javascript\">");
                    out.write("window.location.href = \"buscarProveedor.jsp\";");
                    out.println("alert('Proveedor eliminado');");
                    out.println("</script>");
                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.write("window.location.href = \"buscarProveedor.jsp\";");
                    out.println("alert('Proveedor no eliminado');");
                    out.println("</script>");
                }
            }
        %>

    </div>
</div>
<%@ include file="footer.jsp" %>
