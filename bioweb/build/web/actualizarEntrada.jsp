<%-- 
    Document   : actualizarEntrada
    Created on : 18/09/2019, 03:51:11 PM
    Author     : Crispancho
--%>

<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="entity.Persona"%>
<%@page import="model.PersonaDAO"%>
<%@page import="entity.Producto"%>
<%@page import="model.ProductoDAO"%>
<%@page import="model.EntradaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Usuario"%>
<%@page import="model.UsuarioDAO"%>
<%@page import="entity.Entrada"%>
<%@include file="head.jsp" %>

<div class="container mt-5 mb-5">
    <h4 class="row justify-content-center align-items-center mb-5 text-dark">ACTUALIZAR ENTRADA</h4>
    <!--Logo-->
    <div class="navbar-brand">
        <img src="imagenes/biologo.png" class="mb-3" style="width:250px;">
    </div>
    <form id="frmUsuario" action="ActualizarEntrada" method="post">

        <div class="row">

            <%  // valido que se halla enviado el id, desde buscarEntrada.jsp
                if (request.getParameter("entradaSeleccionada") != null) {

                    //ArrayList<Entrada> listaEntrada = (ArrayList<Entrada>) request.getAttribute("entradaSeleccionada"); NO USO
                    EntradaDAO miEntradaDAO = new EntradaDAO();
                    for (Entrada entrada : miEntradaDAO.buscarUnaEntrada(request.getParameter("entradaSeleccionada").toString())) {
            %>

            <!--id de la entrada-->
            <div class="form-group col-md-3">
                <label for="idEntrada">* ID</label>
                <input id="idEntrada" class="form-control" type="text" name="idEntrada" value="<%out.println(entrada.getIdEntrada());%>" readonly>
            </div> 

            <!--usuario sistema-->   
            <div class="form-group col-md-3">
                <label for="loguin">* USUARIO</label>
                <input type="text" class="form-control" id="loguin" name="loguin" readonly="readonly" value="<%out.println(miSesion.getAttribute("sesionActiva"));%>">
                <%
                    // listo el id del usuario
                    UsuarioDAO miUsuarioDao = new UsuarioDAO();
                    for (Usuario usuario : miUsuarioDao.buscarUsuarioLoguin((String) miSesion.getAttribute("sesionActiva"))) {

                %>
                <input type="hidden" name="idUsuario" value="<%out.println(usuario.getIdUsuario());%>">
                <%
                    }
                %>
            </div>

            <!--nombre del producto, id del producto-->    
            <div class="form-group col-md-3">
                <label for="cmbProducto">* PRODUCTO</label>
                <select id="cmbProducto" class="form-control" name="cmbProducto">
                    <%
                        // creo objeto para listar los producto
                        ProductoDAO miProductoDao = new ProductoDAO();

                        // recorro las lista de producos
                        for (Producto productoLista : miProductoDao.buscarProducto()) {

                    %>
                    <option value="<%out.println(productoLista.getIdProducto());%>"><%out.println(productoLista.getNombre());%></option>
                    <%
                        }
                    %>

                    <%
                        // listo el producto seleccionado
                        for (Producto pSeleccionado : miProductoDao.buscarUnProducto(Integer.toString(entrada.getIdProducto()))) {

                    %>
                    <option selected value="<%out.println(pSeleccionado.getIdProducto());%>"><%out.println(pSeleccionado.getNombre());%></option>

                    <%
                        }
                    %>
                </select>  
            </div>

            <!--responsable-->    
            <div class="form-group col-md-3">
                <label for="cmbResponsable">* QUIÉN RECIBE</label>
                <select id="cmbResponsable" class="form-control" name="cmbResponsable">
                    <%
                        // creo objeto para listar los responsable
                        PersonaDAO miPersonaDao = new PersonaDAO();

                        // recorro las lista de producos
                        for (Persona responsable : miPersonaDao.buscarPersona("empleado")) {

                    %>
                    <option value="<%out.println(responsable.getIdPersona());%>"><%out.println(responsable.getNombre());%></option>
                    <%
                        }
                    %>

                    <%
                        for (Persona responsableSelec : miPersonaDao.buscarUnaPersona(Integer.toString(entrada.getResponsable()))) {

                    %>
                    <option selected value="<%out.println(responsableSelec.getIdPersona());%>"><%out.println(responsableSelec.getNombre());%></option>

                    <%
                        }
                    %>
                </select>  
            </div>

            <!--proveedor-->    
            <div class="form-group col-md-3">
                <label for="cmbProveedor">* PROVEEDOR</label>
                <select id="cmbProveedor" class="form-control" name="cmbProveedor">
                    <%
                        // creo objeto para listar los proveedor
                        PersonaDAO miProveedorDao = new PersonaDAO();

                        // recorro las lista de personas
                        for (Persona proveedor : miProveedorDao.buscarPersona("proveedor")) {

                    %>
                    <option value="<%out.println(proveedor.getIdPersona());%>"><%out.println(proveedor.getNombre());%></option>
                    <%
                        }
                    %>

                    <%
                        for (Persona proveedor : miPersonaDao.buscarUnaPersona(Integer.toString(entrada.getProveedor()))) {

                    %>
                    <option selected value="<%out.println(proveedor.getIdPersona());%>"><%out.println(proveedor.getNombre());%></option>

                    <%
                        }
                    %>
                </select>  
            </div>

            <!--conductor-->    
            <div class="form-group col-md-3">
                <label for="cmbConductor">* CONDUCTOR</label>
                <select id="cmbConductor" class="form-control" name="cmbConductor">
                    <%
                        // creo objeto para listar los conductor
                        PersonaDAO miConductorDao = new PersonaDAO();

                        // listo conductores tipo proveedor
                        for (Persona conductor : miConductorDao.buscarPersona("proveedor")) {

                    %>
                    <option value="<%out.println(conductor.getIdPersona());%>"><%out.println(conductor.getNombre());%></option>
                    <%
                        }
                    %>

                    <%
                        for (Persona conductor : miPersonaDao.buscarUnaPersona(Integer.toString(entrada.getConductor()))) {

                    %>
                    <option selected value="<%out.println(conductor.getIdPersona());%>"><%out.println(conductor.getNombre());%></option>

                    <%
                        }
                    %>

                    <%
                        // listo conductores tipo empleado
                        for (Persona conductor : miConductorDao.buscarPersona("empleado")) {
                    %>
                    <option value="<%out.println(conductor.getIdPersona());%>"><%out.println(conductor.getNombre());%></option>
                    <%
                        }
                    %>

                </select>  
            </div>


            <!--numero placa-->
            <div class="form-group col-md-3">
                <label for="numeroPlaca">* PLACA</label>
                <input  id="numeroPlaca" class="form-control" type="text" name="numeroPlaca" value="<%out.println(entrada.getNumeroPlaca());%>" required>
            </div>      

            <!--ruta-->
            <div class="form-group col-md-3">
                <label for="ruta">* RUTA</label>
                <input id="ruta" class="form-control" type="text" name="ruta" value="<%out.println(entrada.getRuta());%>" required>
            </div>    

            <!--consecutivo-->
            <div class="form-group col-md-3">
                <label for="consecutivo">* CONSECUTIVO</label>
                <input  id="consecutivo" class="form-control" type="text" name="consecutivo" value="<%out.println(entrada.getConsecutivo());%>" required>
            </div>


            <!---fecha--->
            <div class="form-group col-md-3">
                <label for="fecha">* FECHA Y HORA</label>
                <%
                    // Mostrar fecha actual "2019-09-12 20:16:00" 2018-06-12T19:30
                    StringBuilder fecha = new StringBuilder(entrada.getFechaHora());
                    fecha.deleteCharAt(10);
                    fecha.insert(10, "T");
                    SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");

                    Date fechaDate = null;
                    fechaDate = formato.parse(fecha.toString());
                %>
                <input id="fecha" class="form-control" type="datetime-local" name="fecha" value="<%out.write(formato.format(fechaDate));%>" required readonly>
            </div>

            <!--caneca-->
            <div class="form-group col-md-3">
                <label for="canecaActualizar">CANECA</label>
                <input  id="canecaActualizar" class="form-control" type="text" name="caneca" value="<%out.println(entrada.getCaneca());%>" onkeyup="calcularGalon()">
            </div>

            <!--calcula los galones de una caneca
               1. tomo el valor del campo canecaActualizar
               2. guardo el valor de las canecas * 55
               3. muestro el resultado en los galoes, solo con 2 decimales
            -->
            <script type="text/javascript">
                function calcularGalon() {

                    let canecaActualizar = document.getElementById("canecaActualizar").value;
                    let galonActualizar = canecaActualizar * 55;
                    document.getElementById("galonActualizar").value = galonActualizar.toFixed(2);

                }
            </script>



            <!--galón-->
            <div class="form-group col-md-3">
                <label for="galonActualizar">GALÓN</label>
                <input  id="galonActualizar" class="form-control" type="text" name="galon" value="<%out.println(entrada.getGalon());%>">
            </div>

            <!--galón extra-->
            <div class="form-group col-md-3">
                <label for="galonExtra">GALÓN EXTRA</label>
                <input  id="galonExtra" class="form-control" type="text"  onblur="sumaGalonExtra()">
            </div>

            <!--sumar galones extras
                 1. tomo el valor de los galones extras
                 2. tomo el valor de los galones actuales, equivalentes a las canecas
                 3. sumo galones actuales y galones extras, los muestro en galones actuales 
            -->

            <script type="text/javascript">

                function sumaGalonExtra() {
                    let galonFinal = parseFloat(document.getElementById("galonActualizar").value);
                    let galonExtra = parseFloat(document.getElementById("galonExtra").value);

                    // si galon extra no es un numero es por que el usuario salio del input borrando los valores
                    // luego restablecemos galon entrada
                    if (isNaN(galonExtra)) {

                        let canecaActualizar = document.getElementById("canecaActualizar").value;
                        let galonActualizar = canecaActualizar * 55;
                        document.getElementById("galonActualizar").value = galonActualizar.toFixed(2);

                    } else {
                        let resultadoGalone = galonFinal + galonExtra;
                        document.getElementById("galonActualizar").value = parseFloat(resultadoGalone).toFixed(2);
                    }


                }
            </script>

            <!--kg remisionado-->
            <div class="form-group col-md-3">
                <label for="kgRemisionado">* KG REMISIONADO</label>
                <input  id="kgRemisionado" class="form-control" type="text" name="kgRemisionado" value="<%out.println(entrada.getKgRemisionado());%>" required>
            </div>

            <!--kg planta-->
            <div class="form-group col-md-3">
                <label for="kgPlanta">* KG PLANTA</label>
                <input  id="kgPlanta" class="form-control" type="text" name="kgPlanta" required value="<%out.println(entrada.getKgPlanta());%>">
            </div>

            <!--diferencia-->
            <div class="form-group col-md-3">
                <label for="diferencia">DIFERENCIA</label>
                <input  id="diferencia" class="form-control" type="text" name="diferencia" value="<%out.println(entrada.getDiferencia());%>" readonly>
            </div>

            <!--producto malo-->
            <div class="form-group col-md-3">
                <label for="productoMalo">PRODUCTO MALO</label>
                <input  id="productoMalo" class="form-control" type="text" name="productoMalo" value="<%out.println(entrada.getProductoMalo());%>">
            </div>

            <!--perdida peso segundo proceso-->
            <div class="form-group col-md-3">
                <label for="persidaSegundoProceso">PERDIDA PESO</label>
                <input  id="persidaSegundoProceso" class="form-control" type="text" name="persidaSegundoProceso" value="<%out.println(entrada.getPerdidaPesoSegundoProceso());%>">
            </div>

            <!--peso neto-->
            <div class="form-group col-md-3">
                <label for="pesoNeto">NETO</label>
                <input  id="pesoNeto" class="form-control" type="text" name="pesoNeto" required value="<%out.println(entrada.getPesoNeto());%>" readonly>
            </div>

            <!--obervación-->
            <div class="form-group col-md-12">
                <label for="observacion">OBSERVACIÓN</label>
                <input  id="observacion" class="form-control" type="text" name="observacion" value="<%out.println(entrada.getObservacion());%>">
            </div>

            <!--actualizar-->
            <button type="submit" class="btn btn-primary col-md-2 " id="btnActualizarEntrada" name="btnActualizarEntrada" value="btnActualizarEntrada">EDITAR <i class="fas fa-people-carry"></i></button>
            <div class="col-md-1"></div>
            <!--volver-->
            <a href="buscarEntrada.jsp" class="btn btn-dark col-md-2 ">VOLVER <i class="far fa-hand-point-left"></i></a>
            <!--boton oculto-->
            <button type="submit" id="btnEliminarEntrada" name="btnEliminarEntrada"></button>
            <div class="col-md-1"></div>
            <!--imprimir--> 
            <a name="imprimir" class="btn btn-success col-md-2 text-white" onclick="window.print();">IMPRIMIR <i class="fas fa-print"></i></a>
            <div class="col-md-2"></div>
            <!--eliminar-->
            <a  class="btn btn-danger text-white col-md-2" id="linkEliminarEntrada">BORRAR <i class="fas fa-trash-alt"></i></a>

            <!--confirmar para eliminar-->
            <script type="text/javascript">
                // oculto el boton eliminar  
                document.getElementById('btnEliminarEntrada').style.display = 'none';
                // capturo el evento click del link del enlace
                $('#linkEliminarEntrada').on('click', function () {
                    if (confirm("Seguro que desea eliminar")) {
                        // doy click sobre el boton eliminar
                        document.getElementById("btnEliminarEntrada").click();
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