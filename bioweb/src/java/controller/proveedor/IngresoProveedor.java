/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.proveedor;

import entity.Persona;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.PersonaDAO;

/**
 *
 * @author Crispancho
 */
@WebServlet(name = "IngresoProveedor", urlPatterns = {"/IngresoProveedor"})
public class IngresoProveedor extends HttpServlet {

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
         * agregar proveedor
         */
        if (request.getParameter("btnAgregarPersona") != null) {
            
            PersonaDAO miDao = new PersonaDAO();
            Persona agregar = new Persona();

            agregar.setNombre(request.getParameter("nombre").trim());
            agregar.setTipoPersona(request.getParameter("tipoPersona").trim());
            agregar.setTipoDocumento(request.getParameter("tipoDocumento").trim());
            agregar.setNumeroDocumento(request.getParameter("numeroDocumento").trim());
            agregar.setDireccion(request.getParameter("direccion").trim());
            agregar.setTelefono(request.getParameter("telefono").trim());
            agregar.setCorreo(request.getParameter("correo").trim());
            agregar.setNombreContacto(request.getParameter("nombreContacto").trim());
            agregar.setNumeroContacto(request.getParameter("numeroContacto").trim());

            if (miDao.agregarPersona(agregar)) {
                request.setAttribute("personaAgregada", "1");
            } else {
                request.setAttribute("personaAgregada", "0");
            }
        }
        
        request.getRequestDispatcher("ingresoProveedor.jsp").forward(request, response);
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
