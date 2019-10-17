<%-- 
    Document   : ingresoPruducto
    Created on : 14/09/2019, 10:39:18 AM
    Author     : Crispancho
--%>

<%@include file="head.jsp" %>

<div class="container mt-5 mb-5">
   <h4 class="row justify-content-center align-items-center mb-5 text-dark">INGRESO PRODUCTO</h4>
   <form action="IngresoProducto" method="post">
    <div class="form-row">
      
    <!--nombre del producto-->
    <div class="form-group col-md-4">
      <label for="nombreProducto">* NOMBRE PRODUCTO</label>
      <input type="text" class="form-control" id="nombreProducto" name="nombreProducto" placeholder="Debe ser único" required>
    </div>   
        
    <!--codigo del producto-->    
    <div class="form-group col-md-4">
        <label for="codigoProducto">CODIGO PRODUCTO</label>
        <input type="text" class="form-control" id="codigoProducto" name="codigoProducto">
    </div>


    <!--observacion-->
    <div class="form-group col-md-4">
      <label for="observacion">OBSERVACIÓN</label>
      <input type="text" class="form-control" id="observacion" name="observacion">
    </div>
    
    <!--agregar-->
    <button type="submit" class="btn btn-primary col-md-2" id="btnAgregarProducto" name="btnAgregarProducto">AGREGAR <i class="fas fa-cart-plus"></i></button>
    <div class="col-md-3"></div>
    <!--volver-->
    <a href="buscarProducto.jsp" class="btn btn-dark col-md-2">VOLVER <i class="far fa-hand-point-left"></i></a>
    <div class="col-md-3"></div>
    <!--limpiar-->
    <button type="reset" class="btn btn-danger col-md-2">LIMPIAR <i class="fas fa-broom"></i></button>
  </div>

</form>
</div>
<%
    // confirmo si el producto fue agregado    
    if (request.getAttribute("productoAgregado")!= null) {
        if (request.getAttribute("productoAgregado").equals("1")) {
            out.write("<script type='text/javascript'>\n");
            out.write("window.location.href = \"ingresoProducto.jsp\";");
            out.write("alert('Producto agregado')");
            out.write("</script>\n");        
        } else {
            out.write("<script type='text/javascript'>\n");
            out.write("window.location.href = \"ingresoProducto.jsp\";");
            out.write("alert('Producto no agregado')");
            out.write("</script>\n");
        }
    }
%>

<%@include file="footer.jsp" %>