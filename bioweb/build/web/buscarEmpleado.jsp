<%-- 
    Document   : listarPersona
    Created on : 29-ago-2019, 14:29:15
    Author     : Crispancho
--%>

<%@page import="model.PersonaDAO"%>
<%@page import="java.util.List"%>
<%@page import="entity.Persona"%>
<%@page import="java.util.ArrayList"%>
<%@include file="head.jsp" %>

<div class="container-fluid">
    <div class="table-responsive">
        <h4 class="row justify-content-center align-items-center mb-4 mt-4 text-dark">LISTA EMPLEADOS</h4>
        <form action="PersonaBO" method="post">
            <table class="table table-bordered table-striped table-hover">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">NOMBRE_EMPLEADO</th>
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
                    <%   PersonaDAO miDAO = new PersonaDAO();

                        // creo objeto de tipo persona y le paso los datos del arreglo
                        for (Persona empleado : miDAO.buscarPersona("empleado")) {

                    %>    
                    <tr>
                        <td>
                            <a href="actualizarEmpleado.jsp?btnBuscarPersona=<%out.println(empleado.getIdPersona());%>" class="btn btn-warning btn-sm mr-1">EDITAR <i class="fas fa-pencil-alt"></i></a><%out.println(empleado.getIdPersona());%>

                        </td>
                        <td>
                            <%out.println(empleado.getNombre());%>

                        </td>
                        <td>
                            <%out.println(empleado.getTipoDocumento());%>

                        </td>


                        <td>
                            <%out.println(empleado.getNumeroDocumento());%>

                        </td>
                        <td>
                            <%out.println(empleado.getDireccion());%>

                        </td>
                        <td>
                            <%out.println(empleado.getTelefono());%>

                        </td>
                        <td>
                            <%out.println(empleado.getCorreo());%>

                        </td>
                        <td>
                            <%out.println(empleado.getNombreContacto());%>
                        </td>
                        <td>
                            <%out.println(empleado.getNumeroContacto());%>
                        </td>
                    </tr>
                    <%

                        }

                    %> 
                </tbody>
                <tfoot>
                    <th scope="col">ID</th>
                        <th scope="col">NOMBRE_EMPLEADO</th>
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
        <%    // valido que que se halla actualizado un empleado
            if (request.getAttribute("personaActualizada") != null) {

                if (request.getAttribute("personaActualizada").equals("1")) {
                    out.println("<script type=\"text/javascript\">");
                    out.write("window.location.href = \"buscarEmpleado.jsp\";");
                    out.println("alert('Empleado actualizado');");
                    out.println("</script>");
                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.write("window.location.href = \"buscarEmpleado.jsp\";");
                    out.println("alert('Empleado no actualizado');");
                    out.println("</script>");
                }

            }

            // valido que empleadoEliminado seea diferente de null
            if (request.getAttribute("personaEliminada") != null) {

                // valido que se halla eliminado el empleado
                if (request.getAttribute("personaEliminada").equals("1")) {
                    out.println("<script type=\"text/javascript\">");
                    out.write("window.location.href = \"buscarEmpleado.jsp\";");
                    out.println("alert('Empleado eliminado');");
                    out.println("</script>");
                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.write("window.location.href = \"buscarEmpleado.jsp\";");
                    out.println("alert('Empleado no eliminado');");
                    out.println("</script>");
                }
            }
        %>

    </div>
</div>

<%@ include file="footer.jsp" %>
