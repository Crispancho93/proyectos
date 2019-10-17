/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.entrada;

import entity.Entrada;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.EntradaDAO;

/**
 *
 * @author Crispancho
 */
@WebServlet(name = "ActualizarEntrada", urlPatterns = {"/ActualizarEntrada"})
public class ActualizarEntrada extends HttpServlet {

    EntradaDAO miDao = new EntradaDAO();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=iso-8859-1");
        PrintWriter out = response.getWriter();

        /**
         * actualizar entrada
         */
        if (request.getParameter("btnActualizarEntrada") != null) {

            Entrada actualizarEntrada = new Entrada();
            actualizarEntrada.setIdEntrada(Integer.valueOf(request.getParameter("idEntrada").trim()));
            actualizarEntrada.setUsuarioSistema(Integer.valueOf(request.getParameter("idUsuario").trim()));
            actualizarEntrada.setIdProducto(Integer.valueOf(request.getParameter("cmbProducto").trim()));
            actualizarEntrada.setResponsable(Integer.valueOf(request.getParameter("cmbResponsable").trim()));
            actualizarEntrada.setProveedor(Integer.valueOf(request.getParameter("cmbProveedor").trim()));
            actualizarEntrada.setRuta(request.getParameter("ruta").trim());
            actualizarEntrada.setConductor(Integer.valueOf(request.getParameter("cmbConductor").trim()));
            actualizarEntrada.setNumeroPlaca(request.getParameter("numeroPlaca").trim());
            actualizarEntrada.setConsecutivo(Integer.valueOf(request.getParameter("consecutivo").trim()));
            actualizarEntrada.setFechaHora(request.getParameter("fecha").trim());
            actualizarEntrada.setCaneca(ActualizarEntrada.convertirFloat(request.getParameter("caneca")));
            actualizarEntrada.setGalon(ActualizarEntrada.convertirFloat(request.getParameter("galon")));
            actualizarEntrada.setKgRemisionado(ActualizarEntrada.convertirFloat(request.getParameter("kgRemisionado")));
            actualizarEntrada.setKgPlanta(ActualizarEntrada.convertirFloat(request.getParameter("kgPlanta")));
            actualizarEntrada.setProductoMalo(ActualizarEntrada.convertirFloat(request.getParameter("productoMalo")));
            actualizarEntrada.setPerdidaPesoSegundoProceso(ActualizarEntrada.convertirFloat(request.getParameter("persidaSegundoProceso")));
            actualizarEntrada.setObservacion(request.getParameter("observacion").trim());

            if (miDao.actualizarEntrada(actualizarEntrada)) {
                request.setAttribute("entradaActualizada", "1");
            } else {
                request.setAttribute("entradaActualizada", "0");
            }

        }
        
        /**
         *  eliminar entarda
         */
        if (request.getParameter("btnEliminarEntrada") != null) {
            
            Entrada borrarEntrada = new Entrada();
            borrarEntrada.setIdEntrada(Integer.valueOf(request.getParameter("idEntrada").trim()));

            if (miDao.eliminarEntrada(borrarEntrada)) {
                request.setAttribute("entradaEliminada", "1");
            } else {
                request.setAttribute("entradaEliminada", "0");
            }
        }
        
        request.getRequestDispatcher("buscarEntrada.jsp").forward(request, response);
    }

    /**
     *
     * @param numero
     * @return
     */
    public static float convertirFloat(String numero) {

        try {
            return Float.parseFloat(numero.trim());
        } catch (NumberFormatException e) {
            return 0f;
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
