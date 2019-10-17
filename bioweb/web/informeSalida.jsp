<%-- 
    Document   : informeSalida
    Created on : 27/09/2019, 09:19:41 PM
    Author     : Crispancho
--%>

<%@page import="entity.Salida"%>
<%@page import="model.SalidaDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@include file="head.jsp" %>

<div class="container mt-5 mb-5">
    <h4 class="row justify-content-center align-items-center mb-5 text-dark">INFORME SALIDA</h4>
    <!--Logo-->
    <div class="navbar-brand">
        <img src="imagenes/biologo.png" class="mb-3" style="width:250px;">
    </div>
    <form action="PersonaBO" method="post">
        <div class="form-row">
            <%   /**
                 * buscarEntrada.jsp, recivir lista de id en checkBox, ejecutar
                 * el metodo del DAO para buscar las entras selecionadas y
                 * listar el informe
                 */
                if (request.getParameter("btncalcular") != null) {

                    SalidaDAO miSalidaDao = new SalidaDAO();

                    if (request.getParameter("checkId") != null) {

                        // capturo los checbox en un array
                        String[] listaID = request.getParameterValues("checkId");

                        DecimalFormat miFormaro = new DecimalFormat("#.00");

                        float caneca = 0f;
                        float galon = 0f;
                        float pesoBruto = 0f;
                        float tara = 0f;
                        float pesoNeto = 0f;
                        float gradosBrix = 0f;
                        float cantidadBulto = 0f;

                        for (Salida salida : miSalidaDao.buscarVariasSalidas(listaID)) {
                            caneca += salida.getCaneca();
                            galon += salida.getGalon();
                            pesoBruto += salida.getPesoBruto();
                            tara += salida.getTara();
                            pesoNeto += salida.getPesoNeto();
                            gradosBrix += salida.getGradosBrix();
                            cantidadBulto += salida.getCantidadBulto();
                        }

            %>

            <!--caneca-->
            <div class="form-group col-md-4">
                <label for="caneca">CANECA</label>
                <input type="text" class="form-control" id="caneca" name="caneca" value="<%out.println(miFormaro.format(caneca));%>">
            </div>

            <!--galón-->
            <div class="form-group col-md-4">
                <label for="galon">GALÓN</label>
                <input type="text" class="form-control" id="galon" name="galon" value="<%out.println(miFormaro.format(galon));%>">
            </div>

            <!--peso bruto-->
            <div class="form-group col-md-4">
                <label for="pesoBruto">PESO BRUTO</label>
                <input type="text" class="form-control" id="pesoBruto" name="pesoBruto" value="<%out.println(miFormaro.format(pesoBruto));%>">
            </div>   

            <!--tara-->
            <div class="form-group col-md-4">
                <label for="tara">TARA</label>
                <input type="text" class="form-control" id="tara" name="tara" value="<%out.println(miFormaro.format(tara));%>">
            </div> 

            <!--peso neto-->
            <div class="form-group col-md-4">
                <label for="pesoNeto">PESO NETO</label>
                <input type="text" class="form-control" id="pesoNeto" name="pesoNeto" value="<%out.println(miFormaro.format(pesoNeto));%>">
            </div> 

            <!--grados brix-->
            <div class="form-group col-md-4">
                <label for="gradosBrix">GRADOS BRIX</label>
                <input type="text" class="form-control" id="gradosBrix" name="gradosBrix" value="<%out.println(miFormaro.format(gradosBrix));%>">
            </div> 

            <!--cantidad bulto-->
            <div class="form-group col-md-4">
                <label for="cantidadBulto">CANTIDAD BULTO</label>
                <input type="text" class="form-control" id="cantidadBulto" name="cantidadBulto" value="<%out.println(miFormaro.format(cantidadBulto));%>">
            </div> 
            
            
            <!--separador-->
            <div class="col-md-8"></div>
            <!--botones-->  
            <a  href="buscarSalida.jsp" class="btn btn-dark text-white col-md-4" >VOLVER <i class="far fa-hand-point-left"></i></a>
            <div class="col-md-4"></div>
            <!--imprimir--> 
            <a name="imprimir" class="btn btn-success col-md-4 text-white" onclick="window.print();">IMPRIMIR <i class="fas fa-print"></i></a>
        </div>

    </form>

</div>

<%      }
    } else {
        response.sendRedirect("buscarEntrada.jsp");
    }

%>

<%@include file="footer.jsp" %>