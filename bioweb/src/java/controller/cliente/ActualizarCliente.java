/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.cliente;

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
@WebServlet(name = "ActualizarCliente", urlPatterns = {"/ActualizarCliente"})
public class ActualizarCliente extends HttpServlet {
    
    private PersonaDAO miDao = new PersonaDAO();
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
        * actualizar cliente
        */
        if (request.getParameter("btnActualizarPersona")!=null) {
            
            Persona cliente = new Persona();
            // establezco valores nuevos para actualizar
            cliente.setIdPersona(Integer.valueOf(request.getParameter("idPersona").trim()));
            cliente.setNombre(request.getParameter("nombre").trim());
            cliente.setTipoPersona(request.getParameter("tipoPersona").trim());
            cliente.setTipoDocumento(request.getParameter("tipoDocumento").trim());
            cliente.setNumeroDocumento(request.getParameter("numeroDocumento").trim());
            cliente.setDireccion(request.getParameter("direccion").trim());
            cliente.setTelefono(request.getParameter("telefono").trim());
            cliente.setCorreo(request.getParameter("correo").trim());
            cliente.setNombreContacto(request.getParameter("nombreContacto").trim());
            cliente.setNumeroContacto(request.getParameter("numeroContacto").trim());
            
            // realizo actualización
            if (miDao.actualizarPersona(cliente)) {
                request.setAttribute("personaActualizada", "1");
            } else {
                request.setAttribute("personaActualizada", "0");
            }
            
        }
        
         /**
         * aliminar cliente
         */
        if (request.getParameter("btnEliminarPersona") != null) {
            
            Persona eliminar = new Persona(); 
            
            // asigno id para eliminar y tipo persona, para saber a donde redireccionar
            eliminar.setIdPersona(Integer.valueOf(request.getParameter("idPersona").trim()));
            eliminar.setTipoPersona(request.getParameter("tipoPersona").trim());

            // valido la consulta y envio resultado a la vista
            if (miDao.eliminarPersona(eliminar)) {
                request.setAttribute("personaEliminada", "1");
            } else {
                request.setAttribute("personaEliminada", "0");
            }
        }
        
        request.getRequestDispatcher("buscarCliente.jsp").forward(request, response);
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
