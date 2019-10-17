<%-- 
    Document   : buscarSalida
    Created on : 27/09/2019, 09:18:59 PM
    Author     : Crispancho
--%>

<%@include file="head.jsp" %>

<div class="container-fluid">
    <div class="table-responsive">
        <h4 class="titulo row justify-content-center align-items-center mb-4 mt-4 text-dark">SALIDAS</h4>
        <form action="informeSalida.jsp" method="post">
            <table id="tablaSalida" class="table table-bordered table-striped table-hover">
                <thead>
                    <tr>
                        <th scope="col">ID_SALIDA</th>
                        <th scope="col">OP</th>
                        <th scope="col">USUARIO</th>
                        <th scope="col">PRODUCTO</th>
                        <th scope="col">QUIÉN_ESTREGA</th>
                        <th scope="col">CLIENTE</th>
                        <th scope="col">CONDUCTOR</th>
                        <th scope="col">PLACA</th>
                        <th scope="col">CONSECUTIVO</th>
                        <th scope="col">FECHA_HORA_MINUTO</th>
                        <th scope="col">CANECA</th>
                        <th scope="col">GALÓN</th>
                        <th scope="col">PESO_BRUTO</th>
                        <th scope="col">TARA</th>
                        <th scope="col">NETO</th>
                        <th scope="col">BRIX</th>
                        <th scope="col">BULTOS</th>
                        <th scope="col">OBSERVACIÓN</th>
                    </tr>
                </thead>
                <tbody id="employee_data">
                    <tr>
                        
                        <td>


                        </td>
                        
                        <td>
                            
                        </td>
                        
                        <td>


                        </td>

                        
                        <td>


                        </td>

                       
                        <td>

                        </td>

                        
                        <td>


                        </td>

                        
                        <td>


                        </td>

                        
                        <td>


                        </td>

                        
                        <td>


                        </td>  

                        
                        <td>

                        </td>

                        
                        <td>

                        </td>

                        
                        <td>

                        </td>

                        
                        <td>

                        </td>

                        
                        <td>

                        </td>

                       
                        <td>

                        </td>

                        
                        <td>

                        </td>

                        
                        <td>

                        </td>

                      
                        <td>

                        </td>

                    </tr>

                </tbody>
                <tfoot>
                    <tr>
                        <th scope="col">ID_SALIDA</th>
                        <th scope="col">OP</th>
                        <th scope="col">USUARIO</th>
                        <th scope="col">PRODUCTO</th>
                        <th scope="col">QUIÉN_ESTREGA</th>
                        <th scope="col">CLIENTE</th>
                        <th scope="col">CONDUCTOR</th>
                        <th scope="col">PLACA</th>
                        <th scope="col">CONSECUTIVO</th>
                        <th scope="col">FECHA_HORA</th>
                        <th scope="col">CANECA</th>
                        <th scope="col">GALÓN</th>
                        <th scope="col">PESO_BRUTO</th>
                        <th scope="col">TARA</th>
                        <th scope="col">NETO</th>
                        <th scope="col">BRIX</th>
                        <th scope="col">BULTOS</th>
                        <th scope="col">OBSERVACIÓN</th>
                    </tr>
                </tfoot>
            </table>

        </form>
    </div>
</div>     

<!--scrip para iniciar data table-->            
<script src="js/ajaxSalida.js" type="text/javascript"></script>


<%    // validamos si actualizo la entrada correctamente
    if (request.getAttribute("salidaActualizada") != null) {
        if (request.getAttribute("salidaActualizada").equals("1")) {
            out.println("<script type=\"text/javascript\">");
            out.write("window.location.href = \"buscarSalida.jsp\";");
            out.println("alert('Salida actualizada');");
            out.println("</script>");
        } else {
            out.println("<script type=\"text/javascript\">");
            out.write("window.location.href = \"buscarSalida.jsp\";");
            out.println("alert('Salida no actualizada');");
            out.println("</script>");
        }

    }

    // validamos que se halla eliminado la salida
    if (request.getAttribute("salidaEliminada") != null) {
        if (request.getAttribute("salidaEliminada").equals("1")) {
            out.println("<script type=\"text/javascript\">");
            out.write("window.location.href = \"buscarSalida.jsp\";");
            out.println("alert('Salida eliminada');");
            out.println("</script>");
        } else {
            out.println("<script type=\"text/javascript\">");
            out.write("window.location.href = \"buscarSalida.jsp\";");
            out.println("alert('Salida no eliminada');");
            out.println("</script>");
        }
    }
%>

<%@include file="footer.jsp" %>