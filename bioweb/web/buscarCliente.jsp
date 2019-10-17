<%-- 
    Document   : buscarCliente
    Created on : 05-sep-2019, 11:06:01
    Author     : Crispancho
--%>
<%@page import="entity.Persona"%>
<%@page import="model.PersonaDAO"%>
<%@include file="head.jsp" %>

<div class="container-fluid">
    <div class="table-responsive">
        <h4 class="row justify-content-center align-items-center mb-4 mt-4 text-dark">LISTA CLIENTES</h4>
        <form action="PersonaBO" method="post">
            <table class="table table-bordered table-striped table-hover">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">NOMBRE_CLIENTE</th>
                        <th scope="col">TELÉFONO</th>
                        <th scope="col">CORREO</th>
                        <th scope="col">NOMBRE_CONTACTO</th>
                        <th scope="col">NÚMERO_CONTACTO</th>
                    </tr>
                </thead>
                <tbody>
                    <%  PersonaDAO miDAO = new PersonaDAO();

                        // creo objeto de tipo persona y le paso los datos del arreglo
                        for (Persona cliente : miDAO.buscarPersona("cliente")) {

                    %>    
                    <tr>
                        <td>
                            <a href="actualizarCliente.jsp?btnBuscarPersona=<%out.println(cliente.getIdPersona());%>" class="btn btn-warning btn-sm mr-1">EDITAR <i class="fas fa-pencil-alt"></i></a><%out.println(cliente.getIdPersona());%>

                        </td>
                        <td>
                            <%out.println(cliente.getNombre());%>

                        </td>

                        <td>
                            <%out.println(cliente.getTelefono());%>

                        </td>
                        <td>
                            <%out.println(cliente.getCorreo());%>

                        </td>  
                        
                        <td>
                            <%out.println(cliente.getNombreContacto());%>
                        </td>
                        <td>
                            <%out.println(cliente.getNumeroContacto());%>
                        </td>
                    </tr>
                    <%

                        }

                    %> 
                </tbody>
                <tfoot>
                    <th scope="col">ID</th>
                        <th scope="col">NOMBRE_CLIENTE</th>
                        <th scope="col">TELÉFONO</th>
                        <th scope="col">CORREO</th>
                        <th scope="col">NOMBRE_CONTACTO</th>
                        <th scope="col">NÚMERO_CONTACTO</th>
                </tfoot>
            </table>

        </form>
        <%    // valido si actualizo el cliente
            if (request.getAttribute("personaActualizada") != null) {
                if (request.getAttribute("personaActualizada").equals("1")) {
                    out.write("<script type='text/javascript'>\n");
                    out.write("window.location.href = \"buscarCliente.jsp\";");
                    out.write("alert('Cliente actualizado')");
                    out.write("</script>\n");
                } else {
                    out.write("<script type='text/javascript'>\n");
                    out.write("window.location.href = \"buscarCliente.jsp\";");
                    out.write("alert('Cliente no actualizado')");
                    out.write("</script>\n");
                }

            }

            // valido si elimino el cliente
            if (request.getAttribute("personaEliminada") != null) {
                if (request.getAttribute("personaEliminada").equals("1")) {
                    out.write("<script type='text/javascript'>\n");
                    out.write("window.location.href = \"buscarCliente.jsp\";");
                    out.write("alert('Cliente eliminado')");
                    out.write("</script>\n");
                } else {
                    out.write("<script type='text/javascript'>\n");
                    out.write("window.location.href = \"buscarCliente.jsp\";");
                    out.write("alert('Cliente no eliminado')");
                    out.write("</script>\n");
                }

            }
        %>

    </div>
</div>

<%@include file="footer.jsp" %>