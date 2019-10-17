<%-- 
    Document   : entrada
    Created on : 09-sep-2019, 15:17:35
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
<%@include file="head.jsp" %>

<div class="container mt-5 mb-5">
    <h4 class="row justify-content-center align-items-center mb-5 text-dark">ENTRADA</h4>
    <!--Logo-->
    <div class="navbar-brand">
        <img src="imagenes/biologo.png" class="mb-5" style="width:250px;">
    </div>
    <form action="CrearEntrada" method="post">
        <div class="form-row">


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
                </select>  
            </div>

            <!--responsable-->
            <div class="form-group col-md-3">
                <label for="cmbResponsable">* QUIÉN RECIBE</label>
                <select id="cmbResponsable" class="form-control" name="cmbResponsable">
                    <%
                        // creo objeto para persona 
                        PersonaDAO miPersonaDao = new PersonaDAO();

                        // recorro las lista de personas tipo empleado
                        for (Persona persona : miPersonaDao.buscarPersona("empleado")) {

                    %>
                    <option value="<%out.println(persona.getIdPersona());%>"><%out.println(persona.getNombre());%></option>

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
                        // recorro las lista de personas tipo proveedor
                        for (Persona persona : miPersonaDao.buscarPersona("proveedor")) {

                    %>
                    <option value="<%out.println(persona.getIdPersona());%>"><%out.println(persona.getNombre());%></option>

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
                        // recorro las lista de personas tipo empleado
                        for (Persona conductorBio : miPersonaDao.buscarPersona("empleado")) {

                    %>
                    <option value="<%out.println(conductorBio.getIdPersona());%>"><%out.println(conductorBio.getNombre());%></option>

                    <%
                        }
                    %>
                    <%
                        for (Persona conductorCliente : miPersonaDao.buscarPersona("proveedor")) {

                    %>
                    <option value="<%out.println(conductorCliente.getIdPersona());%>"><%out.println(conductorCliente.getNombre());%></option>
                    <%
                        }
                    %>

                </select>  
            </div>   

            <!--numero placa-->
            <div class="form-group col-md-3">
                <label for="numeroPlaca">* PLACA</label>
                <input  id="numeroPlaca" class="form-control" type="text" name="numeroPlaca" required>
            </div>      

            <!--ruta-->
            <div class="form-group col-md-3">
                <label for="ruta">* RUTA</label>
                <input id="ruta" class="form-control" type="text" name="ruta" required>
            </div>    

            <!--consecutivo-->
            <div class="form-group col-md-3">
                <label for="consecutivo">* CONSECUTIVO</label>
                <input  id="consecutivo" class="form-control" type="text" name="consecutivo" required>
            </div>

            <!---fecha--->
            <div class="form-group col-md-3">
                <label for="fecha">* FECHA Y HORA</label>
                <%
                    // Mostrar fecha actual
                    Date date = new Date();
                    DateFormat hourdateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
                %>
                <input id="fecha" class="form-control" type="datetime-local" name="fecha" value="<%out.write(hourdateFormat.format(date));%>" required>
            </div>


            <!--caneca-->
            <div class="form-group col-md-3">
                <label for="canecaEntrada">CANECA</label>
                <input  id="canecaEntrada" class="form-control" type="text" name="caneca" onkeyup="calcularGalon()">
            </div>

            <!--calcula los galones de una caneca
               1. tomo el valor del campo canecaEntrada
               2. guardo el valor de las canecas * 55
               3. muestro el resultado en los galoes, solo con 2 decimales
            -->
            <script type="text/javascript">
                function calcularGalon() {

                    let canecaEntrada = document.getElementById("canecaEntrada").value;
                    let galonEntrada = canecaEntrada * 55;
                    document.getElementById("galonEntrada").value = galonEntrada.toFixed(2);

                }
            </script>

            <!--galón-->
            <div class="form-group col-md-3">
                <label for="galonEntrada">GALÓN</label>
                <input  id="galonEntrada" class="form-control" type="text" name="galon">
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
                    let galonFinal = parseFloat(document.getElementById("galonEntrada").value);
                    let galonExtra = parseFloat(document.getElementById("galonExtra").value);

                    // si galon extra no es un numero es por que el usuario salio del input borrando los valores
                    // luego restablecemos galon entrada
                    if (isNaN(galonExtra)) {

                        let canecaEntrada = document.getElementById("canecaEntrada").value;
                        let galonEntrada = canecaEntrada * 55;
                        document.getElementById("galonEntrada").value = galonEntrada.toFixed(2);

                    } else {
                        let resultadoGalone = galonFinal + galonExtra;
                        document.getElementById("galonEntrada").value = parseFloat(resultadoGalone).toFixed(2);
                    }


                }
            </script>


            <!--kg remisionado-->
            <div class="form-group col-md-3">
                <label for="kgRemisionado">* KG REMISIONADO</label>
                <input  id="kgRemisionado" class="form-control" type="text" name="kgRemisionado" required>
            </div>

            <!--kg planta-->
            <div class="form-group col-md-3">
                <label for="kgPlanta">* KG PLANTA</label>
                <input  id="kgPlanta" class="form-control" type="text" name="kgPlanta" required>
            </div>

            <!--producto malo-->
            <div class="form-group col-md-3">
                <label for="productoMalo">PRODUCTO MALO</label>
                <input  id="productoMalo" class="form-control" type="text" name="productoMalo">
            </div>

            <!--perdida peso segundo proceso-->
            <div class="form-group col-md-3">
                <label for="persidaSegundoProceso">PERDIDA PESO</label>
                <input  id="persidaSegundoProceso" class="form-control" type="text" name="persidaSegundoProceso">
            </div>

            <!--obervación-->
            <div class="form-group col-md-12">
                <label for="observacion">OBSERVACIÓN</label>
                <input  id="observacion" class="form-control" type="text" name="observacion">
            </div>

            <!--agregar-->
            <button type="submit" class="btn btn-primary col-md-2" id="btnEntrada" name="btnEntrada">AGREGAR <i class="fas fa-people-carry"></i></button>
            <div class="col-md-1"></div>
            <!--volver-->
            <a href="buscarEntrada.jsp" class="btn btn-dark col-md-2">VOLVER <i class="far fa-hand-point-left"></i></a>
            <div class="col-md-1"></div>
            <!--imprimir--> 
            <a name="imprimir" class="btn btn-success col-md-2 text-white" onclick="window.print();">IMPRIMIR <i class="fas fa-print"></i></a>
            <div class="col-md-2"></div>
            <!--limpiar-->
            <button type="reset" class="btn btn-danger col-md-2" >LIMPIAR <i class="fas fa-broom"></i></button>
            



        </div>
    </form>
</div>
<%
    // valido que se agregue la entrada
    if (request.getAttribute("entradaAgregada") != null) {
        if (request.getAttribute("entradaAgregada").equals("1")) {
            out.write("<script type='text/javascript'>\n");
            out.write("window.location.href = \"entrada.jsp\";");
            out.write("alert('Entrada agregada')");
            out.write("</script>\n");
        } else {
            out.write("<script type='text/javascript'>\n");
            out.write("window.location.href = \"entrada.jsp\";");
            out.write("alert('Entrada no agregada')");
            out.write("</script>\n");
        }
    }
%>
<%@include file="footer.jsp" %>