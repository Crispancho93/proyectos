<%-- 
    Document   : buscarSalidaAvanzada
    Created on : 4/10/2019, 08:07:53 AM
    Author     : Crispancho
--%>

<%@include file="head.jsp" %>

<div class="container-fluid">
    <div class="table-responsive">
        <h4 class="titulo row justify-content-center align-items-center mb-4 mt-4 text-dark">SALIDAS BÚSQUEDA AVANZADA</h4>
        <form action="informeSalida.jsp" method="post">
            <div class="row">

                <div class="col-md-3"></div>

                <!--fecha inicial-->
                <label for="fechaInicial" class="mr-1">Inicio</label>
                <input id="fechaInicial" name="fechaInicial" type="date" class="form-control col-md-2 mr-2">



                <!--fecha final-->
                <label for="fechaFinal" class="mr-1">Fin</label>
                <input id="fechaFinal" name="fechaFinal" type="date" class="form-control col-md-2">

                <!--boton-->
                <button  type="submit" class="btn btn-primary col-md-1 ml-2" onclick="buscarSalidaPorFecha(event);"><i class="fas fa-search"></i></button>

            </div>
            
            <table id="tablaSalidaAvanzada" class="table table-bordered table-striped table-hover mt-4">
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

<script src="js/ajaxSalidaAvanzada.js" type="text/javascript"></script>
<%@include file="footer.jsp" %>