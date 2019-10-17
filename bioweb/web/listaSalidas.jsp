<%-- 
    Document   : listaSalidas
    Created on : 30/09/2019, 11:29:40 AM
    Author     : Crispancho
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="model.SalidaDAO"%>
<%
    response.setContentType("application/json;charset=iso-8859-1");
    SalidaDAO miDao = new SalidaDAO();
    
    /**
     * creamos fechaFinal con la fecha actual y fecha final restando 3 meses
     */
    LocalDate fechaFinal = LocalDate.now();
    LocalDate fechaInicial = fechaFinal.minusMonths(3);
    
    
    /**
     * if solo si se hace una busqueda avanzada
     * de lo contrario se listan todas las entradas
     */
    if (request.getParameter("fechaInicial") != null
            & request.getParameter("fechaFinal") != null) {
        
        String inicio = request.getParameter("fechaInicial").trim(); 
        String fin = request.getParameter("fechaFinal").trim();
        
        out.print(miDao.buscarSalida(inicio, fin));
            
    } else {
        out.print(miDao.buscarSalida(fechaInicial.toString(), fechaFinal.toString()));
    }
    
   
    
    
%>