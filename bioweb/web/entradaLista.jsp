<%-- 
    Document   : entradaLista
    Created on : 19/09/2019, 09:45:33 AM
    Author     : Crispancho
--%>
<%@page import="java.time.LocalDate"%>
<%@page import="model.EntradaDAO"%>

<%
    /**
     * este archivo entrega una respuesta json con todas las entradas
     */ 
    EntradaDAO miDao = new EntradaDAO();
    response.setContentType("application/json;charset=iso-8859-1");

    
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
        
        out.print(miDao.buscarEntrada(inicio, fin));

    } else {

        out.print(miDao.buscarEntrada(fechaInicial.toString(), fechaFinal.toString()));
    }


%>

