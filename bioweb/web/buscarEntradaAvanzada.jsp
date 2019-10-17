<%-- 
    Document   : buscarEntradaAvanzado
    Created on : 3/10/2019, 03:38:23 PM
    Author     : Crispancho
--%>

<%@include file="head.jsp" %>

<div class="container-fluid">

    <div class="table-responsive">
        <h4 class="row justify-content-center align-items-center mb-5 mt-4 text-dark">ENTRADAS BÚSQUEDA AVANZADA</h4>
        <form action="informeEntrada.jsp" method="post" id="frmEntrada">

            <div class="row">

                <div class="col-md-3"></div>

                <!--fecha inicial-->
                <label for="fechaInicial" class="mr-1">Inicio</label>
                <input id="fechaInicial" name="fechaInicial" type="date" class="form-control col-md-2 mr-2">



                <!--fecha final-->
                <label for="fechaFinal" class="mr-1">Fin</label>
                <input id="fechaFinal" name="fechaFinal" type="date" class="form-control col-md-2">

                <!--boton-->
                <button  type="submit" class="btn btn-primary col-md-1 ml-2" onclick="buscarEntradaPorFecha(event);"><i class="fas fa-search"></i></button>
                
            </div>

            <!--tabla busqueda avanzada-->
            <table id="tablaEntradaAvanzada" class="table table-bordered table-striped table-hover mt-4">
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

<script src="js/ajaxEntradaAvanzada.js" type="text/javascript"></script>
<%@include file="footer.jsp" %>