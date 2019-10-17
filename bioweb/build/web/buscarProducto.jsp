<%-- 
    Document   : buscarProducto
    Created on : 14/09/2019, 10:41:50 AM
    Author     : Crispancho
--%>

<%@page import="entity.Producto"%>
<%@page import="model.ProductoDAO"%>
<%@include file="head.jsp" %>

<div class="container-fluid">
<div class="table-responsive">
    <h4 class="row justify-content-center align-items-center  mb-4 mt-4 text-dark">PRODUCTOS</h4>
    <form action="ActualizarProducto" id="frmUsuarioSistema" method="post">
    
<table class="table table-bordered table-striped table-hover">
  <thead>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">CODIGO</th>
      <th scope="col">NOMBRE</th>
      <th scope="col">OBSERVACIÓN</th>
    </tr>
  </thead>
  <tbody>
      
    <%
       // creo un miDAO de la clase ProductoDAO 
       ProductoDAO miProductoDAO = new ProductoDAO();
       
       
       for (Producto producto : miProductoDAO.buscarProducto()) {
  
    %>
      
    <tr>
         <!--ID-->
        <td>
            <a href="actualizarProducto.jsp?listaProducto=<%out.println(producto.getIdProducto());%>" class="btn btn-warning btn-sm mr-1">EDITAR <i class="fas fa-pencil-alt"></i></a><%out.println(producto.getIdProducto());%>
        </td>
        
        <!--Codigo-->
        <td>
            <%out.println(producto.getCodigo());%>
        </td>
        
        <!--Nombre-->
        <td>
            <%out.println(producto.getNombre());%>
        </td>
        
        <!--Tipo observación-->
        <td>
            <%out.println(producto.getObservacion());%>
        </td>

    </tr>
   <%
       }
   %>
  </tbody>
  <tfoot>
      <th scope="col">ID</th>
      <th scope="col">CODIGO</th>
      <th scope="col">NOMBRE</th>
      <th scope="col">OBSERVACIÓN</th>
  </tfoot>
</table>
    
</form>
</div>
   </div>
<%
    // valido si el producto fue agregado
    if (request.getAttribute("productoAgregado")!=null) {
        if (request.getAttribute("productoAgregado").equals("1")) {
            out.write("<script type='text/javascript'>\n");
            out.write("window.location.href = \"buscarProducto.jsp\";");
            out.write("alert('Producto actualizado')");
            out.write("</script>\n");  
        } else {
            out.write("<script type='text/javascript'>\n");
            out.write("window.location.href = \"buscarProducto.jsp\";");
            out.write("alert('Producto no actualizado')");
            out.write("</script>\n"); 
        }
    
    }
    
    // valido si el producto fue eliminado
    if (request.getAttribute("productoEliminado")!=null) {
        if (request.getAttribute("productoEliminado").equals("1")) {
            out.write("<script type='text/javascript'>\n");
            out.write("window.location.href = \"buscarProducto.jsp\";");
            out.write("alert('Producto eliminado')");
            out.write("</script>\n");     
        } else {
            out.write("<script type='text/javascript'>\n");
            out.write("window.location.href = \"buscarProducto.jsp\";");
            out.write("alert('Producto no eliminado')");
            out.write("</script>\n"); 
        }
    
    }
%>   

<%@include file="footer.jsp" %>