<%-- 
    Document   : salida
    Created on : 27/09/2019, 09:18:39 PM
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
    <h4 class="row justify-content-center align-items-center mb-5 text-dark">SALIDA</h4>
    <!--Logo-->
    <div class="navbar-brand" >
        <img src="imagenes/biologo.png" class="mb-5" style="width:250px;">
    </div>
    <form action="CrearSalida" method="post">
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

            <!--responsable quién entrega-->
            <div class="form-group col-md-3">
                <label for="cmbResponsable">* QUIÉN ENTREGA</label>
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

            <!--cliente-->
            <div class="form-group col-md-3">
                <label for="cmbCliente">* CLIENTE</label>
                <select id="cmbCliente" class="form-control" name="cmbCliente">
                    <%
                        // recorro las lista de personas tipo cliente
                        for (Persona persona : miPersonaDao.buscarPersona("cliente")) {

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
                        for (Persona conductorCliente : miPersonaDao.buscarPersona("cliente")) {

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


            <!--peso bruto, sin tara-->
            <div class="form-group col-md-3">
                <label for="pesoBruto">PESO BRUTO</label>
                <input  id="pesoBruto" class="form-control" type="text" name="pesoBruto">
            </div>

            <!--tara-->
            <div class="form-group col-md-3">
                <label for="tara">TARA</label>
                <input  id="tara" class="form-control" type="text" name="tara" >
            </div>

            <!--peso neto-->
            <div class="form-group col-md-3">
                <label for="pesoNeto">PESO NETO</label>
                <input  id="pesoNeto" class="form-control" type="text" name="pesoNeto" onblur="calcularTara()">
            </div>
            
            <!--calcular tara-->
            <script type="text/javascript">
                function calcularTara(){
                    let pesoBruto = parseFloat(document.getElementById("pesoBruto").value);
                    let tara = parseFloat(document.getElementById("tara").value);
                    let pesoNeto = parseFloat(document.getElementById("pesoNeto").value);
                    
                    // si no es numero peso bruto
                    if(isNaN(pesoBruto)){
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
                <input  id="gradosBrix" class="form-control" type="text" name="gradosBrix">
            </div>
            
            <!--cantidad bulto-->
            <div class="form-group col-md-3">
                <label for="cantidadBulto">CANTIDAD BULTO</label>
                <input  id="cantidadBulto" class="form-control" type="text" name="cantidadBulto">
            </div>
            
            <!--obervación-->
            <div class="form-group col-md-12">
                <label for="observacion">OBSERVACIÓN</label>
                <input  id="observacion" class="form-control" type="text" name="observacion">
            </div>

            <!--salida-->
            <button type="submit" class="btn btn-primary col-md-2" id="btnSalida" name="btnSalida">AGREGAR <i class="fas fa-truck"></i></button>
            <div class="col-md-1"></div>
            <!--volver-->
            <a href="buscarSalida.jsp" class="btn btn-dark col-md-2">VOLVER <i class="far fa-hand-point-left"></i></a>
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
    if (request.getAttribute("SalidaAgregada") != null) {
        if (request.getAttribute("SalidaAgregada").equals("1")) {
            out.write("<script type='text/javascript'>\n");
            out.write("window.location.href = \"salida.jsp\";");
            out.write("alert('Salida agregada')");
            out.write("</script>\n");
        } else {
            out.write("<script type='text/javascript'>\n");
            out.write("window.location.href = \"salida.jsp\";");
            out.write("alert('Salida no agregada')");
            out.write("</script>\n");
        }
    }
%>


<%@include file="footer.jsp" %>