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
@WebServlet(name = "CrearSalida", urlPatterns = {"/CrearSalida"})
public class CrearSalida extends HttpServlet {

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
         * salida.jsp, agregar salida
         */
        if (request.getParameter("btnSalida") != null) {

            Salida agregarSalida = new Salida();
            SalidaDAO miDao = new SalidaDAO();

            agregarSalida.setUsuarioSistema(Integer.parseInt(request.getParameter("idUsuario").trim()));
            agregarSalida.setIdProducto(Integer.parseInt(request.getParameter("cmbProducto").trim()));
            agregarSalida.setResponsable(Integer.parseInt(request.getParameter("cmbResponsable").trim()));
            agregarSalida.setCliente(Integer.parseInt(request.getParameter("cmbCliente").trim()));
            agregarSalida.setConductor(Integer.parseInt(request.getParameter("cmbConductor").trim()));
            agregarSalida.setNumeroPlaca(request.getParameter("numeroPlaca").trim());
            agregarSalida.setConsecutivo(Integer.parseInt(request.getParameter("consecutivo").trim()));
            agregarSalida.setFechaHora(request.getParameter("fecha").trim());
            agregarSalida.setCaneca(CrearSalida.convertirFloat(request.getParameter("caneca")));
            agregarSalida.setGalon(CrearSalida.convertirFloat(request.getParameter("galon")));
            agregarSalida.setPesoBruto(CrearSalida.convertirFloat(request.getParameter("pesoBruto")));
            agregarSalida.setTara(CrearSalida.convertirFloat(request.getParameter("tara")));
            agregarSalida.setPesoNeto(CrearSalida.convertirFloat(request.getParameter("pesoNeto")));
            agregarSalida.setGradosBrix(CrearSalida.convertirFloat(request.getParameter("gradosBrix")));
            agregarSalida.setCantidadBulto(CrearSalida.convertirFloat(request.getParameter("cantidadBulto")));
            agregarSalida.setObservacion(request.getParameter("observacion").trim());

            if (miDao.agregarSalida(agregarSalida)) {
                request.setAttribute("SalidaAgregada", "1");
            } else {
                request.setAttribute("SalidaAgregada", "0");
            }

            request.getRequestDispatcher("salida.jsp").forward(request, response);
        }
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
