/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.salida;

import entity.Salida;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.SalidaDAO;

/**
 *
 * @author Crispancho
 */
@WebServlet(name = "ActualizarSalida", urlPatterns = {"/ActualizarSalida"})
public class ActualizarSalida extends HttpServlet {

    SalidaDAO miDao = new SalidaDAO();

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
         * actualizar una salida
         */
        if (request.getParameter("btnActualizarSalida") != null) {

            Salida actualizarSalida = new Salida();
            actualizarSalida.setIdSalida(Integer.parseInt(request.getParameter("idSalida").trim()));
            actualizarSalida.setUsuarioSistema(Integer.parseInt(request.getParameter("idUsuario").trim()));
            actualizarSalida.setIdProducto(Integer.parseInt(request.getParameter("cmbProducto").trim()));
            actualizarSalida.setResponsable(Integer.parseInt(request.getParameter("cmbResponsable").trim()));
            actualizarSalida.setCliente(Integer.parseInt(request.getParameter("cmbCliente").trim()));
            actualizarSalida.setConductor(Integer.parseInt(request.getParameter("cmbConductor").trim()));
            actualizarSalida.setNumeroPlaca(request.getParameter("numeroPlaca").trim());
            actualizarSalida.setConsecutivo(Integer.parseInt(request.getParameter("consecutivo").trim()));
            actualizarSalida.setFechaHora(request.getParameter("fecha").trim());
            actualizarSalida.setCaneca(ActualizarSalida.convertirFloat(request.getParameter("caneca")));
            actualizarSalida.setGalon(ActualizarSalida.convertirFloat(request.getParameter("galon")));
            actualizarSalida.setPesoBruto(ActualizarSalida.convertirFloat(request.getParameter("pesoBruto")));
            actualizarSalida.setTara(ActualizarSalida.convertirFloat(request.getParameter("tara")));
            actualizarSalida.setPesoNeto(ActualizarSalida.convertirFloat(request.getParameter("pesoNeto")));
            actualizarSalida.setGradosBrix(ActualizarSalida.convertirFloat(request.getParameter("gradosBrix")));
            actualizarSalida.setCantidadBulto(ActualizarSalida.convertirFloat(request.getParameter("cantidadBulto")));
            actualizarSalida.setObservacion(request.getParameter("observacion").trim());

            if (miDao.actualizarSalida(actualizarSalida)) {
                request.setAttribute("salidaActualizada", "1");

            } else {
                request.setAttribute("salidaActualizada", "0");
            }
        }

        /**
         * eliminar salida
         */
        if (request.getParameter("btnEliminarSalida") != null) {

            Salida eliminarSalida = new Salida();
            eliminarSalida.setIdSalida(Integer.parseInt(request.getParameter("idSalida").trim()));

            if (miDao.eliminarSalida(eliminarSalida.getIdSalida())) {
                request.setAttribute("salidaEliminada", "1");
            } else {
                request.setAttribute("salidaEliminada", "0");
            }
        }

        request.getRequestDispatcher("buscarSalida.jsp").forward(request, response);
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
