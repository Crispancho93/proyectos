<%-- 
    Document   : informeEntrada
    Created on : 23/09/2019, 03:24:59 PM
    Author     : Crispancho
--%>

<%@page import="model.EntradaDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="entity.Entrada"%>
<%@page import="java.util.ArrayList"%>
<%@include file="head.jsp" %>



<div class="container mt-5 mb-5">
    <h4 class="row justify-content-center align-items-center mb-5 text-dark">INFORME ENTRADA</h4>
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

                    EntradaDAO miEntradaDao = new EntradaDAO();

                    if (request.getParameter("checkId") != null) {

                        // capturo los checbox en un array
                        String[] listaID = request.getParameterValues("checkId");

                        DecimalFormat miFormaro = new DecimalFormat("#.00");
                        float kgRemisionado = 0f;
                        float kgPlanta = 0f;
                        float diferencia = 0f;
                        float pesoNeto = 0f;
                        float persdidaPeso = 0f;
                        float productoMalo = 0f;
                        float caneca = 0f;
                        float galon = 0f;

                        for (Entrada entrada : miEntradaDao.buscarVariasEntradas(listaID)) {
                            kgRemisionado += entrada.getKgRemisionado();
                            kgPlanta += entrada.getKgPlanta();
                            diferencia += entrada.getDiferencia();
                            pesoNeto += entrada.getPesoNeto();
                            persdidaPeso += entrada.getPerdidaPesoSegundoProceso();
                            productoMalo += entrada.getProductoMalo();
                            caneca += entrada.getCaneca();
                            galon += entrada.getGalon();
                        }

            %>

            <!--kg remisionado-->
            <div class="form-group col-md-4">
                <label for="kgRemisionado">KG REMISIONADO</label>
                <input type="text" class="form-control" id="kgRemisionado" name="kgRemisionado" value="<%out.println(miFormaro.format(kgRemisionado));%>">
            </div>   

            <!--kg planta-->
            <div class="form-group col-md-4">
                <label for="kgPlanta">KG PLANTA</label>
                <input type="text" class="form-control" id="kgPlanta" name="kgPlanta" value="<%out.println(miFormaro.format(kgPlanta));%>">
            </div> 

            <!--diferencia-->
            <div class="form-group col-md-4">
                <label for="diferencia">DIFERENCIA</label>
                <input type="text" class="form-control" id="diferencia" name="diferencia" value="<%out.println(miFormaro.format(diferencia));%>">
            </div> 

            <!--peso neto-->
            <div class="form-group col-md-4">
                <label for="pesoNeto">PESO NETO</label>
                <input type="text" class="form-control" id="pesoNeto" name="pesoNeto" value="<%out.println(miFormaro.format(pesoNeto));%>">
            </div> 

            <!--producto malo-->
            <div class="form-group col-md-4">
                <label for="productoMalo">PRODUCTO MALO</label>
                <input type="text" class="form-control" id="productoMalo" name="productoMalo" value="<%out.println(miFormaro.format(productoMalo));%>">
            </div> 

            <!--perdida peso-->
            <div class="form-group col-md-4">
                <label for="perdidaPeso">PERDIDA PESO</label>
                <input type="text" class="form-control" id="perdidaPeso" name="perdidaPeso" value="<%out.println(miFormaro.format(persdidaPeso));%>">
            </div> 

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

            <div class="col-md-2"></div>
            <!--botones-->  
            <a  href="buscarEntrada.jsp" class="btn btn-dark text-white col-md-4" >VOLVER <i class="far fa-hand-point-left"></i></a>
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
