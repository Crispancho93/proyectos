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
@WebServlet(name = "CrearEntrada", urlPatterns = {"/CrearEntrada"})
public class CrearEntrada extends HttpServlet {

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
         * entrada.jsp, agregar una entrada
         */
        if (request.getParameter("btnEntrada") != null) {

            EntradaDAO miDao = new EntradaDAO();

            Entrada agregarEntrada = new Entrada();
            agregarEntrada.setUsuarioSistema(Integer.valueOf(request.getParameter("idUsuario").trim()));
            agregarEntrada.setIdProducto(Integer.valueOf(request.getParameter("cmbProducto").trim()));
            agregarEntrada.setResponsable(Integer.valueOf(request.getParameter("cmbResponsable").trim()));
            agregarEntrada.setProveedor(Integer.valueOf(request.getParameter("cmbProveedor").trim()));
            agregarEntrada.setRuta(request.getParameter("ruta").trim());
            agregarEntrada.setConductor(Integer.valueOf(request.getParameter("cmbConductor").trim()));
            agregarEntrada.setNumeroPlaca(request.getParameter("numeroPlaca").trim());
            agregarEntrada.setConsecutivo(Integer.valueOf(request.getParameter("consecutivo").trim()));
            agregarEntrada.setFechaHora(request.getParameter("fecha").trim());
            agregarEntrada.setCaneca(CrearEntrada.convertirFloat(request.getParameter("caneca")));
            agregarEntrada.setGalon(CrearEntrada.convertirFloat(request.getParameter("galon")));
            agregarEntrada.setKgRemisionado(CrearEntrada.convertirFloat(request.getParameter("kgRemisionado")));
            agregarEntrada.setKgPlanta(CrearEntrada.convertirFloat(request.getParameter("kgPlanta")));
            agregarEntrada.setProductoMalo(CrearEntrada.convertirFloat(request.getParameter("productoMalo")));
            agregarEntrada.setPerdidaPesoSegundoProceso(CrearEntrada.convertirFloat(request.getParameter("persidaSegundoProceso")));
            agregarEntrada.setObservacion(request.getParameter("observacion").trim());

            if (miDao.agregarEntrada(agregarEntrada)) {
                request.setAttribute("entradaAgregada", "1");
            } else {
                request.setAttribute("entradaAgregada", "0");
            }
        }

        request.getRequestDispatcher("entrada.jsp").forward(request, response);
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
