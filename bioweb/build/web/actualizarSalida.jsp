<%-- 
    Document   : actualizarSalida
    Created on : 27/09/2019, 09:19:11 PM
    Author     : Crispancho
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="entity.Persona"%>
<%@page import="model.PersonaDAO"%>
<%@page import="entity.Producto"%>
<%@page import="model.ProductoDAO"%>
<%@page import="entity.Usuario"%>
<%@page import="model.UsuarioDAO"%>
<%@page import="entity.Salida"%>
<%@page import="model.SalidaDAO"%>
<%@include file="head.jsp" %>

<div class="container mt-5 mb-5">
    <h4 class="row justify-content-center align-items-center mb-5 text-dark">ACTUALIZAR SALIDA</h4>
    <!--Logo-->
    <div class="navbar-brand">
        <img src="imagenes/biologo.png" class="mb-3" style="width:250px;">
    </div>
    <form id="frmUsuario" action="ActualizarSalida" method="post">

        <div class="row">

            <%  // valido que se halla enviado el id, desde buscarSalida.jsp
                if (request.getParameter("salidaSeleccionada") != null) {

                    SalidaDAO miSalidaDAO = new SalidaDAO();
                    for (Salida salida : miSalidaDAO.buscaUnaSalida(Integer.parseInt(request.getParameter("salidaSeleccionada").toString()))) {
            %>

            <!--id de la salida-->
            <div class="form-group col-md-3">
                <label for="idSalida">* ID</label>
                <input id="idSalida" class="form-control" type="text" name="idSalida" value="<%out.println(salida.getIdSalida());%>" readonly>
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
                        for (Producto pSeleccionado : miProductoDao.buscarUnProducto(Integer.toString(salida.getIdProducto()))) {

                    %>
                    <option selected value="<%out.println(pSeleccionado.getIdProducto());%>"><%out.println(pSeleccionado.getNombre());%></option>

                    <%
                        }
                    %>
                </select>  
            </div>

            <!--responsable quién entrega-->    
            <div class="form-group col-md-3">
                <label for="cmbResponsable">* QUIÉN ENTREGA</label>
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
                        for (Persona responsableSelec : miPersonaDao.buscarUnaPersona(Integer.toString(salida.getResponsable()))) {

                    %>
                    <option selected value="<%out.println(responsableSelec.getIdPersona());%>"><%out.println(responsableSelec.getNombre());%></option>

                    <%
                        }
                    %>
                </select>  
            </div>

            <!--cliente-->    
            <div class="form-group col-md-3">
                <label for="cmbCliente">* CLIENTE</label>
                <select id="cmbCliente" class="form-control" name="cmbCliente">
                    <%
                        // creo objeto para listar los clientes
                        PersonaDAO miClienteDao = new PersonaDAO();

                        // recorro las lista de personas
                        for (Persona cliente : miClienteDao.buscarPersona("cliente")) {

                    %>
                    <option value="<%out.println(cliente.getIdPersona());%>"><%out.println(cliente.getNombre());%></option>
                    <%
                        }
                    %>

                    <%
                        for (Persona cliente : miPersonaDao.buscarUnaPersona(Integer.toString(salida.getCliente()))) {

                    %>
                    <option selected value="<%out.println(cliente.getIdPersona());%>"><%out.println(cliente.getNombre());%></option>

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

                        // listo conductores tipo cliente
                        for (Persona conductor : miConductorDao.buscarPersona("cliente")) {

                    %>
                    <option value="<%out.println(conductor.getIdPersona());%>"><%out.println(conductor.getNombre());%></option>
                    <%
                        }
                    %>

                    <%
                        for (Persona conductor : miPersonaDao.buscarUnaPersona(Integer.toString(salida.getConductor()))) {

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
                <input  id="numeroPlaca" class="form-control" type="text" name="numeroPlaca" value="<%out.println(salida.getNumeroPlaca());%>" required>
            </div>      


            <!--consecutivo-->
            <div class="form-group col-md-3">
                <label for="consecutivo">* CONSECUTIVO</label>
                <input  id="consecutivo" class="form-control" type="text" name="consecutivo" value="<%out.println(salida.getConsecutivo());%>" required>
            </div>


            <!---fecha--->
            <div class="form-group col-md-3">
                <label for="fecha">* FECHA Y HORA</label>
                <%
                    // Mostrar fecha actual "2019-09-12 20:16:00" 2018-06-12T19:30
                    StringBuilder fecha = new StringBuilder(salida.getFechaHora());
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
                <input  id="canecaActualizar" class="form-control" type="text" name="caneca" value="<%out.println(salida.getCaneca());%>" onkeyup="calcularGalon()">
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
                <input  id="galonActualizar" class="form-control" type="text" name="galon" value="<%out.println(salida.getGalon());%>">
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



            <!--peso bruto, sin tara-->
            <div class="form-group col-md-3">
                <label for="pesoBruto">PESO BRUTO</label>
                <input  id="pesoBruto" class="form-control" type="text" name="pesoBruto" value="<%out.println(salida.getPesoBruto());%>">
            </div>

            <!--tara-->
            <div class="form-group col-md-3">
                <label for="tara">TARA</label>
                <input  id="tara" class="form-control" type="text" name="tara" value="<%out.println(salida.getTara());%>">
            </div>


            <!--peso neto-->
            <div class="form-group col-md-3">
                <label for="pesoNeto">NETO</label>
                <input  id="pesoNeto" class="form-control" type="text" name="pesoNeto" value="<%out.println(salida.getPesoNeto());%>" onblur="calcularTara()">
            </div>

            <!--calcular tara-->
            <script type="text/javascript">
                function calcularTara() {
                    let pesoBruto = parseFloat(document.getElementById("pesoBruto").value);
                    let tara = parseFloat(document.getElementById("tara").value);
                    let pesoNeto = parseFloat(document.getElementById("pesoNeto").value);

                    // si no es numero peso bruto
                    if (isNaN(pesoBruto)) {
                        pesoBruto = 0;

                    }
                    // si no es numero tara
                    if (isNaN(tara)) {
                        tara = 0;
                    }

                    // calculo el peso neto, resto la tara al peso bruto
                    if (pesoBruto !== 0) {
                        let pesoNeto = pesoBruto - tara;
                        document.getElementById("pesoNeto").value = pesoNeto.toFixed(2);
                    }

                }
            </script>

            <!--grados brix-->
            <div class="form-group col-md-3">
                <label for="gradosBrix">GRADOS BRIX</label>
                <input  id="gradosBrix" class="form-control" type="text" name="gradosBrix" value="<%out.println(salida.getGradosBrix());%>">
            </div>

            <!--cantidad bulto-->
            <div class="form-group col-md-3">
                <label for="cantidadBulto">CANTIDAD BULTO</label>
                <input  id="cantidadBulto" class="form-control" type="text" name="cantidadBulto" value="<%out.println(salida.getCantidadBulto());%>">
            </div>



            <!--obervación-->
            <div class="form-group col-md-9">
                <label for="observacion">OBSERVACIÓN</label>
                <input  id="observacion" class="form-control" type="text" name="observacion" value="<%out.println(salida.getObservacion());%>">
            </div>

            <!--actualizar-->
            <button type="submit" class="btn btn-primary col-md-2 " id="btnActualizarSalida" name="btnActualizarSalida" value="btnActualizarSalida">EDITAR <i class="fas fa-truck"></i></button>
            <div class="col-md-1"></div>
            <!--volver-->
            <a href="buscarSalida.jsp" class="btn btn-dark col-md-2 ">VOLVER <i class="far fa-hand-point-left"></i></a>
            <!--boton oculto-->
            <button type="submit" id="btnEliminarSalida" name="btnEliminarSalida"></button>
            <div class="col-md-1"></div>
            <!--imprimir--> 
            <a name="imprimir" class="btn btn-success col-md-2 text-white" onclick="window.print();">IMPRIMIR <i class="fas fa-print"></i></a>
            <div class="col-md-2"></div>
            <!--eliminar-->
            <a  class="btn btn-danger text-white col-md-2" id="linkEliminarSalida">BORRAR <i class="fas fa-trash-alt"></i></a>

            <!--confirmar para eliminar-->
            <script type="text/javascript">
                // oculto el boton eliminar  
                document.getElementById('btnEliminarSalida').style.display = 'none';
                // capturo el evento click del link del enlace
                $('#linkEliminarSalida').on('click', function () {
                    if (confirm("Seguro que desea eliminar")) {
                        // doy click sobre el boton eliminar
                        document.getElementById("btnEliminarSalida").click();
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