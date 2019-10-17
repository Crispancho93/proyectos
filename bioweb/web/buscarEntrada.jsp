<%-- 
    Document   : buscarEntrada
    Created on : 18/09/2019, 03:50:13 PM
    Author     : Crispancho
--%>


<%@include file="head.jsp" %>

<div class="container-fluid">

    <div class="table-responsive">
        <h4 class="row justify-content-center align-items-center mb-4 mt-4 text-dark">ENTRADAS</h4>
        <form action="informeEntrada.jsp" method="post" id="frmEntrada">

            <!--tabla por defecto-->
            <table id="tablaEntrada" class="table table-bordered table-striped table-hover">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">OP</th>
                        <th scope="col">USUARIO</th>
                        <th scope="col">PRODUCTO</th>
                        <th scope="col">QUIÉN_RECIBE</th>
                        <th scope="col">PROVEEDOR</th>
                        <th scope="col">RUTA</th>
                        <th scope="col">CONDUCTOR</th>
                        <th scope="col">PLACA</th>
                        <th scope="col">CONSECUTIVO</th>
                        <th scope="col">FECHA_HORA_MINUTO</th>
                        <th scope="col">CANECA</th>
                        <th scope="col">GALÓN</th>
                        <th scope="col">REMISIONADO</th>
                        <th scope="col">PLANTA</th>
                        <th scope="col">DIFERENCIA</th>
                        <th scope="col">MALO</th>
                        <th scope="col">PERDIDA</th>
                        <th scope="col">NETO</th>
                        <th scope="col">OBSERVACIÓN</th>
                    </tr>
                </thead>
                <tbody id="employee_data">
                    <tr>
                        <!--ID-->
                        <td>


                        </td>

                        <!--calcular-->
                        <td>

                        </td>

                        <!--usuario del sistema-->
                        <td>


                        </td>

                        <!--producto-->
                        <td>


                        </td>

                        <!--responsable-->
                        <td>

                        </td>

                        <!--proveedor-->
                        <td>


                        </td>

                        <!--ruta-->
                        <td>


                        </td>

                        <!--conductor-->
                        <td>


                        </td>

                        <!--numero de la placa-->
                        <td>


                        </td>  

                        <!--consecutivo-->
                        <td>

                        </td>

                        <!--fecha-->
                        <td>

                        </td>

                        <!--caneca-->
                        <td>

                        </td>

                        <!--galon-->
                        <td>

                        </td>

                        <!--kg remisionado-->
                        <td>

                        </td>

                        <!--kg en planta-->
                        <td>

                        </td>

                        <!--diferencia-->
                        <td>

                        </td>

                        <!--producto malo-->
                        <td>

                        </td>

                        <!--perdida peso segundo proceso-->
                        <td>

                        </td>

                        <!--peso neto-->
                        <td>

                        </td>

                        <!--observación-->
                        <td>

                        </td>
                    </tr>

                </tbody>
                <tfoot>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">OP</th>
                        <th scope="col">USUARIO</th>
                        <th scope="col">PRODUCTO</th>
                        <th scope="col">QUIÉN_RECIBE</th>
                        <th scope="col">PROVEEDOR</th>
                        <th scope="col">RUTA</th>
                        <th scope="col">CONDUCTOR</th>
                        <th scope="col">PLACA</th>
                        <th scope="col">CONSECUTIVO</th>
                        <th scope="col">FECHA_HORA_MINUTO</th>
                        <th scope="col">CANECA</th>
                        <th scope="col">GALÓN</th>
                        <th scope="col">REMISIONADO</th>
                        <th scope="col">PLANTA</th>
                        <th scope="col">DIFERENCIA</th>
                        <th scope="col">MALO</th>
                        <th scope="col">PERDIDA</th>
                        <th scope="col">NETO</th>
                        <th scope="col">OBSERVACIÓN</th>
                    </tr>
                </tfoot>
            </table>
        </form>
    </div>
</div>     


<!--script para iniciar data table-->            
<script src="js/ajaxEntrada.js" type="text/javascript"></script>


<%    // validamos si actualizo la entrada correctamente
    if (request.getAttribute("entradaActualizada") != null) {
        if (request.getAttribute("entradaActualizada").equals("1")) {
            out.println("<script type=\"text/javascript\">");
            out.write("window.location.href = \"buscarEntrada.jsp\";");
            out.println("alert('Entrada actualizada');");
            out.println("</script>");
        } else {
            out.println("<script type=\"text/javascript\">");
            out.write("window.location.href = \"buscarEntrada.jsp\";");
            out.println("alert('Entrada no actualizada');");
            out.println("</script>");
        }

    }

    // validamos que se halla eliminado la entrada
    if (request.getAttribute("entradaEliminada") != null) {
        if (request.getAttribute("entradaEliminada").equals("1")) {
            out.println("<script type=\"text/javascript\">");
            out.write("window.location.href = \"buscarEntrada.jsp\";");
            out.println("alert('Entrada eliminada');");
            out.println("</script>");
        } else {
            out.println("<script type=\"text/javascript\">");
            out.write("window.location.href = \"buscarEntrada.jsp\";");
            out.println("alert('Entrada no eliminada');");
            out.println("</script>");
        }
    }
%>
<%@include file="footer.jsp" %>