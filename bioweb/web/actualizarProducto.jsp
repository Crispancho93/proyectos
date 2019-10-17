<%-- 
    Document   : actualizarProducto
    Created on : 14/09/2019, 10:40:33 AM
    Author     : Crispancho
--%>
<%@page import="model.ProductoDAO"%>
<%@page import="entity.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@include file="head.jsp" %>
<div class="container mt-5 mb-5">
   <h4 class="row justify-content-center align-items-center mb-5 text-dark">ACTUALIZAR PRODUCTO</h4>
   
   <form id="frmUsuario" action="ActualizarProducto" method="post">
    
        <%
            // valido el envio del producto, desde buscarProducto.jsp
            // para poder listarlo
           if (request.getParameter("listaProducto") != null) {
               
              // copio array list que me llega del controller
              //ArrayList<Producto> listaProductos = (ArrayList<Producto>) request.getAttribute("listaProducto"); NO USO
              
              ProductoDAO miProductoDao = new ProductoDAO();
              for (Producto producto : miProductoDao.buscarUnProducto(request.getParameter("listaProducto").toString())) {


        %>

        <div class="form-row">
            
         <!--Id del producto-->   
         <div class="form-group col-md-4">
            <label for="idProducto">* ID</label>
            <input type="text" class="form-control" id="idProducto" name="idProducto" readonly="readonly" value="<%out.println(producto.getIdProducto());%>" required>
        </div> 
        
        <!--nombre del producto--> 
        <div class="form-group col-md-4">
            <label for="nombreProducto">* NOMBRE PRODUCTO</label>
            <input type="text" class="form-control" id="nombreProducto" name="nombreProducto" value="<%out.println(producto.getNombre());%>" required>
        </div>
        
        <!--codigo del producto-->
        <div class="form-group col-md-4">
            <label for="codigoProducto">CODIGO PRODUCTO</label>
            <input type="text" class="form-control" id="codigoProducto" name="codigoProducto" value="<%out.println(producto.getCodigo());%>">
        </div>
        
       <!--observación-->
        <div class="form-group col-md-12">
            <label for="observacion">OBSERVACIÓN</label>
            <input type="text" class="form-control" id="observacion" name="observacion" value="<%out.println(producto.getObservacion());%>">
        </div>
      <%
          }
        }     
      %>
      
      <!--actualizar-->
      <button type="submit" class="btn btn-primary col-md-2 " id="btnActualizarProducto" name="btnActualizarProducto" >EDITAR <i class="fas fa-cart-plus"></i></button>
      <div class="col-md-3"></div>
      <!--volver-->
      <a href="buscarProducto.jsp" class="btn btn-dark col-md-2 ">VOLVER <i class="far fa-hand-point-left"></i></a>
      <div class="col-md-3"></div>
      <!--boton oculto-->
      <button type="submit" id="btnEliminarProducto" name="btnEliminarProducto"></button>
      <!--eliminar-->
      <a class="btn btn-danger text-white col-md-2" id="linkEliminarProducto">BORRAR <i class="fas fa-trash-alt"></i></a>
      
      <!--confirmar para eliminar-->
      <script type="text/javascript">
        // oculto el boton eliminar  
        document.getElementById('btnEliminarProducto').style.display = 'none';  
        // capturo el evento click del link del enlace
        $('#linkEliminarProducto').on('click', function() {
            if (confirm("Seguro que desea eliminar")) {
                // doy click sobre el boton eliminar
                document.getElementById("btnEliminarProducto").click();
            }
        });
      </script>
      
      </div>
    </form>
</div>
<%@include file="footer.jsp" %>